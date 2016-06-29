<%@ Page Language="C#" AutoEventWireup="true" CodeFile="microarreglos2015.aspx.cs" Inherits="microarreglos2015_microarreglos2015" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>CIBNOR - Registro en línea</title>
    <script type="text/javascript" src="../_js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="./js/actions_microarreglos2015.js"></script>
    <link rel="Stylesheet" type="text/css" href="./css/registroweb.css" />
</head>
<body>
<div id="divContainer">
    <header>
        <img id="logo_izq1" class="logo" src="../_img/logo_cib_oficial.gif" />
        <div id="divTitulo">
            <p id="lblTitulo">Microarreglos de ADN y Bioinformática NGS</p>
        </div>
        <h3 id="lblRegistroEnLinea">Registro en Línea</h3>
        <img id="logo_der1" class="logo" src="../_img/logo_conacyt.png" />
    </header>

    <form id="form1" runat="server" enctype="multipart/form-data" >
        <section id="sec1Datos">
            <div id="divDatos">
                <h2>Datos personales</h2>
                <asp:TextBox ID="txtNombres" class="input" runat="server" MaxLength="50" placeholder="Nombre(s)..." />
                <asp:TextBox ID="txtApellidos" class="input" runat="server" MaxLength="50" placeholder="Apellido(s)..." />
                <asp:TextBox ID="txtCorreo" class="input" runat="server" MaxLength="50" placeholder="Correo electrónico..." />
                <asp:TextBox ID="txtCorreoConfirma" class="input" runat="server" MaxLength="50" placeholder="Confirmar correo electrónico..." />
                <asp:TextBox ID="txtInstitucion" class="input" runat="server" MaxLength="200" placeholder="Institución..." />
                <br />
                <div id="divFacturacion">
                    <h2>Datos para facturacion</h2>
                    <p class="inputLabel">En caso de no requerir factura, favor de indicar "no aplica"</p>
                    <asp:TextBox ID="txtFacturaRfc" class="input" runat="server" MaxLength="20" placeholder="RFC..." />
                    <asp:TextBox ID="txtFacturaNombre" class="input" runat="server" MaxLength="200" placeholder="Nombre a facturar..." />
                    <asp:TextBox ID="txtDomicilio" class="input" runat="server" MaxLength="200" placeholder="Domicilio..." />
                </div>
                <br />
                <p class="inputLabel">Favor de anexar su comprobante de pago:</p>
                <input type="file" class="inputFile" name="adjuntar" id="fuArchivo" runat="server" accept=".pdf" />
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
                <p id="pConfirmacion">Por favor confirma tus datos y presiona Enviar</p>
                <br />
                <input type="button" ID="btnRegresar" class="inputButton" runat="server" value="Regresar" />
                <asp:Button ID="btnEnviar" class="inputButton" runat="server" Text="Enviar" OnClick="btnEnviar_Click"/>
            </div>
        </section>
        <asp:Label ID="lblStatus" class="inputLabel" runat="server"></asp:Label>
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
</body>
</html>


