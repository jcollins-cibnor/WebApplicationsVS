<%@ Page Language="C#" AutoEventWireup="true" CodeFile="expociencias.aspx.cs" Inherits="expociencias_expociencias" Debug="true" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>CIBNOR - Registro en l&iacute;nea</title>
    <script type="text/javascript" src="../_js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="./js/actions_expociencias.js"></script>
    <link rel="Stylesheet" type="text/css" href="./css/registroweb.css" />

<%-- ESTO ES PARA EL DATEPICKER
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="./js/jquery.ui.datepicker-es.js"></script>
    <link type="text/css" rel="stylesheet" href="./css/jquery-ui.css"/>--%>
</head>
<body>
<div id="divContainer">
    <header>
        <img id="logo_izq1" class="logo" src="../_img/logo_cib_oficial.gif" />
<%--        <img id="logo_centro" class="logo" src="../_img/logo_expociencias3.png" />--%>
        <img id="logo_der1" class="logo" src="../_img/logo_pace.png" />
        <div id="divTitulo">
            <p id="lblTitulo">Expociencias Sudcaliforniana</p>
        </div>
        <h2 id="lblRegistroEnLinea">Registro en L&iacute;nea</h2>
    </header>

    <form id="form1" runat="server" enctype="multipart/form-data" >
        <section id="sec1Datos">
            <div id="divDatos">
                <h3>DATOS GENERALES DEL AUTOR(ES) Y ASESOR(ES)</h3>
                <asp:TextBox ID="txtNombreEst1" class="input46percent" runat="server" MaxLength="100" placeholder="Nombre completo del estudiante titular..." />
                <asp:TextBox ID="txtCorreoEst1" class="input46percent" runat="server" MaxLength="50" placeholder="Correo electr&oacute;nico..." />
                <br />
                <asp:TextBox ID="txtTelefonoEst1" class="input100w" runat="server" MaxLength="12" placeholder="Tel&eacute;fono..." />
                <asp:DropDownList ID="ddlSexoEst1" CssClass="input100w" runat="server" >
                    <asp:ListItem Value="...">Sexo...</asp:ListItem>
                    <asp:ListItem>Femenino</asp:ListItem>
                    <asp:ListItem>Masculino</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtEdadEst1" class="input100w" runat="server" MaxLength="2" placeholder="Edad en a&ntilde;os..." />
                <br />
                <asp:DropDownList ID="ddlTallaEst1" CssClass="input200w" runat="server" >
                    <asp:ListItem Value="...">Talla de playera (unisex)...</asp:ListItem>
                    <asp:ListItem>XS</asp:ListItem>
                    <asp:ListItem>S</asp:ListItem>
                    <asp:ListItem>M</asp:ListItem>
                    <asp:ListItem>L</asp:ListItem>
                    <asp:ListItem>XL</asp:ListItem>
                </asp:DropDownList>
                <asp:RadioButtonList ID="rblNumeroEstudiantes" class="input" runat="server" RepeatDirection="Horizontal" style="margin-top:4px;">
                    <asp:ListItem Selected="True" Value="1"> Registro individual</asp:ListItem>
                    <asp:ListItem Value="2 - 3"> Equipo de 2 &oacute; 3 estudiantes</asp:ListItem>
                </asp:RadioButtonList>

                <div id="divEquipo" style="border:solid 1px gray;">
                    <asp:TextBox ID="txtNombreEst2" class="input46percent" runat="server" MaxLength="100" placeholder="Nombre completo del estudiante 2..." />
                    <asp:TextBox ID="txtCorreoEst2" class="input46percent" runat="server" MaxLength="50" placeholder="Correo electr&oacute;nico..." />
                    <asp:DropDownList ID="ddlTallaEst2" CssClass="input200w" runat="server" >
                        <asp:ListItem Value="...">Talla de playera (unisex)...</asp:ListItem>
                        <asp:ListItem>XS</asp:ListItem>
                        <asp:ListItem>S</asp:ListItem>
                        <asp:ListItem>M</asp:ListItem>
                        <asp:ListItem>L</asp:ListItem>
                        <asp:ListItem>XL</asp:ListItem>
                    </asp:DropDownList>                    
                    <br />
                    <asp:TextBox ID="txtNombreEst3" class="input46percent" runat="server" MaxLength="100" placeholder="Nombre completo del estudiante 3..." />
                    <asp:TextBox ID="txtCorreoEst3" class="input46percent" runat="server" MaxLength="50" placeholder="Correo electr&oacute;nico..." />
                    <asp:DropDownList ID="ddlTallaEst3" CssClass="input200w" runat="server" >
                        <asp:ListItem Value="...">Talla de playera (unisex)...</asp:ListItem>
                        <asp:ListItem>XS</asp:ListItem>
                        <asp:ListItem>S</asp:ListItem>
                        <asp:ListItem>M</asp:ListItem>
                        <asp:ListItem>L</asp:ListItem>
                        <asp:ListItem>XL</asp:ListItem>
                    </asp:DropDownList>                    
                    <br />
                    <br />
                </div>

                <br />
                <asp:TextBox ID="txtInstitucion" class="input" runat="server" MaxLength="200" placeholder="Nombre de la instituci&oacute;n..." />
                <asp:TextBox ID="txtDomicilio" class="input46percent" runat="server" MaxLength="100" placeholder="Domicilio oficial..." />
                <asp:TextBox ID="txtMunicipio" class="input46percent" runat="server" MaxLength="50" placeholder="Municipio..." />
                <br />
                <br />
                <asp:TextBox ID="txtNombreAsesor" class="input" runat="server" MaxLength="100" placeholder="Nombre completo asesor(a)..." />
                <asp:TextBox ID="txtCorreoAsesor" class="input46percent" runat="server" MaxLength="50" placeholder="Correo electr&oacute;nico..." />
                <asp:TextBox ID="txtTelefonoAsesor" class="input46percent" runat="server" MaxLength="50" placeholder="Tel&eacute;fono..." />
                <br />
                <br />

                <asp:RadioButtonList ID="rblTipoPago" class="input" runat="server" RepeatDirection="Vertical" style="margin-top:4px;">
                    <asp:ListItem Selected="True" Value="Efectivo"> Pago en efectivo en caja o el dia del evento</asp:ListItem>
                    <asp:ListItem Value="Transferencia"> Pago v&iacute;a transferencia bancaria</asp:ListItem>
                </asp:RadioButtonList>

                    <%--                <div class="divAdjuntarArchivo">
                    <p class="inputLabel">Adjuntar resumen del proyecto:</p>
                    <input type="file" class="inputFile" name="adjuntar" id="fuArchivo" runat="server" accept=".pdf" />
                </div>--%>
                <div id="divTipoPago" style="border:solid 1px gray; background-color:white;">
                    <p class="inputLabel">Adjuntar comprobante del pago:</p>
                    <input type="file" class="inputFile" name="adjuntar" id="fuArchivo" runat="server" accept=".pdf" />                    
                </div>

                <br />
                <h3>DATOS DEL PROYECTO Y PARTICIPACI&Oacute;N</h3>
                <asp:TextBox ID="txtNombreProyecto" class="input" runat="server" MaxLength="100" placeholder="Nombre del proyecto u obra..." />
                <asp:DropDownList ID="ddlCategoria" class="input46percent" runat="server">
                    <asp:ListItem Value="...">Categor&iacute;a de participaci&oacute;n...</asp:ListItem>
                    <asp:ListItem Value="1">Pandillas Cient&iacute;ficas Petit (Preescolar, 1º y 2º Primaria)</asp:ListItem>
                    <asp:ListItem Value="2">Pandillas Cient&iacute;ficas Kids (3º a 6º Primaria)</asp:ListItem>
                    <asp:ListItem Value="3">Pandillas Cient&iacute;ficas Teens (Secundaria)</asp:ListItem>
                    <asp:ListItem Value="4">Medio Superior (Preparatoria o bachillerato o equivalente)</asp:ListItem>
                    <asp:ListItem Value="5">Superior (Universidad o equivalente)</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlArea" CssClass="input46percent" runat="server" >
                    <asp:ListItem Value="...">&Aacute;rea de participaci&oacute;n...</asp:ListItem>
                    <asp:ListItem Value="A">Agropecuarias y Alimentos</asp:ListItem>
                    <asp:ListItem Value="B">Biología</asp:ListItem>
                    <asp:ListItem Value="C">Ciencias de la Ingeniería</asp:ListItem>
                    <asp:ListItem Value="D">Ciencias de los Materiales</asp:ListItem>
                    <asp:ListItem Value="E">Computación y Software</asp:ListItem>
                    <asp:ListItem Value="F">Divulgación de la Ciencia</asp:ListItem>
                    <asp:ListItem Value="G">Exactas y Naturales</asp:ListItem>
                    <asp:ListItem Value="H">Medio Ambiente</asp:ListItem>
                    <asp:ListItem Value="I">Medicina y Salud</asp:ListItem>
                    <asp:ListItem Value="J">Mecatrónica</asp:ListItem>
                    <asp:ListItem Value="K">Sociales y Humanidades</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtDescripcionProyecto" class="inputTextArea" runat="server" MaxLength="1000" TextMode="MultiLine" Rows="4" 
                    placeholder="Escribe una descripcion del proyecto donde se explique de forma general: objetivos, desarrollo e impacto social..." />
                <p class="inputLabel">Resumen de 1000 caracteres como m&aacute;ximo.</p>

                <br />
                <br />
                <h3>INFORMACI&Oacute;N ADICIONAL</h3>
                <p class="inputLabel">En caso de requerir apoyo de hospedaje, favor de llenar lo siguiente:</p>
                <asp:TextBox ID="txtNombreHuesped" class="input" runat="server" MaxLength="100" placeholder="Nombre completo de quien requiere el hospedaje..." />
                <asp:TextBox ID="txtJustificacion" class="input" runat="server" MaxLength="100" placeholder="Justificaci&oacute;n..." />
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


