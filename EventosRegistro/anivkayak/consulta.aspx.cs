using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class anivkayak_consulta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDSgeneral.SelectCommand = "SELECT * FROM [" + lblEventoId.Text + "]";
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

}