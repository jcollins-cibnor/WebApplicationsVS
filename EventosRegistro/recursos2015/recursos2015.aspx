<%@ Page Language="C#" AutoEventWireup="true" CodeFile="recursos2015.aspx.cs" Inherits="recursos2015_recursos2015" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>CIBNOR - Registro en línea</title>
    <script type="text/javascript" src="../_js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="./js/actions_recursos2015.js"></script>
    <link rel="Stylesheet" type="text/css" href="./css/registroweb.css" />
</head>
<body>
<div id="divContainer">
    <header>
        <img id="logo_izq1" class="logo" src="../_img/logo_cib_oficial.gif" />
        <div id="divTitulo">
            <p id="lblTitulo">Los Recursos Naturales y La Legislacion Ambiental Mexicana</p>
            <p id="lblRegistroEnLinea">Registro en Línea</p>
        </div>        
        <img id="logo_der1" class="logo" src="../_img/logo_conacyt.png" />
    </header>

    <form id="form1" runat="server" enctype="multipart/form-data" >
        <section id="sec1Datos">
            <div id="divDatos">
                <h4>Datos personales</h4>
                <asp:TextBox ID="txtNombres" class="input" runat="server" MaxLength="50" placeholder="Nombre(s)..." />
                <asp:TextBox ID="txtApellidos" class="input" runat="server" MaxLength="50" placeholder="Apellido(s)..." />
                <asp:TextBox ID="txtCorreo" class="input" runat="server" MaxLength="50" placeholder="Correo electrónico..." />
                <asp:TextBox ID="txtCorreoConfirma" class="input" runat="server" MaxLength="50" placeholder="Confirmar correo electrónico..." />
                <asp:TextBox ID="txtInstitucion" class="input" runat="server" MaxLength="200" placeholder="Institución..." />
                <br />
                <div id="divFacturacion">
                    <h3>Datos para facturacion</h3>
                    <p class="inputLabel">En caso de no requerir factura, favor de indicar "no aplica"</p>
                    <asp:TextBox ID="txtFacturaRfc" class="input" runat="server" MaxLength="20" placeholder="RFC..." />
                    <asp:TextBox ID="txtFacturaNombre" class="input" runat="server" MaxLength="200" placeholder="Nombre a facturar..." />
                    <asp:TextBox ID="txtDomicilio" class="input" runat="server" MaxLength="200" placeholder="Domicilio..." />
                    <br />
                    <p class="inputLabel">Favor de anexar su comprobante de pago:</p>
                    <input type="file" class="inputFile" name="adjuntar" id="fuArchivo" runat="server" accept=".pdf" />
                    <br />
                    <br />
                </div>
                <asp:TextBox ID="txtComentarios" class="inputTextArea" runat="server" MaxLength="500" TextMode="MultiLine" Rows="4" placeholder="Comentarios..." />
                <br />
            </div>
            <input type="button" ID="btnContinuar" class="inputButton" runat="server" value="Continuar" />
            <br />
        </section>

        <!-- Seccion de confirmacion -->
        <section id="sec2Confirmacion">
            <div id="divConfirmacion">
                <p id="lblConfirmacion">Por favor confirma tus datos y presiona Enviar</p>
                <br />
                <input type="button" ID="btnRegresar" class="inputButton" runat="server" value="Regresar" />
                <asp:Button ID="btnEnviar" class="inputButton" runat="server" Text="Enviar" OnClick="btnEnviar_Click"/>
            </div>
        </section>
        <p>
            <asp:Label ID="lblStatus" class="inputLabel" runat="server"></asp:Label>
        </p>        
        <asp:ScriptManager ID="scriptmanager1" EnablePartialRendering="true" runat="server" />
    </form>
    <br />
    <footer>
        <p>Centro de investigaciones Biológicas del Noroeste S.C.</p>
        <p>Instituto Politécnico Nacional 195, Playa Palo de Santa Rita Sur; La Paz, B.C.S. México; C.P. 23096, Tel:(52) (612) 123-8484 Fax:(52) (612) 125-3625<br />
            <asp:HyperLink ID="hlkUrlFooter" runat="server" NavigateUrl="http://www.cibnor.gob.mx/component/content/article/472"
                Target="_blank">Política de Privacidad</asp:HyperLink></p>
    </footer>
    <asp:SqlDataSource ID="SqlDSregistro" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>"
        SelectCommand="SELECT * FROM [microarreglos2015]" OldValuesParameterFormatString="original_{0}">
    </asp:SqlDataSource>
</div>
<p><asp:Label ID="lblHiddenMensaje" runat="server" Visible="False"></asp:Label></p>

<!-- MENSAJE DE ESPERA -->
<div id="divMensaje" style="height:60%; width:99%; position:absolute; top:20%; margin:1px; border:1px solid #000; background-color:white; text-align:center;">
    <p style="height:40px; display:block; line-height:40px; font-family:Consolas, Arial; font-variant:normal; background-color:#000; color:#FFF;">
        <b>Por favor, espere unos momentos...</b>
    </p>
    <p style="height:40px; display:block; line-height:40px; font-family:Arial; font-variant:normal;">
        <b>Se esta procesando su solicitud.</b>
        <br />
        <img alt="procesando..." src="../_img/icon_loader_blackbars.gif" />
    </p>
</div>
<!-- EOF: MENSAJE DE ESPERA -->

</body>
</html>


