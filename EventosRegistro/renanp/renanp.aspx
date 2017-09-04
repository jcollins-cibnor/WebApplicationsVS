<%@ Page Language="C#" AutoEventWireup="true" CodeFile="renanp.aspx.cs" Inherits="renanp_renanp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
<%-- --%>
</head>
<body>
<div id="divContainer">
    <header>
        <img id="logo_izq1" class="logo" src="../_img/logo_cib_oficial.gif" />
<%--        <img id="logo_centro" class="logo" src="../_img/logo_renanp20163.png" /> EN CASO DE LOGO CENTRAL --%>
        <%--<img id="logo_der1" class="logo" src="../_img/logo_cib_oficial.gif" />--%>
        <div id="divTitulo">
            <p id="lblTitulo">
                RENANP 2017
            </p>
        </div>
<%--        <h2 id="lblRegistroEnLinea">Registro en L&iacute;nea</h2>--%>
    </header>

    <form id="form1" runat="server">
        <section id="sec1Datos">
            <div id="divDatos">
                <h3>DATOS GENERALES</h3>
                <div style="background-color:blue;">
                    Nombre(s)
                    <asp:TextBox ID="txtNombres" class="input46percent required" runat="server" MaxLength="100" placeholder="Nombre(s)..." />
                </div>
                <asp:TextBox ID="txtApellidos" class="input required" runat="server" MaxLength="100" placeholder="Apellido(s)..." />
                <asp:TextBox ID="txtCorreo" class="input46percent required" runat="server" MaxLength="50" placeholder="Correo electr&oacute;nico..." />
                <asp:TextBox ID="txtCorreoConfirma" class="input46percent required" runat="server" MaxLength="50" placeholder="Confirma correo electr&oacute;nico..." />
                <asp:TextBox ID="txtInstitucion" class="input" runat="server" MaxLength="200" placeholder="Nombre de la instituci&oacute;n..." />
                <asp:TextBox ID="txtCiudadProcedencia" class="input" runat="server" MaxLength="200" placeholder="Ciudad de procedencia..." />
                <asp:TextBox ID="txtFechaLlega" class="input46percent required" runat="server" MaxLength="50" placeholder="Fecha de LLEGADA al hotel sede..." />
                <asp:TextBox ID="txtHoraLlega" class="input46percent required" runat="server" MaxLength="50" placeholder="Hora..." />
                <asp:TextBox ID="txtFechaSalida" class="input46percent required" runat="server" MaxLength="50" placeholder="Fecha de SALIDA del hotel sede..." />
                <asp:TextBox ID="txtHoraSalida" class="input46percent required" runat="server" MaxLength="50" placeholder="Hora..." />
                <br />
                <br />
            </div>
        </section>
    </form>
</div>
<div id="divMensajeFijo"
    style="border:1px solid blue; position:fixed; top:100px; right:18%; width:150px; line-height:20px; padding:4px; background-color:white; z-index:100;">
    <p class="required">Campos requeridos</p>
<%--    <p >Si no aplica ingrese "NA"</p>--%>
</div>
</body>
</html>
<style>
    body{
        width:640px;
        position:fixed;
        margin:10px auto;
        /*background-color:red;*/
    }
    #divContainer {
        width:640px; /*Ancho tomado del iPhone 4 (640x960)*/
        position:fixed;
        margin:4px 0px 4px 50%;
        left:-320px;
        /*background-color:cyan;*/
    }
    header {
        text-align:center;
        height:90px;
        position:relative;
        width:96%;
        margin:0px 2%;
        border-bottom:1px solid #000;   
        background-color:white;
    }

</style>

