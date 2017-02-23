<%@ Page Language="C#" AutoEventWireup="true" CodeFile="consulta.aspx.cs" Inherits="expociencias_consulta" %>

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
        <asp:Button ID="btnConsultar" runat="server" Text="Realizar consulta" OnClick="btnConsultar_Click" />
        &nbsp;<asp:Button ID="btnExportar" runat="server" onclick="btnExportar_Click" Text="Exportar a Excel" />
        <br />
        Evento:
        <asp:Label ID="lblEventoId" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="18px" ForeColor="#333399" Text="expociencias"></asp:Label>
        <br />
        <hr />
    </div>
    <div>
        <asp:GridView ID="grvConsulta" runat="server" DataSourceID="SqlDSgeneral" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="grvConsulta_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="id">
            <RowStyle BackColor="White" ForeColor="#003399" Font-Names="Arial" Font-Size="9pt" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="nombreEst1" HeaderText="nombreEst1" SortExpression="nombreEst1" />
                <asp:BoundField DataField="correoEst1" HeaderText="correoEst1" SortExpression="correoEst1" />
                <asp:BoundField DataField="telefonoEst1" HeaderText="telefonoEst1" SortExpression="telefonoEst1" />
                <asp:BoundField DataField="sexo" HeaderText="sexo" SortExpression="sexo" />
                <asp:BoundField DataField="edad" HeaderText="edad" SortExpression="edad" />
                <asp:BoundField DataField="numeroEst" HeaderText="numeroEst" SortExpression="numeroEst" />
                <asp:BoundField DataField="nombreEst2" HeaderText="nombreEst2" SortExpression="nombreEst2" />
                <asp:BoundField DataField="correoEst2" HeaderText="correoEst2" SortExpression="correoEst2" />
                <asp:BoundField DataField="nombreEst3" HeaderText="nombreEst3" SortExpression="nombreEst3" />
                <asp:BoundField DataField="correoEst3" HeaderText="correoEst3" SortExpression="correoEst3" />
                <asp:BoundField DataField="nombreAsesor" HeaderText="nombreAsesor" SortExpression="nombreAsesor" />
                <asp:BoundField DataField="correoAsesor" HeaderText="correoAsesor" SortExpression="correoAsesor" />
                <asp:BoundField DataField="telefonoAsesor" HeaderText="telefonoAsesor" SortExpression="telefonoAsesor" />
                <asp:BoundField DataField="institucion" HeaderText="institucion" SortExpression="institucion" />
                <asp:BoundField DataField="domicilio" HeaderText="domicilio" SortExpression="domicilio" />
                <asp:BoundField DataField="municipio" HeaderText="municipio" SortExpression="municipio" />
                <asp:BoundField DataField="proyecto" HeaderText="proyecto" SortExpression="proyecto" />
                <asp:BoundField DataField="categoria" HeaderText="categoria" SortExpression="categoria" />
                <asp:BoundField DataField="area" HeaderText="area" SortExpression="area" />
                <asp:BoundField DataField="descipcionProyecto" HeaderText="descipcionProyecto" SortExpression="descipcionProyecto" />
                <asp:BoundField DataField="nombreHuesped" HeaderText="nombreHuesped" SortExpression="nombreHuesped" />
                <asp:BoundField DataField="justificacion" HeaderText="justificacion" SortExpression="justificacion" />
                <asp:BoundField DataField="claveRegistro" HeaderText="claveRegistro" SortExpression="claveRegistro" />
                <asp:BoundField DataField="tipoPago" HeaderText="tipoPago" SortExpression="tipoPago" />
                <asp:BoundField DataField="fechaRegistro" HeaderText="fechaRegistro" SortExpression="fechaRegistro" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="Black" Font-Names="Arial" Font-Size="9pt" />
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDSgeneral" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>" SelectCommand="" >
    </asp:SqlDataSource>
    <br />

</form>
</body>
</html>
