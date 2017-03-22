using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

using System.IO;
using System.Net;
using System.Net.Mail;

/// <summary>
/// Descripción breve de OperacionesBasicas
/// </summary>
public class OperacionesBasicas
{
    public OperacionesBasicas()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    // Revisa si ya existe el registro en la 'tabla', buscando por el 'campo' y comparandolo con el 'texto'
    public int numRegistros(string tabla, string campo, string texto)
    {
        int numeroRegistros = 0;

        SqlConnection con = new SqlConnection(@"Data source=200.23.162.199; uid=sdbCib; pwd=m@rC0rtes1; Initial Catalog=REGWEB");
        //SqlConnection con = new SqlConnection(@"Data source=172.16.200.199; uid=sdbCib; pwd=m@rC0rtes1; Initial Catalog=REGWEB");//remote tests
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM " + tabla + " WHERE ([" + campo + "] = '" + texto + "')";
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();

        numeroRegistros = ds.Tables[0].Rows.Count;
        return numeroRegistros;
    }

    // Envia un correo a los destinos indicados, si se desea omitir un campo se indica con "-"
    public string enviarCorreo(string origen, string passwd, string destino, string copia, string copiaoculta, string asunto, string mensaje, string prioridad)
    {
        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
        mail.To.Add(destino);
        if (copia != "-") {
            mail.CC.Add(copia);
        }
        if (copiaoculta != "-") {
            mail.Bcc.Add(copiaoculta);
        }
        mail.Subject = asunto;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = mensaje;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true;
        mail.ReplyToList.Add(new MailAddress(copiaoculta));

        switch (prioridad) {
            case "baja":
                mail.Priority = MailPriority.Low;
                break;
            case "normal":
                mail.Priority = MailPriority.Normal;
                break;
            case "alta":
                mail.Priority = MailPriority.High;
                break;
        }
        SmtpClient client = new SmtpClient();

        //Add the Creddentials- use your own email id and password
        if (origen != "-") {
            mail.From = new MailAddress(origen, origen, System.Text.Encoding.UTF8);
            client.Credentials = new System.Net.NetworkCredential(origen, passwd);
        }
        else {
            client.Credentials = new System.Net.NetworkCredential("eventos.cibnor@cibnor.mx", "Eventos.1");
            mail.From = new MailAddress("eventos.cibnor@cibnor.mx", "eventos.cibnor@cibnor.mx", System.Text.Encoding.UTF8);
        }

        client.Port = 587; // Gmail works on this port
        client.Host = "smtp.gmail.com";
        client.EnableSsl = true; //Gmail works on Server Secured Layer

        try {
            client.Send(mail);
        }
        catch (Exception ex) {
            Exception ex2 = ex;
            string errorMessage = string.Empty;
            while (ex2 != null) {
                errorMessage += ex2.ToString();
                ex2 = ex2.InnerException;
            }
            return errorMessage;
        }

        return "-";
    }


    public string adjuntarArchivo(System.Web.UI.HtmlControls.HtmlInputFile fuControl, string uploadPath, string fileName)
    {
        if (fuControl.PostedFile != null)
        {
            // Indicamos la ruta
            string path = HttpContext.Current.ApplicationInstance.Server.MapPath(uploadPath);
            // Armamos el nombre del archivo
            string fn = System.IO.Path.GetFileName(fileName + ".pdf");
            // Obtenemos los parametros del archivo por subir
            var fileSize = fuControl.PostedFile.ContentLength;
            var fileMimeType = fuControl.PostedFile.ContentType;
            //lblStatus.Text = "Size: " + fileSize + ", MIME: " + fileMimeType;
            if (Path.GetExtension(fuControl.PostedFile.FileName).ToLower() != ".pdf")
            {
                return "El archivo debe ser tipo PDF";
            }
            if (fileSize > 2048000)
            {
                return "El archivo debe ser menor a 2MB";
            }

            // Subimos el archivo
            fuControl.PostedFile.SaveAs(System.IO.Path.Combine(path, fn));
        }
        return "ok";
    }
}