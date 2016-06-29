<%@ Page Language="C#" AutoEventWireup="true" CodeFile="renanp2016.aspx.cs" Inherits="renanp2016_renanp2016" Debug="true" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>CIBNOR - Registro en l&iacute;nea</title>
    <script type="text/javascript" src="../_js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="./js/actions_renanp2016.js"></script>
    <link rel="Stylesheet" type="text/css" href="./css/registroweb.css" />

<%-- ESTO ES PARA EL DATEPICKER--%>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="./js/jquery.ui.datepicker-es.js"></script>
    <link type="text/css" rel="stylesheet" href="./css/jquery-ui.css"/>
</head>
<body>
<div id="divContainer">
    <header>
        <img id="logo_izq1" class="logo" src="../_img/logo_cib_oficial.gif" />
<%--        <img id="logo_centro" class="logo" src="../_img/logo_renanp20163.png" />--%>
        <img id="logo_der1" class="logo" src="../_img/logo_cib_oficial.gif" />
        <div id="divTitulo">
            <p id="lblTitulo">
                <asp:Label ID="lblTituloPrincipal" runat="server" Text="Label"></asp:Label>
                </p>
        </div>
        <h2 id="lblRegistroEnLinea">Registro en L&iacute;nea</h2>
    </header>

    <form id="form1" runat="server" enctype="multipart/form-data" >
        <section id="sec1Datos">
            <div id="divDatos">
                <h3>DATOS GENERALES</h3>
                <asp:TextBox ID="txtNombre" class="input" runat="server" MaxLength="100" placeholder="Nombre completo..." />
                <asp:TextBox ID="txtCorreo" class="input46percent" runat="server" MaxLength="50" placeholder="Correo electr&oacute;nico..." />
                <asp:TextBox ID="txtCorreoConfirma" class="input46percent" runat="server" MaxLength="50" placeholder="Confirmaci&oacute;n de correo electr&oacute;nico..." />
                <asp:TextBox ID="txtInstitucion" class="input" runat="server" MaxLength="200" placeholder="Nombre de la instituci&oacute;n..." />
                <br />
                <br />
                
                <%--Taller en Julio--%>
                <div id="div1a" runat="server" hidden="hidden">
                    <div id="divTraslado" style="border:solid 1px gray;">
                    
                        <h4 style="text-align:center;">Itinerario</h4>
                        <asp:RadioButtonList ID="rblTraslado" class="input" runat="server" RepeatDirection="Vertical" style="margin-top:4px;">
                            <asp:ListItem Value="no"> Me trasladar&eacute; por cuenta propia</asp:ListItem>
                            <asp:ListItem Value="si" Selected="True"> Requiero traslado aereo</asp:ListItem>
                        </asp:RadioButtonList>
                        <div id="divItinerarios" style="text-align:center;">
                            <p class="inputLabel">VIAJE DE IDA</p>
                            <asp:Label ID="lblVueloSalida1" class="input100w" runat="server" Text="Vuelo inicial >" Font-Bold="True" Width="100px"></asp:Label>
                            <asp:TextBox ID="txtSalidaOrigen1" class="input100w" runat="server" MaxLength="50" placeholder="Origen: " />
                            <asp:TextBox ID="txtSalidaDestino1" class="input100w" runat="server" MaxLength="50" placeholder="Destino: " />
                            <asp:TextBox ID="txtSalidaAerolinea1" class="input100w" runat="server" MaxLength="50" placeholder="Aerolinea: " />
                            <asp:TextBox ID="txtSalidaNoVuelo1" class="input100w" runat="server" MaxLength="50" placeholder="No. de Vuelo: " />
                            <asp:TextBox ID="txtSalidaFecha1" class="input100w" runat="server" MaxLength="50" placeholder="Fecha: " />
                            <asp:TextBox ID="txtSalidaHora1" class="input100w" runat="server" MaxLength="50" placeholder="Hora de salida: " />
                            <asp:TextBox ID="txtSalidaHoraLlegada1" class="input100w" runat="server" MaxLength="50" placeholder="Hora de llegada: " />
                            <br />
                            <asp:Label ID="lblVueloSalida2" class="input100w" runat="server" Text="Vuelo escala >" Font-Bold="True" Width="100px"></asp:Label>
                            <asp:TextBox ID="txtSalidaOrigen2" class="input100w" runat="server" MaxLength="50" placeholder="Origen: " />
                            <asp:TextBox ID="txtSalidaDestino2" class="input100w" runat="server" MaxLength="50" placeholder="Destino: " />
                            <asp:TextBox ID="txtSalidaAerolinea2" class="input100w" runat="server" MaxLength="50" placeholder="Aerolinea: " />
                            <asp:TextBox ID="txtSalidaNoVuelo2" class="input100w" runat="server" MaxLength="50" placeholder="No. de Vuelo: " />
                            <asp:TextBox ID="txtSalidaFecha2" class="input100w" runat="server" MaxLength="50" placeholder="Fecha: " />
                            <asp:TextBox ID="txtSalidaHora2" class="input100w" runat="server" MaxLength="50" placeholder="Hora de salida: " />
                            <asp:TextBox ID="txtSalidaHoraLlegada2" class="input100w" runat="server" MaxLength="50" placeholder="Hora de llegada: " />

                            <br /><br />
                            <p class="inputLabel">VIAJE DE REGRESO</p>
                            <asp:Label ID="lblVueloRegreso1" class="input100w" runat="server" Text="Vuelo inicial >" Font-Bold="True" Width="100px"></asp:Label>
                            <asp:TextBox ID="txtRegresoOrigen1" class="input100w" runat="server" MaxLength="50" placeholder="Origen: " />
                            <asp:TextBox ID="txtRegresoDestino1" class="input100w" runat="server" MaxLength="50" placeholder="Destino: " />
                            <asp:TextBox ID="txtRegresoAerolinea1" class="input100w" runat="server" MaxLength="50" placeholder="Aerolinea: " />
                            <asp:TextBox ID="txtRegresoNoVuelo1" class="input100w" runat="server" MaxLength="50" placeholder="No. de Vuelo: " />
                            <asp:TextBox ID="txtRegresoFecha1" class="input100w" runat="server" MaxLength="50" placeholder="Fecha: " />
                            <asp:TextBox ID="txtRegresoHora1" class="input100w" runat="server" MaxLength="50" placeholder="Hora de salida: " />
                            <asp:TextBox ID="txtRegresoHoraLlegada1" class="input100w" runat="server" MaxLength="50" placeholder="Hora de llegada: " />
                            <br />
                            <asp:Label ID="lblVueloRegreso2" class="input100w" runat="server" Text="Vuelo escala >" Font-Bold="True" Width="100px"></asp:Label>
                            <asp:TextBox ID="txtRegresoOrigen2" class="input100w" runat="server" MaxLength="50" placeholder="Origen: " />
                            <asp:TextBox ID="txtRegresoDestino2" class="input100w" runat="server" MaxLength="50" placeholder="Destino: " />
                            <asp:TextBox ID="txtRegresoAerolinea2" class="input100w" runat="server" MaxLength="50" placeholder="Aerolinea: " />
                            <asp:TextBox ID="txtRegresoNoVuelo2" class="input100w" runat="server" MaxLength="50" placeholder="No. de Vuelo: " />
                            <asp:TextBox ID="txtRegresoFecha2" class="input100w" runat="server" MaxLength="50" placeholder="Fecha: " />
                            <asp:TextBox ID="txtRegresoHora2" class="input100w" runat="server" MaxLength="50" placeholder="Hora de salida: " />
                            <asp:TextBox ID="txtRegresoHoraLlegada2" class="input100w" runat="server" MaxLength="50" placeholder="Hora de llegada: " />
                                                        
                            <br />&nbsp;
                        </div>
                    </div>

                </div>

                <%--Congreso en Noviembre, participantes que pagan --%>
                <div id="div3a" runat="server" hidden="hidden">
                    
                    <asp:DropDownList ID="ddlModalidad" CssClass="input200w" runat="server" >
                        <asp:ListItem Value="...">Modalidad de presentaci&oacute;n...</asp:ListItem>
                        <asp:ListItem>Oral</asp:ListItem>
                        <asp:ListItem>Poster</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <p class="inputLabel" style="font-weight:900;">
                        <asp:CheckBox ID="chkEstudiante" runat="server" Text=" - Soy estudiante" /> 
                        <br />
                    </p>
                    <div id="divEstudiante" hidden="hidden">
                        <p class="inputLabel">Adjuntar credencial de estudiante (por ambos lados, PDF, maximo 2MB):</p>
                        <input type="file" class="inputFile" name="adjuntar" id="fuAdjuntoCredencial" runat="server" accept=".pdf" />
                    </div>

                    <asp:TextBox ID="txtTituloResumen" class="input" runat="server" MaxLength="400" placeholder="Titulo de su resumen..." />
                    <asp:TextBox ID="txtAutores" class="input" runat="server" MaxLength="400" placeholder="Autor(es)..." />
                    <asp:TextBox ID="txtCoAutores" class="input" runat="server" MaxLength="400" placeholder="Co autor(es)..." />

                    <br />
                    <br />
                    <asp:DropDownList ID="ddlPago" CssClass="input200w" runat="server" >
                        <asp:ListItem Value="...">Opciones de pago...</asp:ListItem>
                        <asp:ListItem>Op 1</asp:ListItem>
                        <asp:ListItem>Op 2</asp:ListItem>
                        <asp:ListItem>Op 3</asp:ListItem>
                        <asp:ListItem>Op 4</asp:ListItem>
                        <asp:ListItem>Op 5</asp:ListItem>
                        <asp:ListItem>Op 6</asp:ListItem>
                    </asp:DropDownList>
                    <p class="inputLabel">Adjuntar comprobante del pago (archivo PDF, maximo 2MB):</p>
                    <input type="file" class="inputFile" name="adjuntar" id="fuAdjuntoPago" runat="server" accept=".pdf" />

                    <p class="inputLabel" style="font-weight:900;">
                        <asp:CheckBox ID="chkFactura" runat="server" Text=" - Requiero factura" /> 
                        <br />
                    </p>
                    <div id="divFacturacion">
                        <asp:TextBox ID="txtFacturaRfc" class="input" runat="server" MaxLength="20" placeholder="RFC..." />
                        <asp:TextBox ID="txtFacturaNombre" class="input" runat="server" MaxLength="200" placeholder="Nombre a facturar..." />
                        <asp:TextBox ID="txtDomicilio" class="input" runat="server" MaxLength="200" placeholder="Domicilio..." />
                    </div>

                </div>

                <br />
                <asp:TextBox ID="txtComentarios" class="inputTextArea" runat="server" MaxLength="50" TextMode="MultiLine" Rows="4" 
                    placeholder="Comentarios adicionales..." />
                <br />
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
        <asp:TextBox ID="txtType" runat="server" style="font-weight:900; font-size:14px; color:red;" hidden="hidden"></asp:TextBox>
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
            <asp:HyperLink ID="hlkConsulta" runat="server" NavigateUrl="consulta.aspx" Target="_blank" style="text-decoration:none; color:#d6dbe9">o</asp:HyperLink>
        </p>
    </footer>
    <asp:SqlDataSource ID="SqlDSregistro" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>"
        SelectCommand="SELECT * FROM [microarreglos2015]" OldValuesParameterFormatString="original_{0}">
    </asp:SqlDataSource>
</div>

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
<!-- EOF: MENSAJE DE ESPERA -->

</body>
</html>


