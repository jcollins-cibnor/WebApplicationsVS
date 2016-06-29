<%@ Page Language="C#" AutoEventWireup="true" CodeFile="consulta.aspx.cs" Inherits="anivseguridad_consulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Consulta de Registros</title>

</head>
<body>
<form id="form1" runat="server">

    <div>
        <br />
        &nbsp;
        <asp:Button ID="btnExportar" runat="server" onclick="btnExportar_Click" Text="Exportar a Excel" />
        <br />
        Evento:
        <asp:Label ID="lblEventoId" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="18px" ForeColor="#333399" Text="anivseguridad" ></asp:Label>
        <br />
        <hr />
    </div>
    <div>
        <asp:GridView ID="grvConsulta" runat="server" DataSourceID="SqlDSgeneral" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="id">
            <RowStyle BackColor="White" ForeColor="#003399" Font-Names="Arial" Font-Size="9pt" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                <asp:BoundField DataField="correo" HeaderText="correo" SortExpression="correo" />
                <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                <asp:BoundField DataField="nombreequipo" HeaderText="nombreequipo" SortExpression="nombreequipo" />
                <asp:BoundField DataField="nombrei1" HeaderText="nombrei1" SortExpression="nombrei1" />
                <asp:BoundField DataField="comentarios" HeaderText="comentarios" SortExpression="comentarios" />
                <asp:BoundField DataField="registrofecha" HeaderText="registrofecha" SortExpression="registrofecha" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="Black" Font-Names="Arial" Font-Size="9pt" />
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDSgeneral" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>" SelectCommand="SELECT * FROM [anivseguridad]">
    </asp:SqlDataSource>
    <br />

</form>

        <script type="text/javascript">
            var path = document.location.pathname;
            var dirfull = path.substring(1, path.lastIndexOf('/'));
            var dirlast = dirfull.substring(dirfull.lastIndexOf('/') + 1, dirfull.length);

            //alert(dirlast);
            //document.all("lblEventoId").innerText = dirlast;
            //YA CAMBIA EL LABEL PERO NO HACE LA CONSULTA DEBIDO A QUE ESTA SE EJECUTA ANTES DE EL js
    </script>

</body>
</html>
