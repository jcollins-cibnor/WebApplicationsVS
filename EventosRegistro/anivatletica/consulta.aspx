<%@ Page Language="C#" AutoEventWireup="true" CodeFile="consulta.aspx.cs" Inherits="anivatletica_consulta" %>

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
        <asp:Label ID="lblEventoId" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="18px" ForeColor="#333399" Text="anivatletica" ></asp:Label>
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
                <asp:BoundField DataField="edad" HeaderText="edad" SortExpression="edad" />
                <asp:BoundField DataField="sexo" HeaderText="sexo" SortExpression="sexo" />
                <asp:BoundField DataField="tiporegistro" HeaderText="tiporegistro" SortExpression="tiporegistro" />
                <asp:BoundField DataField="nombreequipo" HeaderText="nombreequipo" SortExpression="nombreequipo" />
                <asp:BoundField DataField="nombrei2" HeaderText="nombrei2" SortExpression="nombrei2" />
                <asp:BoundField DataField="edadi2" HeaderText="edadi2" SortExpression="edadi2" />
                <asp:BoundField DataField="sexoi2" HeaderText="sexoi2" SortExpression="sexoi2" />
                <asp:BoundField DataField="nombrei3" HeaderText="nombrei3" SortExpression="nombrei3" />
                <asp:BoundField DataField="edadi3" HeaderText="edadi3" SortExpression="edadi3" />
                <asp:BoundField DataField="sexoi3" HeaderText="sexoi3" SortExpression="sexoi3" />
                <asp:BoundField DataField="nombrei4" HeaderText="nombrei4" SortExpression="nombrei4" />
                <asp:BoundField DataField="edadi4" HeaderText="edadi4" SortExpression="edadi4" />
                <asp:BoundField DataField="sexoi4" HeaderText="sexoi4" SortExpression="sexoi4" />
                <asp:BoundField DataField="comentarios" HeaderText="comentarios" SortExpression="comentarios" />
                <asp:BoundField DataField="registrofecha" HeaderText="registrofecha" SortExpression="registrofecha" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="Black" Font-Names="Arial" Font-Size="9pt" />
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDSgeneral" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>" SelectCommand="SELECT * FROM [anivatletica]">
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
