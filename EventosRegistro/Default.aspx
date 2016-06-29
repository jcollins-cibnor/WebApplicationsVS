<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <a href="./microarreglos2015">Microarreglos 2015</a>
    </div>
    </form>
</body>
</html>--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Consulta General de Registros</title>
</head>
<body>
    Hola
    <img src="_img/icon_loader_blackbars.gif" />
    <form id="form1" runat="server">
    <div>    

        <asp:DropDownList ID="ddlEventos" runat="server" AutoPostBack="True" onselectedindexchanged="ddlEventos_SelectedIndexChanged">
            <asp:ListItem Value="0">Seleccionar una opcion...</asp:ListItem>
            <asp:ListItem>cultivos2015</asp:ListItem>
            <asp:ListItem>microarreglos2015</asp:ListItem>
        </asp:DropDownList>
    &nbsp;
        <asp:Button ID="btnExportar" runat="server" onclick="btnExportar_Click" Text="Exportar a Excel" Enabled="False" />
        <br />    

    </div>

    <asp:GridView ID="grvConsulta" runat="server" 
        DataSourceID="SqlDSgeneral" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <RowStyle BackColor="White" ForeColor="#003399" Font-Names="Arial" Font-Size="9pt" />
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="Black" Font-Names="Arial" Font-Size="9pt" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDSgeneral" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:REGWEBConnectionString.ProviderName %>">
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    </form>
</body>
</html>