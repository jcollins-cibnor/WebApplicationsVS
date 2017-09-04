<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cursoProfesores.aspx.cs" Inherits="renanp_cursoProfesores" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>CIBNOR - Registro en l&iacute;nea</title>
    <script type="text/javascript" src="../_js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="./js/actions_renanp.js"></script>
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
        <%--<img id="logo_izq1" class="logo" src="../_img/logo_cib_oficial.gif" />--%>
<%--        <img id="logo_centro" class="logo" src="../_img/logo_renanp20163.png" />--%>
        <%--<img id="logo_der1" class="logo" src="../_img/logo_cib_oficial.gif" />--%>
        <div id="divTitulo">
            <p id="lblTitulo">
                <asp:Label ID="lblTituloPrincipal" runat="server" Text="Label"></asp:Label>
                </p>
        </div>
        <h2 id="lblRegistroEnLinea">Registro en L&iacute;nea</h2>
    </header>

    <div id="divMensajeFijo"
        style="border:1px solid red; position:fixed; top:120px; right:8%; width:150px; line-height:20px; padding:4px; background-color:white; z-index:100;">
        <p class="required">Campos requeridos</p>
        <p >Si no aplica ingrese "NA"</p>
    </div>

    <form id="form1" runat="server" enctype="multipart/form-data" >
        <section id="sec1Datos">
            <div id="divDatos">
                <h3>DATOS GENERALES</h3>
                <asp:TextBox ID="txtNombre" class="input required" runat="server" MaxLength="100" placeholder="Nombre completo..." />
                <asp:TextBox ID="txtCorreo" class="input46percent required" runat="server" MaxLength="50" placeholder="Correo electr&oacute;nico..." />
                <asp:TextBox ID="txtCorreoConfirma" class="input46percent required" runat="server" MaxLength="50" placeholder="Confirmaci&oacute;n de correo electr&oacute;nico..." />
                <asp:TextBox ID="txtInstitucion" class="input" runat="server" MaxLength="200" placeholder="Nombre de la instituci&oacute;n..." />
                <br />
                <br />
                
                <%--Curso --%>
                    <div id="divCTraslado" style="border:solid 1px gray;">
                    
                        <h4 style="text-align:center;">Itinerario</h4>
                        <asp:RadioButtonList ID="rblCTraslado" class="input" runat="server" RepeatDirection="Vertical" style="margin-top:4px;">
                            <asp:ListItem Value="no"> Me trasladar&eacute; por cuenta propia</asp:ListItem>
                            <asp:ListItem Value="si" Selected="True"> Requiero traslado aereo</asp:ListItem>
                            <asp:ListItem Value="sb"> Me trasladar&eacute; por autobus</asp:ListItem>
                        </asp:RadioButtonList>
                        <div id="divCItinerarios" style="text-align:center;">
                            <p class="inputLabel">VIAJE DE IDA</p>
                            <asp:Label ID="lblCVueloSalida1" class="input100w" runat="server" Text="Vuelo inicial >" Font-Bold="True" Width="100px"></asp:Label>
                            <asp:TextBox ID="txtCSalidaOrigen1" class="input100w required" runat="server" MaxLength="50" placeholder="Origen: " />
                            <asp:TextBox ID="txtCSalidaDestino1" class="input100w" runat="server" MaxLength="50" placeholder="Destino: " />
                            <asp:TextBox ID="txtCSalidaAerolinea1" class="input100w" runat="server" MaxLength="50" placeholder="Aerolinea: " />
                            <asp:TextBox ID="txtCSalidaNoVuelo1" class="input100w required" runat="server" MaxLength="50" placeholder="No. de Vuelo: " />
                            <asp:TextBox ID="txtCSalidaFecha1" class="input100w required" runat="server" MaxLength="50" placeholder="Fecha: " />
                            <asp:TextBox ID="txtCSalidaHora1" class="input100w required" runat="server" MaxLength="50" placeholder="Hora de salida: " />
                            <asp:TextBox ID="txtCSalidaHoraLlegada1" class="input100w" runat="server" MaxLength="50" placeholder="Hora de llegada: " />
                            <br />
                            <asp:Label ID="lblCVueloSalida2" class="input100w" runat="server" Text="Vuelo escala >" Font-Bold="True" Width="100px"></asp:Label>
                            <asp:TextBox ID="txtCSalidaOrigen2" class="input100w" runat="server" MaxLength="50" placeholder="Origen: " />
                            <asp:TextBox ID="txtCSalidaDestino2" class="input100w" runat="server" MaxLength="50" placeholder="Destino: " />
                            <asp:TextBox ID="txtCSalidaAerolinea2" class="input100w" runat="server" MaxLength="50" placeholder="Aerolinea: " />
                            <asp:TextBox ID="txtCSalidaNoVuelo2" class="input100w" runat="server" MaxLength="50" placeholder="No. de Vuelo: " />
                            <asp:TextBox ID="txtCSalidaFecha2" class="input100w" runat="server" MaxLength="50" placeholder="Fecha: " />
                            <asp:TextBox ID="txtCSalidaHora2" class="input100w" runat="server" MaxLength="50" placeholder="Hora de salida: " />
                            <asp:TextBox ID="txtCSalidaHoraLlegada2" class="input100w" runat="server" MaxLength="50" placeholder="Hora de llegada: " />

                            <br /><br />
                            <p class="inputLabel">VIAJE DE REGRESO</p>
                            <asp:Label ID="lblCVueloRegreso1" class="input100w" runat="server" Text="Vuelo inicial >" Font-Bold="True" Width="100px"></asp:Label>
                            <asp:TextBox ID="txtCRegresoOrigen1" class="input100w required" runat="server" MaxLength="50" placeholder="Origen: " />
                            <asp:TextBox ID="txtCRegresoDestino1" class="input100w" runat="server" MaxLength="50" placeholder="Destino: " />
                            <asp:TextBox ID="txtCRegresoAerolinea1" class="input100w" runat="server" MaxLength="50" placeholder="Aerolinea: " />
                            <asp:TextBox ID="txtCRegresoNoVuelo1" class="input100w required" runat="server" MaxLength="50" placeholder="No. de Vuelo: " />
                            <asp:TextBox ID="txtCRegresoFecha1" class="input100w required" runat="server" MaxLength="50" placeholder="Fecha: " />
                            <asp:TextBox ID="txtCRegresoHora1" class="input100w required" runat="server" MaxLength="50" placeholder="Hora de salida: " />
                            <asp:TextBox ID="txtCRegresoHoraLlegada1" class="input100w" runat="server" MaxLength="50" placeholder="Hora de llegada: " />
                            <br />
                            <asp:Label ID="lblCVueloRegreso2" class="input100w" runat="server" Text="Vuelo escala >" Font-Bold="True" Width="100px"></asp:Label>
                            <asp:TextBox ID="txtCRegresoOrigen2" class="input100w" runat="server" MaxLength="50" placeholder="Origen: " />
                            <asp:TextBox ID="txtCRegresoDestino2" class="input100w" runat="server" MaxLength="50" placeholder="Destino: " />
                            <asp:TextBox ID="txtCRegresoAerolinea2" class="input100w" runat="server" MaxLength="50" placeholder="Aerolinea: " />
                            <asp:TextBox ID="txtCRegresoNoVuelo2" class="input100w" runat="server" MaxLength="50" placeholder="No. de Vuelo: " />
                            <asp:TextBox ID="txtCRegresoFecha2" class="input100w" runat="server" MaxLength="50" placeholder="Fecha: " />
                            <asp:TextBox ID="txtCRegresoHora2" class="input100w" runat="server" MaxLength="50" placeholder="Hora de salida: " />
                            <asp:TextBox ID="txtCRegresoHoraLlegada2" class="input100w" runat="server" MaxLength="50" placeholder="Hora de llegada: " />
                                                        
                            <br />&nbsp;
                        </div>
                        <div id="divCRuta" style="text-align:center;">
                            <asp:Label ID="lblRuta" class="input100w" runat="server" Text="Ruta >" Font-Bold="True" Width="100px"></asp:Label>
                            <asp:TextBox ID="txtCRutaOrigen" class="input30percent required" runat="server" MaxLength="50" placeholder="Lugar de origen: " />
                            <asp:TextBox ID="txtCRutaHoraLlegada" class="input30percent required" runat="server" MaxLength="50" placeholder="Hora de llegada: " />
                            <br />&nbsp;
                        </div>
                    </div>


                <br />
                <asp:TextBox ID="txtComentarios" class="inputTextArea" runat="server" MaxLength="1000" TextMode="MultiLine" Rows="4" 
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
        <p style="text-align:right; border:none; left:100px;">
            <asp:HyperLink ID="hlkConsulta" runat="server" NavigateUrl="cursoProfesoresConsulta.aspx" Target="_blank" style="text-decoration:none; color:#d6dbe9">O</asp:HyperLink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
    </footer>
    <asp:SqlDataSource ID="SqlDSregistro" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>"
        SelectCommand="SELECT * FROM [microarreglos2015]" OldValuesParameterFormatString="original_{0}">
    </asp:SqlDataSource>
</div>

<!-- MENSAJE DE ESPERA -->
<div id="divMensajeEspera" 
    style="height:300px; width:70%; left:15%; position:fixed; top:30%; margin:1px; border:1px solid #000; background-color:white; text-align:center;">    

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


