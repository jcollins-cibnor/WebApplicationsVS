<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SolicitudPost.aspx.cs" Inherits="Test" Debug="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />

    <link rel="stylesheet" type="text/css" media="all" href="css/styles.css"><!-- CSS general de la plantilla -->
    <link rel="stylesheet" type="text/css" media="all" href="css/switchery.min.css"> <!-- CSS general de la plantilla -->
    <script type="text/javascript" src="js/switchery.min.js"></script><!-- JS de la plantilla -->
    
    <script type="text/javascript" src="js/jquery.js"></script><!-- JQ base ver1.11  -->
    <title></title>
</head>
<body>
    <div class="main-header" id="mainHeader"
        style="width: 100%; height: 150px; overflow: hidden; display: block; position: relative; background: url('img/cib_image.png') no-repeat;
            background-size: cover; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; 
            background-position: 50% 50%;" >
            
        <div class="wrapper content_header clearfix"
            style="width: 120%; margin: 0 auto; display:block; line-height:70px; position: relative; bottom:-60px; left:-20px;
                background-color:white; opacity:0.7;" >
                
                <h1 class="encabezado"
                    style="color: #4b4848; font-family: 'Helvetica Neue', Arial, sans-serif; letter-spacing: 1px; line-height:70px; font-size: 24px; 
                        margin: 0 0 0 20px; text-align:left; text-shadow:none; opacity:1;" >
                            SOLICITUD DE EVENTO
                </h1>
        </div>           
    </div>
    <div id="wrapper">

    <form id="form1" runat="server">
    <input type="hidden" value="EL SIGUIENTE DIV CONTIENE LEYENDAS INFORMATIVAS">
	<div class="col-1">
        <label class="encabezado" style="text-align:center;">
            &nbsp;<br />
            Sus datos han sido enviados al <strong>DEPARTAMENTO DE EVENTOS</strong> con copia a su correo electrónico.<br />
        <img src="img/logo_dei.png" style="width:200px; height:auto;" />
        </label>
        <label class="encabezado" style="text-align:justify;">
            En breve su solicitud será analizada. En caso de ser aprobada le será dado a conocer el espacio que le fue asignado, 
            así como la confirmación del equipo, mobiliario y apoyos requeridos.<br />
        </label>
        <label class="encabezado" style="text-align:left;">
            <strong>Consideraciones adicionales importantes:</strong><br />
        </label>
        <label class="encabezado" style="text-align:justify; margin:0px 20px;">
            <ol>
                <li>En caso de cancelación de un evento, el titular del evento deberá notificarlo al DEPARTAMENTO DE EVENTOS a la
                    brevedad posible a través del correo electrónico eventos@cibnor.mx, para el trámite correspondiente.</li>
                <li>En caso de reprogramación del evento, por cambio de fecha y/o horario, se deberá enviar de nuevo la solicitud correspondiente.</li>
                <li>Para cualquier aclaración, pregunta, observación y/o comentario referente a su solicitud de eventos, es
                    indispensable que tenga a la mano el número de folio correspondiente a dicha solicitud que fue asignado por el sistema.</li>
            </ol>
            &nbsp;<br />
        </label>
        <label class="encabezado" style="text-align:center;">
            Gracias por su colaboración.<br />
        </label>

        <div class="col-submit">
            <section style="border:none;">
                <div class="col-2" style="box-shadow:none;">
                    <label class="labelBlockDisplay labelConfirm">
                        <button id="btnOtraSolicitud" class="submitbtn" type="button" style="margin:10px 15%; width:70%;"
                            onclick="window.location.assign('http://eventos.cibnor.mx/solicitud/')">Otra solicitud</button>
                    </label>
                </div>
                <div class="col-2" style="box-shadow:none;">
                    <label>
                        <button id="btnIntranet" class="submitbtn" type="button" style="margin:auto 15%; width:70%;"
                            onclick="window.location.assign('http://intranet.cibnor.mx/intranet/index.php')" >Intranet</button>
                    </label>
                </div>
            </section>
        </div>
    </div>

    <div id="divMensajeFinal">

    </div>
    <div id="divDatosRecibidos" style="position:fixed; left:10%;">
        <asp:Label ID="lblTitular" runat="server" Text="Titular" Visible="False"></asp:Label>
        <asp:Label ID="lblClaveProy" runat="server" Text="Proyecto" Visible="False"></asp:Label>
        <asp:Label ID="lblIdCategoria" runat="server" Text="Categoria" Visible="False"></asp:Label>
        <asp:SqlDataSource ID="sqlDSprDirectorioDatos" runat="server" ConnectionString='<%$ ConnectionStrings:RemoteConnectionStringDirectorio %>' 
            SelectCommand="pr_selectoneDirectorioDatosByIdPersona" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblTitular" PropertyName="Text" Name="IdPersona" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gvDirectorioDatos" runat="server" DataSourceID="sqlDSprDirectorioDatos" ShowHeader="False" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="IdPersona" HeaderText="IdPersona" SortExpression="IdPersona"></asp:BoundField>
                <asp:BoundField DataField="Apellido_ascii" HeaderText="Apellido_ascii" SortExpression="Apellido_ascii"></asp:BoundField>
                <asp:BoundField DataField="Nombre_ascii" HeaderText="Nombre_ascii" SortExpression="Nombre_ascii"></asp:BoundField>
                <asp:BoundField DataField="Extension" HeaderText="Extension" SortExpression="Extension"></asp:BoundField>
                <asp:BoundField DataField="AreaId" HeaderText="AreaId" SortExpression="AreaId"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="sqlDSProyectoYResp" runat="server" ConnectionString='<%$ ConnectionStrings:RemoteConnectionStringCat_empl %>' 
            SelectCommand="SELECT [Cve_proyec], [Desc_larga], [Nom_respon] FROM [Cat_proy16] WHERE ([Cve_proyec] = @Cve_proyec)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblClaveProy" PropertyName="Text" Name="Cve_proyec" Type="String" DefaultValue=""></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gvProyectoYResp" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSProyectoYResp" ShowHeader="False">
            <Columns>
                <asp:BoundField DataField="Cve_proyec" HeaderText="Cve_proyec" SortExpression="Cve_proyec"></asp:BoundField>
                <asp:BoundField DataField="Desc_larga" HeaderText="Desc_larga" SortExpression="Desc_larga"></asp:BoundField>
                <asp:BoundField DataField="Nom_respon" HeaderText="Nom_respon" SortExpression="Nom_respon"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="sqlDSprCat_empl" runat="server" ConnectionString='<%$ ConnectionStrings:RemoteConnectionStringCat_empl %>' 
            SelectCommand="pr_selectoneCat_emplByNum_emplea" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblTitular" PropertyName="Text" Name="IdPersona" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gvCat_empl" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSprCat_empl" ShowHeader="False">
            <Columns>
                <asp:BoundField DataField="Num_emplea" HeaderText="Num_emplea" SortExpression="Num_emplea"></asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                <asp:BoundField DataField="Prog_sial" HeaderText="Prog_sial" SortExpression="Prog_sial"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="sqlDSprCatCategorias" runat="server" ConnectionString='<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>' 
            SelectCommand="pr_selectoneCatCategoriasByClave" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblIdCategoria" Name="IdCat" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gvCatCategorias" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSprCatCategorias" ShowHeader="False" DataKeyNames="CategoriaId">
            <Columns>
                <asp:BoundField DataField="CategoriaId" HeaderText="CategoriaId" InsertVisible="False" ReadOnly="True" SortExpression="CategoriaId" />
                <asp:BoundField DataField="Clave" HeaderText="Clave" SortExpression="Clave" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="sqlDSprgetmaxyearSolEventoGral" runat="server" ConnectionString='<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>' 
            SelectCommand="pr_getmaxyearSolEventoGral" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:GridView ID="gvgetmaxyearSolEventoGral" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSprgetmaxyearSolEventoGral" ShowHeader="False">
            <Columns>
                <asp:BoundField DataField="anio" HeaderText="anio" ReadOnly="True" SortExpression="anio"></asp:BoundField>
                <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="sqlDSprCatEmailAvisos" runat="server" ConnectionString='<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>' SelectCommand="proc_ObtenerTodosCatEmailAvisos" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:GridView ID="gvCatEmailAvisos" runat="server" DataSourceID="sqlDSprCatEmailAvisos" ShowHeader="False" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="EmailAvisoId">
            <Columns>
                <asp:BoundField DataField="EmailAvisoId" HeaderText="EmailAvisoId" SortExpression="EmailAvisoId" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" SortExpression="InsumoId" ReadOnly="True"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="sqlDSprCatLugares" runat="server" ConnectionString='<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>' SelectCommand="proc_ObtenerTodosCatLugarIntExt" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:GridView ID="gvCatLugares" runat="server" DataSourceID="sqlDSprCatLugares" ShowHeader="False" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="LugarId">
            <Columns>
                <asp:BoundField DataField="LugarId" HeaderText="LugarId" SortExpression="LugarId" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="LineaMsg" HeaderText="LineaMsg" SortExpression="LineaMsg" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="MsgId" HeaderText="MsgId" ReadOnly="True" SortExpression="MsgId"></asp:BoundField>
                <asp:BoundField DataField="Url" HeaderText="Url" ReadOnly="True" SortExpression="Url"></asp:BoundField>
                <asp:BoundField DataField="TieneDato" HeaderText="TieneDato" ReadOnly="True" SortExpression="TieneDato"></asp:BoundField>
                <asp:BoundField DataField="MsgIdLineaMsg" HeaderText="MsgIdLineaMsg" ReadOnly="True" SortExpression="MsgIdLineaMsg"></asp:BoundField>
                <asp:BoundField DataField="UrlLineaMsg" HeaderText="UrlLineaMsg" ReadOnly="True" SortExpression="UrlLineaMsg"></asp:BoundField>
                <asp:BoundField DataField="Activo" HeaderText="Activo" ReadOnly="True" SortExpression="Activo"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="sqlDSprCatInsumos" runat="server" ConnectionString='<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>' SelectCommand="proc_ObtenerTodosCatInsumos" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:GridView ID="gvCatInsumos" runat="server" DataSourceID="sqlDSprCatInsumos" ShowHeader="False" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="InsumoId">
            <Columns>
                <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" SortExpression="InsumoId" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" ReadOnly="True" NullDisplayText="-"></asp:BoundField>
                <asp:BoundField DataField="Url" HeaderText="Url" ReadOnly="True" SortExpression="Url"></asp:BoundField>
                <asp:BoundField DataField="Activo" HeaderText="Activo" ReadOnly="True" SortExpression="Activo"></asp:BoundField>
                <asp:BoundField DataField="OtroTxt" HeaderText="OtroTxt" ReadOnly="True" SortExpression="OtroTxt" NullDisplayText="-"></asp:BoundField>
                <asp:BoundField DataField="OtroTipo" HeaderText="OtroTipo" ReadOnly="True" SortExpression="OtroTipo"></asp:BoundField>
                <asp:BoundField DataField="MuestraUsuario" HeaderText="MuestraUsuario" ReadOnly="True" SortExpression="MuestraUsuario"></asp:BoundField>
                <asp:BoundField DataField="MuestraUsuarioOtroTxt" HeaderText="MuestraUsuarioOtroTxt" ReadOnly="True" SortExpression="MuestraUsuarioOtroTxt"></asp:BoundField>
                <asp:BoundField DataField="Orden" HeaderText="Orden" ReadOnly="True" SortExpression="Orden"></asp:BoundField>
            </Columns>
        </asp:GridView>

<%--        <asp:Label ID="lblSolicitudId" runat="server" Text="-"></asp:Label>
        <asp:SqlDataSource ID="sqlDSSolicitudId" runat="server" ConnectionString='<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>' 
            SelectCommand="pr_insertSolEventoGral" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="Folio" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Fecha" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="NomSolicitante" Type="String"></asp:Parameter>
                <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="AreaId" Type="String"></asp:Parameter>
                <asp:Parameter Name="AreaOtro" Type="String"></asp:Parameter>
                <asp:Parameter Name="UbicacionId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Extel" Type="String"></asp:Parameter>
                <asp:Parameter Name="Tel" Type="String"></asp:Parameter>
                <asp:Parameter Name="Proyecto" Type="String"></asp:Parameter>
            </SelectParameters>

        </asp:SqlDataSource>--%>
    </div>
    </form>

    </div>
</body>
</html>
