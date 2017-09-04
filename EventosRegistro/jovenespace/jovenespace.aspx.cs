using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Net.Mail;

public partial class jovenespace_jovenespace : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {        

        OperacionesBasicas Opb = new OperacionesBasicas();
        int numRegistros = Opb.numRegistros("jovenespace", "correo", txtCorreo.Text);
        if (numRegistros > 0) // Ya existe?
        {
            lblStatus.Text = "El correo que ingresaste ya se encuentra registrado, por favor utiliza otro.";
            txtCorreo.Focus();
        }
        else // No existe, adelante
        {
            string fileUpload = "";
            fileUpload = Opb.adjuntarArchivo(fuArchivo, "~/jovenespace/uploads", txtCorreo.Text); // adjuntarArchivo();
            if (fileUpload == "ok") // Se adjunto el archivo? entonces genera la clave y registralo
             {
                //lblStatus.Text = "NO existe";
                lblStatus.Text = "";
                numRegistros = Opb.numRegistros("jovenespace", "area", ddlArea.SelectedItem.Text);
                lblHiddenClave.Text = ddlArea.SelectedValue + Convert.ToString(numRegistros + 1);
                //lblHiddenClave.Visible = true;

                // CREAR EL MENSAJE A ENVIAR POR CORREO
                lblHiddenMensaje.Text = "Estimado(a) participante, el registro ha sido completado con exito." + '\n' +
                    '\n' +
                    "- datos generales del autor --" + '\n' +
                    '\n' +
                    "Nombre completo: " + txtNombres.Text + " " + txtApellidos.Text + '\n' +
                    "Correo: " + txtCorreo.Text + '\n' +
                    "Telefono: " + txtTelefono.Text + '\n' +
                    "Sexo: " + ddlSexo.SelectedValue + '\n' +
                    "Edad: " + txtEdad.Text + '\n' +
                    "Institucion: " + txtInstitucion.Text + '\n' +
                    "Domicilio: " + txtDomicilioOficial.Text + '\n' +
                    "Municipio: " + txtMunicipio.Text + '\n' +
                    "Carrera: " + txtCarrera.Text + '\n' +
                    "Egresado: " + ddlEgresado.SelectedValue + '\n' +
                    "Fecha de egreso: " + txtFechaEgreso.Text + '\n' +
                    "Semestre: " + txtSemestre.Text + '\n' +
                    "Titulado: " + ddlTitulado.SelectedValue + '\n' +
                    "Fecha de titulacion: " + txtFechaTitulacion.Text + '\n' +
                    '\n' +
                    "- datos del proyecto --" + '\n' +
                    '\n' +
                    "Nombre del proyecto: " + txtNombreProyecto.Text + '\n' +
                    "Area: " + ddlArea.SelectedItem.Text + '\n' +
                    '\n' +
                    "- informacion adicional --" + '\n' +
                    '\n' +
                    "Nombre completo del quien requiere hospedaje: " + txtNombreHuesped.Text + '\n' +
                    "Justificacion: " + txtJustificacion.Text + '\n' +
                    '\n' +
                    "Clave de registro: " + lblHiddenClave.Text + '\n' +
                    '\n' +
                "NOTA: FAVOR DE LEER LA CONVOCATORIA EXTENSA Y ESTAR PENDIENTES DE SU CORREO, RECIBIRAN INFORMACION,  EN CASO DE SER SELECCIONADOS O NO. " +
                "SI RESULTAS SELECCIONADO DEBERAN CUMPLIR CON TODAS LAS ESPECIFICACIONES REQUERIDAS AL MOMENTO DEL REGISTRO EL DIA DEL EVENTO. " +
                "(ESTAN EN LA CONVOCATORIA EXTENSA, POR SI NO LA TIENES LA RECIBIRAS A TU CORREO ELECTRONICO)" + '\n' +
                    '\n' +
                    '\n' +
                "Gracias," + '\n' + "Comite Organizador" + '\n' + "CIBNOR, S.C." + '\n' +
                '\n' +
                '\n' +
                "PD: Este mensaje ha sido redactado sin acentos.";

                lblHiddenMensaje.Text = lblHiddenMensaje.Text.Replace("\n", "<br />");

                //Crear el comando para el INSERT
                SqlDSregistro.InsertCommand = "INSERT INTO jovenespace VALUES ('" +
                    txtNombres.Text + "', '" +
                    txtApellidos.Text + "', '" +
                    txtCorreo.Text + "', '" +
                    txtTelefono.Text + "', '" +
                    ddlSexo.SelectedValue + "', '" +
                    txtEdad.Text + "', '" +

                    txtInstitucion.Text + "', '" +
                    txtDomicilioOficial.Text + "', '" +
                    txtMunicipio.Text + "', '" +
                    txtCarrera.Text + "', '" +
                    ddlEgresado.SelectedValue + "', '" +
                    txtFechaEgreso.Text + "', '" +
                    txtSemestre.Text + "', '" +
                    ddlTitulado.SelectedValue + "', '" +
                    txtFechaTitulacion.Text + "', '" +
                    
                    txtNombreProyecto.Text + "', '" +
                    ddlArea.SelectedItem.Text + "', '" +

                    txtNombreHuesped.Text + "', '" +
                    txtJustificacion.Text + "', '" +
                    lblHiddenClave.Text + "', '" +
                    "1" + "', GetDate())";

                OperacionesBasicas OpbCorreo = new OperacionesBasicas();

                int registroOk = 1; // Para validar si el registro se ejecuto en el server
                try
                {
                    SqlDSregistro.Insert();
                    // Mandamos correo(from, password, to, [cc | "-"], [cco | "-"], subject, msg, priority) Con "-" en from y password usa las crendenciales de eventos.cibnor@
                    //OpbCorreo.enviarCorreo("-", "-", txtCorreo.Text, "-", "jcollins@cibnor.mx", "Jovenes PACE - Registro web", lblHiddenMensaje.Text, "normal"); // para pruebas
                    OpbCorreo.enviarCorreo("-", "-", txtCorreo.Text, "-", "jovenes.pace@cibnor.mx", "Jovenes PACE - Registro web", lblHiddenMensaje.Text, "normal");
                }
                catch (Exception ex)
                {
                    OpbCorreo.enviarCorreo("-", "-", "jcollins@cibnor.mx", "-", "-", "Error_jovenesPACE", 
                                           "ex.Message: " + ex.Message + " - " + txtCorreo.Text + " - ex.InnerException.Message: " + ex.InnerException.Message, "normal");

                    registroOk = 0;
                    lblStatus.Text = "Hubo un problema al procesar su registro, favor de intentarlo de nuevo mas tarde. El webmaster ya ha sido notificado.";
                }
                if (registroOk == 1)
                {
                    Response.Redirect("~/RegistroOk.aspx?evento=jovenespace");
                }

            }
             else // No se pudo adjuntar el archivo, muestra el error
             {
                 lblStatus.Text = fileUpload;
                 lblStatus.Focus();
             }

        }
   
