using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class renanp2016_consulta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var tipoRegistro = Request.QueryString["id"]; // Este dato lo obtenemos del parametro en la URL

        switch (tipoRegistro)
        {
            case "1a":
                lblEventoId.Text = "renanpTaller";
                SqlDSgeneral.SelectCommand = "SELECT * FROM [" + lblEventoId.Text + "]";
                grvConsulta.Visible = true;
                break;
            case "3a":
            default:
                lblEventoId.Text = "renanpCongreso";
                SqlDScongreso3a.SelectCommand = "SELECT * FROM [renanpCongreso3a]";
                grvConsultaCongreso3a.Visible = true;
                // FALTA AGREGAR LOS LINKS PARA VISUALIZAR EL COMPROBANTE DE PAGO Y LA CREDENCIAL, SI ES QUE LA INCLUYO EL PARTICIPANTE
                break;
        }

    }
    protected void btnExportar_Click(object sender, EventArgs e)
    {
        var tipoRegistro = Request.QueryString["id"]; // Este dato lo obtenemos del parametro en la URL
        switch (tipoRegistro)
        {
            case "1a":
                exportarExcel(grvConsulta);
                break;
            case "3a":
            default:
                exportarExcel(grvConsultaCongreso3a);
                break;
        }
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
    protected void grvConsultaCongreso3a_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["liga"] = "./uploads/" + grvConsultaCongreso3a.SelectedRow.Cells[3].Text + ".pdf";
        Response.Redirect(Convert.ToString(Session["liga"]));


//        Session["ligaC"] = "./uploads/" + grvConsultaCongreso3a.SelectedRow.Cells[3].Text + "_credencial.pdf";
        //Response.Redirect(Convert.ToString(Session["ligaC"]));
    }

}