<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConsultaIndividual.aspx.cs" Inherits="ConsultaIndividual" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Consulta individual</title>
    <style>
        label {
            width:100%; line-height:14px; background-color:#646bbe; color:white; padding:4px 6px; margin:1px;
        }
        td {
            vertical-align:top;
        }
        .dataview {
            margin:1%;
            width:98%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div hidden="hidden">
        <asp:TextBox ID="txtFolioId" runat="server" Visible="False"></asp:TextBox>
        <br />
    </div>
    <table style="width:100%; font-family:Calibri; font-size:14px;">
        <tr>
            <td style="width:100%;">
                <%--<label>DATOS DEL SOLICITANTE</label>--%>
                <asp:SqlDataSource ID="sqlDSEventoGral" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT SolicitudId, Folio, Fecha, NomSolicitante, Email, AreaId, AreaOtro, UbicacionId, Extel, Tel, Proyecto FROM SolEventoGral WHERE (Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" DefaultValue="201600463" Name="Value" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DetailsView class="dataview" style="width:98%;" ID="dvEventoGral" runat="server" AutoGenerateRows="False" DataKeyNames="SolicitudId" DataSourceID="sqlDSEventoGral" Height="50px" Width="125px" HeaderText="DATOS DEL SOLICITANTE">
                    <FieldHeaderStyle Font-Bold="True" Width="220px" HorizontalAlign="Right" />
                    <Fields>
                    <asp:BoundField DataField="SolicitudId" HeaderText="SolicitudId" InsertVisible="False" ReadOnly="True" SortExpression="SolicitudId" Visible="False" />
                    <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                    <asp:BoundField DataField="NomSolicitante" HeaderText="Solicitante" SortExpression="NomSolicitante" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Fecha" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Fecha" SortExpression="Fecha" Visible="False" />
                    <asp:BoundField DataField="AreaId" HeaderText="AreaId" SortExpression="AreaId" Visible="False" />
                    <asp:BoundField DataField="AreaOtro" HeaderText="AreaOtro" SortExpression="AreaOtro" Visible="False" />
                    <asp:BoundField DataField="UbicacionId" HeaderText="UbicacionId" SortExpression="UbicacionId" Visible="False" />
                    <asp:BoundField DataField="Extel" HeaderText="Extensión Tel." SortExpression="Extel" />
                    <asp:BoundField DataField="Tel" HeaderText="Linea directa" SortExpression="Tel" />
                    <asp:BoundField DataField="Proyecto" HeaderText="Proyecto" SortExpression="Proyecto" />
                </Fields>
                    <HeaderStyle Font-Bold="True" BorderWidth="2px" Font-Size="16px" />
                </asp:DetailsView>
                <%--<label>DATOS DEL EVENTO</label>--%>
                <asp:SqlDataSource ID="sqlDSDatos" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT SolEventoGral.Folio, SolEventoDatos.* FROM SolEventoGral INNER JOIN SolEventoDatos ON SolEventoGral.SolicitudId = SolEventoDatos.SolicitudId WHERE (SolEventoGral.Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" Name="Value" PropertyName="Text" DefaultValue="201600463" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DetailsView class="dataview" style="width:98%;" ID="dvEventoDatos" runat="server" AutoGenerateRows="False" DataKeyNames="SolicitudId" DataSourceID="sqlDSDatos" Height="50px" Width="100%" HeaderText="DATOS DEL EVENTO" HorizontalAlign="Left">
                    <FieldHeaderStyle Font-Bold="True" Width="220px" HorizontalAlign="Right" />
                    <Fields>
                        <asp:BoundField DataField="NombreTitular" HeaderText="Titular Evento" SortExpression="NombreTitular" />
                        <asp:BoundField DataField="Evento" HeaderText="Titulo Evento" SortExpression="Evento" />
                        <asp:BoundField DataField="DescripEvento" HeaderText="Descripción" SortExpression="DescripEvento" />
                        <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" />
                        <asp:BoundField DataField="FechaIni" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Fecha Inicio" SortExpression="FechaIni" />
                        <asp:BoundField DataField="FechaFin" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Al" SortExpression="FechaFin" />
                        <asp:BoundField DataField="HoraIni" HeaderText="Horario" SortExpression="HoraIni" />
                        <asp:BoundField DataField="HoraFin" HeaderText="A" SortExpression="HoraFin" />
                        <asp:BoundField DataField="NumPersonas" HeaderText="Asistentes" SortExpression="NumPersonas" />
                        <asp:BoundField DataField="TipoEvento" HeaderText="Tipo de Evento" SortExpression="TipoEvento" />
                        <asp:BoundField DataField="Director" HeaderText="Se requiere la presencia del Director" SortExpression="Director" />
                        <asp:BoundField DataField="Comentarios" HeaderText="Comentarios" SortExpression="Comentarios" />
                        <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" Visible="False" />
                        <asp:BoundField DataField="SolicitudId" HeaderText="SolicitudId" ReadOnly="True" SortExpression="SolicitudId" Visible="False" />
                        <asp:BoundField DataField="TitularId" HeaderText="TitularId" SortExpression="TitularId" Visible="False" />
                        <asp:BoundField DataField="EmailTitular" HeaderText="EmailTitular" SortExpression="EmailTitular" Visible="False" />
                        <asp:BoundField DataField="Reprogramado" HeaderText="Reprogramado" SortExpression="Reprogramado" Visible="False" />
                        <asp:BoundField DataField="FolioPrevio" HeaderText="FolioPrevio" SortExpression="FolioPrevio" Visible="False" />
                        <asp:BoundField DataField="FolioId" HeaderText="FolioId" SortExpression="FolioId" Visible="False" />
                        <asp:BoundField DataField="TipoHorario" HeaderText="TipoHorario" SortExpression="TipoHorario" Visible="False" />
                        <asp:BoundField DataField="EquipoOtro" HeaderText="EquipoOtro" SortExpression="EquipoOtro" Visible="False" />
                        <asp:BoundField DataField="Justificacion" HeaderText="Justificacion" SortExpression="Justificacion" Visible="False" />
                        <asp:BoundField DataField="Beneficiarios" HeaderText="Beneficiarios" SortExpression="Beneficiarios" Visible="False" />
                        <asp:BoundField DataField="Objetivos" HeaderText="Objetivos" SortExpression="Objetivos" Visible="False" />
                        <asp:BoundField DataField="Programas" HeaderText="Programas" SortExpression="Programas" Visible="False" />
                        <asp:BoundField DataField="OtroApoyo" HeaderText="OtroApoyo" SortExpression="OtroApoyo" Visible="False" />
                        <asp:BoundField DataField="OtroCategoria" HeaderText="OtroCategoria" SortExpression="OtroCategoria" Visible="False" />
                        <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" Visible="False" />
                        <asp:BoundField DataField="ComentariosAdmon" HeaderText="ComentariosAdmon" SortExpression="ComentariosAdmon" Visible="False" />
                        <asp:BoundField DataField="Atendida" HeaderText="Atendida" SortExpression="Atendida" Visible="False" />
                        <asp:BoundField DataField="Atendieron" HeaderText="Atendieron" SortExpression="Atendieron" Visible="False" />
                        <asp:BoundField DataField="PublicarCalendario" HeaderText="PublicarCalendario" SortExpression="PublicarCalendario" Visible="False" />
                        <asp:BoundField DataField="TipoAniversario" HeaderText="TipoAniversario" SortExpression="TipoAniversario" Visible="False" />
                    </Fields>
                    <HeaderStyle Font-Bold="True" BackColor="White" BorderWidth="2pt" Font-Size="16px" />
                </asp:DetailsView>
                <br />&nbsp;
                <%--<label>SolEventoHorario</label>--%>
                <asp:SqlDataSource ID="sqlDSHorario" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT DISTINCT SolEventoGral.Folio, SolEventoHorario.* FROM SolEventoGral INNER JOIN SolEventoHorario ON SolEventoGral.SolicitudId = SolEventoHorario.SolicitudId WHERE (SolEventoGral.Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" Name="Value" PropertyName="Text" DefaultValue="201600463" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gvHorario" class="dataview" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSHorario" ToolTip="HORARIO POR FECHA">
                    <Columns>
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" DataFormatString="{0:dd/MMM/yyyy}" />
                        <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" Visible="False" />
                        <asp:BoundField DataField="SolicitudId" HeaderText="SolicitudId" SortExpression="SolicitudId" Visible="False" />
                        <asp:BoundField DataField="HoraIni" HeaderText="Inicia (hora)" SortExpression="HoraIni" />
                        <asp:BoundField DataField="HoraFin" HeaderText="Termina (hora)" SortExpression="HoraFin" />
                        <asp:BoundField DataField="Area" HeaderText="Area o Lugar" SortExpression="Area" Visible="False" />
                        <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" SortExpression="InsumoId" Visible="False" />
                    </Columns>
                    <HeaderStyle BorderWidth="2px" Font-Bold="True" Font-Size="16px" />
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
                <%--<label>SolEventoInsumos</label>--%>
                <asp:SqlDataSource ID="sqlDSInsumos" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT DISTINCT SolEventoGral.Folio, SolEventoInsumos.* FROM SolEventoGral INNER JOIN SolEventoInsumos ON SolEventoGral.SolicitudId = SolEventoInsumos.SolicitudId WHERE (SolEventoGral.Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" Name="Value" PropertyName="Text" DefaultValue="201600463" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gvInsumos" class="dataview" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSInsumos" Visible="False">
                    <Columns>
                        <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" Visible="False" />
                        <asp:BoundField DataField="SolicitudId" HeaderText="SolicitudId" SortExpression="SolicitudId" />
                        <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" SortExpression="InsumoId" />
                        <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
                    </Columns>
                </asp:GridView>
                <%--<label>SolEventoLugares</label>--%>
                <asp:SqlDataSource ID="sqlDSLugares" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT DISTINCT SolEventoGral.Folio, SolEventoLugares.* FROM SolEventoGral INNER JOIN SolEventoLugares ON SolEventoGral.SolicitudId = SolEventoLugares.SolicitudId WHERE (SolEventoGral.Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" Name="Value" PropertyName="Text" DefaultValue="201600463" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gvLugares" class="dataview" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSLugares" Visible="False">
                    <Columns>
                        <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" Visible="False" />
                        <asp:BoundField DataField="SolicitudId" HeaderText="SolicitudId" SortExpression="SolicitudId" />
                        <asp:BoundField DataField="LugarId" HeaderText="LugarId" SortExpression="LugarId" />
                        <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
                    </Columns>
                </asp:GridView>
                <%--<label>SolEventoUrls</label>--%>
                <asp:SqlDataSource ID="sqlDSEventoUrls" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT DISTINCT SolEventoGral.Folio, SolEventoUrls.* FROM SolEventoGral INNER JOIN SolEventoUrls ON SolEventoGral.SolicitudId = SolEventoUrls.SolicitudId WHERE (SolEventoGral.Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" Name="Value" PropertyName="Text" DefaultValue="201600463" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DetailsView class="dataview" style="width:98%;" ID="dvEventoUrls" runat="server" AutoGenerateRows="False" DataKeyNames="SolicitudId" DataSourceID="sqlDSEventoUrls" Height="50px" Width="125px" Visible="False">
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
                <%--<label>SolEventoStaff</label>--%>
                <asp:SqlDataSource ID="sqlDSEventoStaff" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT DISTINCT SolEventoGral.Folio, SolEventoStaff.* FROM SolEventoGral INNER JOIN SolEventoStaff ON SolEventoGral.SolicitudId = SolEventoStaff.SolicitudId WHERE (SolEventoGral.Folio = @Value)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFolioId" Name="Value" PropertyName="Text" DefaultValue="201600463" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gvEventoStaff" class="dataview" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSEventoStaff" Visible="False">
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
