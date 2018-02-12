using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Net.Mail;

public partial class anivdomino_anivdomino : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        OperacionesBasicas OpbCorreo = new OperacionesBasicas();

        SqlDSregistro.InsertCommand = "INSERT INTO anivdomino VALUES ('" + txtNombres.Text +
        "', '" + txtApellidos.Text +
        "', '" + txtCorreo.Text +
        "', '" + txtTelefono.Text +
        "', '" + txtNombreEquipo.Text +

        "', '" + txtNombreI1.Text +

        "', '" + txtComentarios.Text +

        "', GetDate())";

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
            '\n' +
            "- Integrantes" + '\n' +
            "01: " + txtNombreI1.Text + '\n' +
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
            OpbCorreo.enviarCorreo("-", "-", txtCorreo.Text, "asauceda@cibnor.mx", "eventos@cibnor.mx", "Domino - Registro web", mensaje, "normal");
        }
        catch (Exception ex)
        {
            OpbCorreo.enviarCorreo("-", "-", "jcollins@cibnor.mx", "-", "-",
                "Error domino", "ex.Message: " + ex.Message + " - " + txtCorreo.Text + " - ex.InnerException.Message: " + ex.InnerException.Message, "normal");

            registroOk = 0;
            lblStatus.Text = "Hubo un problema al procesar su registro, favor de intentarlo de nuevo mas tarde. El webmaster ya ha sido notificado.";
        }
        if (registroOk == 1)
        {
            Response.Redirect("~/RegistroOk.aspx?evento=anivdomino");
        }

    }

}