using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Net.Mail;

public partial class anivvoleibol_anivvoleibol : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        OperacionesBasicas OpbCorreo = new OperacionesBasicas();

        SqlDScolorcamiseta.UpdateCommand = "UPDATE AnivColorCamiseta SET [selected] = 'ocupado' " + 
                                           "WHERE [color] = '" + ddlColorCamiseta.SelectedValue + "'";
        SqlDScolorcamiseta.Update();


            SqlDSregistro.InsertCommand = "INSERT INTO anivvoleibol VALUES ('" + txtNombres.Text +
            "', '" + txtApellidos.Text +
            "', '" + txtCorreo.Text +
            "', '" + txtTelefono.Text +
            "', '" + txtNombreEquipo.Text +
            "', '" + ddlColorCamiseta.SelectedValue +

            "', '" + txtNombreI1.Text + "', '" + txtNombreI2.Text +
            "', '" + txtNombreI3.Text + "', '" + txtNombreI4.Text +
            "', '" + txtNombreI5.Text + "', '" + txtNombreI6.Text +
            "', '" + txtNombreI7.Text + "', '" + txtNombreI8.Text +
            "', '" + txtNombreI9.Text + "', '" + txtNombreI10.Text +
            "', '" + txtNombreI11.Text + "', '" + txtNombreI12.Text +
            "', '" + txtNombreI13.Text + "', '" + txtNombreI14.Text +
            "', '" + txtNombreI15.Text +

            "', '" + txtComentarios.Text +

            "', GetDate())";
//            SqlDSregistro.Insert();

                //Armamos el mensaje
                lblHiddenMensaje.Text =
                    "- Datos del capitan" + '\n' +
                    "------------------------------------------------" + '\n' +
                    '\n' +
                    "Nombre(s): " + txtNombres.Text + '\n' +
                    "Apellido(s): " + txtApellidos.Text + '\n' +
                    "Correo electronico: " + txtCorreo.Text + '\n' +
                    "Telefono: " + txtTelefono.Text + '\n' +
                    '\n' +
                    "- Datos del equipo" + '\n' +
                    "------------------------------------------------" + '\n' +
                    '\n' +
                    "Nombre del equipo: " + txtNombreEquipo.Text + '\n' +
                    "Color de camiseta: " + ddlColorCamiseta.SelectedValue + '\n' +
                    '\n' +
                    "- Integrantes" + '\n' +
                    "01: " + txtNombreI1.Text + '\n' +
                    "02: " + txtNombreI2.Text + '\n' +
                    "03: " + txtNombreI3.Text + '\n' +
                    "04: " + txtNombreI4.Text + '\n' +
                    "05: " + txtNombreI5.Text + '\n' +
                    "06: " + txtNombreI6.Text + '\n' +
                    "07: " + txtNombreI7.Text + '\n' +
                    "08: " + txtNombreI8.Text + '\n' +
                    "09: " + txtNombreI9.Text + '\n' +
                    "10: " + txtNombreI10.Text + '\n' +
                    "11: " + txtNombreI11.Text + '\n' +
                    "12: " + txtNombreI12.Text + '\n' +
                    "13: " + txtNombreI13.Text + '\n' +
                    "14: " + txtNombreI14.Text + '\n' +
                    "15: " + txtNombreI15.Text + '\n' +
                    '\n' +
                    "Comentarios: " + txtComentarios.Text;


            string mensaje = "Estimado(a) " + txtNombres.Text.Trim() + ", usted ha sido registrado(a)." + '\n' +
                '\n' +
                lblHiddenMensaje.Text + '\n' +
                '\n' +
                '\n' +
                "Gracias," + '\n' +
                '\n' +
                "Comite Organizador" + '\n' + "CIBNOR, S.C.";
            mensaje = mensaje.Replace("\n", "<br />");

            int registroOk = 1; // Para validar si el registro se ejecuto en el server
            try
            {
                SqlDSregistro.Insert();
                //    // Mandamos correo(from, password, to, [cc | "-"], [cco | "-"], subject, msg, priority) Se le pone "-" al from y password para que use las crendenciales de eventos.cibnor@
                OpbCorreo.enviarCorreo("-", "-", txtCorreo.Text, "bymar04@cibnor.mx", "eventos@cibnor.mx", "Voleibol - Registro web", mensaje, "normal");
            }
            catch (Exception ex)
            {
                OpbCorreo.enviarCorreo("-", "-", "jcollins@cibnor.mx", "-", "-",
                    "Error voleibol", "ex.Message: " + ex.Message + " - " + txtCorreo.Text + " - ex.InnerException.Message: " + ex.InnerException.Message, "normal");

                registroOk = 0;
                lblStatus.Text = "Hubo un problema al procesar su registro, favor de intentarlo de nuevo mas tarde. El webmaster ya ha sido notificado.";
            }
            if (registroOk == 1)
            {
                Response.Redirect("~/RegistroOk.aspx?evento=anivvoleibol");
            }


            //// Mandamos correo(from, to, [cc | "-"], [cco | "-"], subject, msg)
            //if (factura == "SI") {
            //    enviarCorreo("eventos.cibnor@cibnor.mx", txtCorreo.Text, "xgodinez@cibnor.mx", "anivvoleibol@cibnor.mx", "anivvoleibol - Registro en linea", mensaje, "normal");
            //}
            //else {
            //    enviarCorreo("eventos.cibnor@cibnor.mx", txtCorreo.Text, "-", "anivvoleibol@cibnor.mx", "anivvoleibol - Registro en linea", mensaje, "normal");
            //}

            //// Para pruebas
            ////enviarCorreo("eventos.cibnor@cibnor.mx", txtCorreo.Text, "-", "-", "anivvoleibol - Registro en linea", mensaje, "normal");

            //Response.Redirect("~/RegistroOk.aspx?evento=anivvoleibol");

    
