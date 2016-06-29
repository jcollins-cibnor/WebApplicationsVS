using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Net.Mail;

public partial class nochebohemia_nochebohemia : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        OperacionesBasicas OpbCorreo = new OperacionesBasicas();
        
        SqlDSregistro.InsertCommand = "INSERT INTO nochebohemia VALUES ('" + txtNombres.Text +
        "', '" + txtApellidos.Text +
        "', '" + txtCorreo.Text +
        "', '" + txtTelefono.Text +
        "', '" + txtPresentar.Text +
        "', '" + txtRequerimientos.Text +

        "', '" + txtComentarios.Text +

        "', GetDate())";

        //Armamos el mensaje
        lblHiddenMensaje.Text =
            "- Datos personales" + '\n' +
            "------------------------------------------------" + '\n' +
            '\n' +
            "Nombre(s): " + txtNombres.Text + '\n' +
            "Apellido(s): " + txtApellidos.Text + '\n' +
            "Correo electronico: " + txtCorreo.Text + '\n' +
            "Telefono: " + txtTelefono.Text + '\n' +
            '\n' +
            "Presentare: " + txtPresentar.Text + '\n' +
            "Requerimientos: " + txtRequerimientos.Text + '\n' +
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
            OpbCorreo.enviarCorreo("-", "-", txtCorreo.Text, "rubi04@cibnor.mx, jvilla04@cibnor.mx", "eventos@cibnor.mx", "Noche bohemia - Registro web", mensaje, "normal");
        }
        catch (Exception ex)
        {
            OpbCorreo.enviarCorreo("-", "-", "jcollins@cibnor.mx", "-", "-",
                "Error nochebohemia", "ex.Message: " + ex.Message + " - " + txtCorreo.Text + " - ex.InnerException.Message: " + ex.InnerException.Message, "normal");

            registroOk = 0;
            lblStatus.Text = "Hubo un problema al procesar su registro, favor de intentarlo de nuevo mas tarde. El webmaster ya ha sido notificado.";
        }
        if (registroOk == 1)
        {
            Response.Redirect("~/RegistroOk.aspx?evento=nochebohemia");
        }

    }

}