        //

        //// se cumplen todos los requisitos para un registro exitoso?
        //if ((adjuntarArchivo() == "ok"))
        //{
        
        //}
        //else {
        //    lblStatus.Text = fileUpload;
        //    lblStatus.Focus();
        //}

    //    string factura = "NO";
    //    if (chkFactura.Checked) { 
    //        factura = "SI";
    //        // Subimos el comprobante de pago, si regresa 0 hubo un error

        
    //    }

    //    // Insertamos en la tabla
    //    SqlDSregistro.InsertCommand = "INSERT INTO jovenespace VALUES ('" + txtNombres.Text +
    //    "', '" + txtApellidos.Text +
    //    "', '" + txtCorreo.Text +
    //    "', '" + txtInstitucion.Text +
    //    "', '" + factura +
    //    "', '" + txtFacturaRfc.Text +
    //    "', '" + txtFacturaNombre.Text +
    //    "', '" + txtDomicilio.Text +
    //    "', '" + txtComentarios.Text +
    //    "', GetDate())";
    //    SqlDSregistro.Insert();

    //    //Armamos el mensaje
    //    lblHiddenMensaje.Text =
    //        "Nombre(s): " + txtNombres.Text + '\n' +
    //        "Apellido(s): " + txtApellidos.Text + '\n' +
    //        '\n' +
    //        "Correo electrónico: " + txtCorreo.Text + '\n' +
    //        "Institución: " + txtInstitucion.Text + '\n' +
    //        '\n' +
    //        "Requiero factura: " + factura + '\n' +
    //        "Datos para facturación --- " + '\n' +
    //        "RFC: " + txtFacturaRfc.Text + '\n' +
    //        "Nombre: " + txtFacturaNombre.Text + '\n' +
    //        "Domicilio: " + txtDomicilio.Text + '\n' +
    //        '\n' +
    //        "Comentarios: " + txtComentarios.Text;

    //    string mensaje = "Estimado(a), " + txtNombres.Text.Trim() + ", usted ha sido registrado(a)." + '\n' +
    //        '\n' +
    //        lblHiddenMensaje.Text + '\n' +
    //        '\n' +
    //        '\n' +
    //        "Gracias," + '\n' +
    //        '\n' +
    //        "Comite Organizador" + '\n' + "CIBNOR, S.C.";
    //    mensaje = mensaje.Replace("\n", "<br />");

    //    // Mandamos correo(from, to, [cc | "-"], [cco | "-"], subject, msg)
    //    if (factura == "SI")
    //    {
    //        enviarCorreo("eventos.cibnor@cibnor.mx", txtCorreo.Text, "xgodinez@cibnor.mx", "jovenespace@cibnor.mx", "jovenespace - Registro en linea", mensaje, "normal");
    //    }
    //    else
    //    {
    //        enviarCorreo("eventos.cibnor@cibnor.mx", txtCorreo.Text, "-", "jovenespace@cibnor.mx", "jovenespace - Registro en linea", mensaje, "normal");
    //    }

    //    Response.Redirect("~/RegistroOk.aspx?evento=jovenespace");

    }

    protected string adjuntarArchivo()
    {
        if (fuArchivo.PostedFile != null)
        {
            // Indicamos la ruta
            string path = HttpContext.Current.ApplicationInstance.Server.MapPath("~/jovenespace/uploads");
            // Armamos el nombre del archivo
            string fn = System.IO.Path.GetFileName(txtCorreo.Text + ".pdf");
            // Obtenemos los parametros del archivo por subir
            var fileSize = fuArchivo.PostedFile.ContentLength;
            var fileMimeType = fuArchivo.PostedFile.ContentType;
            //lblStatus.Text = "Size: " + fileSize + ", MIME: " + fileMimeType;
            if (Path.GetExtension(fuArchivo.PostedFile.FileName).ToLower() != ".pdf")
            {
                return "El archivo debe ser tipo PDF";
            }
            if (fileSize > 2048000)
            {
                return "El archivo debe ser menor a 2MB";
            }

            // Subimos el archivo
            fuArchivo.PostedFile.SaveAs(System.IO.Path.Combine(path, fn));
        }
        return "ok";
    }

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