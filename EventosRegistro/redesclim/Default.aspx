<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="redesclim_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        var path = document.location.pathname;
        var dirfull = path.substring(1, path.lastIndexOf('/'));
        var dirlast = dirfull.substring(dirfull.lastIndexOf('/') + 1, dirfull.length);

        window.location.replace("./" + dirlast + ".aspx"); // Redirigir al usuario a la pagina de registro
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div1">
    </div>
    </form>
</body>
</html>
