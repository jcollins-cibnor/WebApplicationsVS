using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistroOk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string nomEv = Request.QueryString["evento"];

        lblSubTituloEvento.Text = "";
        switch (nomEv)
        {
            case "redesclim":
                //logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./redesclim/images/logo_redesclim.png";
                lblTituloEvento.Text = "REDESClim 2017";
                lblSubTituloEvento.Text = "Quinta Reunión Nacional";
                btnAceptar.PostBackUrl = "http://www.redesclim.org.mx/";
                break;
            
            case "barras2017":
                //logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                lblTituloEvento.Text = "Cuarta Reunión Nacional de la Red Temática Código de Barras de la vida";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/barras2017.html";
                break;

            case "genomica2017":
                //logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                lblTituloEvento.Text = "Taller de An&aacute;lisis de datos NGS: RNAseq y metagen&oacute;mica";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/genomica2017.html";
                break;

            case "anivseguridad":
            case "anivkayak":
            case "anivdomino":
            case "nochebohemia":
            case "anivboliche":
            case "anivatletica":
            case "anivrecorrido":
            case "anivtochito":
            case "anivsoftbol":
            case "anivbasquet":
            case "anivfutbol":
            case "anivvoleibol":
                //logo_izq1.ImageUrl = "./_img/logo_40aniv.png";
                logo_der1.ImageUrl = "./_img/logo_aniv.png";
                lblTituloEvento.Text = "Actividades de Aniversario";
                lblSubTituloEvento.Text = "Registro en línea";
                btnAceptar.PostBackUrl = "http://eventos.cibnor.mx";
                break;

            case "biorreactores":
                //logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                lblTituloEvento.Text = "Curso: Fundamentos Sobre Biorreactores, Diseño e Implementaci&oacute;n de Bioprocesos Aplicados a la Biotecnologia de Microalgas";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/biorreactores.html";
                break;

            case "microscopia":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                lblTituloEvento.Text = "8vo. Curso básico de microscopía electrónica de barrido, Colección y manejo de imágenes digitales";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/microscopia.html";
                break;

            case "expociencias":
                //logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_pace.png";
                lblTituloEvento.Text = "Expociencias Sudcaliforniana";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/expociencias.html";
                break;

            case "jovenespace":
                //logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_pace.png";
                lblTituloEvento.Text = "4to. Encuentro Estatal de J&oacute;venes Investigadores en Baja California Sur";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/jovenespace.html";
                break;

            default:
                break;
        }
    }
}