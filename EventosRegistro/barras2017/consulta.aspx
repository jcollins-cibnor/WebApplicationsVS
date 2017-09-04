<%@ Page Language="C#" AutoEventWireup="true" CodeFile="consulta.aspx.cs" Inherits="biorreactores_consulta" %>

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
        window.location.replace("https://docs.google.com/spreadsheets/d/19Hokrnzj304UC6xVwFpsrfXSG7ubbSalf5-ZeYPuHTE/edit?usp=sharing");

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div1">
    </div>
    </form>
</body>
</html>
