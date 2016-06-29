<%@ Page Language="C#" AutoEventWireup="true" CodeFile="consulta.aspx.cs" Inherits="jovenespace_consulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Consulta de Registros</title>

<%--    <script type="text/javascript">
        var path = document.location.pathname;
        alert(path);

        var dir = path.substring(1, path.lastIndexOf('/'));
//        alert(path + ", dir: " + dir);
//        window.location.replace("./" + dir + ".aspx");
    </script>--%>

</head>
<body>
<form id="form1" runat="server">

    <div>
        <br />
        &nbsp;
        <asp:Button ID="btnExportar" runat="server" onclick="btnExportar_Click" Text="Exportar a Excel" />
        <br />
        Evento:
        <asp:Label ID="lblEventoId" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="18px" ForeColor="#333399" Text="jovenespace"></asp:Label>
        <br />
        <hr />
    </div>
    <div>
        <asp:GridView ID="grvConsulta" runat="server" DataSourceID="SqlDSgeneral" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="grvConsulta_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="id">
            <RowStyle BackColor="White" ForeColor="#003399" Font-Names="Arial" Font-Size="9pt" />
            <Columns>
                <asp:CommandField SelectText="Ver" ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                <asp:BoundField DataField="correo" HeaderText="correo" SortExpression="correo" />
                <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                <asp:BoundField DataField="sexo" HeaderText="sexo" SortExpression="sexo" />
                <asp:BoundField DataField="edad" HeaderText="edad" SortExpression="edad" />
                <asp:BoundField DataField="institucion" HeaderText="institucion" SortExpression="institucion" />
                <asp:BoundField DataField="domicilioOficial" HeaderText="domicilioOficial" SortExpression="domicilioOficial" />
                <asp:BoundField DataField="municipio" HeaderText="municipio" SortExpression="municipio" />
                <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                <asp:BoundField DataField="egresado" HeaderText="egresado" SortExpression="egresado" />
                <asp:BoundField DataField="fechaEgreso" HeaderText="fechaEgreso" SortExpression="fechaEgreso" />
                <asp:BoundField DataField="semestre" HeaderText="semestre" SortExpression="semestre" />
                <asp:BoundField DataField="titulado" HeaderText="titulado" SortExpression="titulado" />
                <asp:BoundField DataField="fechaTitulacion" HeaderText="fechaTitulacion" SortExpression="fechaTitulacion" />
                <asp:BoundField DataField="nombreProyecto" HeaderText="nombreProyecto" SortExpression="nombreProyecto" />
                <asp:BoundField DataField="area" HeaderText="area" SortExpression="area" />
                <asp:BoundField DataField="nombreHuesped" HeaderText="nombreHuesped" SortExpression="nombreHuesped" />
                <asp:BoundField DataField="justificacion" HeaderText="justificacion" SortExpression="justificacion" />
                <asp:BoundField DataField="registroClave" HeaderText="registroClave" SortExpression="registroClave" />
                <asp:BoundField DataField="registroValido" HeaderText="registroValido" SortExpression="registroValido" Visible="False" />
                <asp:BoundField DataField="registroFecha" HeaderText="registroFecha" SortExpression="registroFecha" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="Black" Font-Names="Arial" Font-Size="9pt" />
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDSgeneral" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>" SelectCommand="SELECT * FROM [jovenespace]">
    </asp:SqlDataSource>
    <br />

</form>
</body>
</html>
