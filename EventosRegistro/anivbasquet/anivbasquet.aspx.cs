using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Net.Mail;

public partial class anivbasquet_anivbasquet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        OperacionesBasicas OpbCorreo = new OperacionesBasicas();

        //SqlDScolorcamiseta.UpdateCommand = "UPDATE anivColorCamisetaFutbol SET [selected] = 'ocupado' " + 
        //                                   "WHERE [color] = '" + ddlColorCamiseta.SelectedValue + "'";
        //SqlDScolorcamiseta.Update();
        
        SqlDSregistro.InsertCommand = "INSERT INTO anivbasquet VALUES ('" + txtNombres.Text +
        "', '" + txtApellidos.Text +
        "', '" + txtCorreo.Text +
        "', '" + txtTelefono.Text +
        "', '" + txtNombreEquipo.Text +
        //"', '" + ddlColorCamiseta.SelectedValue +

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
            //"Color de camiseta: " + ddlColorCamiseta.SelectedValue + '\n' +
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
            OpbCorreo.enviarCorreo("-", "-", txtCorreo.Text, "dortega04@cibnor.mx", "eventos@cibnor.mx", "Basquetbol - Registro web", mensaje, "normal");
        }
        catch (Exception ex)
        {
            OpbCorreo.enviarCorreo("-", "-", "jcollins@cibnor.mx", "-", "-",
                "Error futbol", "ex.Message: " + ex.Message + " - " + txtCorreo.Text + " - ex.InnerException.Message: " + ex.InnerException.Message, "normal");

            registroOk = 0;
            lblStatus.Text = "Hubo un problema al procesar su registro, favor de intentarlo de nuevo mas tarde. El webmaster ya ha sido notificado.";
        }
        if (registroOk == 1)
        {
            Response.Redirect("~/RegistroOk.aspx?evento=anivbasquet");
        }

    }

    //protected void ddlColorCamiseta_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddlColorCamiseta.SelectedValue == "ocupado")
    //    {
    //        lblColorStatus.ForeColor = System.Drawing.Color.Red;
    //        lblColorStatus.Text = "Color no disponible, por favor selecciona otro.";
    //        ddlColorCamiseta.SelectedIndex = 0;
    //    }
    //    else
    //    {
    //        lblColorStatus.ForeColor = System.Drawing.Color.Black;
    //        lblColorStatus.Text = "Color disponible";
    //    }
    //}

}