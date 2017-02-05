using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class genomica2017_consulta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnExportar_Click(object sender, EventArgs e)
    {
        exportarExcel(grvConsulta);
    }

    protected void btnConsultar_Click(object sender, EventArgs e)
    {
        SqlDSgeneral.SelectCommand = "SELECT * FROM [" + lblEventoId.Text + "]";
        SqlDSgeneral.DataBind();
    }

    protected void exportarExcel(GridView nomGV)
    {
        if (grvConsulta.Rows.Count > 0)
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
        else {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Presiona -Realizar consulta- para mostrar los registros existentes');", true);
        }

    }

    protected void grvConsulta_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["liga"] = "./uploads/" + grvConsulta.SelectedRow.Cells[4].Text + ".pdf";
        Response.Redirect(Convert.ToString(Session["liga"]));

    }

}