//        }

    }

    protected void ddlColorCamiseta_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((ddlColorCamiseta.SelectedValue == "ocupado") || (ddlColorCamiseta.SelectedValue == "Selecciona"))
        {
            lblColorStatus.ForeColor = System.Drawing.Color.Red;
            lblColorStatus.Text = "Color no disponible, por favor selecciona otro.";
            ddlColorCamiseta.SelectedIndex = 0;

            if (ddlColorCamiseta.SelectedValue == "Selecciona")
            {
//                lblColorStatus.ForeColor = System.Drawing.Color.Black;
//                lblColorStatus.Text = "";
            }
        }
        else
        {
            lblColorStatus.ForeColor = System.Drawing.Color.Black;
            lblColorStatus.Text = "Color disponible";
        }
    }

    //protected string adjuntarArchivo()
    //{
    //    if (fuArchivo.PostedFile != null)
    //    {
    //        // Indicamos la ruta
    //        string path = HttpContext.Current.ApplicationInstance.Server.MapPath("~/anivvoleibol/uploads");
    //        // Armamos el nombre del archivo
    //        string fn = System.IO.Path.GetFileName(txtCorreo.Text + ".pdf");
    //        // Obtenemos los parametros del archivo por subir
    //        var fileSize = fuArchivo.PostedFile.ContentLength;
    //        var fileMimeType = fuArchivo.PostedFile.ContentType;
    //        //lblStatus.Text = "Size: " + fileSize + ", MIME: " + fileMimeType;
    //        if (Path.GetExtension(fuArchivo.PostedFile.FileName).ToLower() != ".pdf")
    //        {
    //            return "Considera que: el archivo debe ser tipo PDF";                 
    //        }
    //        if (fileSize > 2048000)
    //        {
    //            return "Recuerda que: el archivo debe ser menor a 2MB";                
    //        }

    //        // Subimos el archivo
    //        fuArchivo.PostedFile.SaveAs(System.IO.Path.Combine(path, fn));
    //    }
    //    return "ok";
    //}

    ////protected int adjuntarArchivo()
    ////{
    ////    if (fuArchivo.PostedFile != null)
    ////    {
    ////        // Indicamos la ruta
    ////        string path = HttpContext.Current.ApplicationInstance.Server.MapPath("~/anivvoleibol/uploads");
    ////        // Armamos el nombre del archivo
    ////        string fn = System.IO.Path.GetFileName(txtCorreo.Text + ".pdf");
    ////        // Obtenemos los parametros del archivo por subir
    ////        var fileSize = fuArchivo.PostedFile.ContentLength;
    ////        var fileMimeType = fuArchivo.PostedFile.ContentType;
    ////        //lblStatus.Text = "Size: " + fileSize + ", MIME: " + fileMimeType;
    ////        if (Path.GetExtension(fuArchivo.PostedFile.FileName).ToLower() != ".pdf")
    ////        {
    ////            lblStatus.Text = "El archivo debe ser tipo PDF";
    ////            return 0;
    ////        }
    ////        if (fileSize > 2048000)
    ////        {
    ////            lblStatus.Text = "El archivo debe ser menor a 2MB";
    ////            return 0;
    ////        }

    ////        // Subimos el archivo
    ////        fuArchivo.PostedFile.SaveAs(System.IO.Path.Combine(path, fn));
    ////    }
    ////    return 1;
    ////}

    //public void enviarCorreo(string origen, string destino, string copia, string copiaoculta, string asunto, string mensaje, string prioridad)
    //{
    //    System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
    //    //        mail.From = new MailAddress(origen, "The Source", System.Text.Encoding.UTF8);
    //    mail.From = new MailAddress(origen, origen, System.Text.Encoding.UTF8);
    //    mail.To.Add(destino);

    //    if (copia != "-") {
    //        mail.CC.Add(copia);
    //    }
    //    if (copiaoculta != "-") {
    //        mail.Bcc.Add(copiaoculta);
    //    }

    //    mail.Subject = asunto;
    //    mail.SubjectEncoding = System.Text.Encoding.UTF8;
    //    mail.Body = mensaje;
    //    mail.BodyEncoding = System.Text.Encoding.UTF8;
    //    mail.IsBodyHtml = true;

    //    switch (prioridad) {
    //        case "baja":
    //            mail.Priority = MailPriority.Low;
    //            break;
    //        case "normal":
    //            mail.Priority = MailPriority.Normal;
    //            break;
    //        case "alta":
    //            mail.Priority = MailPriority.High;
    //            break;
    //    }

    //    SmtpClient client = new SmtpClient();
    //    //Add the Creddentials- use your own email id and password
    //    client.Credentials = new System.Net.NetworkCredential("eventos.cibnor@cibnor.mx", "Eventos.1");
    //    //client.Credentials = new System.Net.NetworkCredential(origen, passwd);

    //    client.Port = 587; // Gmail works on this port
    //    client.Host = "smtp.gmail.com";
    //    client.EnableSsl = true; //Gmail works on Server Secured Layer
    //    try
    //    {
    //        client.Send(mail);
    //    }
    //    catch (Exception ex)
    //    {
    //        Exception ex2 = ex;
    //        string errorMessage = string.Empty;
    //        while (ex2 != null)
    //        {
    //            errorMessage += ex2.ToString();
    //            ex2 = ex2.InnerException;
    //        }
    //        HttpContext.Current.Response.Write(errorMessage);
    //    }
    //}

}