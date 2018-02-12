<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Consulta.aspx.cs" Inherits="imagenes_Consulta" %>

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
        window.location.replace("https://docs.google.com/spreadsheets/d/1N1AVRnx7G0iJaCEwBlKunPc-pG5mUzy0cGVlPqRpf6s/edit?usp=sharing");

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div1">
    </div>
    </form>
</body>
</html>
