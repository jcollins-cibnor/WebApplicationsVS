using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        

    }
    protected void ddlEventos_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnExportar.Enabled = false;
        if (ddlEventos.SelectedValue != "0")
        {
            SqlDSgeneral.SelectCommand = "SELECT * FROM [" + ddlEventos.SelectedValue + "]";

            SqlDSgeneral.DataBind();
            btnExportar.Enabled = true;
        }
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

        Response.AddHeader("Content-Disposition", "attachment;filename=" + ddlEventos.SelectedValue + ".xls");
        Response.Charset = "UTF-8";
        Response.Write(sb.ToString());
        Response.End();
    }

    //protected void exportarExcel(GridView nomGV)
    //{
    //    System.Text.StringBuilder sb = new System.Text.StringBuilder();
    //    System.IO.StringWriter sw = new System.IO.StringWriter(sb);
    //    System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);

    //    Page page = new Page();
    //    HtmlForm form = new HtmlForm();
    //    nomGV.EnableViewState = false;
    //    page.EnableEventValidation = false;
    //    page.DesignerInitialize();
    //    page.Controls.Add(form);
    //    page.RenderControl(htw);

    //    form.Controls.Add(nomGV);

    //    Response.Clear();
    //    Response.Buffer = true;
    //    Response.ContentType = "application/vnd.ms-excel";

    //    Response.AddHeader("Content-Disposition", "attachment;filename=" + ddlEventos.SelectedValue + ".xls");
    //    Response.Charset = "UTF-8";
    //    Response.Write(sb.ToString());
    //    Response.End();
    //}
}