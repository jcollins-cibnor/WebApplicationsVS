<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistroCerrado.aspx.cs" Inherits="RegistroCerrado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CIBNOR - Registro en l&iacute;nea</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous" />

</head>
<body>

<div id="divContainer" class="container" runat="server">

    <header>
        <asp:Image ID="logo_izq1" class="logo" runat="server" />
        <asp:Image ID="logo_izq2" class="logo"  runat="server" Visible="False" />
        <asp:Image ID="logo_centro1" class="logo" runat="server" Visible="False"/>
        <div id="divTitulo" runat="server">
        </div>
        <asp:Image ID="logo_der2" class="logo" runat="server" Visible="False" />

<%--        <div class="media"><%-- DIV PARA  TITULO CON IMAGEN A LA DERECHA --%>
<%--            <div class="media-body">
                <h2 class="media-heading">
                    <asp:Label ID="lblTituloEvento" runat="server" Text="¡Cupo completo!"></asp:Label>
                </h2>
                <p>
                    <asp:Label ID="lblSubTituloEvento" runat="server" Text="Gracias por su interes en nuestro evento."></asp:Label>
                </p>
            </div>
            <div class="media-right">
                <asp:Image ID="logo_der1" class="media-object" runat="server" style="height:90px" ImageUrl="~/_img/logo_dei.png" />
            </div>
        </div>
        <hr />--%>
    </header>
    <br />

    <form id="form1" runat="server">
        <div class="alert alert-info col-sm-12" role="alert">
            <h4 class="alert-heading">¡Cupo completo!</h4>
            <p>
                Debido a la respuesta recibida los espacios disponibles se encuentran agotados. Gracias por su interes en nuestro evento.
                <br /><br />
                Atentamente,
                <br />
                Comit&eacute; Organizador.
                
                <%--Si desea regresar a la pagina del evento, presione el bot&oacute;n &quot;Ok&quot;. En caso contrario, solamente cierre esta ventana.--%>
            </p>
            <hr />
            <h4 class="alert-heading">¡Full quota!</h4>
            <p class="mb-0">
                Due to the response received available spaces are exhausted. Thank you for your interest in our event.
                <br /><br />
                Sincerely, 
                <br />
                Organizing Committee
            </p>
        </div>
        <br />
<%--        <blockquote class="blockquote text-center">
            <p class="mb-0">
                <asp:Button ID="btnAceptar" class="btn btn-outline-success btn-lg" runat="server" Text="Ok" />
            </p>
        </blockquote>--%>

    </form>
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>
