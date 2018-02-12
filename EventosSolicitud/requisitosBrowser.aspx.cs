using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class requisitosBrowser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Mostrara el tipo y caracteristiacas del Explorador.
        System.Web.HttpBrowserCapabilities browser = Request.Browser;

        string s = "Opciones del Explorador: "
             + "Tipo = " + browser.Type + "<br/>"
             + "Nombre = " + browser.Browser + "<br/>"
             + "Versión = " + browser.Version + "<br/>"
             + "Versión Principal = " + browser.MajorVersion + "<br/>"
             + "Versión Secundaria = " + browser.MinorVersion + "<br/>"
             + "Plataforma = " + browser.Platform + "<br/>"
             + "Beta = " + browser.Beta + "<br/>"
             + "Recolector = " + browser.Crawler + "<br/>"
             + "AOL = " + browser.AOL + "<br/>"
             + "Win16 = " + browser.Win16 + "<br/>"
             + "Win32 = " + browser.Win32 + "<br/>"
             + "Soporta Frames = " + browser.Frames + "<br/>"
             + "Soporta Tables = " + browser.Tables + "<br/>"
             + "Soporta Cookies = " + browser.Cookies + "<br/>"
             + "Soporta VBScript = " + browser.VBScript + "<br/>"
             + "Soporta JavaScript = " + browser.EcmaScriptVersion.ToString() + "<br/>"
             + "Soporta Java Applets = " + browser.JavaApplets + "<br/>"
             + "Soporta ActiveX Controls = " + browser.ActiveXControls + "<br/>"
             + "Soporta JavaScript Version = " + browser["JavaScriptVersion"] + "<br/>";
        
       // Response.Write(s);
        double jsVersion = Convert.ToDouble(browser["JavaScriptVersion"]);
        if (jsVersion >= 1.11) {
            Response.Write("Ok");
        }
        else {
            // Redireccionamos a la pagina donde le avisa la obsolecencia
            Response.Redirect("~/index.html");
        }
    }
}