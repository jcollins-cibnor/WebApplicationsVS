using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using System;
using System.IO;

public partial class recursos2015_consulta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnExportar_Click(object sender, EventArgs e)
    {
        exportarExcel(grvConsulta);
    }

    protected void exportarExcel(GridView nomGV)
    {
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        System.IO.StringWriter sw = new System.IO.StringWriter(sb);
        System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);

        Page page = new Page();
        HtmlForm form = new HtmlForm();
        nomGV.EnableViewState = false;
        page.EnableEventValidation = false;
        page.DesignerInitialize();
        page.Controls.Add(form);
        form.Controls.Add(nomGV);
        page.RenderControl(htw);
        Response.Clear();
        Response.Buffer = true;
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=Registro_" + lblEventoId.Text + ".xls");
        Response.Charset = "UTF-8";
        Response.Write(sb.ToString());
        Response.End();
    }

    protected void grvConsulta_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["liga"] = "http://200.23.162.100/registroweb/cultivos2015/" + grvConsulta.SelectedRow.Cells[4].Text + ".pdf";
        string path = Convert.ToString(Session["liga"]);
        // NO FUNCIONA !!!!!!!!!!!!!!
        string serverPath = Server.MapPath(path);

        if (File.Exists(serverPath))
        {
            lblEventoId.Text = Convert.ToString(Session["liga"]);
//            Response.Redirect(Convert.ToString(Session["liga"]));
        }
        else {
            lblEventoId.Text = "NO! existe";
//            Response.Redirect("./Default.aspx");
        }


    }
}