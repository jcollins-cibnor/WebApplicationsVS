<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="imagenes_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        var path = document.location.pathname;
        var dirfull = path.substring(1, path.lastIndexOf('/'));
        var dirlast = dirfull.substring(dirfull.lastIndexOf('/') + 1, dirfull.length);

        //        alert(dirfull + "-" + dirlast);   
        //window.location.replace("./" + dirlast + ".aspx");
        window.location.replace("https://docs.google.com/forms/d/e/1FAIpQLSd2AaiPQ8neBIoMARwZ2oMZxRaIB07r4-_MEydBoF5-HdFpfw/viewform?usp=sf_link");

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div1">
    </div>
    </form>
</body>
</html>
