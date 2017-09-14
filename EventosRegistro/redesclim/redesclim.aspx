<%@ Page Language="C#" AutoEventWireup="true" CodeFile="redesclim.aspx.cs" Inherits="redesclim_redesclim" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>REDESClim 2017 - Registro</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/initialSetup.css" />
    <link rel="stylesheet" href="css/bootstrap-datepicker.css" />
    <link rel="stylesheet" href="css/timepicki.css" />
</head>
<body>
    <div class="container">
    
        <div class="row">
            <div class="col-md-12">
                <br />
                <div class="media"><%-- DIV PARA  TITULO CON IMAGEN A LA DERECHA --%>
                    <div class="media-body">
                        <h2 class="media-heading">REDESClim 2017</h2>
                        <p>Quinta Reunión Nacional</p>
                    </div>
                    <div class="media-right">
                        <img src="images/logo_redesclim.png" class="media-object" style="width:150px" />
                    </div>
                </div>
                <hr />
                <%--INICIO DEL FORMULARIO--%>
                <form class="form-horizontal form1" id="form1" name="form1" runat="server"> 
                    <div class="form-group">
                        <label for="nombre" class="col-sm-2 control-label">Nombres</label>
                        <div class="col-sm-10">
                            <%--<asp:TextBox class="form-control required" id="nombres" placeholder="Nombres" runat="server"></asp:TextBox>--%>
                            <input class="form-control" type="text" id="nombres" placeholder="Nombres" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="apellido" class="col-sm-2 control-label">Apellidos</label>
                        <div class="col-sm-10">
                            <%--<asp:TextBox class="form-control" type="text" id="apellidos" placeholder="Apellidos" runat="server"></asp:TextBox>--%>
                            <input class="form-control" type="text" id="apellidos" placeholder="Apellidos" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="correo" class="col-sm-2 control-label">Correo</label>
                        <div class="col-sm-10">
                            <%--<asp:TextBox class="form-control" type="email" id="correo" placeholder="Correo" runat="server"></asp:TextBox>--%>
                            <input class="form-control" type="text" id="correo" placeholder="Correo" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="institucion" class="col-sm-2 control-label">Instituci&oacute;n</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" id="institucion" placeholder="Institución" runat="server" />
                        </div>
                    </div>
                    <br />
                    <h4>Itinerario</h4>
                    <div class="radio">
                        <label>
                            <input type="radio" id="rbTrasladoCuenta" name="traslado" value="cuenta" runat="server" checked />
                            Me trasladaré por cuenta propia
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" id="rbTrasladoAereo" name="traslado" value="aereo" runat="server" />
                            Requiero traslado aéreo
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" id="rbTrasladoAutobus" name="traslado" value="autobus" runat="server" />
                            Me trasladaré en autobús
                        </label>
                    </div>
                    <br />
                    <div id="trasladoAereo" class="col-sm-12" hidden="hidden">
                        <h3>Viaje de ida</h3>
                        <h4>Vuelo inicial</h4>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <input class="form-control" type="text" id="salidaRuta1" placeholder="Ruta" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control" type="text" id="salidaAerolinea1" placeholder="Aerolinea" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control" type="text" id="salidaVuelo1" placeholder="No. vuelo" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control datepicker" type="text" id="salidaFecha1" placeholder="Fecha" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control timepicker" type="text" id="salidaHora1" placeholder="Salida" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control timepicker" type="text" id="salidaHoraLlegada1" placeholder="Llegada" runat="server" />
                            </div>
                        </div>
                        <h4>Vuelo escala</h4>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <input class="form-control" type="text" id="salidaRuta2" placeholder="Ruta" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control" type="text" id="salidaAerolinea2" placeholder="Aerolinea" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control" type="text" id="salidaVuelo2" placeholder="No. vuelo" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control datepicker" type="text" id="salidaFecha2" placeholder="Fecha" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control timepicker" type="text" id="salidaHora2" placeholder="Salida" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control timepicker" type="text" id="salidaHoraLlegada2" placeholder="Llegada" runat="server" />
                            </div>
                        </div>

                        <h3>Viaje de regreso</h3>
                        <h4>Vuelo inicial</h4>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <input class="form-control" type="text" id="regresoRuta1" placeholder="Ruta" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control" type="text" id="regresoAerolinea1" placeholder="Aerolinea" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control" type="text" id="regresoVuelo1" placeholder="No. vuelo" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control datepicker" type="text" id="regresoFecha1" placeholder="Fecha" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control timepicker" type="text" id="regresoHora1" placeholder="Salida" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control timepicker" type="text" id="regresoHoraLlegada1" placeholder="Llegada" runat="server" />
                            </div>
                        </div>
                        <h4>Vuelo escala</h4>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <input class="form-control" type="text" id="regresoRuta2" placeholder="Ruta" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control" type="text" id="regresoAerolinea2" placeholder="Aerolinea" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control" type="text" id="regresoVuelo2" placeholder="No. vuelo" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control datepicker" type="text" id="regresoFecha2" placeholder="Fecha" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control timepicker" type="text" id="regresoHora2" placeholder="Salida" runat="server" />
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control timepicker" type="text" id="regresoHoraLlegada2" placeholder="Llegada" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div id="trasladoAutobus" class="col-sm-12" hidden="hidden">
                        <h4>Ruta de autobús</h4>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input class="form-control" type="text" id="rutaOrigen" placeholder="Lugar de origen" runat="server" />
                            </div>
                            <div class="col-sm-6">
                                <input class="form-control timepicker" type="text" id="rutaLlegada" placeholder="Hora de llegada" runat="server" />
                            </div>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" id="chkRequiereHospedaje" name="chkRequiereHospedaje" value="SI" runat="server" />
                                Requiero hospedaje en hotel sede
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <textarea class="form-control" id="comentarios" rows="3" placeholder="Comentarios adicionales" maxlength="10000" runat="server"></textarea>
                        </div>
                    </div>
                    <div id="divError" class="alert-danger divError">
                        <ul id="ulError">
                            <%--<li>option</li>--%>
                        </ul>
                    </div>
                    <asp:Button id="btnEnviar" class="btn btn-primary btn-lg" type="submit" runat="server" Text="Enviar" OnClick="btnEnviar_Click" />
                    <button id="btnLoading" class="btn btn-lg btn-warning disabled hidden">
                        <%-- Clases que realizan la animacion: glyphicon-refresh glyphicon-refresh-animate, removidas en caso de demostración, van en el siguiente "span" --%>
                        <span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span> 
                        Enviando registro...
                        <%--Registro validado correctamente, gracias.--%>
                    </button>
                    <br /><br />
                </form>
                <footer class="modal-footer">                  

                    <p style="font-size:9px;">Centro de investigaciones Biol&oacute;gicas del Noroeste S.C.<br />
                        Instituto Polit&eacute;cnico Nacional 195, Playa Palo de Santa Rita Sur.<br />
                        La Paz, B.C.S., M&eacute;xico; C.P. 23096, Tel:(52) (612) 123-8484<br />
                        <a href="http://www.cibnor.gob.mx/component/content/article/472" target="_blank" >Pol&iacute;tica de Privacidad</a>
                    </p>                    
                    <%--<p><a href="#" target="_blank" style="color:#e8e8ec">O</a><br /></p>--%> <%--Link para consultar los registros--%>
                </footer>
                <asp:SqlDataSource ID="SqlDSregistro" runat="server" ConnectionString="<%$ ConnectionStrings:REGWEBConnectionString %>"
                    SelectCommand="" OldValuesParameterFormatString="original_{0}">
                </asp:SqlDataSource>
            </div>
        </div>

    </div>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/timepicki.js"></script>
    <script src="js/initialSetup.js"></script>

</body>
</html>
