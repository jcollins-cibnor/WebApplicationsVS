<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jovenespace.aspx.cs" Inherits="jovenespace_jovenespace" Debug="true" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>CIBNOR - Registro en l&iacute;nea</title>
    <script type="text/javascript" src="../_js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="./js/actions_jovenespace.js"></script>
    <link rel="Stylesheet" type="text/css" href="./css/registroweb.css" />

    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="./js/jquery.ui.datepicker-es.js"></script>
    <link type="text/css" rel="stylesheet" href="./css/jquery-ui.css"/>
</head>
<body>
<div id="divContainer">
    <header>
        <img id="logo_izq1" class="logo" src="../_img/logo_cib_oficial.gif" />
<%--        <img id="logo_centro" class="logo" src="../_img/logo_jovenespace3.png" />--%>
        <img id="logo_der1" class="logo" src="../_img/logo_pace.png" />
        <div id="divTitulo">
            <p id="lblTitulo">4to. Encuentro Estatal de J&oacute;venes Investigadores en Baja California Sur</p>
        </div>
        <h2 id="lblRegistroEnLinea">Registro en L&iacute;nea</h2>
    </header>

    <form id="form1" runat="server" enctype="multipart/form-data" >
        <section id="sec1Datos">
            <div id="divDatos">
                <h3>DATOS GENERALES DEL AUTOR</h3>
                <asp:TextBox ID="txtNombres" class="input46percent" runat="server" MaxLength="50" placeholder="Nombre(s)..." />
                <asp:TextBox ID="txtApellidos" class="input46percent" runat="server" MaxLength="50" placeholder="Apellido(s)..." />
                <br />
                <asp:TextBox ID="txtCorreo" class="input46percent" runat="server" MaxLength="50" placeholder="Correo electr&oacute;nico..." />
                <asp:TextBox ID="txtCorreoConfirma" class="input46percent" runat="server" MaxLength="50" placeholder="Confirmar correo electr&oacute;nico..." />
                <br />
                <asp:TextBox ID="txtTelefono" class="input100w" runat="server" MaxLength="50" placeholder="Telefono..." />
                <br />
                <asp:DropDownList ID="ddlSexo" CssClass="input200w" runat="server" >
                    <asp:ListItem Value="...">Indicar sexo...</asp:ListItem>
                    <asp:ListItem>Femenino</asp:ListItem>
                    <asp:ListItem>Masculino</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtEdad" class="input100w" runat="server" MaxLength="2" placeholder="Edad en a&ntilde;os..." />
                <br />
                <br />
                <asp:TextBox ID="txtInstitucion" class="input" runat="server" MaxLength="200" placeholder="Instituci&oacute;n..." />
                <asp:TextBox ID="txtDomicilioOficial" class="input46percent" runat="server" MaxLength="100" placeholder="Domicilio oficial..." />
                <asp:TextBox ID="txtMunicipio" class="input46percent" runat="server" MaxLength="50" placeholder="Municipio..." />
                <br />
                <asp:TextBox ID="txtCarrera" class="input" runat="server" MaxLength="50" placeholder="Carrera/especialidad..." />
                <br />
                <asp:DropDownList ID="ddlEgresado" CssClass="input100w" runat="server" >
                    <asp:ListItem Value="...">&iquest;Egresado?</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                    <asp:ListItem>Si</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtFechaEgreso" class="input200w" runat="server" MaxLength="50" placeholder="Fecha de egreso (dd-MM-yyyy)..." />
                <br />
                <asp:TextBox ID="txtSemestre" class="input100w" runat="server" MaxLength="2" placeholder="Semestre..." />
                <br />
                <div id="divTitulado">
                    <asp:DropDownList ID="ddlTitulado" CssClass="input100w" runat="server" >
                        <asp:ListItem Value="...">&iquest;Titulado?</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                        <asp:ListItem>Si</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtFechaTitulacion" class="input200w" runat="server" MaxLength="10" placeholder="Fecha de titulaci&oacute;n (DD/MM/YYYY)..." />
                </div>
                <br />
                <h3>DATOS DEL PROYECTO</h3>
                <asp:TextBox ID="txtNombreProyecto" class="input" runat="server" MaxLength="200" placeholder="Nombre del proyecto u obra..." />
                <asp:DropDownList ID="ddlArea" CssClass="input" runat="server" >
                    <asp:ListItem Value="...">Seleccionar &aacute;rea...</asp:ListItem>
                    <asp:ListItem Value="A">Ciencias de la Tierra</asp:ListItem>
                    <asp:ListItem Value="B">Biolog&iacute;a y Qu&iacute;mica</asp:ListItem>
                    <asp:ListItem Value="C">Medicina y Ciencias de la Salud</asp:ListItem>
                    <asp:ListItem Value="D">Humanidades y Ciencias de la Conducta</asp:ListItem>
                    <asp:ListItem Value="E">Ciencias Sociales</asp:ListItem>
                    <asp:ListItem Value="F">Biotecnolog&iacute;a y Ciencias Agropecuarias</asp:ListItem>
                    <asp:ListItem Value="G">Ingenier&iacute;as</asp:ListItem>
                </asp:DropDownList>
                <div class="divAdjuntarArchivo">
                    <p class="inputLabel">Adjuntar resumen del proyecto:</p>
                    <input type="file" class="inputFile" name="adjuntar" id="fuArchivo" runat="server" accept=".pdf" />
                </div>
                <br />
                <h3>INFORMACI&Oacute;N ADICIONAL</h3>
                <p class="inputLabel">En caso de requerir apoyo de hospedaje, favor de llenar lo siguiente:</p>
                <asp:TextBox ID="txtNombreHuesped" class="input" runat="server" MaxLength="200" placeholder="Nombre completo de quien requiere el hospedaje..." />
                <asp:TextBox ID="txtJustificacion" class="input" runat="server" MaxLength="200" placeholder="Justificaci&oacute;n..." />
                <br />
                <br />
                <h3>CONDICIONES DE PARTICIPACI&Oacute;N</h3>
                <p class="textLabel">
                    Autores del proyecto registrado en este formulario aceptan las condiciones de participaci&oacute;n que declara el evento en cuesti&oacute;n donde se estipula lo siguiente:
                    <br />
                    <br />
                    "El fraude cient&iacute;fico y la mala conducta, no son toleradas en ning&uacute;n nivel de investigaci&oacute;n o participaci&oacute;n. 
                    El plagio, uso o presentaci&oacute;n de trabajos de otra persona como propios, fabricaci&oacute;n o falsificaci&oacute;n de datos no ser&aacute;n aceptados. 
                    Proyectos fraudulentos no calificar&aacute;n para participar en cualquier evento afiliado independientemente de la etapa que se encuentren."
                    <br />
                    <br />
                    Al presionar el bot&oacute;n Continuar <strong>ACEPTAMOS LAS CONDICIONES DE PARTICIPACI&Oacute;N.</strong>
                </p>
