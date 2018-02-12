<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConsultaEspecifica.aspx.cs" Inherits="ConsultaEspecifica" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        label {
            width:100%; line-height:14px; background-color:#646bbe; color:white; padding:4px 6px; margin:1px;
        }
        td {
            width:30%; background-color:gray; vertical-align:top;
        }
        .dataview {
            margin:1%;
            width:98%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtFolioId" runat="server">201600463</asp:TextBox>&nbsp;-
        <asp:Button ID="btnAnterior" runat="server" Text="&lt;" OnClick="btnAnterior_Click" />
        <asp:Button ID="btnSiguiente" runat="server" OnClick="btnSiguiente_Click" Text="&gt;" />
        <br />
    </div>
    <table style="width:100%; height:100%; background-color:white; font-family:Calibri; font-size:12px;">
        <tr>
            <td>
                <label>SolEventoGral</label>
                <asp:SqlDataSource ID="sqlDSEventoGral" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT SolicitudId, Folio, Fecha, NomSolicitante, Email, AreaId, AreaOtro, UbicacionId, Extel, Tel, Proyecto FROM SolEventoGral WHERE (Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" DefaultValue="201600463" Name="Value" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DetailsView class="dataview" style="width:98%;" ID="dvEventoGral" runat="server" AutoGenerateRows="False" DataKeyNames="SolicitudId" DataSourceID="sqlDSEventoGral" Height="50px" Width="125px">
                    <FieldHeaderStyle Font-Bold="True" Width="15%" />
                    <Fields>
                    <asp:BoundField DataField="SolicitudId" HeaderText="SolicitudId" InsertVisible="False" ReadOnly="True" SortExpression="SolicitudId" />
                    <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                    <asp:BoundField DataField="Fecha" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Fecha" SortExpression="Fecha" />
                    <asp:BoundField DataField="NomSolicitante" HeaderText="NomSolicitante" SortExpression="NomSolicitante" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="AreaId" HeaderText="AreaId" SortExpression="AreaId" />
                    <asp:BoundField DataField="AreaOtro" HeaderText="AreaOtro" SortExpression="AreaOtro" />
                    <asp:BoundField DataField="UbicacionId" HeaderText="UbicacionId" SortExpression="UbicacionId" />
                    <asp:BoundField DataField="Extel" HeaderText="Extel" SortExpression="Extel" />
                    <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel" />
                    <asp:BoundField DataField="Proyecto" HeaderText="Proyecto" SortExpression="Proyecto" />
                </Fields>
                    <HeaderStyle Font-Bold="False" />
                </asp:DetailsView>
                <br />
                <label>SolEventoInsumos</label>
                <asp:SqlDataSource ID="sqlDSInsumos" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT DISTINCT SolEventoGral.Folio, SolEventoInsumos.* FROM SolEventoGral INNER JOIN SolEventoInsumos ON SolEventoGral.SolicitudId = SolEventoInsumos.SolicitudId WHERE (SolEventoGral.Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" Name="Value" PropertyName="Text" DefaultValue="201600463" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gvInsumos" class="dataview" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSInsumos">
                    <Columns>
                        <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" Visible="False" />
                        <asp:BoundField DataField="SolicitudId" HeaderText="SolicitudId" SortExpression="SolicitudId" />
                        <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" SortExpression="InsumoId" />
                        <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
                    </Columns>
                </asp:GridView>
            </td>
            <td style="width:40%;">
                <label>SolEventoDatos</label>
                <asp:SqlDataSource ID="sqlDSDatos" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT SolEventoGral.Folio, SolEventoDatos.* FROM SolEventoGral INNER JOIN SolEventoDatos ON SolEventoGral.SolicitudId = SolEventoDatos.SolicitudId WHERE (SolEventoGral.Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" Name="Value" PropertyName="Text" DefaultValue="201600463" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DetailsView class="dataview" style="width:98%;" ID="dvEventoDatos" runat="server" AutoGenerateRows="False" DataKeyNames="SolicitudId" DataSourceID="sqlDSDatos" Height="50px" Width="125px">
                    <FieldHeaderStyle Font-Bold="True" Width="15%" />
                    <Fields>
                        <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" Visible="False" />
                        <asp:BoundField DataField="SolicitudId" HeaderText="SolicitudId" ReadOnly="True" SortExpression="SolicitudId" />
                        <asp:BoundField DataField="TitularId" HeaderText="TitularId" SortExpression="TitularId" />
                        <asp:BoundField DataField="NombreTitular" HeaderText="NombreTitular" SortExpression="NombreTitular" />
                        <asp:BoundField DataField="EmailTitular" HeaderText="EmailTitular" SortExpression="EmailTitular" />
                        <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" />
                        <asp:BoundField DataField="Reprogramado" HeaderText="Reprogramado" SortExpression="Reprogramado" />
                        <asp:BoundField DataField="FolioPrevio" HeaderText="FolioPrevio" SortExpression="FolioPrevio" />
                        <asp:BoundField DataField="FolioId" HeaderText="FolioId" SortExpression="FolioId" />
                        <asp:BoundField DataField="NumPersonas" HeaderText="NumPersonas" SortExpression="NumPersonas" />
                        <asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento" />
                        <asp:BoundField DataField="DescripEvento" HeaderText="DescripEvento" SortExpression="DescripEvento" />
                        <asp:BoundField DataField="Director" HeaderText="Director" SortExpression="Director" />
                        <asp:BoundField DataField="FechaIni" DataFormatString="{0:yyyy/MM/dd}" HeaderText="FechaIni" SortExpression="FechaIni" />
                        <asp:BoundField DataField="FechaFin" DataFormatString="{0:yyyy/MM/dd}" HeaderText="FechaFin" SortExpression="FechaFin" />
                        <asp:BoundField DataField="TipoHorario" HeaderText="TipoHorario" SortExpression="TipoHorario" />
                        <asp:BoundField DataField="HoraIni" HeaderText="HoraIni" SortExpression="HoraIni" />
                        <asp:BoundField DataField="HoraFin" HeaderText="HoraFin" SortExpression="HoraFin" />
                        <asp:BoundField DataField="TipoEvento" HeaderText="TipoEvento" SortExpression="TipoEvento" />
                        <asp:BoundField DataField="EquipoOtro" HeaderText="EquipoOtro" SortExpression="EquipoOtro" />
                        <asp:BoundField DataField="Justificacion" HeaderText="Justificacion" SortExpression="Justificacion" />
                        <asp:BoundField DataField="Beneficiarios" HeaderText="Beneficiarios" SortExpression="Beneficiarios" />
                        <asp:BoundField DataField="Objetivos" HeaderText="Objetivos" SortExpression="Objetivos" />
                        <asp:BoundField DataField="Programas" HeaderText="Programas" SortExpression="Programas" />
                        <asp:BoundField DataField="OtroApoyo" HeaderText="OtroApoyo" SortExpression="OtroApoyo" />
                        <asp:BoundField DataField="Comentarios" HeaderText="Comentarios" SortExpression="Comentarios" />
                        <asp:BoundField DataField="OtroCategoria" HeaderText="OtroCategoria" SortExpression="OtroCategoria" />
                        <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" />
                        <asp:BoundField DataField="ComentariosAdmon" HeaderText="ComentariosAdmon" SortExpression="ComentariosAdmon" />
                        <asp:BoundField DataField="Atendida" HeaderText="Atendida" SortExpression="Atendida" />
                        <asp:BoundField DataField="Atendieron" HeaderText="Atendieron" SortExpression="Atendieron" />
                        <asp:BoundField DataField="PublicarCalendario" HeaderText="PublicarCalendario" SortExpression="PublicarCalendario" />
                        <asp:BoundField DataField="TipoAniversario" HeaderText="TipoAniversario" SortExpression="TipoAniversario" />
                    </Fields>
                    <HeaderStyle Width="100px" Font-Bold="True" />
                </asp:DetailsView>
            </td>
            <td>
                <label>SolEventoLugares</label>
                <asp:SqlDataSource ID="sqlDSLugares" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT DISTINCT SolEventoGral.Folio, SolEventoLugares.* FROM SolEventoGral INNER JOIN SolEventoLugares ON SolEventoGral.SolicitudId = SolEventoLugares.SolicitudId WHERE (SolEventoGral.Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" Name="Value" PropertyName="Text" DefaultValue="201600463" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gvLugares" class="dataview" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSLugares">
                    <Columns>
                        <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" Visible="False" />
                        <asp:BoundField DataField="SolicitudId" HeaderText="SolicitudId" SortExpression="SolicitudId" />
                        <asp:BoundField DataField="LugarId" HeaderText="LugarId" SortExpression="LugarId" />
                        <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
                    </Columns>
                </asp:GridView>
                <br />
                <label>SolEventoUrls</label>
                <asp:SqlDataSource ID="sqlDSEventoUrls" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT DISTINCT SolEventoGral.Folio, SolEventoUrls.* FROM SolEventoGral INNER JOIN SolEventoUrls ON SolEventoGral.SolicitudId = SolEventoUrls.SolicitudId WHERE (SolEventoGral.Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" Name="Value" PropertyName="Text" DefaultValue="201600463" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DetailsView class="dataview" style="width:98%;" ID="dvEventoUrls" runat="server" AutoGenerateRows="False" DataKeyNames="SolicitudId" DataSourceID="sqlDSEventoUrls" Height="50px" Width="125px">
                    <FieldHeaderStyle Font-Bold="True" Width="15%" />
                    <Fields>
                    <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" Visible="False" />
                    <asp:BoundField DataField="SolicitudId" HeaderText="SolicitudId" SortExpression="SolicitudId" ReadOnly="True" />
                    <asp:BoundField DataField="UrlOficial" HeaderText="UrlOficial" SortExpression="UrlOficial" />
                    <asp:BoundField DataField="UrlGaleria" HeaderText="UrlGaleria" SortExpression="UrlGaleria" />
                    <asp:BoundField DataField="UrlConvoca" HeaderText="UrlConvoca" SortExpression="UrlConvoca" />
                    <asp:BoundField DataField="UrlInvitado" HeaderText="UrlInvitado" SortExpression="UrlInvitado" />
                    <asp:BoundField DataField="UrlAd1Texto" HeaderText="UrlAd1Texto" SortExpression="UrlAd1Texto" />
                    <asp:BoundField DataField="UrlAd1Uri" HeaderText="UrlAd1Uri" SortExpression="UrlAd1Uri" />
                    <asp:BoundField DataField="UrlAd2Texto" HeaderText="UrlAd2Texto" SortExpression="UrlAd2Texto" />
                    <asp:BoundField DataField="UrlAd2Uri" HeaderText="UrlAd2Uri" SortExpression="UrlAd2Uri" />
                </Fields>
                    <HeaderStyle Width="100px" Font-Bold="True" />
                </asp:DetailsView>
                <br />
                <label>SolEventoHorario</label>
                <asp:SqlDataSource ID="sqlDSHorario" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT DISTINCT SolEventoGral.Folio, SolEventoHorario.* FROM SolEventoGral INNER JOIN SolEventoHorario ON SolEventoGral.SolicitudId = SolEventoHorario.SolicitudId WHERE (SolEventoGral.Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" Name="Value" PropertyName="Text" DefaultValue="201600463" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gvHorario" class="dataview" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSHorario">
                    <Columns>
                        <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" Visible="False" />
                        <asp:BoundField DataField="SolicitudId" HeaderText="SolicitudId" SortExpression="SolicitudId" />
                        <asp:BoundField DataField="HoraIni" HeaderText="HoraIni" SortExpression="HoraIni" />
                        <asp:BoundField DataField="HoraFin" HeaderText="HoraFin" SortExpression="HoraFin" />
                        <asp:BoundField DataField="Fecha" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Fecha" SortExpression="Fecha" />
                        <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                        <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" SortExpression="InsumoId" />
                    </Columns>
                </asp:GridView>
                <br />
                <label>SolEventoStaff</label>
                <asp:SqlDataSource ID="sqlDSEventoStaff" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT DISTINCT SolEventoGral.Folio, SolEventoStaff.* FROM SolEventoGral INNER JOIN SolEventoStaff ON SolEventoGral.SolicitudId = SolEventoStaff.SolicitudId WHERE (SolEventoGral.Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" Name="Value" PropertyName="Text" DefaultValue="201600463" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gvEventoStaff" class="dataview" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSEventoStaff">
                    <Columns>
                        <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" Visible="False" />
                        <asp:BoundField DataField="SolicitudId" HeaderText="SolicitudId" SortExpression="SolicitudId" />
                        <asp:BoundField DataField="NumEmpleado" HeaderText="NumEmpleado" SortExpression="NumEmpleado" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    
    </form>
</body>
</html>
