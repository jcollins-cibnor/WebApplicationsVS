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

        switch (nomEv)
        {
            case "biorreactores":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                lblTituloEvento.Text = "Curso: Fundamentos Sobre Biorreactores, Diseño e Implementaci&oacute;n de Bioprocesos Aplicados a la Biotecnologia de Microalgas";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/biorreactores.html";
                break;

            case "genomica2017":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";

                lblTituloEvento.Text = "Taller de An&aacute;lisis de datos NGS: RNAseq y metagen&oacute;mica";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/genomica2017.html";
                break;
            case "simulators2016":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";

                lblTituloEvento.Text = "Computer simulators in conservation genetics";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/simulators2016.html";
                break;
            case "renanp2016":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";

                lblTituloEvento.Text = "RENANP 2016";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/renanp2016.html";
                break;
            case "genetica2016":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";

                lblTituloEvento.Text = "TRANSFORMACI&Oacute;N GEN&Eacute;TICA DE MICROALGAS PARA SU APLICACI&Oacute;N BIOTECNOL&Oacute;GICA";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/genetica2016.html";
                break;
            case "ogms2016":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                lblTituloEvento.Text = "2do. Foro nacional de discusi&oacute;n de organismos gen&eacute;ticamente modificados (OGMs-CIBNOR)";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos-cibnor/1723-2do-foro-nacional-de-discusion-de-organismos-geneticamente-modificados-ogms-cibnor";
                break;

            case "expociencias":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_pace.png";
                lblTituloEvento.Text = "Expociencias Sudcaliforniana";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/expociencias.html";
                break;

            case "jovenespace":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_pace.png";
                lblTituloEvento.Text = "4to. Encuentro Estatal de J&oacute;venes Investigadores en Baja California Sur";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/jovenespace.html";
                break;
            
            case "fotonica2016":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";

                lblTituloEvento.Text = "Curso te&oacute;rico-pr&aacute;ctico de microscop&iacute;a fot&oacute;nica y fotograf&iacute;a digital";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/fotonica2016.html";
                break;

            case "plantas2016":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";

                divTitulo.Attributes.CssStyle.Add("background-image", "url(../_img/logo_plantas2016.png)");
                divTitulo.Attributes.CssStyle.Add("height", "50px");

                lblTituloEvento.Text = "";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/plantas2016.html";
                break;

            case "crustaceos2016":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                lblTituloEvento.Text = "Aspectos te&oacute;ricos y aplicados al cultivo de crust&aacute;ceos dec&aacute;podos: reproducci&oacute;n y crecimiento";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/crustaceos2016.html";
                break;

            case "biorreactores2016":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                lblTituloEvento.Text = "Curso: Fundamentos Sobre Biorreactores, Diseño e Implementaci&oacute;n de Bioprocesos Aplicados a la Biotecnologia de Microalgas";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/biorreactores2016.html";
                break;

            case "salud2015":
                divContainer.Attributes.CssStyle.Add("padding-top", "5px");
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_izq1.Attributes.CssStyle.Add("height","60px");

                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                logo_der1.Attributes.CssStyle.Add("height","60px");

                //logo_centro1.ImageUrl = "./_img/logo_salud2015.png";
                //logo_centro1.Attributes.CssStyle.Add("height","60px");
                //logo_centro1.Visible = true;

                divTitulo.Attributes.CssStyle.Add("background-image", "url(../_img/logo_salud2015.png)");
                divTitulo.Attributes.CssStyle.Add("height", "50px");
                
                lblTituloEvento.Text = "";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/salud2015.html";
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
                logo_izq1.ImageUrl = "./_img/logo_40aniv.png";
                logo_der1.ImageUrl = "./_img/logo_dei.png";
                lblTituloEvento.Text = "Actividades del XL Aniversario";
                btnAceptar.PostBackUrl = "http://eventos.cibnor.mx";
                break;

            case "politicas2015":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                lblTituloEvento.Text = "Evaluaci&oacute;n de pol&iacute;ticas p&uacute;blicas e instrumentos de pol&iacute;tica ambiental en M&eacute;xico";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/politicas2015.html";
                break;

            case "microscopia":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                lblTituloEvento.Text = "8vo. Curso básico de microscopía electrónica de barrido, Colección y manejo de imágenes digitales";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/microscopia.html";
                break;

            case "microarreglos2015":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                lblTituloEvento.Text = "Microarreglos de ADN y Bioinformática NGS";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/microarreglos2015.html";
                break;

            case "recursos2015":
                logo_izq1.ImageUrl = "./_img/logo_cib_oficial.gif";
                logo_der1.ImageUrl = "./_img/logo_conacyt.png";
                lblTituloEvento.Text = "Los Recursos Naturales y La Legislacion Ambiental Mexicana";
                btnAceptar.PostBackUrl = "http://www.cibnor.gob.mx/eventos/recursos2015.html";
                break;

            default:
                break;
        }
    }
}