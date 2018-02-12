using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConsultaIndividual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var folio = Request.QueryString["Id"];
        txtFolioId.Text = folio;
    }
}