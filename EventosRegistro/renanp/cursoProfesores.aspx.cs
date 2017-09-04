using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class renanp_cursoProfesores : System.Web.UI.Page
{
    string correoAlias = "";
    string correoSubject = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        #region Validacion del navegador
        System.Web.HttpBrowserCapabilities browser = Request.Browser;
        double jsVersion = Convert.ToDouble(browser["JavaScriptVersion"]);
        if (jsVersion >= 1.11) {
            // lblStatus.Text = jsVersion.ToString(); Response.Write("Ok");
        }
        else {
            Response.Redirect("~/BrowserCapabilities.html"); // Redireccionamos a la pagina donde le avisa la obsolecencia
        }
        #endregion

        var registroId = Request.QueryString["rId"]; // Este dato lo obtenemos del parametro en la URL
        registroId = registroId.ToUpper();
        switch (registroId)
        {
            case "SCC":
                lblTituloPrincipal.Text = "3er. Curso RENANP - San Cristobal de Las Casas";
                correoAlias = "curso-renanp3@cibnor.mx";
                correoSubject = "Curso RENANP San Cristobal - Registro en linea";
                break;
            case "AGS":
            default:
                lblTituloPrincipal.Text = "2do. Curso RENANP - Aguascalientes";
                correoAlias = "curso-renanp@cibnor.mx";
                correoSubject = "Curso RENANP Aguascalientes - Registro en linea";
                break;
        }
        txtType.Text = registroId;
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        OperacionesBasicas Opb = new OperacionesBasicas();
        lblStatus.Text = "";
        if (txtComentarios.Text.Length > 999) {
            txtComentarios.Text = txtComentarios.Text.Substring(0, 999);
        }

        lblHiddenMensaje.Text =
            "- DATOS GENERALES" + '\n' +
            '\n' +
            "Nombre completo: " + txtNombre.Text + '\n' +
            "Correo electr&oacute;nico: " + txtCorreo.Text + '\n' +
            "Instituci&oacute;n: " + txtInstitucion.Text + '\n' +
            '\n' +
            "- ITINERARIO" + '\n' +
            "Traslado: " + rblCTraslado.SelectedItem.Text + '\n' +
            '\n';

        var datosCTraslado = "";
        if (rblCTraslado.SelectedValue == "si")
        {
            datosCTraslado =
            "-- VIAJE DE IDA --" + '\n' + '\n' +
            lblCVueloSalida1.Text + '\n' +
            txtCSalidaOrigen1.Attributes["placeholder"] + txtCSalidaOrigen1.Text + " - " +
            txtCSalidaDestino1.Attributes["placeholder"] + txtCSalidaDestino1.Text + " - " +
            txtCSalidaAerolinea1.Attributes["placeholder"] + txtCSalidaAerolinea1.Text + " - " +
            txtCSalidaNoVuelo1.Attributes["placeholder"] + txtCSalidaNoVuelo1.Text + '\n' +
            txtCSalidaFecha1.Attributes["placeholder"] + txtCSalidaFecha1.Text + " - " +
            txtCSalidaHora1.Attributes["placeholder"] + txtCSalidaHora1.Text + " - " +
            txtCSalidaHoraLlegada1.Attributes["placeholder"] + txtCSalidaHoraLlegada1.Text + '\n' +
            '\n' +
            lblCVueloSalida2.Text + '\n' +
            txtCSalidaOrigen2.Attributes["placeholder"] + txtCSalidaOrigen2.Text + " - " +
            txtCSalidaDestino2.Attributes["placeholder"] + txtCSalidaDestino2.Text + " - " +
            txtCSalidaAerolinea2.Attributes["placeholder"] + txtCSalidaAerolinea2.Text + " - " +
            txtCSalidaNoVuelo2.Attributes["placeholder"] + txtCSalidaNoVuelo2.Text + '\n' +
            txtCSalidaFecha2.Attributes["placeholder"] + txtCSalidaFecha2.Text + " - " +
            txtCSalidaHora2.Attributes["placeholder"] + txtCSalidaHora2.Text + " - " +
            txtCSalidaHoraLlegada2.Attributes["placeholder"] + txtCSalidaHoraLlegada2.Text + '\n' +
            '\n' +
            "-- VIAJE DE REGRESO --" + '\n' + '\n' +
            lblCVueloRegreso1.Text + '\n' +
            txtCRegresoOrigen1.Attributes["placeholder"] + txtCRegresoOrigen1.Text + " - " +
            txtCRegresoDestino1.Attributes["placeholder"] + txtCRegresoDestino1.Text + " - " +
            txtCRegresoAerolinea1.Attributes["placeholder"] + txtCRegresoAerolinea1.Text + " - " +
            txtCRegresoNoVuelo1.Attributes["placeholder"] + txtCRegresoNoVuelo1.Text + '\n' +
            txtCRegresoFecha1.Attributes["placeholder"] + txtCRegresoFecha1.Text + " - " +
            txtCRegresoHora1.Attributes["placeholder"] + txtCRegresoHora1.Text + " - " +
            txtCRegresoHoraLlegada1.Attributes["placeholder"] + txtCRegresoHoraLlegada1.Text + '\n' +
            '\n' +
            lblCVueloRegreso2.Text + '\n' +
            txtCRegresoOrigen2.Attributes["placeholder"] + txtCRegresoOrigen2.Text + " - " +
            txtCRegresoDestino2.Attributes["placeholder"] + txtCRegresoDestino2.Text + " - " +
            txtCRegresoAerolinea2.Attributes["placeholder"] + txtCRegresoAerolinea2.Text + " - " +
            txtCRegresoNoVuelo2.Attributes["placeholder"] + txtCRegresoNoVuelo2.Text + '\n' +
            txtCRegresoFecha2.Attributes["placeholder"] + txtCRegresoFecha2.Text + " - " +
            txtCRegresoHora2.Attributes["placeholder"] + txtCRegresoHora2.Text + " - " +
            txtCRegresoHoraLlegada2.Attributes["placeholder"] + txtCRegresoHoraLlegada2.Text + '\n' +
            '\n';
        }
        if (rblCTraslado.SelectedValue == "sb")
        {
            datosCTraslado =
            "-- VIAJE EN AUTOBUS --" + '\n' + '\n' +
            lblRuta.Text + '\n' +
            txtCRutaOrigen.Attributes["placeholder"] + txtCRutaOrigen.Text + " - " +
            txtCRutaHoraLlegada.Attributes["placeholder"] + txtCRutaHoraLlegada.Text + '\n' +
            '\n';
        }

        if (rblCTraslado.SelectedValue != "no") { lblHiddenMensaje.Text += datosCTraslado; }

        lblHiddenMensaje.Text +=
            "- INFORMACI&Oacute;N ADICIONAL" + '\n' +
            '\n' +
            "Comentarios: " + txtComentarios.Text;
        lblHiddenMensaje.Text = lblHiddenMensaje.Text.Replace("\n", "<br />");

        //Crear el comando para el UPDATE
        SqlDSregistro.InsertCommand = "INSERT INTO renanpCursoProfesores VALUES ('" +
            txtNombre.Text + "', '" +
            txtCorreo.Text + "', '" +
            txtInstitucion.Text + "', '" +
            txtType.Text + "', '" +
            rblCTraslado.SelectedItem.Text + "', '" +
            txtCRutaOrigen.Text + "', '" +
            txtCRutaHoraLlegada.Text + "', '" +
            txtCSalidaOrigen1.Text + "', '" +
            txtCSalidaDestino1.Text + "', '" +
            txtCSalidaAerolinea1.Text + "', '" +
            txtCSalidaNoVuelo1.Text + "', '" +
            txtCSalidaFecha1.Text + "', '" +
            txtCSalidaHora1.Text + "', '" +
            txtCSalidaHoraLlegada1.Text + "', '" +
            txtCSalidaOrigen2.Text + "', '" +
            txtCSalidaDestino2.Text + "', '" +
            txtCSalidaAerolinea2.Text + "', '" +
            txtCSalidaNoVuelo2.Text + "', '" +
            txtCSalidaFecha2.Text + "', '" +
            txtCSalidaHora2.Text + "', '" +
            txtCSalidaHoraLlegada2.Text + "', '" +

            txtCRegresoOrigen1.Text + "', '" +
            txtCRegresoDestino1.Text + "', '" +
            txtCRegresoAerolinea1.Text + "', '" +
            txtCRegresoNoVuelo1.Text + "', '" +
            txtCRegresoFecha1.Text + "', '" +
            txtCRegresoHora1.Text + "', '" +
            txtCRegresoHoraLlegada1.Text + "', '" +
            txtCRegresoOrigen2.Text + "', '" +
            txtCRegresoDestino2.Text + "', '" +
            txtCRegresoAerolinea2.Text + "', '" +
            txtCRegresoNoVuelo2.Text + "', '" +
            txtCRegresoFecha2.Text + "', '" +
            txtCRegresoHora2.Text + "', '" +
            txtCRegresoHoraLlegada2.Text + "', '" +

            txtComentarios.Text + "', GetDate())";
        SqlDSregistro.Insert();

        string mensaje = "Gracias, el registro ha sido completado con exito." + '\n' +
            '\n' +
            lblHiddenMensaje.Text + '\n' +
            '\n' +
            '\n' +
            "Atentamente," + '\n' + "Comite Organizador" + '\n' + "CIBNOR, S.C.";

        mensaje = mensaje.Replace("\n", "<br />");

        // MANDAMOS EL CORREO
        Opb.enviarCorreo("-", "-", txtCorreo.Text, "aortega@cibnor.mx", correoAlias, correoSubject, mensaje, "normal");
        //Opb.enviarCorreo("-", "-", txtCorreo.Text, "jcollins@cibnor.mx", "jcollins@cibnor.mx", correoSubject, mensaje, "normal"); // PRUEBAS

        Response.Redirect("~/RegistroOk.aspx?evento=renanpCurso");

    }
}