using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Net.Mail;

public partial class microarreglos2015_microarreglos2015 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        // Subimos el comprobante de pago, si regresa 0 hubo un error
        var fileUpload = adjuntarArchivo();

        // Insertamos en la tabla
        SqlDSregistro.InsertCommand = "INSERT INTO microarreglos2015 VALUES ('" + txtNombres.Text +
        "', '" + txtApellidos.Text +
        "', '" + txtCorreo.Text +
        "', '" + txtInstitucion.Text +
        "', '" + txtFacturaRfc.Text +
        "', '" + txtFacturaNombre.Text +
        "', '" + txtDomicilio.Text +
        "', '" + txtComentarios.Text +
        "', GetDate())";
        SqlDSregistro.Insert();

        //Armamos el mensaje
        lblHiddenMensaje.Text =
            "Nombre(s): " + txtNombres.Text + '\n' +
            "Apellido(s): " + txtApellidos.Text + '\n' +
            '\n' +
            "Correo electrónico: " + txtCorreo.Text + '\n' +
            "Institución: " + txtInstitucion.Text + '\n' +
            '\n' +
            "Datos para facturación --- " + '\n' +
            "RFC: " + txtFacturaRfc.Text + '\n' +
            "Nombre: " + txtFacturaNombre.Text + '\n' +
            "Domicilio: " + txtDomicilio.Text + '\n' +
            '\n' +
            "Comentarios: " + txtComentarios.Text;

        //lblHiddenMensaje.Text = lblHiddenMensaje.Text.Replace("\n", "<br />");

        string mensaje = "Estimado(a), " + txtNombres.Text.Trim() + ", usted ha sido registrado(a)." + '\n' +
            '\n' +
            lblHiddenMensaje.Text + '\n' +
            '\n' +
            '\n' +
            "Gracias," + '\n' +
            '\n' +
            "Comite Organizador" + '\n' + "CIBNOR, S.C.";
        mensaje = mensaje.Replace("\n", "<br />");

        // Mandamos correo(from, to, [cc | "-"], subject, msg)
        enviarCorreo("eventos.cibnor@cibnor.mx", txtCorreo.Text, "-", "-", "Microarreglos 2015 - Registro en linea", mensaje, "normal");

        Response.Redirect("~/RegistroOk.aspx?evento=microarreglos2015");

    }

    protected int adjuntarArchivo()
    {
        if (fuArchivo.PostedFile != null)
        {
            // Indicamos la ruta
            string path = HttpContext.Current.ApplicationInstance.Server.MapPath("~/microarreglos2015/uploads");
            // Armamos el nombre del archivo
            string fn = System.IO.Path.GetFileName(txtCorreo.Text + ".pdf");
            // Obtenemos los parametros del archivo por subir
            var fileSize = fuArchivo.PostedFile.ContentLength;
            var fileMimeType = fuArchivo.PostedFile.ContentType;
            //lblStatus.Text = "Size: " + fileSize + ", MIME: " + fileMimeType;
            if (Path.GetExtension(fuArchivo.PostedFile.FileName).ToLower() != ".pdf")
            {
                lblStatus.Text = "El archivo debe ser tipo PDF";
                return 0;
            }
            if (fileSize > 2048000)
            {
                lblStatus.Text = "El archivo debe ser menor a 2MB";
                return 0;
            }

            // Subimos el archivo
            fuArchivo.PostedFile.SaveAs(System.IO.Path.Combine(path, fn));
        }
        return 1;
    }

    public void enviarCorreo(string origen, string destino, string copia, string copiaoculta, string asunto, string mensaje, string prioridad)
    {
        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
        //        mail.From = new MailAddress(origen, "The Source", System.Text.Encoding.UTF8);
        mail.From = new MailAddress(origen, origen, System.Text.Encoding.UTF8);
        mail.To.Add(destino);

        if (copia != "-") {
            mail.CC.Add(copia);
        }
        if (copiaoculta != "-") {
            mail.Bcc.Add(copiaoculta);
        }

        mail.Subject = asunto;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = mensaje;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true;

        switch (prioridad) {
            case "baja":
                mail.Priority = MailPriority.Low;
                break;
            case "normal":
                mail.Priority = MailPriority.Normal;
                break;
            case "alta":
                mail.Priority = MailPriority.High;
                break;
        }

        SmtpClient client = new SmtpClient();
        //Add the Creddentials- use your own email id and password
        client.Credentials = new System.Net.NetworkCredential("eventos.cibnor@cibnor.mx", "Eventos.1");
        //client.Credentials = new System.Net.NetworkCredential(origen, passwd);

        client.Port = 587; // Gmail works on this port
        client.Host = "smtp.gmail.com";
        client.EnableSsl = true; //Gmail works on Server Secured Layer
        try
        {
            client.Send(mail);
        }
        catch (Exception ex)
        {
            Exception ex2 = ex;
            string errorMessage = string.Empty;
            while (ex2 != null)
            {
                errorMessage += ex2.ToString();
                ex2 = ex2.InnerException;
            }
            HttpContext.Current.Response.Write(errorMessage);
        }
    }

}