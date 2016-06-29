<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistroOk.aspx.cs" Inherits="RegistroOk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CIBNOR - Registro en l&iacute;nea</title>

<style type="text/css">
* {
    margin:0px;
    padding:0px;
    border:none;
    }

#divContainer {
    width:840px;
    position:relative;
    margin:0px auto;
    }

header {
    background-color:#FFF;
    text-align:center;
    height:100px;
    position:relative;
    width:100%;
    margin:0px auto 10px auto;
    border-bottom:1px solid #000;   
    }

.logo {
    height:60px;
    width:auto;
    position:absolute;
    top:10px;
    }
    
#logo_izq1 {
    left:5%;
    }

#logo_der1 {
    right:5%;
    }


#logo_centro1 {
    margin: 0px auto;
    right:0%;
    }
    
#divTitulo {
    /*border:1px solid red;*/
    width:480px;
    margin:0px auto;
    text-align:center;
    font-family:"Verdana";
    font-weight:900;
    font-size:1.0em;
    padding-top:20px;
    background-image:none;
    background-position:center;
    background-repeat:no-repeat;
    }

#lblTitulo {
    margin:10px auto;
}

.inputButton {
    border:1px solid #CCC;
    font-family:Arial;
    font-size:12px;
    width:120px;
    height:24px;
    margin:0px 5px;
    cursor:pointer;
    }
</style>

</head>
<body>
<div id="divContainer" runat="server">

    <header>
        <asp:Image ID="logo_izq1" class="logo" runat="server" />
        <asp:Image ID="logo_izq2" class="logo"  runat="server" Visible="False" />

        <asp:Image ID="logo_centro1" class="logo" runat="server" Visible="False"/>
        <div id="divTitulo" runat="server">
            <asp:Label ID="lblTituloEvento" runat="server" Text="Titulo del Evento"></asp:Label>
        </div>
        <asp:Image ID="logo_der1" class="logo" runat="server" />
        <asp:Image ID="logo_der2" class="logo" runat="server" Visible="False" />

    </header>

    <form id="form1" runat="server">
    <div align="center">
    
        <table style="width: 80%; font-family: Verdana; font-size: 11pt;">
            <tr>
                <td style="width:10%"></td>
                <td style="text-align:center" class="style1">
                    <br />
                    <br />    
                    <br />
                </td>
                <td  style="width:10%" class="style1"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="text-align:center">
                    Gracias por su interes en nuestro evento.
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="text-align:center">
                    <br />
                    Su solicitud de registro fue enviada al Comit&eacute; Organizador.<br />
                    Una copia del mismo ha sido enviada al correo electr&oacute;nico registrado.<br />
                    <br />
                    Si desea regresar a la pagina del evento, presione el boton &quot;Ok&quot;.<br />
                    En caso contrario, solamente cierre esta ventana.<br />
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <hr style="width:100%; border-top:1px solid black;" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="text-align:center">
                    Thank you for your interest in our event.<br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="text-align:center">
                    <br />
                    Your registration application was sent to the Organizing Committee.<br />
                    A copy of this application has also been sent to the registered electonic mail.<br />
                    <br />
                    If you wish to go back to the home page of the event, click on &quot;Ok&quot;.<br />
                    If not, only close this window.<br />
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="text-align:center">
                    <br />
                    <asp:Button ID="btnAceptar" class="inputButton" runat="server" Text="Ok" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        </div>
    </form>
</div>
</body>
</html>
