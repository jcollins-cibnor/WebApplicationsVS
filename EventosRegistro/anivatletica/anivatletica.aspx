<%@ Page Language="C#" AutoEventWireup="true" CodeFile="anivatletica.aspx.cs" Inherits="anivatletica_anivatletica" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>CIBNOR - Registro en l&iacute;nea</title>
    <script type="text/javascript" src="../_js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="./js/actions_anivatletica.js"></script>
    <link rel="Stylesheet" type="text/css" href="./css/registroweb.css" />
</head>
<body>
<div id="divContainer">
    <header>
        <img id="logo_izq1" class="logo" src="../_img/logo_40aniv.png" />
        <div id="divTitulo">
            <p id="lblTitulo">XL Aniversario - Carrera atletica</p>
        </div>
        <h3 id="lblRegistroEnLinea">Registro en L&iacute;nea</h3>
        <img id="logo_der1" class="logo" src="../_img/logo_dei.png" />
    </header>

    <form id="form1" runat="server" enctype="multipart/form-data" >
        <section id="sec1Datos">
            <div id="divDatos">
                <h2>Datos personales</h2>
                <asp:TextBox ID="txtNombres" class="input" runat="server" MaxLength="50" placeholder="Nombre(s)..." />
                <asp:TextBox ID="txtApellidos" class="input" runat="server" MaxLength="50" placeholder="Apellido(s)..." />
                <asp:TextBox ID="txtCorreo" class="input" runat="server" MaxLength="50" placeholder="Correo electr&oacute;nico..." />
                <asp:TextBox ID="txtCorreoConfirma" class="input" runat="server" MaxLength="50" placeholder="Confirmar correo electr&oacute;nico..." />
                <asp:TextBox ID="txtEdad" class="input46percent" runat="server" MaxLength="2" placeholder="Edad..." />
                <asp:DropDownList ID="ddlSexo" class="input46percent" runat="server" >
                    <asp:ListItem Value="...">Sexo...</asp:ListItem>
                    <asp:ListItem>Mujer</asp:ListItem>
                    <asp:ListItem>Hombre</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <h2>Opciones de registro...</h2>
                <fieldset style="font-family:Verdana; font-size:11px;">
                    <input type="radio" name="rblTipoRegistro" id="rblTipoIndividual" value="Individual" runat="server" />Individual<br />
<%--                <input type="radio" name="rblTipoRegistro" id="rblTipoEquipo" value="Equipo" runat="server" />Equipo
                    SE COMENTO LA OPCION DE EQUIPO Y SE MODIFICO EL js    --%>
                </fieldset>
<%--                <asp:RadioButtonList ID="rblTipoRegistro" name="rblTR" class="inputRadio" runat="server" >
                    <asp:ListItem Value="Individual">Individual</asp:ListItem>
                    <asp:ListItem Value="Equipo" Selected="True">Equipo</asp:ListItem>
                </asp:RadioButtonList>--%>
                <br />
                <section id="sec2"> <%--ES EL SEPARADOR DE SECCION EL CUAL APARECE CUANDO SE SELECCIONA EQUIPO--%>
                <asp:TextBox ID="txtNombreEquipo" class="input" runat="server" MaxLength="20" placeholder="Nombre del equipo..." />
                <br />
                <br />
                <article id="artParticipantes">
                    <h3>INTEGRANTES DEL EQUIPO</h3>
                    <%--PARTICIPANTE 2--%>
                    <asp:TextBox ID="txtNombreParticipante2" class="inputNomParticipante" runat="server" MaxLength="100" placeholder="Nombre completo..." />
                    <asp:TextBox ID="txtEdadParticipante2" class="inputEdadParticipante" runat="server" MaxLength="2" placeholder="Edad..." />
                    <asp:DropDownList ID="ddlSexoParticipante2" class="inputSexoParticipante" runat="server" >
                        <asp:ListItem Value="...">Sexo...</asp:ListItem>
                        <asp:ListItem>Mujer</asp:ListItem>
                        <asp:ListItem>Hombre</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <%--PARTICIPANTE 3--%>
                    <asp:TextBox ID="txtNombreParticipante3" class="inputNomParticipante" runat="server" MaxLength="100" placeholder="Nombre completo..." />
                    <asp:TextBox ID="txtEdadParticipante3" class="inputEdadParticipante" runat="server" MaxLength="2" placeholder="Edad..." />
                    <asp:DropDownList ID="ddlSexoParticipante3" class="inputSexoParticipante" runat="server" >
                        <asp:ListItem Value="...">Sexo...</asp:ListItem>
                        <asp:ListItem>Mujer</asp:ListItem>
                        <asp:ListItem>Hombre</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <%--PARTICIPANTE 4--%>
                    <asp:TextBox ID="txtNombreParticipante4" class="inputNomParticipante" runat="server" MaxLength="100" placeholder="Nombre completo..." />
                    <asp:TextBox ID="txtEdadParticipante4" class="inputEdadParticipante" runat="server" MaxLength="2" placeholder="Edad..." />
                    <asp:DropDownList ID="ddlSexoParticipante4" class="inputSexoParticipante" runat="server" >
                        <asp:ListItem Value="...">Sexo...</asp:ListItem>
                        <asp:ListItem>Mujer</asp:ListItem>
                        <asp:ListItem>Hombre</asp:ListItem>
                    </asp:DropDownList>
                </article>
                <br />
                <br />
                </section> <%--FIN DE SECCION--%>
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

        <!-- Los DataSource que se requieren para las altas de Prude -->
        <asp:SqlDataSource ID="SqlDSregweb2" runat="server" 
            ConnectionString="Data Source=200.23.162.100;uid=cibnor;pwd=Pass@word1;Initial Catalog=REGWEB2" 
            ProviderName="System.Data.SqlClient">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDSregweb3" runat="server" 
            ConnectionString="Data Source=200.23.162.100;uid=cibnor;pwd=Pass@word1;Initial Catalog=REGWEB2" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT TOP (1) TeamId FROM Teams ORDER BY TeamId DESC">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDSregweb3" 
            Width="200px" Visible="False">
        </asp:GridView>

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


