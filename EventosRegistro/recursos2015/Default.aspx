<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="recursos2015_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<%--    <meta http-equiv="refresh" content="0; url=redirect.aspx">
--%>

    <script type="text/javascript">
        var path = document.location.pathname;
        var dir = path.substring(1, path.lastIndexOf('/'));

        alert(path + ", dir: " + dir);
        window.location.replace("./" + dir + ".aspx");
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div1">
    </div>
    </form>
</body>
</html>
