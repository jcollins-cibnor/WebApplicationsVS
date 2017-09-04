<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cursoProfesoresConsulta.aspx.cs" Inherits="renanp_cursoProfesoresConsulta" %>

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
        <asp:Label ID="lblEventoId" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="18px" ForeColor="#333399" Text="renanp"></asp:Label>
        <br />
        <hr />
    </div>
    <div>
        <asp:GridView ID="grvConsulta" runat="server" DataSourceID="SqlDSgeneral" 
            BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            OnSelectedIndexChanged="grvConsulta_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="id" Visible="False">
            <RowStyle BackColor="White" ForeColor="#003399" Font-Names="Arial" Font-Size="9pt" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                <asp:BoundField DataField="correo" HeaderText="correo" SortExpression="correo" />
                <asp:BoundField DataField="institucion" HeaderText="institucion" SortExpression="institucion" />
                <asp:BoundField DataField="cursoId" HeaderText="cursoId" SortExpression="cursoId" />
                <asp:BoundField DataField="traslado" HeaderText="traslado" SortExpression="traslado" />
                <asp:BoundField DataField="rutaOrigen" HeaderText="rutaOrigen" SortExpression="rutaOrigen" />
                <asp:BoundField DataField="rutaHoraLlegada" HeaderText="rutaHoraLlegada" SortExpression="rutaHoraLlegada" />
                <asp:BoundField DataField="salidaOrigen1" HeaderText="salidaOrigen1" SortExpression="salidaOrigen1" />
                <asp:BoundField DataField="salidaDestino1" HeaderText="salidaDestino1" SortExpression="salidaDestino1" />
                <asp:BoundField DataField="salidaAerolinea1" HeaderText="salidaAerolinea1" SortExpression="salidaAerolinea1" />
                <asp:BoundField DataField="salidaNoVuelo1" HeaderText="salidaNoVuelo1" SortExpression="salidaNoVuelo1" />
                <asp:BoundField DataField="salidaFecha1" HeaderText="salidaFecha1" SortExpression="salidaFecha1" />
                <asp:BoundField DataField="salidaHora1" HeaderText="salidaHora1" SortExpression="salidaHora1" />
                <asp:BoundField DataField="salidaHoraLlegada1" HeaderText="salidaHoraLlegada1" SortExpression="salidaHoraLlegada1" />
                <asp:BoundField DataField="salidaOrigen2" HeaderText="salidaOrigen2" SortExpression="salidaOrigen2" />
                <asp:BoundField DataField="salidaDestino2" HeaderText="salidaDestino2" SortExpression="salidaDestino2" />
                <asp:BoundField DataField="salidaAerolinea2" HeaderText="salidaAerolinea2" SortExpression="salidaAerolinea2" />
                <asp:BoundField DataField="salidaNoVuelo2" HeaderText="salidaNoVuelo2" SortExpression="salidaNoVuelo2" />
                <asp:BoundField DataField="salidaFecha2" HeaderText="salidaFecha2" SortExpression="salidaFecha2" />
                <asp:BoundField DataField="salidaHora2" HeaderText="salidaHora2" SortExpression="salidaHora2" />
                <asp:BoundField DataField="salidaHoraLlegada2" HeaderText="salidaHoraLlegada2" SortExpression="salidaHoraLlegada2" />
                <asp:BoundField DataField="regresoOrigen1" HeaderText="regresoOrigen1" SortExpression="regresoOrigen1" />
                <asp:BoundField DataField="regresoDestino1" HeaderText="regresoDestino1" SortExpression="regresoDestino1" />
                <asp:BoundField DataField="regresoAerolinea1" HeaderText="regresoAerolinea1" SortExpression="regresoAerolinea1" />
                <asp:BoundField DataField="regresoNoVuelo1" HeaderText="regresoNoVuelo1" SortExpression="regresoNoVuelo1" />
                <asp:BoundField DataField="regresoFecha1" HeaderText="regresoFecha1" SortExpression="regresoFecha1" />
                <asp:BoundField DataField="regresoHora1" HeaderText="regresoHora1" SortExpression="regresoHora1" />
                <asp:BoundField DataField="regresoHoraLlegada1" HeaderText="regresoHoraLlegada1" SortExpression="regresoHoraLlegada1" />
                <asp:BoundField DataField="regresoOrigen2" HeaderText="regresoOrigen2" SortExpression="regresoOrigen2" />
                <asp:BoundField DataField="regresoDestino2" HeaderText="regresoDestino2" SortExpression="regresoDestino2" />
                <asp:BoundField DataField="regresoAerolinea2" HeaderText="regresoAerolinea2" SortExpression="regresoAerolinea2" />
                <asp:BoundField DataField="regresoNoVuelo2" HeaderText="regresoNoVuelo2" SortExpression="regresoNoVuelo2" />
                <asp:BoundField DataField="regresoFecha2" HeaderText="regresoFecha2" SortExpression="regresoFecha2" />
                <asp:BoundField DataField="regresoHora2" HeaderText="regresoHora2" SortExpression="regresoHora2" />
                <asp:BoundField DataField="regresoHoraLlegada2" HeaderText="regresoHoraLlegada2" SortExpression="regresoHoraLlegada2" />
                <asp:BoundField DataField="comentarios" HeaderText="comentarios" SortExpression="comentarios" />
                <asp:BoundField DataField="registroFecha" HeaderText="registroFecha" SortExpression="registroFecha" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="Black" Font-Names="Arial" Font-Size="9pt" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDSgeneral" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>" 
            SelectCommand="SELECT * FROM [renanpCursoProfesores]">
        </asp:SqlDataSource>
    </div>
</form>
</body>
</html>
