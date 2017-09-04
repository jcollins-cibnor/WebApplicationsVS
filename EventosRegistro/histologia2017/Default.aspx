<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="histologia2017_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        // ------------ CUANDO SE ALCANZA EL CUPO MAXIMO, SE COMENTA EL script PARA QUE SE MUESTRE LA LEYENDA
        //var path = document.location.pathname;
        //var dirfull = path.substring(1, path.lastIndexOf('/'));
        //var dirlast = dirfull.substring(dirfull.lastIndexOf('/') + 1, dirfull.length);
        //window.location.replace("./" + dirlast + ".aspx");
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div1" style=" position:relative; width:780px; margin:20px auto;">
        <p style="font-family:Arial; font-size:24px; font-weight:900; text-align:center;">
            El cupo m&aacute;ximo para este evento ha sido alcanzado, gracias por su inter&eacute;s.</p>
    </div>
    </form>
</body>
</html>
