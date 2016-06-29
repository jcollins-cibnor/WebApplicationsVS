using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Net.Mail;

using System.Data;
using System.Data.SqlClient;

public partial class renanp2016_renanp2016 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Validacion del navegador
        System.Web.HttpBrowserCapabilities browser = Request.Browser;

        double jsVersion = Convert.ToDouble(browser["JavaScriptVersion"]);
        if (jsVersion >= 1.11)
        {
            // lblStatus.Text = jsVersion.ToString();
            // Response.Write("Ok");
        }
        else
        {
            // Redireccionamos a la pagina donde le avisa la obsolecencia
            Response.Redirect("~/BrowserCapabilities.html");
        }
        #endregion


        var tipoRegistro = Request.QueryString["id"]; // Este dato lo obtenemos del parametro en la URL

        switch (tipoRegistro) {
            case "1a":
                lblTituloPrincipal.Text = "Taller RENANP 2016";
                div1a.Attributes.Remove("hidden");
                break;
            case "3a": 
            default:
                tipoRegistro = "3a";
                lblTituloPrincipal.Text = "Congreso RENANP 2016";
                div3a.Attributes.Remove("hidden");
                break;
        }
        txtType.Text = tipoRegistro;
        hlkConsulta.NavigateUrl += "?id=" + tipoRegistro;
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        OperacionesBasicas Opb = new OperacionesBasicas();
        lblStatus.Text = "";
        var correoAlias = "";
        var correoSubject = "";

        switch (txtType.Text)
        {             
            #region Taller en Julio
            case "1a":
                lblHiddenMensaje.Text =
                    "- DATOS GENERALES" + '\n' +
                    '\n' +
                    "Nombre completo: " + txtNombre.Text + '\n' +
                    "Correo electr&oacute;nico: " + txtCorreo.Text + '\n' +
                    "Instituci&oacute;n: " + txtInstitucion.Text + '\n' +
                    '\n' +
                    "- ITINERARIO" + '\n' +
                    "Traslado: " + rblTraslado.SelectedItem.Text + '\n' +
                    '\n';
                    
                var datosTraslado =
                    "-- VIAJE DE IDA --" + '\n' + '\n' +
                    lblVueloSalida1.Text + '\n' +
                    txtSalidaOrigen1.Attributes["placeholder"] + txtSalidaOrigen1.Text + " - " +
                    txtSalidaDestino1.Attributes["placeholder"] + txtSalidaDestino1.Text + " - " +
                    txtSalidaAerolinea1.Attributes["placeholder"] + txtSalidaAerolinea1.Text + " - " +
                    txtSalidaNoVuelo1.Attributes["placeholder"] + txtSalidaNoVuelo1.Text + '\n' +
                    txtSalidaFecha1.Attributes["placeholder"] + txtSalidaFecha1.Text + " - " +
                    txtSalidaHora1.Attributes["placeholder"] + txtSalidaHora1.Text + " - " +
                    txtSalidaHoraLlegada1.Attributes["placeholder"] + txtSalidaHoraLlegada1.Text + '\n' +
                    '\n' +
                    lblVueloSalida2.Text + '\n' +
                    txtSalidaOrigen2.Attributes["placeholder"] + txtSalidaOrigen2.Text + " - " +
                    txtSalidaDestino2.Attributes["placeholder"] + txtSalidaDestino2.Text + " - " +
                    txtSalidaAerolinea2.Attributes["placeholder"] + txtSalidaAerolinea2.Text + " - " +
                    txtSalidaNoVuelo2.Attributes["placeholder"] + txtSalidaNoVuelo2.Text + '\n' +
                    txtSalidaFecha2.Attributes["placeholder"] + txtSalidaFecha2.Text + " - " +
                    txtSalidaHora2.Attributes["placeholder"] + txtSalidaHora2.Text + " - " +
                    txtSalidaHoraLlegada2.Attributes["placeholder"] + txtSalidaHoraLlegada2.Text + '\n' +
                    '\n' +
                    "-- VIAJE DE REGRESO --" + '\n' + '\n' +
                    lblVueloRegreso1.Text + '\n' +
                    txtRegresoOrigen1.Attributes["placeholder"] + txtRegresoOrigen1.Text + " - " +
                    txtRegresoDestino1.Attributes["placeholder"] + txtRegresoDestino1.Text + " - " +
                    txtRegresoAerolinea1.Attributes["placeholder"] + txtRegresoAerolinea1.Text + " - " +
                    txtRegresoNoVuelo1.Attributes["placeholder"] + txtRegresoNoVuelo1.Text + '\n' +
                    txtRegresoFecha1.Attributes["placeholder"] + txtRegresoFecha1.Text + " - " +
                    txtRegresoHora1.Attributes["placeholder"] + txtRegresoHora1.Text + " - " +
                    txtRegresoHoraLlegada1.Attributes["placeholder"] + txtRegresoHoraLlegada1.Text + '\n' +
                    '\n' +
                    lblVueloRegreso2.Text + '\n' +
                    txtRegresoOrigen2.Attributes["placeholder"] + txtRegresoOrigen2.Text + " - " +
                    txtRegresoDestino2.Attributes["placeholder"] + txtRegresoDestino2.Text + " - " +
                    txtRegresoAerolinea2.Attributes["placeholder"] + txtRegresoAerolinea2.Text + " - " +
                    txtRegresoNoVuelo2.Attributes["placeholder"] + txtRegresoNoVuelo2.Text + '\n' +
                    txtRegresoFecha2.Attributes["placeholder"] + txtRegresoFecha2.Text + " - " +
                    txtRegresoHora2.Attributes["placeholder"] + txtRegresoHora2.Text + " - " +
                    txtRegresoHoraLlegada2.Attributes["placeholder"] + txtRegresoHoraLlegada2.Text + '\n' +
                    '\n';

                if (rblTraslado.SelectedValue == "si") { lblHiddenMensaje.Text += datosTraslado; }
    
                lblHiddenMensaje.Text +=
                    "- INFORMACI&Oacute;N ADICIONAL" + '\n' +
                    '\n' +
                    "Comentarios: " + txtComentarios.Text;
                lblHiddenMensaje.Text = lblHiddenMensaje.Text.Replace("\n", "<br />");

                //Crear el comando para el UPDATE
                SqlDSregistro.InsertCommand = "INSERT INTO renanpTaller VALUES ('" +
                    txtNombre.Text + "', '" +
                    txtCorreo.Text + "', '" +
                    txtInstitucion.Text + "', '" +
                    rblTraslado.SelectedItem.Text + "', '" +
                    txtSalidaOrigen1.Text + "', '" +
                    txtSalidaDestino1.Text + "', '" +
                    txtSalidaAerolinea1.Text + "', '" +
                    txtSalidaNoVuelo1.Text + "', '" +
                    txtSalidaFecha1.Text + "', '" +
                    txtSalidaHora1.Text + "', '" +
                    txtSalidaHoraLlegada1.Text + "', '" +
                    txtSalidaOrigen2.Text + "', '" +
                    txtSalidaDestino2.Text + "', '" +
                    txtSalidaAerolinea2.Text + "', '" +
                    txtSalidaNoVuelo2.Text + "', '" +
                    txtSalidaFecha2.Text + "', '" +
                    txtSalidaHora2.Text + "', '" +
                    txtSalidaHoraLlegada2.Text + "', '" +

                    txtRegresoOrigen1.Text + "', '" +
                    txtRegresoDestino1.Text + "', '" +
                    txtRegresoAerolinea1.Text + "', '" +
                    txtRegresoNoVuelo1.Text + "', '" +
                    txtRegresoFecha1.Text + "', '" +
                    txtRegresoHora1.Text + "', '" +
                    txtRegresoHoraLlegada1.Text + "', '" +
                    txtRegresoOrigen2.Text + "', '" +
                    txtRegresoDestino2.Text + "', '" +
                    txtRegresoAerolinea2.Text + "', '" +
                    txtRegresoNoVuelo2.Text + "', '" +
                    txtRegresoFecha2.Text + "', '" +
                    txtRegresoHora2.Text + "', '" +
                    txtRegresoHoraLlegada2.Text + "', '" +

                    txtComentarios.Text + "', GetDate())";

                correoAlias = "taller-renanp@cibnor.mx";
                correoSubject = "Taller RENANP 2016 - Registro en linea.";

                break;
            #endregion

            #region Congreso en Noviembre, participantes que pagan
            case "3a":
                string fileUploadPago = "";
                string fileUploadCredencial = "";
                if (fuAdjuntoPago.Value.Length > 3)
                {
                    fileUploadPago = Opb.adjuntarArchivo(fuAdjuntoPago, "~/renanp2016/uploads", txtCorreo.Text);
                }
                if (fuAdjuntoCredencial.Value.Length > 3)
                {
                    fileUploadCredencial = Opb.adjuntarArchivo(fuAdjuntoCredencial, "~/renanp2016/uploads", txtCorreo.Text + "_credencial");
                }

                if (fileUploadPago != "ok" || fileUploadCredencial != "ok") {
                    break;
                }

                string estudiante = "NO";
                if (chkEstudiante.Checked) { estudiante = "SI"; }
                string factura = "NO";
                if (chkFactura.Checked) { factura = "SI"; }

                lblHiddenMensaje.Text =
                    "Nombre completo: " + txtNombre.Text + '\n' +
                    "Correo electr&oacute;nico: " + txtCorreo.Text + '\n' +
                    "Instituci&oacute;n: " + txtInstitucion.Text + '\n' +
                    '\n' +
                    "Modalidad: " + ddlModalidad.SelectedItem.Text + '\n' +
                    "Es estudiante: " + estudiante + '\n' +
                    "Titulo del resumen: " + txtTituloResumen.Text + '\n' +
                    "Autor(es): " + txtAutores.Text + '\n' +
                    "Co autor(es): " + txtCoAutores.Text + '\n' +
                    '\n' +
                    "Opcion de pago: " + ddlPago.SelectedItem.Text + '\n' +
                    "- Datos para facturaci&oacute;n ---" + '\n' +
                    "Requiere factura: " + factura + '\n' +
                    "RFC: " + txtFacturaRfc.Text + '\n' +
                    "Nombre: " + txtFacturaNombre.Text + '\n' +
                    "Domicilio: " + txtDomicilio.Text + '\n' +
                    '\n' +
                    "Comentarios: " + txtComentarios.Text;

                //Crear el comando para el UPDATE
                SqlDSregistro.InsertCommand = "INSERT INTO renanpCongreso3a VALUES ('" +
                    txtNombre.Text + "', '" +
                    txtCorreo.Text + "', '" +
                    txtInstitucion.Text + "', '" +

                    ddlModalidad.SelectedItem.Text + "', '" +
                    estudiante + "', '" +
                    txtTituloResumen.Text + "', '" +
                    txtAutores.Text + "', '" +
                    txtCoAutores.Text + "', '" +

                    ddlPago.SelectedItem.Text + "', '" +
                    factura + "', '" +
                    txtFacturaRfc.Text + "', '" +
                    txtFacturaNombre.Text + "', '" +
                    txtDomicilio.Text + "', '" +

                    txtComentarios.Text + "', GetDate())";

                correoAlias = "jcollins@cibnor.mx"; // "congreso-renanp@cibnor.mx";
                correoSubject = "Congreso RENANP 2016 - Registro en linea";
                break;
            #endregion
            default:
                break;
        }

        //lblStatus.Text = "Prueba de correo realizada con exito!"; // para pruebas

        SqlDSregistro.Insert();

        //ARMAR CUERPO DEL MENSAJE
        string mensaje = "Gracias, el registro ha sido completado con exito." + '\n' +
            '\n' +
            lblHiddenMensaje.Text + '\n' +
                '\n' +
                '\n' +
            "Atentamente," + '\n' + "Comite Organizador" + '\n' + "CIBNOR, S.C.";

        mensaje = mensaje.Replace("\n", "<br />");

        // MANDAMOS EL CORREO
       // Opb.enviarCorreo("-", "-", txtCorreo.Text, correoAlias, "-", correoSubject, mensaje, "normal");
        Opb.enviarCorreo("-", "-", "jcollins@cibnor.mx", "-", "-", correoSubject, mensaje, "normal");

        Response.Redirect("~/RegistroOk.aspx?evento=renanp2016");

    }


}