<%--
                <p class="inputLabel" style="font-weight:900;">
                    <asp:CheckBox ID="chkFactura" runat="server" Text=" - Requiero factura" /> 
                    <br />
                </p>

                <div id="divFacturacion">
                    <h3>Datos para facturacion</h3>
                    <p class="inputLabel">En caso de no requerir factura, favor de indicar "no aplica"</p>
    
                    <asp:TextBox ID="txtFacturaRfc" class="input" runat="server" MaxLength="20" placeholder="RFC..." />
                    <asp:TextBox ID="txtFacturaNombre" class="input" runat="server" MaxLength="200" placeholder="Nombre a facturar..." />
                    <asp:TextBox ID="txtDomicilio" class="input" runat="server" MaxLength="200" placeholder="Domicilio..." />
                    <br />
                    <br />

                </div>
                <br />
                <asp:TextBox ID="txtComentarios" class="inputTextArea" runat="server" MaxLength="500" TextMode="MultiLine" Rows="4" placeholder="Comentarios..." />
                <br />
--%>


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

        <asp:Label ID="lblHiddenClave" runat="server" Font-Size="8pt" Visible="False"></asp:Label>
    <asp:Label ID="lblHiddenMensaje" runat="server" Font-Size="8pt" Visible="False"></asp:Label>
    </form>
    <br />
    <footer>
        <p>Centro de investigaciones Biol&oacute;gicas del Noroeste S.C.<br />
            Instituto Polit&eacute;cnico Nacional 195, Playa Palo de Santa Rita Sur; La Paz, B.C.S. M&eacute;xico; C.P. 23096, Tel:(52) (612) 123-8484 Fax:(52) (612) 125-3625<br />
            <asp:HyperLink ID="hlkUrlFooter" runat="server" NavigateUrl="http://www.cibnor.gob.mx/component/content/article/472"
                Target="_blank">Pol&iacute;tica de Privacidad</asp:HyperLink>
        </p>
        <p style="text-align:right; border:none;">
            <asp:HyperLink ID="hlkConsulta" runat="server" NavigateUrl="consulta.aspx" Target="_blank" style="text-decoration:none;">Ω</asp:HyperLink>
        </p>
    </footer>
    <asp:SqlDataSource ID="SqlDSregistro" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>"
        SelectCommand="SELECT * FROM [microarreglos2015]" OldValuesParameterFormatString="original_{0}">
    </asp:SqlDataSource>
</div>

<!-- MENSAJE DE ESPERA -->
<div id="divMensajeEspera" style="height:60%; width:99%; position:absolute; top:20%; margin:1px; border:1px solid #000; background-color:white; text-align:center;">

    <p style="display:block; height:20%; line-height:50px; font-family:Consolas, Arial; font-variant:normal; font-size:24px; background-color:#000; color:#FFF;">
        <b>Por favor, espere unos momentos...</b>
    </p>
    <p style="display:block; line-height:100px; font-family:Arial; font-variant:normal; font-size:24px;">
        <br />
        <b>Se esta procesando su solicitud.</b>
        <br />
    </p>
 <%--       <progress value="22" max="100"></progress>


        <img alt="procesando..." src="../_img/icon_loader_blackbars.gif" />--%>

</div>
<!-- EOF: MENSAJE DE ESPERA -->

</body>
</html>


