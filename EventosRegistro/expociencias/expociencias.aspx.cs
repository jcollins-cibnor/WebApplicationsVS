using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Net.Mail;

using System.Data;
using System.Data.SqlClient;

public partial class expociencias_expociencias : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected int numRegistrosClave()
    {
        int numeroRegistros = 0;

        SqlConnection con = new SqlConnection(@"Data source=200.23.162.199; uid=sdbCib; pwd=m@rC0rtes1; Initial Catalog=REGWEB");
        //SqlConnection con = new SqlConnection(@"Data source=172.16.200.199; uid=sdbCib; pwd=m@rC0rtes1; Initial Catalog=REGWEB");//remote test
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM expociencias WHERE ([categoria] = '" + 
                            ddlCategoria.SelectedItem.Text + "' AND [area] = '" + ddlArea.SelectedItem.Text + "')";
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();

        numeroRegistros = ds.Tables[0].Rows.Count;
        return numeroRegistros;
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        // lblStatus.Text = Convert.ToString(numRegistros()); 
        OperacionesBasicas Opb = new OperacionesBasicas();
        if (Opb.numRegistros("expociencias", "correoEst1", txtCorreoEst1.Text) > 0)
        {
            lblStatus.Text = "El correo que ingresaste ya se encuentra registrado, por favor utiliza otro.";
            txtCorreoEst1.Focus();
        }
        else {
            if (fuArchivo.Value.Length > 3) {
                string fileUpload = "";
                fileUpload = Opb.adjuntarArchivo(fuArchivo, "~/expociencias/uploads", txtCorreoEst1.Text);
            }

            lblStatus.Text = "";
            lblHiddenClave.Text = ddlCategoria.SelectedValue + ddlArea.SelectedValue + Convert.ToString(numRegistrosClave() + 1);

            string equipo = " " + '\n';
            if (rblNumeroEstudiantes.SelectedValue != "1") {
                equipo +=
                    "Nombre completo del estudiante 2: " + txtNombreEst2.Text + '\n' +
                    "Correo electr&oacute;nico: " + txtCorreoEst2.Text + '\n' +
                    "Nombre completo del estudiante 3: " + txtNombreEst3.Text + '\n' +
                    "Correo electr&oacute;nico: " + txtCorreoEst3.Text + '\n';
            }
            #region cuerpo del mensaje
            lblHiddenMensaje.Text =
                "- DATOS GENERALES DEL AUTOR(ES) Y ASESOR(ES)" + '\n' +
                '\n' +
                "Nombre completo del estudiante titular: " + txtNombreEst1.Text + '\n' +
                "Correo electr&oacute;nico: " + txtCorreoEst1.Text + '\n' +
                "Tel&eacute;fono: " + txtTelefonoEst1.Text + '\n' +
                "Sexo: " + ddlSexoEst1.SelectedValue + '\n' +
                "Edad: " + txtEdadEst1.Text + '\n' +

                "Individual o Equipo: " + rblNumeroEstudiantes.SelectedItem.Text + 
                equipo +

                "Nombre de la instituci&oacute;n: " + txtInstitucion.Text + '\n' +
                "Domicilio oficial: " + txtDomicilio.Text + '\n' +
                "Municipio: " + txtMunicipio.Text + '\n' +

                "Nombre completo asesor(a): " + txtNombreAsesor.Text + '\n' +
                "Correo electr&oacute;nico: " + txtCorreoAsesor.Text + '\n' +
                "Tel&eacute;fono: " + txtTelefonoAsesor.Text + '\n' +
                '\n' +
                "- DATOS DEL PROYECTO Y PARTICIPACI&Oacute;N" + '\n' +
                '\n' +
                "Nombre del proyecto u obra: " + txtNombreProyecto.Text + '\n' +
                "Categor&iacute;a de participaci&oacute;n: " + ddlCategoria.SelectedItem.Text + '\n' +
                "&Aacute;rea de participaci&oacute;n: " + ddlArea.SelectedItem.Text + '\n' +
                '\n' +
                "Descripci&oacute;n del proyecto: " + '\n' + txtDescripcionProyecto.Text + '\n' +
                '\n' +
                "Forma de pago: " + rblTipoPago.SelectedValue + '\n' +
                '\n' +
                "- INFORMACI&Oacute;N ADICIONAL" + '\n' +
                '\n' +
                "Nombre completo de quien requiere el hospedaje: " + txtNombreHuesped.Text + '\n' +
                "Justificaci&oacute;n: " + txtJustificacion.Text + '\n' +
                '\n' +
                '\n' +
                "Clave de registro: " + lblHiddenClave.Text;
            lblHiddenMensaje.Text = lblHiddenMensaje.Text.Replace("\n", "<br />");
            #endregion

            #region InsertCommand
            //txtDescripcionProyecto.Text = txtDescripcionProyecto.Text.Replace("\n", "<br />");
            //Crear el comando para el UPDATE
            SqlDSregistro.InsertCommand = "INSERT INTO expociencias VALUES ('" +
                txtNombreEst1.Text + "', '" +
                txtCorreoEst1.Text + "', '" +
                txtTelefonoEst1.Text + "', '" +
                ddlSexoEst1.SelectedValue + "', '" +
                txtEdadEst1.Text + "', '" +
                rblNumeroEstudiantes.SelectedValue + "', '" +
                txtNombreEst2.Text + "', '" +
                txtCorreoEst2.Text + "', '" +
                txtNombreEst3.Text + "', '" +
                txtCorreoEst3.Text + "', '" +

                txtNombreAsesor.Text + "', '" +
                txtCorreoAsesor.Text + "', '" +
                txtTelefonoAsesor.Text + "', '" +
                txtInstitucion.Text + "', '" +
                txtDomicilio.Text + "', '" +
                txtMunicipio.Text + "', '" +

                txtNombreProyecto.Text + "', '" +
                ddlCategoria.SelectedItem.Text + "', '" +
                ddlArea.SelectedItem.Text + "', '" +
                txtDescripcionProyecto.Text + "', '" +
                txtNombreHuesped.Text + "', '" +
                txtJustificacion.Text + "', '" +
                lblHiddenClave.Text + "', '" +
                rblTipoPago.SelectedValue + "', GetDate())";
            #endregion

            SqlDSregistro.Insert();

            //ARMAR CUERPO DEL MENSAJE
            string mensaje = "Estimado(a) participante, el registro ha sido completado con exíto." + '\n' +
                '\n' +
                lblHiddenMensaje.Text + '\n' +
                    '\n' +
                    '\n' +
                "Gracias," + '\n' + "Comite Organizador" + '\n' + "CIBNOR, S.C.";

            mensaje = mensaje.Replace("\n", "<br />");

            // MANDAMOS EL CORREO
            Opb.enviarCorreo("-", "-", txtCorreoEst1.Text, "expociencias@cibnor.mx", "xgodinez@cibnor.mx", "Expociencias - Registro en linea", lblHiddenMensaje.Text, "normal");
            //Opb.enviarCorreo("-", "-", txtCorreoEst1.Text, "jcollins@cibnor.mx", "-", "TEST_Expociencias - Registro en linea", lblHiddenMensaje.Text, "normal"); // para pruebas

            Response.Redirect("~/RegistroOk.aspx?evento=expociencias");
        }

    }


}