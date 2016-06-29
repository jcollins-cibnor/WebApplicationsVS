using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Net.Mail;

public partial class anivatletica_anivatletica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        string tipoRegistro = "";
        if (rblTipoIndividual.Checked) {
            tipoRegistro = "Individual";
        }
        else {
            tipoRegistro = "Equipo";
        }

        lblHiddenMensaje.Text =
            "Nombres: " + txtNombres.Text + '\n' +
            "Apellidos: " + txtApellidos.Text + '\n' +
            "Correo electronico: " + txtCorreo.Text + '\n' +
            "Edad: " + txtEdad.Text + '\n' +
            "Sexo: " + ddlSexo.SelectedValue + '\n' +
            "Tipo de registro: " + tipoRegistro;

        if (tipoRegistro == "Equipo")
        {
            lblHiddenMensaje.Text = lblHiddenMensaje.Text + '\n' +
            '\n' +
            "Nombre del equipo: " + txtNombreEquipo.Text + '\n' +
            '\n' +
            "-- PARTICIPANTES" + '\n' +
            "- " + txtNombreParticipante2.Text + ", edad: " + txtEdadParticipante2.Text + " años, Sexo: " + ddlSexoParticipante2.SelectedValue + '\n' +
            "- " + txtNombreParticipante3.Text + ", edad: " + txtEdadParticipante3.Text + " años, Sexo: " + ddlSexoParticipante3.SelectedValue + '\n' +
            "- " + txtNombreParticipante4.Text + ", edad: " + txtEdadParticipante4.Text + " años, Sexo: " + ddlSexoParticipante4.SelectedValue;

            // Dar de alta en las tablas de Prude - equipo
            SqlDSregweb2.InsertCommand = "INSERT INTO [dbo].[Teams] ([YearId],[Nombre],[Num],[RegWebId]) " +
                 "VALUES ('2015','" + txtNombreEquipo.Text + "','0','0')";
            SqlDSregweb2.Insert(); // Insertamos el registro del equipo

            SqlDSregweb3.DataBind(); // Obtenemos el id del equipo recien registrado
            var currentTeamId = GridView1.Rows[0].Cells[0].Text; // y lo guardamos en currentTeamId

            // Insertamos el registro de quien registra al equipo
            SqlDSregweb2.InsertCommand = "INSERT INTO [dbo].[TeamMembers] ([TeamId],[Nombre],[Apellidos],[Edad],[Sexo],[Correo]) " +
                "VALUES ('" + currentTeamId + "','" +
                txtNombres.Text + "','" +
                txtApellidos.Text + "','" +
                txtEdad.Text + "','" +
                ddlSexo.Text.Substring(0, 1) + "','" +
                txtCorreo.Text +
                "')";
            SqlDSregweb2.Insert();

            // Insertamos el registro del participante2
            SqlDSregweb2.InsertCommand = "INSERT INTO [dbo].[TeamMembers] ([TeamId],[Nombre],[Edad],[Sexo],[Correo]) " +
                "VALUES ('" + currentTeamId + "','" +
                txtNombreParticipante2.Text + "','" +
                txtEdadParticipante2.Text + "','" +
                ddlSexoParticipante2.Text.Substring(0, 1) + "','" +
                txtCorreo.Text +
                "')";
            SqlDSregweb2.Insert();

            // Insertamos el registro del participante3
            SqlDSregweb2.InsertCommand = "INSERT INTO [dbo].[TeamMembers] ([TeamId],[Nombre],[Edad],[Sexo],[Correo]) " +
                "VALUES ('" + currentTeamId + "','" +
                txtNombreParticipante3.Text + "','" +
                txtEdadParticipante3.Text + "','" +
                ddlSexoParticipante3.Text.Substring(0, 1) + "','" +
                txtCorreo.Text +
                "')";
            SqlDSregweb2.Insert();

            // Insertamos el registro del participante4
            SqlDSregweb2.InsertCommand = "INSERT INTO [dbo].[TeamMembers] ([TeamId],[Nombre],[Edad],[Sexo],[Correo]) " +
                "VALUES ('" + currentTeamId + "','" +
                txtNombreParticipante4.Text + "','" +
                txtEdadParticipante4.Text + "','" +
                ddlSexoParticipante4.Text.Substring(0, 1) + "','" +
                txtCorreo.Text +
                "')";
            SqlDSregweb2.Insert();
        }
        else {
            // Dar de alta en las tablas de Prude - individual
            SqlDSregweb2.InsertCommand = "INSERT INTO [dbo].[Runners] ([YearId],[Num],[Sexo],[Nombres],[Apellidos],[Correo],[Edad],[Comentarios],[RegWebId]) " +
                "VALUES ('2015','0','" +
                ddlSexo.Text.Substring(0, 1) + "','" +
                txtNombres.Text + "','" +
                txtApellidos.Text + "','" +
                txtCorreo.Text + "','" +
                txtEdad.Text + "','" +
                txtComentarios.Text +
                "','0')";
            SqlDSregweb2.Insert();
        }

        // agregamos lo ultimo que aplica para los dos tipos de registros
        lblHiddenMensaje.Text = lblHiddenMensaje.Text +
            '\n' +
            '\n' +
            "Comentarios: " + txtComentarios.Text;

        string mensaje = "Estimado(a) " + txtNombres.Text.Trim() + ", su registro ha sido completado." + '\n' +
            '\n' +
            lblHiddenMensaje.Text + '\n' +
            '\n' +
            '\n' +
            "Gracias," + '\n' +
            '\n' +
            "Comite Organizador" + '\n' + "CIBNOR, S.C.";
        mensaje = mensaje.Replace("\n", "<br />");

        SqlDSregistro.InsertCommand = "INSERT INTO anivatletica VALUES ('" +
            txtNombres.Text + "', '" +
            txtApellidos.Text + "', '" +
            txtCorreo.Text + "', '" +
            txtEdad.Text + "', '" +
            ddlSexo.SelectedValue + "', '" +
            tipoRegistro + "', '" +
            txtNombreEquipo.Text + "', '" +
            txtNombreParticipante2.Text + "', '" +
            txtEdadParticipante2.Text + "', '" +
            ddlSexoParticipante2.SelectedValue + "', '" +
            txtNombreParticipante3.Text + "', '" +
            txtEdadParticipante3.Text + "', '" +
            ddlSexoParticipante3.SelectedValue + "', '" +
            txtNombreParticipante4.Text + "', '" +
            txtEdadParticipante4.Text + "', '" +
            ddlSexoParticipante4.SelectedValue + "', '" +
            txtComentarios.Text +
            "', GetDate())";
        
        // esto al final de todo
        OperacionesBasicas OpbCorreo = new OperacionesBasicas();

        int registroOk = 1; // Para validar si el registro se ejecuto en el server
        try
        {
            SqlDSregistro.Insert();
            // Mandamos correo(from, password, to, [cc | "-"], [cco | "-"], subject, msg, priority) Se le pone "-" al from y password para que use las crendenciales de eventos.cibnor@
            OpbCorreo.enviarCorreo("-", "-", txtCorreo.Text, "pnavarro04@cibnor.mx", "eventos@cibnor.mx", "Carrera atletica - Registro web", mensaje, "normal");
        }
        catch (Exception ex)
        {
            OpbCorreo.enviarCorreo("-", "-", "jcollins@cibnor.mx", "-", "-",
                "Error atletica", "ex.Message: " + ex.Message + " - " + txtCorreo.Text + " - ex.InnerException.Message: " + ex.InnerException.Message, "normal");

            registroOk = 0;
            lblStatus.Text = "Hubo un problema al procesar su registro, favor de intentarlo de nuevo mas tarde. El webmaster ya ha sido notificado.";
        }
        if (registroOk == 1)
        {
            Response.Redirect("~/RegistroOk.aspx?evento=anivatletica");
        }

    }

}