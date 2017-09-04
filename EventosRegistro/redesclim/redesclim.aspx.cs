using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class redesclim_redesclim : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Validacion del navegador
        System.Web.HttpBrowserCapabilities browser = Request.Browser;
        double jsVersion = Convert.ToDouble(browser["JavaScriptVersion"]);
        if (jsVersion >= 1.11)
        {
            // lblStatus.Text = jsVersion.ToString(); Response.Write("Ok");
        }
        else
        {
            Response.Redirect("~/BrowserCapabilities.html"); // Redireccionamos a la pagina donde le avisa la obsolecencia
        }
        #endregion
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
//        OperacionesBasicas Opb = new OperacionesBasicas(); // Inicializamos el objeto para enviar correo

//        // Inicializamos los estilos para las cajas de respuestas en el correo
//        string pOpenTag = "<p style='border:1px solid black; width:370px; padding:4px; background-color:#ddd;'>";
//        string pCloseTag = "</p>";

//        // Obtenemos el valor del radio por medio del atributo "name"
//        string traslado = (Request.Form["traslado"] != null) ? traslado = Request.Form["traslado"].ToString() : "";
//        string msgTraslado = "";
//        string typeTraslado = "Me trasladar&eacute; en autob&uacute;s";
//        switch (traslado)
//        {
//            case "cuenta":
//                typeTraslado = "Por cuenta propia";
//                msgTraslado = pOpenTag + "Me trasladar&eacute; por cuenta propia" + pCloseTag;
//                break;
//            case "aereo":
//                typeTraslado = "Aéreo";
//                msgTraslado = pOpenTag + "Requiero traslado aéreo" + pCloseTag +
//                    "# Viaje de ida #" + '\n' +
//                    "> > Vuelo inicial" + pOpenTag +
//                    salidaRuta1.Attributes["placeholder"] + ": " + salidaRuta1.Value + " - " +
//                    salidaAerolinea1.Attributes["placeholder"] + ": " + salidaAerolinea1.Value + " - " +
//                    salidaVuelo1.Attributes["placeholder"] + ": " + salidaVuelo1.Value + " - " +
//                    salidaFecha1.Attributes["placeholder"] + ": " + salidaFecha1.Value + " - " +
//                    salidaHora1.Attributes["placeholder"] + ": " + salidaHora1.Value + " - " +
//                    salidaHoraLlegada1.Attributes["placeholder"] + ": " + salidaHoraLlegada1.Value + pCloseTag +
//                    "> > Vuelo escala" + pOpenTag +
//                    salidaRuta2.Attributes["placeholder"] + ": " + salidaRuta2.Value + " - " +
//                    salidaAerolinea2.Attributes["placeholder"] + ": " + salidaAerolinea2.Value + " - " +
//                    salidaVuelo2.Attributes["placeholder"] + ": " + salidaVuelo2.Value + " - " +
//                    salidaFecha2.Attributes["placeholder"] + ": " + salidaFecha2.Value + " - " +
//                    salidaHora2.Attributes["placeholder"] + ": " + salidaHora2.Value + " - " +
//                    salidaHoraLlegada2.Attributes["placeholder"] + ": " + salidaHoraLlegada2.Value + pCloseTag +
//                    "# Viaje de regreso #" + '\n' +
//                    "> > Vuelo inicial" + pOpenTag +
//                    regresoRuta1.Attributes["placeholder"] + ": " + regresoRuta1.Value + " - " +
//                    regresoAerolinea1.Attributes["placeholder"] + ": " + regresoAerolinea1.Value + " - " +
//                    regresoVuelo1.Attributes["placeholder"] + ": " + regresoVuelo1.Value + " - " +
//                    regresoFecha1.Attributes["placeholder"] + ": " + regresoFecha1.Value + " - " +
//                    regresoHora1.Attributes["placeholder"] + ": " + regresoHora1.Value + " - " +
//                    regresoHoraLlegada1.Attributes["placeholder"] + ": " + regresoHoraLlegada1.Value + pCloseTag +
//                    "> > Vuelo escala" + pOpenTag +
//                    regresoRuta2.Attributes["placeholder"] + ": " + regresoRuta2.Value + " - " +
//                    regresoAerolinea2.Attributes["placeholder"] + ": " + regresoAerolinea2.Value + " - " +
//                    regresoVuelo2.Attributes["placeholder"] + ": " + regresoVuelo2.Value + " - " +
//                    regresoFecha2.Attributes["placeholder"] + ": " + regresoFecha2.Value + " - " +
//                    regresoHora2.Attributes["placeholder"] + ": " + regresoHora2.Value + " - " +
//                    regresoHoraLlegada2.Attributes["placeholder"] + ": " + regresoHoraLlegada2.Value + pCloseTag;                
//                break;
//            case "autobus":
//                msgTraslado = pOpenTag + "En autobús" + pCloseTag +
//                    rutaOrigen.Attributes["placeholder"] + ": " + pOpenTag + rutaOrigen.Value + " - " +
//                    rutaLlegada.Attributes["placeholder"] + ": " + rutaLlegada.Value + pCloseTag;
//                break;
//            default: break;
//        }

