using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConsultaEspecifica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSiguiente_Click(object sender, EventArgs e)
    {
        int tmp = Convert.ToInt32(txtFolioId.Text.Trim());
        tmp += 1;
        txtFolioId.Text = tmp.ToString();
    }
    protected void btnAnterior_Click(object sender, EventArgs e)
    {
        int tmp = Convert.ToInt32(txtFolioId.Text.Trim());
        tmp -= 1;
        txtFolioId.Text = tmp.ToString();
    }
}