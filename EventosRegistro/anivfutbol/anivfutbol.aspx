<%@ Page Language="C#" AutoEventWireup="true" CodeFile="anivfutbol.aspx.cs" Inherits="anivfutbol_anivfutbol" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>CIBNOR - Registro en l&iacute;nea</title>
    <script type="text/javascript" src="../_js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="./js/actions_anivfutbol.js"></script>
    <link rel="Stylesheet" type="text/css" href="./css/registroweb.css" />
</head>
<body>
<div id="divContainer">
    <header>
        <img id="logo_izq1" class="logo" src="../_img/logo_aniv.png" />
        <div id="divTitulo">
            <p id="lblTitulo">Torneo de f&uacute;tbol</p>
        </div>
        <h3 id="lblRegistroEnLinea">Registro en L&iacute;nea</h3>
        <img id="logo_der1" class="logo" src="../_img/logo_dei.png" />
    </header>

    <form id="form1" runat="server" enctype="multipart/form-data" >
        <section id="sec1Datos">
            <div id="divDatos">
                <h2>Datos personales del capit&aacute;n</h2>
                <asp:TextBox ID="txtNombres" class="input" runat="server" MaxLength="50" placeholder="Nombre(s)..." />
                <asp:TextBox ID="txtApellidos" class="input" runat="server" MaxLength="50" placeholder="Apellido(s)..." />
                <asp:TextBox ID="txtCorreo" class="input" runat="server" MaxLength="50" placeholder="Correo electr&oacute;nico..." />
                <asp:TextBox ID="txtCorreoConfirma" class="input" runat="server" MaxLength="50" placeholder="Confirmar correo electr&oacute;nico..." />
                <asp:TextBox ID="txtTelefono" class="input" runat="server" MaxLength="50" placeholder="Telefono de contacto..." />
                <br />
                <br />
                <h2>Datos del equipo</h2>
                <asp:TextBox ID="txtNombreEquipo" class="input" runat="server" MaxLength="50" placeholder="Nombre del equipo..." />
                <br />
                <br />

                <asp:SqlDataSource ID="SqlDScolorcamiseta" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>" SelectCommand="SELECT * FROM [anivColorCamisetaFutbol] WHERE ([selected] <> @selected)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ocupado" Name="selected" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>

                <p class="inputLabel">Selecciona un color de camiseta:</p>
                <asp:DropDownList ID="ddlColorCamiseta" class="input200w" runat="server" AutoPostBack="True" DataSourceID="SqlDScolorcamiseta" 
                    DataTextField="color" DataValueField="selected" onselectedindexchanged="ddlColorCamiseta_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Label ID="lblColorStatus" runat="server" Text=""></asp:Label>
                <br />

                <p class="inputLabel">Integrantes:</p>
                <asp:TextBox ID="txtNombreI1" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI2" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI3" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI4" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI5" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI6" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI7" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI8" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI9" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI10" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI11" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI12" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI13" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI14" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <asp:TextBox ID="txtNombreI15" class="input" runat="server" MaxLength="100" placeholder="Nombre completo del participante..." />
                <br />
                <br />
                <asp:TextBox ID="txtComentarios" class="inputTextArea" runat="server" MaxLength="500" TextMode="MultiLine" Rows="4" placeholder="Comentarios..." />
                <br />
            </div>
            <input type="button" ID="btnContinuar" class="inputButton" runat="server" value="Continuar" />
            <br />
        </section>

        <!-- Seccion de confirmacion -->
        <section id="sec2Confirmacion">
            <div id="divConfirmacion">
                <p id="pConfirmacion" style="font-weight:900; color:#0026ff">Por favor confirma tus datos y presiona Enviar</p>
                <br />
                <input type="button" ID="btnRegresar" class="inputButton" runat="server" value="Regresar" />
                <asp:Button ID="btnEnviar" class="inputButton" runat="server" Text="Enviar" OnClick="btnEnviar_Click"/>
            </div>
        </section>
        <asp:Label ID="lblStatus" class="inputLabel" runat="server" style="font-weight:900; font-size:14px; color:red;"></asp:Label>
        <asp:ScriptManager ID="scriptmanager1" EnablePartialRendering="true" runat="server" />
    </form>
    <br />
    <footer>
        <p>
            Centro de investigaciones Biol&oacute;gicas del Noroeste S.C.
            Instituto Polit&eacute;cnico Nacional 195, Playa Palo de Santa Rita Sur; La Paz, B.C.S. M&eacute;xico; C.P. 23096, Tel:(52) (612) 123-8484 Fax:(52) (612) 125-3625<br />
            <asp:HyperLink ID="hlkUrlFooter" runat="server" NavigateUrl="http://www.cibnor.gob.mx/component/content/article/472"
                Target="_blank">Pol&iacute;tica de Privacidad</asp:HyperLink>
        </p>
        <p style="text-align:right; border:none;">
            <asp:HyperLink ID="hlkConsulta" runat="server" NavigateUrl="consulta.aspx" Target="_blank" style="text-decoration:none;">O</asp:HyperLink>
        </p>
    </footer>
    <asp:SqlDataSource ID="SqlDSregistro" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>"
        SelectCommand="SELECT * FROM [microarreglos2015]" OldValuesParameterFormatString="original_{0}">
    </asp:SqlDataSource>
</div>
<p><asp:Label ID="lblHiddenMensaje" runat="server" Visible="False"></asp:Label></p>

<!-- MENSAJE DE ESPERA -->
<div id="divMensajeEspera" 
    style="height:300px; width:70%; left:15%; position:absolute; top:30%; margin:1px; border:1px solid #000; background-color:white; text-align:center;">    

    <p style="display:block; height:50%; line-height:150px; font-family:Consolas, Arial; font-variant:normal; font-size:24px; background-color:#000; color:#FFF;">
        <b>Por favor, espere unos momentos...</b>
    </p>
    <p style="display:block; line-height:150px; font-family:Arial; font-variant:normal; font-size:24px;">
        <b>Se esta procesando su solicitud.</b>
    </p>
</div>

<!-- EOF: -->

</body>
</html>