//        string msgBody =
//             "- DATOS GENERALES" + '\n' +
//            '\n' +
//            "Nombre completo: " + pOpenTag + nombres.Text + " " + apellidos.Text + pCloseTag +
//            "Correo electr&oacute;nico: " + pOpenTag + correo.Text + pCloseTag +
//            institucion.Attributes["placeholder"] + ": " + pOpenTag + institucion.Value + pCloseTag +
//            '\n' +
//            "- ITINERARIO" + msgTraslado + 
//            '\n' +
//            comentarios.Attributes["placeholder"] + ": " + pOpenTag + comentarios.Value + pCloseTag;

//        // ACTUALIZAR CON BOOTSTRAP "RegistroOk.aspx"

//#region Crear el comando para el UPDATE
//        SqlDSregistro.InsertCommand = "INSERT INTO redesclim VALUES ('" +
//            nombres.Text + "', '" +
//            apellidos.Text + "', '" +
//            correo.Text + "', '" +
//            institucion.Value + "', '" +
//            typeTraslado + "', '" +
//            rutaOrigen.Value + "', '" +
//            rutaLlegada.Value + "', '" +

//            salidaRuta1.Value + "', '" +
//            salidaAerolinea1.Value + "', '" +
//            salidaVuelo1.Value + "', '" +
//            salidaFecha1.Value + "', '" +
//            salidaHora1.Value + "', '" +
//            salidaHoraLlegada1.Value + "', '" +
//            salidaRuta2.Value + "', '" +
//            salidaAerolinea2.Value + "', '" +
//            salidaVuelo2.Value + "', '" +
//            salidaFecha2.Value + "', '" +
//            salidaHora2.Value + "', '" +
//            salidaHoraLlegada2.Value + "', '" +

//            regresoRuta1.Value + "', '" +
//            regresoAerolinea1.Value + "', '" +
//            regresoVuelo1.Value + "', '" +
//            regresoFecha1.Value + "', '" +
//            regresoHora1.Value + "', '" +
//            regresoHoraLlegada1.Value + "', '" +
//            regresoRuta2.Value + "', '" +
//            regresoAerolinea2.Value + "', '" +
//            regresoVuelo2.Value + "', '" +
//            regresoFecha2.Value + "', '" +
//            regresoHora2.Value + "', '" +
//            regresoHoraLlegada2.Value + "', '" +

//            comentarios.Value + "', GetDate())";
//        SqlDSregistro.Insert();
//#endregion

//        string mensaje = "Gracias, el registro ha sido completado con &eacute;xito." + '\n' +
//            '\n' +
//            msgBody + '\n' +
//            '\n' +
//            "Atentamente," + '\n' + "Comit&eacute; Organizador" + '\n' + "CIBNOR, S.C.";

//        mensaje = mensaje.Replace("\n", "<br />");

//        // MANDAMOS EL CORREO
//        Opb.enviarCorreo("-", "-", correo.Text, "-", "redesclim@cibnor.mx", "Barras 2017 - Registro en linea", mensaje, "normal");
//        //Opb.enviarCorreo("-", "-", correo.Text, "jcollins@cibnor.mx", "jcollins@cibnor.mx", "Barras 2017 - Registro", mensaje, "normal"); // PRUEBAS

//        Response.Redirect("~/RegistroOk.aspx?evento=redesclim");

    }
}