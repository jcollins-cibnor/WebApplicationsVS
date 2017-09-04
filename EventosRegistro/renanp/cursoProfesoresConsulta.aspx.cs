using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class renanp_cursoProfesoresConsulta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var registroId = Request.QueryString["rId"]; // Este dato lo obtenemos del parametro en la URL
        registroId = registroId.ToUpper();

        SqlDSgeneral.SelectCommand = "SELECT * FROM [renanpCursoProfesores] WHERE [cursoId]='" + registroId + "'";
        grvConsulta.Visible = true;

        switch (registroId)
        {
            case "SCC":
                lblEventoId.Text = "3er. Curso RENANP - San Cristobal de Las Casas";
                //lblTituloPrincipal.Text = "3er. Curso RENANP - San Cristobal de Las Casas";
                //correoAlias = "curso-renanp3@cibnor.mx";
                //correoSubject = "Curso RENANP San Cristobal - Registro en linea";
                break;
            case "AGS":
            default:
                lblEventoId.Text = "2do. Curso RENANP - Aguascalientes";
                break;
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
        Response.AddHeader("Content-Disposition", "attachment;filename=Registro_" + lblEventoId.Text + ".xls");
        Response.Charset = "UTF-8";
        Response.Write(sb.ToString());
        Response.End();
    }

    protected void grvConsulta_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["liga"] = "./uploads/" + grvConsulta.SelectedRow.Cells[4].Text + ".pdf";
        Response.Redirect(Convert.ToString(Session["liga"]));

    }

}