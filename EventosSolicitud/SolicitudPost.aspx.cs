using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// Requerido para CultureInfo
using System.Globalization;
// Requerido para el insert del store procedure
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
// Requerido para enviar correo
using System.IO;
using System.Net;
using System.Net.Mail;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) { }

    protected void Page_PreRender(object sender, EventArgs e) {
        CultureInfo dateInfo = new CultureInfo("es-ES");
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo; // Contiene la funcion -ToTitleCase-
        #region// Tabla: SolEventoGral ------------------------------
        DateTime Fecha = DateTime.Now;
        // TitularId se asigna a un label para que se pueda generar la consulta requerida para obtener AreaId y Extel 
        var TitularId = Request.Form["ddlTitular"];
        lblTitular.Text = TitularId;

        var NomSolicitante = Request.Form["txtSolicitanteNombre"].Trim();
        var Email = Request.Form["txtSolicitanteCorreo"].Trim();
        var Tel = Request.Form["txtSolicitanteTelefono"].Trim();
        var Extel = gvDirectorioDatos.Rows[0].Cells[3].Text;

        var contactoTel = "<tr><td>Tel/Ext: </td><td><strong>" + Tel + "</strong></td></tr>" +
                          "<tr><td>Ext. titular: </td><td><strong>" + Extel + "</strong></td></tr>";

        var chkTitular = Request.Form["chkTitular"];
        if (chkTitular == "1") { // ¿El solicitante es el titular? Si si, obtenemos los datos de la consulta
            NomSolicitante = textInfo.ToTitleCase(gvDirectorioDatos.Rows[0].Cells[2].Text + " " + gvDirectorioDatos.Rows[0].Cells[1].Text);
            Email = gvCat_empl.Rows[0].Cells[1].Text.Trim();
            if (Email != "") { Email += "@cibnor.mx"; }
            Tel = "";
            contactoTel = "<tr><td>Extensi&oacute;n Tel: </td><td><strong>" + Extel + "</strong></td></tr>";
        }
        var areaId = gvCat_empl.Rows[0].Cells[2].Text.Trim();
        var AreaOtro = "";
        int UbicacionId = 1; // Probablemente en otro catalogo, revisar en el servidor abulon, sin embargo NO NOS SIRVE ESTE DATO

        var Proyecto = Request.Form["ddlProyecto"].Trim();
        lblClaveProy.Text = Proyecto;
        //var proyDescLen = (gvProyectoYResp.Rows[0].Cells[1].Text.Length > 59) ? 59 : gvProyectoYResp.Rows[0].Cells[1].Text.Length;
        //var proyDescLarga = gvProyectoYResp.Rows[0].Cells[1].Text.Substring(0, proyDescLen);
        var proyDescLarga = gvProyectoYResp.Rows[0].Cells[1].Text.Trim();
        proyDescLarga = proyDescLarga.Substring(0, 1) + textInfo.ToLower(proyDescLarga.Substring(1, proyDescLarga.Length - 1));
        var proyRespon = gvProyectoYResp.Rows[0].Cells[2].Text.Trim();

        int Folio = 999910000; // Armar el FOLIO: Obtener el ultimo de la tabla, tomando en cuenta el cambio de año para reiniciar el contador
        int thisYear = Fecha.Year;
        int lastYear = Convert.ToInt32(gvgetmaxyearSolEventoGral.Rows[0].Cells[0].Text);
        // El año actual es mayor que el año del ultimo folio ? Reinicia el contador, en caso contrario, sumale uno al ultimo
        Folio = (thisYear > lastYear) ? (100000 * thisYear) + 1 : Convert.ToInt32(gvgetmaxyearSolEventoGral.Rows[0].Cells[1].Text) + 1;

        int solicitudId = 99999; // Inicializamos la variable solo por seguridad, el primer -INSERT- nos devolvera el Id
        #endregion// EOF Tabla: SolEventoGral ------------------------------

        // Tabla: SolEventoDatos ------------------------------
        #region parte 1 de 2
        var NombreTitular = textInfo.ToUpper(gvDirectorioDatos.Rows[0].Cells[1].Text + ", " + gvDirectorioDatos.Rows[0].Cells[2].Text);
        var EmailTitular = gvCat_empl.Rows[0].Cells[1].Text.Trim() + "@cibnor.mx";

        var CategoriaId = Request.Form["ddlCategoria"].Trim();
        lblIdCategoria.Text = CategoriaId; // Para la consulta del catalogo CatCategorias
        var Categoria = gvCatCategorias.Rows[0].Cells[1].Text.Trim(); // Es la que se grabara en la table "SolEventoDatos"
        var CategoriaDesc = gvCatCategorias.Rows[0].Cells[2].Text.Trim(); // Se utilizara para el envio de correo

        var Reprogramado = "NO";
        var FolioPrevio = ""; // Del folio previo
        int FolioId = 0; // Del folio previo
        int NumPersonas = Convert.ToInt32(Request.Form["txtNumeroAsistentes"].ToString().Trim());
        var Evento = Request.Form["txtTituloEvento"].ToString().Trim();
        Evento = Evento.Substring(0, 1).ToUpper() + Evento.Substring(1).ToLower(); // Titulo del evento con la 1era letra en mayusculas
        var DescripEvento = Request.Form["txtDescripcionEvento"].ToString().Trim();
        var Director = Request.Form["ddlDirector"].ToString().Trim();

        var chkMultiplesFechas = Request.Form["chkMultiplesFechas"];
        // Si es una sola fecha, ambas variables (-FechaIni-, -FechaFin-) obtienen el mismo valor.. 
        DateTime FechaIni = Convert.ToDateTime(Request.Form["txtFecha"].ToString().Trim(), dateInfo);
        DateTime FechaFin = Convert.ToDateTime(Request.Form["txtFecha"].ToString().Trim(), dateInfo);
        var TipoHorario = "REGULAR";
        var HoraIni = Request.Form["txtHoraI"].ToString().Trim();
        var HoraFin = Request.Form["txtHoraT"].ToString().Trim();

        var listFechaIni = new List<DateTime>();
        var listHoraIni = new List<String>();
        var listHoraFin = new List<String>();

        // Agregamos como primer elemento de la coleccion los valores en las variables independientes
        listFechaIni.Add(FechaIni);
        listHoraIni.Add(HoraIni);
        listHoraFin.Add(HoraFin);
        #endregion
        // Si es mas de una fecha, le agregamos a la coleccion a partir del segundo elemento de la tabla ("_1"),
        // para que al final queden todas las fechas en la coleccion
        #region// Tabla: SolEventoHorario ------------------------------
        if (!String.IsNullOrEmpty(chkMultiplesFechas))
        { // Es mas de una fecha
            var tblRow = 1;
            var tblContinue = true;
            // Si son varias fechas -FechaIni- obtiene la 1era fecha y -FechaFin- la ultima
            while (tblContinue)
            {
                var FechaInistr = Request.Form["txtFecha_" + tblRow];
                var HoraInistr = Request.Form["txtHoraI_" + tblRow];
                var HoraTerstr = Request.Form["txtHoraT_" + tblRow];

                if (!String.IsNullOrEmpty(FechaInistr))
                {
                    DateTime rowDate = Convert.ToDateTime(FechaInistr.ToString().Trim(), dateInfo);
                    FechaIni = (rowDate < FechaIni) ? rowDate : FechaIni; // Se asignan las fechas inicial y final
                    FechaFin = (rowDate > FechaFin) ? rowDate : FechaFin;
                    listFechaIni.Add(rowDate); // Se agrega el renglon a las listas correspondientes
                    listHoraIni.Add(HoraInistr.ToString().Trim());
                    listHoraFin.Add(HoraTerstr.ToString().Trim());
                }
                else
                {
                    tblContinue = false;
                }
                tblRow += 1;
            }
            TipoHorario = "IRREGULAR";
            HoraIni = "";
            HoraFin = "";
        }
        #endregion// EOF Tabla: SolEventoHorario ------------------------------
        #region parte 2 de 2
        var fsItem = Request.Form["rdoTipoEvento"];
        var TipoEvento = (fsItem == "1") ? "INTERNO" : "EXTERNO";
        var EquipoOtro = Request.Form["txtOtroEquipoEspecifique"].ToString().Trim();
        var Justificacion = Request.Form["txtJustificacion"].ToString().Trim();
        var Beneficiarios = Request.Form["txtBeneficiarios"].ToString().Trim();
        var Objetivos = Request.Form["txtObjetivos"].ToString().Trim();
        var Programas = Request.Form["txtProgramas"].ToString().Trim();
        var OtroApoyo = Request.Form["txtOtroApoyoEspecifique"].ToString().Trim();
        var Comentarios = Request.Form["txtComentarios"].ToString().Trim();

        //INFORMACIÓN ADMINISTRATIVA
        var OtroCategoria = "";
        var Observaciones = "";
        var ComentariosAdmon = "";
        var Atendida = "N";
        var Atendieron = "";
        var PublicarCalendario = Request.Form["ddlDisponiblePara"].ToString().Trim();
        var TipoAniversario = "NO";
        #endregion// EOF Tabla: SolEventoDatos ------------------------------

        #region// Tabla: SolEventoLugares (los que indica el usuario) ------------------------------
        Dictionary<int, string> listLugares = new Dictionary<int, string>(); // Declaramos una nueva instancia para almacenar los pares
        var txtLugares = Request.Form["inputLugares"].ToString().Trim(); // Obtenemos la cadena donde se encuentran almacenados los valores

        var ia = 0; var ib = 0; var ic = 0; // Inicializamos los indices
        while (ia < txtLugares.Length)
        { // El indice -ia- es el principal, por lo tanto preguntamos si es mayor que la longitud de la cadena
            ib = txtLugares.IndexOf("|", ia); // Obtenemos el indice de la primera ocurrencia del caracter "|" el cual divide los pares
            var tmpSubstr = txtLugares.Substring(ia, ib - ia); // Obtenemos la substr que contiene ambos valores del par actual
            var dk = ""; var dv = ""; // Inicializamos los contenedores individuales de los pares
            ic = tmpSubstr.IndexOf(":", 0); // Obtenemos el indice del caracter ":" (si existe sera mayor a 0) el cual divide los valores
            if (ic > 0)
            { // Si tiene dato en el -textbox-
                dk = tmpSubstr.Substring(1, ic - 1);
                dv = tmpSubstr.Substring(ic + 1, tmpSubstr.Length - ic - 1);
            }
            else
            { // No existe o no tiene dato
                dk = tmpSubstr.Substring(1, tmpSubstr.Length - 1);
                dv = "";
            }
            listLugares.Add(Convert.ToInt32(dk), dv); // Agregamos el par de valores a -listLugares-
            ia = ib + 1;
        }
        #endregion// EOF Tabla: SolEventoLugares ------------------------------

        // Tabla: SolEventoInsumos (los que indica el usuario) ------------------------------
        #region
        Dictionary<int, string> listInsumos = new Dictionary<int, string>(); // Declaramos una nueva instancia para almacenar los pares
        var txtInsumos = Request.Form["inputInsumos"].ToString().Trim(); // Obtenemos la cadena donde se encuentran almacenados los valores

        ia = 0; ib = 0; ic = 0; // Inicializamos los indices
        while (ia < txtInsumos.Length)
        { // El indice -ia- es el principal, por lo tanto preguntamos si es mayor que la longitud de la cadena
            ib = txtInsumos.IndexOf("|", ia); // Obtenemos el indice de la primera ocurrencia del caracter "|" el cual divide los pares
            var tmpSubstr = txtInsumos.Substring(ia, ib - ia); // Obtenemos la substr que contiene ambos valores del par actual
            var dk = ""; var dv = ""; // Inicializamos los contenedores individuales de los pares
            ic = tmpSubstr.IndexOf(":", 0); // Obtenemos el indice del caracter ":" (si existe sera mayor a 0) el cual divide los valores
            if (ic > 0)
            { // Si tiene dato en el -textbox-
                dk = tmpSubstr.Substring(1, ic - 1);
                dv = tmpSubstr.Substring(ic + 1, tmpSubstr.Length - ic - 1);
            }
            else
            { // No existe o no tiene dato
                dk = tmpSubstr.Substring(1, tmpSubstr.Length - 1);
                dv = "";
            }
            listInsumos.Add(Convert.ToInt32(dk), dv); // Agregamos el par de valores a -listInsumos-
            //Response.Write("<br />ia:" + ia + "- ib:" + ib + "- ic:" + ic);//---
            //Response.Write("<br />dk:" + dk + "- dv:" + dv);//---
            ia = ib + 1;
        }
        #endregion
        // EOF Tabla: SolEventoInsumos ------------------------------

        // Insertar en tablas ------------------------------
        String strConnString = ConfigurationManager.ConnectionStrings["LocalWindowsAuthConnectionStringEventos"].ConnectionString;
        #region Insertar en SolEventoGral
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "pr_insertSolEventoGral";
        cmd.Parameters.Add("@Folio", SqlDbType.Int).Value = Folio;
        cmd.Parameters.Add("@Fecha", SqlDbType.DateTime).Value = Fecha;
        cmd.Parameters.Add("@NomSolicitante", SqlDbType.VarChar).Value = NomSolicitante;
        cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
        cmd.Parameters.Add("@areaId", SqlDbType.VarChar).Value = areaId;
        cmd.Parameters.Add("@AreaOtro", SqlDbType.VarChar).Value = AreaOtro;
        cmd.Parameters.Add("@UbicacionId", SqlDbType.Int).Value = UbicacionId;
        cmd.Parameters.Add("@Extel", SqlDbType.VarChar).Value = Extel;
        cmd.Parameters.Add("@Tel", SqlDbType.VarChar).Value = Tel;
        cmd.Parameters.Add("@Proyecto", SqlDbType.VarChar).Value = Proyecto;
        cmd.Connection = con;
        try
        {
            con.Open();
            object obj = cmd.ExecuteScalar();
            // Obtenemos el ID del registro insertado
            string id = obj.ToString();
            solicitudId = Convert.ToInt32(id);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
        #endregion
        #region Insertar en SolEventoDatos
        SqlConnection conDatos = new SqlConnection(strConnString);
        SqlCommand cmdDatos = new SqlCommand();
        cmdDatos.CommandType = CommandType.StoredProcedure;
        cmdDatos.CommandText = "pr_insertSolEventoDatos";
        cmdDatos.Parameters.Add("@SolicitudId", SqlDbType.Int).Value = solicitudId;
        cmdDatos.Parameters.Add("@TitularId", SqlDbType.Int).Value = TitularId;
        cmdDatos.Parameters.Add("@NombreTitular", SqlDbType.VarChar).Value = NombreTitular;
        cmdDatos.Parameters.Add("@EmailTitular", SqlDbType.VarChar).Value = EmailTitular;
        cmdDatos.Parameters.Add("@Categoria", SqlDbType.VarChar).Value = Categoria;
        cmdDatos.Parameters.Add("@Reprogramado", SqlDbType.VarChar).Value = Reprogramado;
        cmdDatos.Parameters.Add("@FolioPrevio", SqlDbType.VarChar).Value = FolioPrevio;
        cmdDatos.Parameters.Add("@FolioId", SqlDbType.Int).Value = FolioId;
        cmdDatos.Parameters.Add("@NumPersonas", SqlDbType.Int).Value = NumPersonas;
        cmdDatos.Parameters.Add("@Evento", SqlDbType.Text).Value = Evento;
        cmdDatos.Parameters.Add("@DescripEvento", SqlDbType.Text).Value = DescripEvento;
        cmdDatos.Parameters.Add("@Director", SqlDbType.VarChar).Value = Director;
        cmdDatos.Parameters.Add("@FechaIni", SqlDbType.DateTime).Value = FechaIni;
        cmdDatos.Parameters.Add("@FechaFin", SqlDbType.DateTime).Value = FechaFin;
        cmdDatos.Parameters.Add("@TipoHorario", SqlDbType.VarChar).Value = TipoHorario;
        cmdDatos.Parameters.Add("@HoraIni", SqlDbType.VarChar).Value = HoraIni;
        cmdDatos.Parameters.Add("@HoraFin", SqlDbType.VarChar).Value = HoraFin;
        cmdDatos.Parameters.Add("@TipoEvento", SqlDbType.VarChar).Value = TipoEvento;
        cmdDatos.Parameters.Add("@EquipoOtro", SqlDbType.VarChar).Value = EquipoOtro;
        cmdDatos.Parameters.Add("@Justificacion", SqlDbType.Text).Value = Justificacion;
        cmdDatos.Parameters.Add("@Beneficiarios", SqlDbType.Text).Value = Beneficiarios;
        cmdDatos.Parameters.Add("@Objetivos", SqlDbType.Text).Value = Objetivos;
        cmdDatos.Parameters.Add("@Programas", SqlDbType.Text).Value = Programas;
        cmdDatos.Parameters.Add("@OtroApoyo", SqlDbType.VarChar).Value = OtroApoyo;
        cmdDatos.Parameters.Add("@Comentarios", SqlDbType.Text).Value = Comentarios;
        cmdDatos.Parameters.Add("@OtroCategoria", SqlDbType.VarChar).Value = OtroCategoria;
        cmdDatos.Parameters.Add("@Observaciones", SqlDbType.Text).Value = Observaciones;
        cmdDatos.Parameters.Add("@ComentariosAdmon", SqlDbType.Text).Value = ComentariosAdmon;
        cmdDatos.Parameters.Add("@Atendida", SqlDbType.VarChar).Value = Atendida;
        cmdDatos.Parameters.Add("@Atendieron", SqlDbType.Text).Value = Atendieron;
        cmdDatos.Parameters.Add("@PublicarCalendario", SqlDbType.VarChar).Value = PublicarCalendario;
        cmdDatos.Parameters.Add("@TipoAniversario", SqlDbType.VarChar).Value = TipoAniversario;
        cmdDatos.Connection = conDatos;

        try
        {
            conDatos.Open();
            cmdDatos.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conDatos.Close();
            conDatos.Dispose();
        }
        #endregion
        #region Insertar en SolEventoInsumos
        foreach (KeyValuePair<int, string> pair in listInsumos)
        {
            insertarInsumo(solicitudId, pair.Key, pair.Value);
        }
        #endregion
        #region Insertar en SolEventoHorario
        var totalElements = listFechaIni.Count;
        for (var index = 0; index < totalElements; index++)
        {
            insertarHorario(solicitudId, listFechaIni[index], listHoraIni[index], listHoraFin[index]);
        }
        #endregion
        // EOF Insertar en tablas ------------------------------

        #region envio de e-mails
        var listEmails = new List<String>(); // Inicializamos la lista donde se almacenaran los buzones
        foreach (KeyValuePair<int, string> pairs in listInsumos)
        { // Para cada insumo solicitado...
            var insumoId = pairs.Key; // ... obtenemos el ID del insumo con el cual vamos a checar si tiene un buzon configurado
            var totalRows = gvCatEmailAvisos.Rows.Count; // Indice para recorrer la tabla de buzones configurados
            for (var index = 0; index < totalRows; index++)
            { // Para cada Insumo con un buzon configurado...
                var insumoActual = Convert.ToInt32(gvCatEmailAvisos.Rows[index].Cells[3].Text.Trim());
                if (insumoId == insumoActual)
                { // ... preguntamos si es igual al ID del insumo solicitado
                    var emailActual = gvCatEmailAvisos.Rows[index].Cells[2].Text.Trim(); // y obtenemos su correspondiente buzon
                    if (!listEmails.Contains(emailActual))
                    { // Si la lista no tiene este buzon, agregalo
                        listEmails.Add(emailActual);
                    }
                }
            }
        }
        var listEmailsTxt = ""; // Inicializamos la variable que contendra el string a utilizar en el envio del correo
        if (listEmails.Count > 0)
        { // Si la lista de buzones no esta vacia...
            foreach (string key in listEmails)
            {
                listEmailsTxt += key; // ... agregala al final del string con su separador
                if (listEmails.IndexOf(key) + 1 < listEmails.Count) { listEmailsTxt += ","; }
            }
        }
        else
        { // Si la lista esta vacia...
            listEmailsTxt = "-"; // ... establece el caracter '-' para que la funcion de enviar correo la de por vacia
        }
        listEmailsTxt.TrimEnd(','); // Se le remueve el ultimo separador

        //        var emailFrom = "eventos.cibnor@cibnor.mx"; // No se requiere ya que por default la funcion envia desde ese correo
        //        var emailTo = EmailTitular + ", " + Email;
        var emailTo = (EmailTitular != Email) ? EmailTitular + ", " + Email : Email;
        var emailCc = gvCatEmailAvisos.Rows[0].Cells[2].Text.Trim(); // "eventos@cibnor.mx";
        var emailBcc = listEmailsTxt;
        var emailSubject = "SOLICITUD DE EVENTO ** " + TipoEvento + " **( Folio No. " + Folio.ToString() + " )";

        /// Tomamos del Dictionary el Id del insumo, lo consultamos en el GridView para obtener su descripcion, y finalmente
        /// agregar a su variable lbl(montaje, audiovisual, etc), con los tags de HTML necesarios 
        /// Valores: descripcion (tomada del gridview), [texto adicional](tomada del gridview) y [valor de su textbox](tomada del Dictionary)

        var lblHorario = ""; // Una o multiples fechas, incluyendo el horario especifico (sustituye a "REGULAR" / "IRREGULAR")
        if (TipoHorario == "REGULAR")
        { // Si es una sola fecha
            lblHorario += HoraIni + " a " + HoraFin + " hrs.";
        }
        else
        { // Si son varias fechas...
            lblHorario += "Multiples fechas:<ul>"; // ... agrega esta leyenda y cada uno de las fechas
            for (var i = 0; i < listFechaIni.Count; i++)
            {
                lblHorario += "<li>" + String.Format("{0:dd/MM/yyyy}", listFechaIni[i]) + " de " + listHoraIni[i] + " a " + listHoraFin[i] + " hrs.</li>";
            }
            lblHorario += "</ul>";
        }
        #endregion

        #region armar las strings para el cuerpo del correo (lblTipoEvento[lugares], lblPublicarCalendario)
        var lblTipoEvento = TipoEvento + "<ul>"; // Interno o Externo, incluyendo lo indicado
        foreach (KeyValuePair<int, string> kvp in listLugares)
        {
            var lugarDesc = "";
            for (var i = 0; i < gvCatLugares.Rows.Count; i++)
            {
                if (gvCatLugares.Rows[i].Cells[0].Text == kvp.Key.ToString())
                {
                    lugarDesc = gvCatLugares.Rows[i].Cells[1].Text + " " + gvCatLugares.Rows[i].Cells[3].Text + " ";
                }
            }
            lblTipoEvento += "<li>" + lugarDesc + kvp.Value + "</li>";
        }
        lblTipoEvento += "</ul>";

        var lblPublicarCalendario = "Privado"; // En el correo aparece como -Evento disponible para:-
        switch (PublicarCalendario)
        {
            case "PR": lblPublicarCalendario = "Privado"; break;
            case "CC": lblPublicarCalendario = "Comunidad CIBNOR"; break;
            case "PG": lblPublicarCalendario = "Publico en general"; break;
            case "NP": lblPublicarCalendario = "No publicar"; break;
        }
        #endregion
        #region armar las strings para el cuerpo del correo (Todos los insumos)
        var lblMontaje = "<ul>"; var lblMobiliario = "<ul>"; var lblAudiovisual = "<ul>"; var lblComputo = "<ul>";
        var lblAlimentos = "<ul>"; var lblProveedor = "<ul>"; var lblVehiculos = "<ul>"; var lblServicios = "<ul>";
        var lblApoyo = "<ul>"; var lblCultural = "<ul>"; var lblDisenio = "<ul>";
        foreach (KeyValuePair<int, string> pair in listInsumos)
        {
            for (var i = 0; i < gvCatInsumos.Rows.Count; i++)
            {
                if (gvCatInsumos.Rows[i].Cells[0].Text == pair.Key.ToString())
                {
                    var insDesc = gvCatInsumos.Rows[i].Cells[2].Text.Trim();

                    var insPrecio = gvCatInsumos.Rows[i].Cells[3].Text;
                    if ((insPrecio != "-") && (insPrecio != "0"))
                    {
                        insPrecio = " <strong>[ $ "+ insPrecio +".00 ]</strong>";
                        insDesc += insPrecio;
                    }

                    var insTextoAd = gvCatInsumos.Rows[i].Cells[6].Text;
                    insTextoAd = (insTextoAd != "-") ? " - " + insTextoAd + " " : " ";
                    switch (gvCatInsumos.Rows[i].Cells[1].Text)
                    {
                        case "MONTAJE":
                            lblMontaje += "<li>" + insDesc + insTextoAd + pair.Value + "</li>"; break;
                        case "MOBILIARIO":
                            lblMobiliario += "<li>" + insDesc + insTextoAd + pair.Value + "</li>"; break;
                        case "AUDIOVISUAL":
                            lblAudiovisual += "<li>" + insDesc + insTextoAd + pair.Value + "</li>"; break;
                        case "COMPUTO":
                            lblComputo += "<li>" + insDesc + insTextoAd + pair.Value + "</li>"; break;
                        case "ALIMENTOS":
                            lblAlimentos += "<li>" + insDesc + insTextoAd + pair.Value + "</li>"; break;
                        case "PROVEEDOR":
                            lblProveedor += "<li>" + insDesc + insTextoAd + pair.Value + "</li>"; break;
                        case "VEHICULOS":
                            lblVehiculos += "<li>" + insDesc + insTextoAd + pair.Value + "</li>"; break;
                        case "SERVICIOS":
                            lblServicios += "<li>" + insDesc + insTextoAd + pair.Value + "</li>"; break;
                        case "APOYO":
                            lblApoyo += "<li>" + insDesc + insTextoAd + pair.Value + "</li>"; break;
                        case "CULTURAL":
                            lblCultural += "<li>" + insDesc + insTextoAd + pair.Value + "</li>"; break;
                        case "DISENIO":
                            lblDisenio += "<li>" + insDesc + insTextoAd + pair.Value + "</li>"; break;
                    }
                    break;
                }
            }
        }
        lblMontaje += "</ul>"; lblMobiliario += "</ul>"; lblAudiovisual += "</ul>"; lblComputo += "</ul>";
        lblAlimentos += "</ul>"; lblProveedor += "</ul>"; lblVehiculos += "</ul>"; lblServicios += "</ul>";
        lblApoyo += "</ul>"; lblCultural += "</ul>"; lblDisenio += "</ul>";
        #endregion

        #region cuerpo del correo
        var emailBody = "<div><strong>" + emailSubject + "</strong>" +
            //            " - Consultar status en <a href=\"http://eventos.cibnor.mx/test/ConsultaIndividual.aspx?Id=" + Folio.ToString() + "\" target=\"_blank\">este enlace (de prueba)</a>." + // Para pruebas en el correo
            //            " - Consultar status en <a href=\"http://eventos.cibnor.mx/solicitud/ConsultaIndividual.aspx?Id=" + Folio.ToString() + "\" target=\"_blank\">este enlace</a>." +
            "<br /><br />" +
            "<hr />+ DATOS DEL SOLICITANTE<hr />" +
            "<table><tr><td>Solicitante: </td><td><strong>" + NomSolicitante + "</strong></td></tr>" +
            "<tr><td>Email: </td><td><strong>" + Email + "</strong></td></tr>" +
            contactoTel +
            "<tr><td>Proyecto: </td><td><strong>" + Proyecto + "</strong></td></tr>" +
            "<tr><td></td><td><strong>" + proyDescLarga + "</strong></td></tr>" +
            "<tr><td></td><td><strong>Responsable: " + proyRespon + "</strong></td></tr></table><br />" +
            "<hr />+ DATOS DEL EVENTO<hr />" +
            "<table>" +
            "<tr valign=\"top\"><td width=\"120px\">Titular Evento: </td><td><strong>" + NombreTitular + "</strong></td></tr>" +
            "<tr valign=\"top\"><td>Título Evento: </td><td><strong>" + Evento + "</strong></td></tr>" +
            "<tr valign=\"top\"><td>Descripción: </td><td><strong>" + DescripEvento + "</strong></td></tr>" +
            "<tr valign=\"top\"><td>Categoria: </td><td><strong>" + CategoriaDesc + "</strong></td></tr>" +
            "<tr valign=\"top\"><td>Reprogramado: </td><td><strong>" + Reprogramado + "</strong></td></tr>" +

            "<tr valign=\"top\"><td>Fecha: </td><td><strong>" + String.Format("{0:dd/MM/yyyy}", FechaIni) + " al " + String.Format("{0:dd/MM/yyyy}", FechaFin) + "</strong></td></tr>" +
            "<tr valign=\"top\"><td>Horario: </td><td><strong>" + lblHorario + "</strong></td></tr>" +
            "<tr valign=\"top\"><td>Asistentes: </td><td><strong>" + NumPersonas.ToString() + "</strong></td></tr>" +

            "<tr valign=\"top\"><td>Tipo de Evento: </td><td><strong>" + lblTipoEvento + "</strong></td></tr>" +
            "<tr valign=\"top\"><td colspan=\"2\">Se requiere la presencia del Director: <strong>" + Director + "</strong></td></tr>" +
            "<tr valign=\"top\"><td colspan=\"2\">Evento disponible para: <strong>" + lblPublicarCalendario + "</strong></td></tr>" +
            "<tr valign=\"top\"><td colspan=\"2\">&nbsp;</td></tr>" +
            "</table>" +
            "<hr />+ MONTAJE, MOBILIARIO Y EQUIPO<hr />" +
            "- MONTAJE <strong>" + lblMontaje.Trim() + "</strong>" +
            "- MOBILIARIO <strong>" + lblMobiliario.Trim() + "</strong>" +
            "- AUDIOVISUAL <strong>" + lblAudiovisual.Trim() + "</strong>" +
            "- CÓMPUTO <strong>" + lblComputo.Trim() + "</strong>" +
            "- OTRO EQUIPO: <strong>" + EquipoOtro + "</strong><br /><br />" +

            "<hr />+ SERVICIOS Y APOYO<hr />" +
            "- ALIMENTOS Y BEBIDAS <strong>" + lblAlimentos.Trim() + "</strong>" +
            "- DE PROVEEDOR EXTERNO <strong>" + lblProveedor.Trim() + "</strong>" +
            "<ul><li>JUSTIFICACIÓN: <strong>" + Justificacion + "</strong></li>" +
            "<li>BENEFICIARIOS: <strong>" + Beneficiarios + "</strong></li>" +
            "<li>OBJETIVOS: <strong>" + Objetivos + "</strong></li>" +
            "<li>PROGRAMAS: <strong>" + Programas + "</strong></li></ul>" +
            "- VEHICULOS <strong>" + lblVehiculos.Trim() + "</strong>" +
            "- OTROS SERVICIOS <strong>" + lblServicios.Trim() + "</strong>" +
            "- APOYOS <strong>" + lblApoyo.Trim() + "</strong>" +
            "- ACTIVIDADES CULTURALES <strong>" + lblCultural.Trim() + "</strong>" +
            "- DEPTO. DE EXT. Y DIV. CIENTÍFICA <strong>" + lblDisenio.Trim() + "</strong>" +
            "- OTRO APOYO: <strong>" + OtroApoyo + "</strong><br /><br />" +

            "<hr />+ DATOS ADICIONALES<hr />" +
            "- COMENTARIOS: <strong>" + Comentarios.Trim().Replace("\n", "<br /><br />") + "</strong><br />" +
            "<hr /><hr />Gracias por su cooperación | Departamento de Eventos | CIBNOR, S.C.</div>";
        #endregion

        var correoResult = enviarCorreo("-", "-", emailTo, emailCc, emailBcc, emailSubject, emailBody, "normal"); // Linea definitiva para produccion
        //var correoResult = enviarCorreo("-", "-", emailTo, "-", "-", emailSubject, emailBody, "normal"); // Linea para pruebas finales
        if (correoResult != "-")
        { // En caso de error en el envio del mensaje...
            Response.Write("Se genero un error en el envio del correo: " + correoResult);
        }
        #region Para pruebas
        /// 
        /// - QUE SE MUESTREN LOS PRECIOS EN EL CORREO ENVIADO, YA QUE SI MUESTRA LA LEYENDA PERO NO
        /// LA CANTIDAD.
        /// - AGREGAR EL TYPE AL INPUT CUANDO EL ELEMENTO DEL CATALOGO LO PRESENTE
        /// 
        //emailBody += ".<br/><br/><br/>emailCc:" + emailCc + "<br/><br/>emailBcc:" + emailBcc;
        //emailBody += "<br/><br/>lblMontaje:" + lblMontaje + "<br/><br/>lblServicios:" + lblServicios;
        //var correoResult = enviarCorreo("-", "-", Email, "-", "-", emailSubject, emailBody, "normal"); //Envia correo de prueba al solicitante "como ya quedaria" (sin cc a eventos)
        //Response.Write("<br /> emailBcc:" + emailBcc);
        //Response.Write("<br /><br />" + emailBody);
        //Response.Write("<br /> chkTitular:" + chkTitular);
        //Response.Write("<br /> chkMultiplesFechas:" + chkMultiplesFechas);
        #region Monitoreo vars SolEventoGral ---
        //Response.Write("<br /><br /> ----- SolEventoGral -----");
        //Response.Write("<br /> solicitudId:" + solicitudId);
        //Response.Write("<br /> Folio:" + Folio);
        //Response.Write("<br /> Fecha:" + String.Format("{0:yyyy/MMMM/dd}", Fecha));
        //Response.Write("<br /> NomSolicitante:" + NomSolicitante);
        //Response.Write("<br /> Email:" + Email);
        //Response.Write("<br /> areaId:" + areaId);
        //Response.Write("<br /> AreaOtro:" + AreaOtro);
        //Response.Write("<br /> UbicacionId:" + UbicacionId);
        //Response.Write("<br /> Extel:" + Extel);
        //Response.Write("<br /> Tel:" + Tel);
        //Response.Write("<br /> Proyecto:" + Proyecto);
        #endregion

        #region Monitoreo vars SolEventoDatos ---
        //Response.Write("<br /><br /> ----- SolEventoDatos -----");
        //Response.Write("<br /> solicitudId:" + solicitudId);
        //Response.Write("<br /> TitularId:" + TitularId);
        //Response.Write("<br /> NombreTitular:" + NombreTitular);
        //Response.Write("<br /> EmailTitular:" + EmailTitular);
        //Response.Write("<br /> Categoria:" + Categoria);
        //Response.Write("<br /> Categoria Desc:" + CategoriaDesc);
        //Response.Write("<br /> Reprogramado:" + Reprogramado);
        //Response.Write("<br /> FolioPrevio:" + FolioPrevio);
        //Response.Write("<br /> FolioId:" + FolioId);
        //Response.Write("<br /> NumPersonas:" + NumPersonas);
        //Response.Write("<br /> Evento:" + Evento);
        //Response.Write("<br /> DescripEvento:" + DescripEvento);
        //Response.Write("<br /> Director:" + Director);
        //Response.Write("<br /> FechaIni:" + FechaIni);
        //Response.Write("<br /> FechaFin:" + FechaFin);
        //Response.Write("<br /> TipoHorario:" + TipoHorario);
        //Response.Write("<br /> HoraIni:" + HoraIni);
        //Response.Write("<br /> HoraFin:" + HoraFin);
        //Response.Write("<br /> TipoEvento:" + TipoEvento);
        //Response.Write("<br /> EquipoOtro:" + EquipoOtro);
        //Response.Write("<br /> Justificacion:" + Justificacion);
        //Response.Write("<br /> Beneficiarios:" + Beneficiarios);
        //Response.Write("<br /> Objetivos:" + Objetivos);
        //Response.Write("<br /> Programas:" + Programas);
        //Response.Write("<br /> OtroApoyo:" + OtroApoyo);
        //Response.Write("<br /> Comentarios:" + Comentarios);
        //Response.Write("<br /> OtroCategoria:" + OtroCategoria);
        //Response.Write("<br /> Observaciones:" + Observaciones);
        //Response.Write("<br /> ComentariosAdmon:" + ComentariosAdmon);
        //Response.Write("<br /> Atendida:" + Atendida);
        //Response.Write("<br /> Atendieron:" + Atendieron);
        //Response.Write("<br /> PublicarCalendario:" + PublicarCalendario);
        //Response.Write("<br /> TipoAniversario:" + TipoAniversario);
        #endregion

        #region Monitoreo vars SolEventoHorarios ---
        //Response.Write("<br /><br /> ----- SolEventoHorarios -----");
        //for (var i = 0; i < listFechaIni.Count; i++)
        //{
        //    Response.Write("<br /> fecha(" + i + "):" + listFechaIni[i] + " --- HoraIni:" + listHoraIni[i] + " --- HoraFin:" + listHoraFin[i]);
        //}
        #endregion

        #region Monitoreo vars SolEventoLugares ---
        //Response.Write("<br /><br /> ----- SolEventoLugares -----");
        //foreach (KeyValuePair<int, string> kvp in listLugares)
        //{
        //    Response.Write("<br />Key:" + kvp.Key + ", Value:" + kvp.Value);
        //}
        #endregion

        #region Monitoreo vars SolEventoInsumos ---
        //Response.Write("<br /><br /> ----- SolEventoInsumos -----");
        //foreach (KeyValuePair<int, string> kvp in listInsumos) {
        //    Response.Write("<br />Key:" + kvp.Key + ", Value:" + kvp.Value);
        //}
        #endregion

        #region Monitoreo Bcc Emails ---
        //Response.Write("<br /><br /> ----- Bcc listEmails -----");
        //foreach (string key in listEmails)
        //{
        //    Response.Write("<br />Email:" + key);
        //}
        //Response.Write("<br />emailBody:" + emailBody);
        #endregion

        //foreach (string key in Request.Form) // devuelve todo el cochinero
        //{
        //    Response.Write("<br />|" + key + "=" + Request.Form[key]);
        //}
        //Response.Write("<br />TERMINAN LOS -Response.Write-<br />");
        #endregion
    }

    // Insertar un horario(SolicitudId, HoraIni, HoraFin, Fecha, Area="", InsumoId=0) en la tabla SolEventoHorario
    protected void insertarHorario(int solId, DateTime fecha, string horaI, string horaT)
    {
        String strConnString = ConfigurationManager.ConnectionStrings["LocalWindowsAuthConnectionStringEventos"].ConnectionString;
        SqlConnection conHorario = new SqlConnection(strConnString);
        SqlCommand cmdHorario = new SqlCommand();
        cmdHorario.CommandType = CommandType.StoredProcedure;
        cmdHorario.CommandText = "pr_insertSolEventoHorario";
        cmdHorario.Parameters.Add("@SolicitudId", SqlDbType.Int).Value = solId;
        cmdHorario.Parameters.Add("@HoraIni", SqlDbType.VarChar).Value = horaI;
        cmdHorario.Parameters.Add("@HoraFin", SqlDbType.VarChar).Value = horaT;
        cmdHorario.Parameters.Add("@Fecha", SqlDbType.DateTime).Value = fecha;
        cmdHorario.Parameters.Add("@Area", SqlDbType.VarChar).Value = "";
        cmdHorario.Parameters.Add("@InsumoId", SqlDbType.Int).Value = 0;
        cmdHorario.Connection = conHorario;
        try {
            conHorario.Open();
            cmdHorario.ExecuteNonQuery();
        }
        catch (Exception ex) {
            throw ex;
        }
        finally {
            conHorario.Close();
            conHorario.Dispose();
        }
    }

    // Insertar un insumo(SolicitudId, InsumoId, Valor) en la tabla SolEventoInsumos
    protected void insertarInsumo(int solId, int insId, string val)
    {
        String strConnString = ConfigurationManager.ConnectionStrings["LocalWindowsAuthConnectionStringEventos"].ConnectionString;
        SqlConnection conInsumos = new SqlConnection(strConnString);
        SqlCommand cmdInsumos = new SqlCommand();
        cmdInsumos.CommandType = CommandType.StoredProcedure;
        cmdInsumos.CommandText = "pr_insertSolEventoInsumos";
        cmdInsumos.Parameters.Add("@SolicitudId", SqlDbType.Int).Value = solId;
        cmdInsumos.Parameters.Add("@InsumoId", SqlDbType.Int).Value = insId;
        cmdInsumos.Parameters.Add("@Valor", SqlDbType.VarChar).Value = val;
        cmdInsumos.Connection = conInsumos;
        try
        {
            conInsumos.Open();
            cmdInsumos.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conInsumos.Close();
            conInsumos.Dispose();
        }
    }

    // Envia un correo a los destinos indicados, si se desea omitir un campo se indica con "-"
    public string enviarCorreo(string origen, string passwd, string destino, string copia, string copiaoculta, string asunto, string mensaje, string prioridad) {
        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
        mail.To.Add(destino);
        if (copia != "-") { mail.CC.Add(copia); }
        if (copiaoculta != "-") { mail.Bcc.Add(copiaoculta); }
        mail.Subject = asunto;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = mensaje;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true;
        mail.ReplyToList.Add(new MailAddress("eventos@cibnor.mx"));
        switch (prioridad) {
            case "baja":
                mail.Priority = MailPriority.Low; break;
            case "normal":
                mail.Priority = MailPriority.Normal; break;
            case "alta":
                mail.Priority = MailPriority.High; break;
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
            //            HttpContext.Current.Response.Write(errorMessage);
            return errorMessage;
        }
        return "-";
    }

}