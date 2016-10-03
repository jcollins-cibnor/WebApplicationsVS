using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Net.Mail;

public partial class diatomeas2017_diatomeas2017 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        OperacionesBasicas OpbCorreo = new OperacionesBasicas();

        string factura = "NO";
        if (chkFactura.Checked) { factura = "SI"; }

        // Subimos el comprobante de pago, si regresa 0 hubo un error
        var fileUpload = adjuntarArchivo();

        if (fileUpload != "ok") {
            lblStatus.Text = fileUpload; 
        }
        else { 
            // Insertamos en la tabla
            SqlDSregistro.InsertCommand = "INSERT INTO diatomeas2017 VALUES ('" + txtNombres.Text +
            "', '" + txtApellidos.Text +
            "', '" + txtCorreo.Text +
            "', '" + txtInstitucion.Text +
            "', '" + factura +
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
                "Correo electr&oacute;nico: " + txtCorreo.Text + '\n' +
                "Instituci&oacute;n: " + txtInstitucion.Text + '\n' +
                '\n' +
                "Requiero factura: " + factura + '\n' +
                "Datos para facturaci&oacute;n --- " + '\n' +
                "RFC: " + txtFacturaRfc.Text + '\n' +
                "Nombre: " + txtFacturaNombre.Text + '\n' +
                "Domicilio: " + txtDomicilio.Text + '\n' +
                '\n' +
                "Comentarios: " + txtComentarios.Text;

            string mensaje = "Estimado(a), " + txtNombres.Text.Trim() + ", usted ha sido registrado(a)." + '\n' +
                '\n' +
                lblHiddenMensaje.Text + '\n' +
                '\n' +
                '\n' +
                "Gracias," + '\n' +
                '\n' +
                "Comite Organizador" + '\n' + "CIBNOR, S.C.";
            mensaje = mensaje.Replace("\n", "<br />");

            
            //// Mandamos correo(from, psswd, to, [cc | "-"], [cco | "-"], subject, msg, priority)
            OpbCorreo.enviarCorreo("-", "-", txtCorreo.Text, "xgodinez@cibnor.mx", "diatomeas2017@cibnor.mx", "diatomeas2017 - Registro en linea", mensaje, "normal");

            Response.Redirect("~/RegistroOk.aspx?evento=diatomeas2017");
        }

    }

    protected string adjuntarArchivo()
    {
        if (fuArchivo.PostedFile != null)
        {
            // Indicamos la ruta
            string path = HttpContext.Current.ApplicationInstance.Server.MapPath("~/diatomeas2017/uploads");
            // Armamos el nombre del archivo
            string fn = System.IO.Path.GetFileName(txtCorreo.Text + ".pdf");
            // Obtenemos los parametros del archivo por subir
            var fileSize = fuArchivo.PostedFile.ContentLength;
            var fileMimeType = fuArchivo.PostedFile.ContentType;
            //lblStatus.Text = "Size: " + fileSize + ", MIME: " + fileMimeType;
            if (Path.GetExtension(fuArchivo.PostedFile.FileName).ToLower() != ".pdf")
            {
                return "Considera que: el archivo debe ser tipo PDF";                 
            }
            if (fileSize > 2048000)
            {
                return "Recuerda que: el archivo debe ser menor a 2MB";                
            }

            // Subimos el archivo
            fuArchivo.PostedFile.SaveAs(System.IO.Path.Combine(path, fn));
        }
        return "ok";
    }


}