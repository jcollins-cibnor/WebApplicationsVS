<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SolicitudNva.aspx.cs" Inherits="SolicitudNva" Debug="true" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
    
    <title>CIBNOR - Solicitud a Eventos</title>
    <!--<link rel="icon" href="img/icon_eventos.ico"> -->
</head>

<body>
  <div class="main-header" id="mainHeader"
        style="width: 100%; height: 150px; overflow: hidden; display: block; position: relative; background: url('img/cib_image.png') no-repeat;
            background-size: cover; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; 
            background-position: 50% 50%;" >
            
        <div class="wrapper content_header clearfix"
            style="width: 120%; margin: 0 auto; display:block; line-height:70px; position: relative; bottom:-60px; left:-20px;
                background-color:white; opacity:0.7;" >
                
                <h1 class="encabezado"
                    style="color: #4b4848; font-family: 'Helvetica Neue', Arial, sans-serif; letter-spacing: 1px; line-height:70px; font-size: 24px; 
                        margin: 0 0 0 20px; text-align:left; text-shadow:none; opacity:1;" >
                        	SOLICITUD DE EVENTO
                </h1>
        </div>           
  </div>

  <div id="wrapper">

  <form id="form1" method="post" runat="server" action="SolicitudPost.aspx">
              
  	<section id="secErrorMsg">
      <div class="col-1" style="box-shadow:none; border:none;">
        <label id="lblErrorMsg" class="labelBlockDisplay" style="padding:10px; color:white; line-height:18px;">
            Favor de atender lo siguiente:
        </label>
      </div>
    </section>  

  	<section id="secConfirm">
      <div class="col-1 divConfirm" style="height: 30px; border-bottom:none;">
        <label class="labelBlockDisplay" style="padding-top:2px;">
            <button id="btnLabel" class="submitbtn btnConfirm" type="button"
                style="background-image:none; background-color:grey; border-bottom:none; cursor:default; color:#fff;" >
                Confirmaci&oacute;n de informaci&oacute;n. Regrese y edite si es necesario.
            </button>
        </label>
      </div>
      <div class="col-2 divConfirm">
        <label class="labelBlockDisplay labelConfirm">
        <button id="btnRegresar" class="submitbtn btnConfirm" type="button">Regresar y modificar</button>
        </label>
      </div>
      <div class="col-2 divConfirm">
        <label class="labelBlockDisplay labelConfirm">
        <button id="btnEnviar" class="submitbtn btnConfirm" runat="server">Enviar solicitud</button>
        </label>
      </div>   
    </section>       
  	
    <section id="secSending" style="padding-left:50%;">
        <div id='cl_rect' class="col-4" style="box-shadow:none; padding-top:30px; margin-left:-120px; width:auto;">   	        	
        </div>
    </section> 

    <div class="col-header">
        <label class="encabezado">datos generales del solicitante
        </label>
    </div>
    
	<input type="hidden" value="1 TITULAR, PROYECTO">
    <div class="col-2">
        <asp:SqlDataSource ID="sqlDSTitular" runat="server" ConnectionString="<%$ ConnectionStrings:RemoteConnectionStringCat_empl %>" 
            SelectCommand="SELECT Num_emplea AS NumEmplea, ISNULL(RTRIM(Ap_paterno) + ' ' + RTRIM(Ap_materno) + ' ' + RTRIM(Nom_emplea), '') AS Nombre, Email FROM Empleados WHERE (Fecha_baja = '1900-01-01') ORDER BY Ap_paterno, Ap_materno">
        </asp:SqlDataSource>
        <label class="labelBlockDisplay">Titular del evento
            <asp:DropDownList class="DropDownList" ID="ddlTitular" runat="server" tabindex="10" 
                DataSourceID="sqlDSTitular" DataTextField="Nombre" DataValueField="NumEmplea" AppendDataBoundItems="True">
                <Items>
                    <asp:ListItem Text="Seleccionar..." Value="..." />
                </Items>
            </asp:DropDownList>
        </label>
    </div>
    <div class="col-2">
        <asp:SqlDataSource ID="sqlDSProyecto" runat="server" ConnectionString="<%$ ConnectionStrings:RemoteConnectionStringCat_empl %>" 
            SelectCommand="SELECT Cve_proyec, Des_proyec, (Cve_proyec +' - '+ Des_proyec) as combinedFields FROM Cat_proy16 ORDER BY Cve_proyec">
        </asp:SqlDataSource>
        <label class="labelBlockDisplay">Proyecto
            <asp:DropDownList class="DropDownList" ID="ddlProyecto" runat="server" tabindex="20" 
                DataSourceID="sqlDSProyecto" DataTextField="combinedFields" DataValueField="Cve_proyec" AppendDataBoundItems="True">
                <Items>
                    <asp:ListItem Text="Seleccionar..." Value="..." />
                </Items>
            </asp:DropDownList>
        </label>
    </div>

    <input type="hidden" value="2 EL TITULAR ES QUIEN LLENA? Si si, el correo lo toma del query del titular, y deshabilita los campos del solicitante">
    <div class="col-1">
        <label class="labelBlockDisplay control-label" for="chkTitular" tabindex="30">&iquest;El titular es quien llena esta solicitud?&nbsp;&nbsp;
            <input id="chkTitular" name="chkTitular" type="checkbox" value="1" class="js-switch" >
            <br />
            <label class="labelLeyenda">
                Si la respuesta es positiva, el mensaje de confirmaci&oacute;n sera enviado a su buz&oacute;n.
            </label>
        </label>
    </div>    
	<input type="hidden" value="4 CONTROLES PARA EL SOLICITANTE">
	<section id="secSolicitante">
      <div class="col-3">
        <label>
          Nombre y apellido
          <input id="txtSolicitanteNombre" placeholder="de quien llena este formulario..." name="txtSolicitanteNombre" tabindex="40">
        </label>
      </div>
      <div class="col-3">
        <label>
          Correo
          <input type="email" id="txtSolicitanteCorreo" placeholder="correo electronico de contacto..." name="txtSolicitanteCorreo" tabindex="42">
        </label>
      </div>
      <div class="col-3">
        <label>
          Telefono
          <input id="txtSolicitanteTelefono" placeholder="l&iacute;nea directa o celular..." name="txtSolicitanteTelefono" tabindex="44">
        </label>
      </div>    
    </section>

    <hr>
    
    <div class="col-header">
        <label class="encabezado">datos del evento</label>
    </div>

	<input type="hidden" value="5 TITULO, No. PARTICIPANTES, 6 DESCRIPCION">        
    <div class="col-2 col-2b">
        <label class="labelBlockDisplay">
            Titulo del evento a realizarse
            <input placeholder="..." id="txtTituloEvento" name="txtTituloEvento" tabindex="50">
        </label>
    </div>  
    <div class="col-4">
        <label>
            Numero de asistentes
            <input type="number" placeholder="Total de participantes..." id="txtNumeroAsistentes" name="txtNumeroAsistentes" tabindex="52">
        </label>
    </div>  
    <div class="col-1">
        <label class="labelBlockDisplay">
            Descripci&oacute;n del evento
            <br>&nbsp;<br>
            <textarea id="txtDescripcionEvento" name="txtDescripcionEvento" placeholder="Informaci&oacute;n general que se mostrara en el calendario..." 
            	rows="2" style="height:54px;" tabindex="60"></textarea>
        </label>
    </div>
    
	<input type="hidden" value="7 CATEGORIA, EVENTO DISPONIBLE PARA, REQUIERE PRESENCIA DEL DG">
    <div class="col-4">
        <asp:SqlDataSource ID="sqlDSCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" 
            SelectCommand="SELECT * FROM [CatCategorias] ORDER BY [Descripcion]">
        </asp:SqlDataSource>
        <label>Categoria del evento
            <asp:DropDownList class="DropDownList" ID="ddlCategoria" runat="server" tabindex="70" 
                DataSourceID="sqlDSCategoria" DataTextField="Descripcion" DataValueField="CategoriaId" AppendDataBoundItems="true">
                <Items>
                    <asp:ListItem Text="Seleccionar..." Value="..." />
                </Items>
            </asp:DropDownList>
        </label>
    </div>
    <div class="col-4">
        <label>
            Evento disponible para
            <select id="ddlDisponiblePara" class="DropDownList" runat="server" tabindex="72">
                <option value="PR">Privado</option>
                <option value="CC">Comunidad CIBNOR</option>
                <option value="PG">Publico en general</option>
                <option value="NP">No publicar</option>
            </select>
        </label>
    </div>
    <div class="col-2" style="padding-top:0px;">
       	<label>
            &iquest;Requiere la presencia del Director General?&nbsp;&nbsp;
            <select id="ddlDirector" name="ddlDirector" class="DropDownList" runat="server" tabindex="74">
                <option value="NO">NO</option>
                <option value="SI">SI</option>
            </select>
        </label>
    </div>
            
    <hr>
    
    <input type="hidden" value="EL SIGUIENTE DIV CONTIENE LEYENDAS INFORMATIVAS CON LINKS">
	<div class="col-1">
        <label class="labelLeyenda">
            Le reiteramos que debe:<br>
			&nbsp;&nbsp;- Tomar en cuenta en el <strong>horario</strong> el tiempo <strong>necesario para pruebas y ensayos</strong>.<br>
			&nbsp;&nbsp;- Considerar que su sala estar&aacute; lista y se abrir&aacute; <strong>10 minutos antes</strong> del horario indicado.<br>
            &nbsp;&nbsp;
            <br>
            <br>
            Definiciones:
			- <a onClick="linkExterno('horario')">Disponibilidad de horario</a> - |
			- <a onClick="linkExterno('horarioRe')">Horario regular</a> - |
            - <a onClick="linkExterno('horarioIr')">Horario irregular</a> -
        </label>
    </div>
        
    <input type="hidden" value="SECCION DE INGRESAR FECHAS, PERSISTE EL DETALLE DE COMO SE MUESTRAN LOS BOTONES al REDIMENCIONAR LA VENTANA">
    <input type="hidden" value="EL PADDING DEL DIV Y EL DEL LABEL SIGUIENTES FUERON NECESARIOS PARA IGUALAR LO ALTO DEL RENGLON A LOS DEMAS">
    <div class="col-4" style="padding:29px 0px 17px 0px;">
       	<label style="padding:0px 0px 0px 20px; width:230px;" tabindex="90">
        	&iquest;Varias fechas?&nbsp;&nbsp;
			<input type="checkbox" value="1" class="js-switch" id="chkMultiplesFechas" name="chkMultiplesFechas" style="margin:0px; padding:0px;" >
        </label>
    </div>
	<div id="divMultiplesFechasI" class="col-2b" style="padding-bottom:0px;">
        <label style="cursor:default;">
            <input type="button" class="btnMultiplesFechas" value="+ AGREGAR FECHA" onClick="addNewRow(event)" tabindex="92" >
        </label>
    </div>
  
    <hr>
	
    <input type="hidden" value="10 SECCION Y 11 TABLA DONDE SE AGREGAN O ELIMINAN RENGLONES">
    <section id="secFechasEvento" style="border:1px solid #005680;">    
    <table border="0" id="tabla" style="width:100%;">
    <tr id="celda" class="celda">
        <td>
        <div class="col-3">
            <label>
                Fecha:
                <input placeholder="Fecha del evento..." id="txtFecha" name="txtFecha" class="inputFechas" tabindex="100" >
            </label>
    	</div>
        <div class="col-3">
            <label>
                De:
                <input placeholder="Hora de inicio..." id="txtHoraI" name="txtHoraI" class="inputHorasI" tabindex="102" >
            </label>
    	</div>
        <div class="col-3">
            <label>
                a las:
                <input placeholder="Hora de terminaci&oacute;n..." id="txtHoraT" name="txtHoraT" class="inputHorasT" tabindex="104" >
            </label>
    	</div>
        </td>
    </tr>
    </table>
    </section>

    <hr>
    
    <input type="hidden" value="12 EL EVENTO ES INTERNO O EXTERNO?">
    <div class="col-1" style="height:80px;">
        <label style="margin-top:20px; padding-bottom:0px; padding-top:0px; width:100%; cursor:default;">
	        Tipo de evento:
        </label>
        <fieldset id="fstTipoEvento" class="optionList" runat="server" style="width:90%; margin:0px 5%; text-align:center;" data-role="controlgroup" data-type="horizontal">
			<input type="radio" name="rdoTipoEvento" id="rdbTipoInterno" value="1" tabindex="120" >
            <a onClick="linkExterno('eventoInterno')"> Interno</a>
            <input type="radio" name="rdoTipoEvento" id="rdbTipoExterno" style="margin-left:5%;" value="2" tabindex="122" >
            <a onClick="linkExterno('eventoExterno')"> Externo</a>
        </fieldset>
    </div>
    <input id="inputLugares" name="inputLugares" hidden="hidden" >
    <input type="hidden" value="13 ES INTERNO...">
    <div class="col-1" id="divEventoInterno">
        <label style="margin-top:20px; padding-bottom:0px; padding-top:0px; width:100%; cursor:default;">
            <asp:SqlDataSource ID="sqlDSTipoInterno" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatLugarIntExt] WHERE (([Tipo] = @Tipo) AND ([Activo] = @Activo))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="INTERNO" Name="Tipo" Type="String" />
                    <asp:Parameter DefaultValue="SI" Name="Activo" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gvTipoInterno" runat="server" AutoGenerateColumns="False" DataKeyNames="LugarId" DataSourceID="sqlDSTipoInterno" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="LugarId" HeaderText="LugarId" InsertVisible="False" ReadOnly="True" SortExpression="LugarId" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="MsgId" HeaderText="MsgId" SortExpression="MsgId" NullDisplayText="_" />
                    <asp:BoundField DataField="Url" HeaderText="Url" SortExpression="Url" />
                    <asp:BoundField DataField="LineaMsg" HeaderText="LineaMsg" SortExpression="LineaMsg" />
                    <asp:BoundField DataField="MsgIdLineaMsg" HeaderText="MsgIdLineaMsg" SortExpression="MsgIdLineaMsg" NullDisplayText="_" />
                    <asp:BoundField DataField="UrlLineaMsg" HeaderText="UrlLineaMsg" SortExpression="UrlLineaMsg" />
                    <asp:BoundField DataField="TieneDato" HeaderText="TieneDato" SortExpression="TieneDato" />
                    <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                </Columns>
            </asp:GridView>
        	Seleccione una opci&oacute;n
        </label>
        <asp:CheckBoxList ID="chkTipoInterno" class="optionList" runat="server" tabindex="130" 
            DataSourceID="sqlDSTipoInterno" DataTextField="Nombre" DataValueField="LugarId"></asp:CheckBoxList>
        <label>&nbsp;</label>
    </div>
    <input type="hidden" value="13 ES EXTERNO...">
    <div class="col-1" id="divEventoExterno">
        <label style="margin-top:20px; padding-bottom:0px; padding-top:0px; width:100%; cursor:default;">
            <asp:SqlDataSource ID="sqlDSTipoExterno" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatLugarIntExt] WHERE (([Tipo] = @Tipo) AND ([Activo] = @Activo))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="EXTERNO" Name="Tipo" Type="String" />
                    <asp:Parameter DefaultValue="SI" Name="Activo" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gvTipoExterno" runat="server" AutoGenerateColumns="False" DataKeyNames="LugarId" DataSourceID="sqlDSTipoExterno" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="LugarId" HeaderText="LugarId" InsertVisible="False" ReadOnly="True" SortExpression="LugarId" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="MsgId" HeaderText="MsgId" SortExpression="MsgId" NullDisplayText="_" />
                    <asp:BoundField DataField="Url" HeaderText="Url" SortExpression="Url" />
                    <asp:BoundField DataField="LineaMsg" HeaderText="LineaMsg" SortExpression="LineaMsg" />
                    <asp:BoundField DataField="MsgIdLineaMsg" HeaderText="MsgIdLineaMsg" SortExpression="MsgIdLineaMsg" NullDisplayText="_" />
                    <asp:BoundField DataField="UrlLineaMsg" HeaderText="UrlLineaMsg" SortExpression="UrlLineaMsg" />
                    <asp:BoundField DataField="TieneDato" HeaderText="TieneDato" SortExpression="TieneDato" />
                    <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                </Columns>
            </asp:GridView>
        	Indique una ubicaci&oacute;ns:
        </label>
            <asp:CheckBoxList ID="chkTipoExterno" class="optionList" runat="server" tabindex="132" 
                DataSourceID="sqlDSTipoExterno" DataTextField="Nombre" DataValueField="LugarId" style="width:100%;"></asp:CheckBoxList>
        <label>&nbsp;</label>
    </div>

    <div style="cursor:default;" class="col-header">
        <label class="encabezado">montaje, mobiliario y equipo</label>
    </div>
    <input id="inputInsumos" name="inputInsumos" hidden="hidden" >
    
	<input type="hidden" value="14 MONTAJE Y MOBILIARIO">
    <div class="col-2">
        <label>
            <asp:SqlDataSource ID="sqlDSMontaje" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatInsumos] WHERE (([TipoInsumo] = @TipoInsumo) AND ([Activo] = @Activo) AND ([MuestraUsuario] = @MuestraUsuario))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="MONTAJE" Name="TipoInsumo" Type="String" />
                    <asp:Parameter DefaultValue="S" Name="Activo" Type="String" />
                    <asp:Parameter DefaultValue="SI" Name="MuestraUsuario" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>            
            <asp:GridView ID="gvMontaje" runat="server" AutoGenerateColumns="False" DataKeyNames="InsumoId" DataSourceID="sqlDSMontaje" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" InsertVisible="False" ReadOnly="True" SortExpression="InsumoId" />
                    <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" NullDisplayText="_" SortExpression="Precio" />
                    <asp:BoundField DataField="Url" HeaderText="Url" NullDisplayText="_" SortExpression="Url" />
                    <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                    <asp:BoundField DataField="OtroTxt" HeaderText="OtroTxt" NullDisplayText="_" SortExpression="OtroTxt" />
                    <asp:BoundField DataField="OtroTipo" HeaderText="OtroTipo" NullDisplayText="_" SortExpression="OtroTipo" />
                    <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
                    <asp:BoundField DataField="MuestraUsuario" HeaderText="MuestraUsuario" SortExpression="MuestraUsuario" />
                    <asp:BoundField DataField="MuestraUsuarioOtroTxt" HeaderText="MuestraUsuarioOtroTxt" SortExpression="MuestraUsuarioOtroTxt" />
                </Columns>
        </asp:GridView>           
        Tipo de montaje (<a onClick="linkExterno('montajes')">ver tipos</a>)
        </label>
        <asp:CheckBoxList ID="chkMontaje" class="optionList" runat="server" tabindex="140" 
            DataSourceID="sqlDSMontaje" DataTextField="Nombre" DataValueField="InsumoId"></asp:CheckBoxList>
	</div>
    <div class="col-2" style="box-shadow:none;">
    	<input type="hidden" value="Al segundo elemento de un col-2 se le pone ese estilo y se agrega un <hr> despues del div">
        <label>
            <asp:SqlDataSource ID="sqlDSMobiliario" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatInsumos] WHERE (([TipoInsumo] = @TipoInsumo) AND ([Activo] = @Activo) AND ([MuestraUsuario] = @MuestraUsuario))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="MOBILIARIO" Name="TipoInsumo" Type="String" />
                    <asp:Parameter DefaultValue="S" Name="Activo" Type="String" />
                    <asp:Parameter DefaultValue="SI" Name="MuestraUsuario" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>            
            <asp:GridView ID="gvMobiliario" runat="server" AutoGenerateColumns="False" DataKeyNames="InsumoId" DataSourceID="sqlDSMobiliario" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" InsertVisible="False" ReadOnly="True" SortExpression="InsumoId" />
                    <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" NullDisplayText="_" SortExpression="Precio" />
                    <asp:BoundField DataField="Url" HeaderText="Url" NullDisplayText="_" SortExpression="Url" />
                    <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                    <asp:BoundField DataField="OtroTxt" HeaderText="OtroTxt" NullDisplayText="_" SortExpression="OtroTxt" />
                    <asp:BoundField DataField="OtroTipo" HeaderText="OtroTipo" NullDisplayText="_" SortExpression="OtroTipo" />
                    <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
                    <asp:BoundField DataField="MuestraUsuario" HeaderText="MuestraUsuario" SortExpression="MuestraUsuario" />
                    <asp:BoundField DataField="MuestraUsuarioOtroTxt" HeaderText="MuestraUsuarioOtroTxt" SortExpression="MuestraUsuarioOtroTxt" />
                </Columns>
        </asp:GridView>           
        Mobiliario
        </label>
        <asp:CheckBoxList ID="chkMobiliario" class="optionList" runat="server" tabindex="142"  
            DataSourceID="sqlDSMobiliario" DataTextField="Nombre" DataValueField="InsumoId"></asp:CheckBoxList>
	</div>
    <hr />
	<input type="hidden" value="15 AUDIOVISUAL Y COMPUTO, 16 OTRO EQUIPO">
    <div class="col-2">
        <label>
            <asp:SqlDataSource ID="sqlDSAudiovisual" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatInsumos] WHERE (([TipoInsumo] = @TipoInsumo) AND ([Activo] = @Activo) AND ([MuestraUsuario] = @MuestraUsuario))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="AUDIOVISUAL" Name="TipoInsumo" Type="String" />
                    <asp:Parameter DefaultValue="S" Name="Activo" Type="String" />
                    <asp:Parameter DefaultValue="SI" Name="MuestraUsuario" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>            
            <asp:GridView ID="gvAudiovisual" runat="server" AutoGenerateColumns="False" DataKeyNames="InsumoId" DataSourceID="sqlDSAudiovisual" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" InsertVisible="False" ReadOnly="True" SortExpression="InsumoId" />
                    <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" NullDisplayText="_" SortExpression="Precio" />
                    <asp:BoundField DataField="Url" HeaderText="Url" NullDisplayText="_" SortExpression="Url" />
                    <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                    <asp:BoundField DataField="OtroTxt" HeaderText="OtroTxt" NullDisplayText="_" SortExpression="OtroTxt" />
                    <asp:BoundField DataField="OtroTipo" HeaderText="OtroTipo" NullDisplayText="_" SortExpression="OtroTipo" />
                    <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
                    <asp:BoundField DataField="MuestraUsuario" HeaderText="MuestraUsuario" SortExpression="MuestraUsuario" />
                    <asp:BoundField DataField="MuestraUsuarioOtroTxt" HeaderText="MuestraUsuarioOtroTxt" SortExpression="MuestraUsuarioOtroTxt" />
                </Columns>
        </asp:GridView>           
        Equipo audiovisual
        </label>
        <asp:CheckBoxList ID="chkAudiovisual" class="optionList" runat="server" tabindex="150" 
            DataSourceID="sqlDSAudiovisual" DataTextField="Nombre" DataValueField="InsumoId"></asp:CheckBoxList>
	</div>
    <div class="col-2" style="box-shadow:none;">
        <label>
            <asp:SqlDataSource ID="sqlDSComputo" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatInsumos] WHERE (([TipoInsumo] = @TipoInsumo) AND ([Activo] = @Activo) AND ([MuestraUsuario] = @MuestraUsuario))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="COMPUTO" Name="TipoInsumo" Type="String" />
                    <asp:Parameter DefaultValue="S" Name="Activo" Type="String" />
                    <asp:Parameter DefaultValue="SI" Name="MuestraUsuario" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>            
            <asp:GridView ID="gvComputo" runat="server" AutoGenerateColumns="False" DataKeyNames="InsumoId" DataSourceID="sqlDSComputo" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" InsertVisible="False" ReadOnly="True" SortExpression="InsumoId" />
                    <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" NullDisplayText="_" SortExpression="Precio" />
                    <asp:BoundField DataField="Url" HeaderText="Url" NullDisplayText="_" SortExpression="Url" />
                    <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                    <asp:BoundField DataField="OtroTxt" HeaderText="OtroTxt" NullDisplayText="_" SortExpression="OtroTxt" />
                    <asp:BoundField DataField="OtroTipo" HeaderText="OtroTipo" NullDisplayText="_" SortExpression="OtroTipo" />
                    <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
                    <asp:BoundField DataField="MuestraUsuario" HeaderText="MuestraUsuario" SortExpression="MuestraUsuario" />
                    <asp:BoundField DataField="MuestraUsuarioOtroTxt" HeaderText="MuestraUsuarioOtroTxt" SortExpression="MuestraUsuarioOtroTxt" />
                </Columns>
        </asp:GridView>           
        Equipo de c&oacute;mputo
        </label>
        <asp:CheckBoxList ID="chkComputo" class="optionList" runat="server" tabindex="152" 
            DataSourceID="sqlDSComputo" DataTextField="Nombre" DataValueField="InsumoId"></asp:CheckBoxList>
	</div>
    <hr />
    <div class="col-1">
        <label class="labelBlockDisplay">
            Otro equipo:
            <input placeholder="Especifique..." id="txtOtroEquipoEspecifique" name="txtOtroEquipoEspecifique" tabindex="160" > 
        </label>
    </div>
    
    <div class="col-header">
        <label class="encabezado">servicios y apoyo</label>
    </div>

    <div class="col-1">
        <label class="labelLeyenda">
            Favor de leer las <a onClick="linkExterno('alimentos')">Aclaraciones Importantes</a> 
            sobre la responsabilidad del DEPARTAMENTO DE EVENTOS referente a <strong>Alimentos y Bebidas.</strong>
        </label>
    </div>

	<input type="hidden" value="17 ALIMENTOS Y PROVEEDOR EXTERNO, 18 JUSTIFICACION">
    <div class="col-1">
        <asp:SqlDataSource ID="sqlDSAlimentos" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatInsumos] WHERE (([TipoInsumo] = @TipoInsumo) AND ([Activo] = @Activo) AND ([MuestraUsuario] = @MuestraUsuario))">
            <SelectParameters>
                <asp:Parameter DefaultValue="ALIMENTOS" Name="TipoInsumo" Type="String" />
                <asp:Parameter DefaultValue="S" Name="Activo" Type="String" />
                <asp:Parameter DefaultValue="SI" Name="MuestraUsuario" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gvAlimentos" runat="server" AutoGenerateColumns="False" DataKeyNames="InsumoId" DataSourceID="sqlDSAlimentos" ShowHeader="False">
            <Columns>
                <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" InsertVisible="False" ReadOnly="True" SortExpression="InsumoId" />
                <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" NullDisplayText="_" SortExpression="Precio" />
                <asp:BoundField DataField="Url" HeaderText="Url" NullDisplayText="_" SortExpression="Url" />
                <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                <asp:BoundField DataField="OtroTxt" HeaderText="OtroTxt" NullDisplayText="_" SortExpression="OtroTxt" />
                <asp:BoundField DataField="OtroTipo" HeaderText="OtroTipo" NullDisplayText="_" SortExpression="OtroTipo" />
                <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
                <asp:BoundField DataField="MuestraUsuario" HeaderText="MuestraUsuario" SortExpression="MuestraUsuario" />
                <asp:BoundField DataField="MuestraUsuarioOtroTxt" HeaderText="MuestraUsuarioOtroTxt" SortExpression="MuestraUsuarioOtroTxt" />
            </Columns>
        </asp:GridView>
        <div id="divAlimentosCostos" style="width:100%; color:#000; text-align:center; margin:0px auto;">
            
            <table id="tblPreciosAlimentos" class="tabla" style="width:100%;">
                <tr>
                    <td>
                        <asp:CheckBoxList ID="chkAlimentos" class="optionList" runat="server" tabindex="170" 
                            DataSourceID="sqlDSAlimentos" DataTextField="Nombre" DataValueField="InsumoId"></asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        </div>

        <hr />
        <label style="width:100%;">
            De proveedor externo (<a onClick="linkExterno('http://eventos.cibnor.mx/Solicitudes/Mensajes?fl=18')">Cotizaci&oacute;n</a>)
        </label> 
        <asp:SqlDataSource ID="sqlDSProveedor" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatInsumos] WHERE (([TipoInsumo] = @TipoInsumo) AND ([Activo] = @Activo) AND ([MuestraUsuario] = @MuestraUsuario))">
            <SelectParameters>
                <asp:Parameter DefaultValue="PROVEEDOR" Name="TipoInsumo" Type="String" />
                <asp:Parameter DefaultValue="S" Name="Activo" Type="String" />
                <asp:Parameter DefaultValue="SI" Name="MuestraUsuario" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gvProveedor" runat="server" AutoGenerateColumns="False" DataKeyNames="InsumoId" DataSourceID="sqlDSProveedor" ShowHeader="False">
            <Columns>
                <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" InsertVisible="False" ReadOnly="True" SortExpression="InsumoId" />
                <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" NullDisplayText="_" SortExpression="Precio" />
                <asp:BoundField DataField="Url" HeaderText="Url" NullDisplayText="_" SortExpression="Url" />
                <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                <asp:BoundField DataField="OtroTxt" HeaderText="OtroTxt" NullDisplayText="_" SortExpression="OtroTxt" />
                <asp:BoundField DataField="OtroTipo" HeaderText="OtroTipo" NullDisplayText="_" SortExpression="OtroTipo" />
                <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
                <asp:BoundField DataField="MuestraUsuario" HeaderText="MuestraUsuario" SortExpression="MuestraUsuario" />
                <asp:BoundField DataField="MuestraUsuarioOtroTxt" HeaderText="MuestraUsuarioOtroTxt" SortExpression="MuestraUsuarioOtroTxt" />
            </Columns>
        </asp:GridView>
        <div style="width:100%; color:#000; text-align:center; margin:0px auto;">
            <table id="tblProveedorExterno" class="tabla" style="width:100%;">
                <tr>
                    <td>
                        <asp:CheckBoxList ID="chkProveedor" class="optionList" runat="server" tabindex="172" 
                            DataSourceID="sqlDSProveedor" DataTextField="Nombre" DataValueField="InsumoId"></asp:CheckBoxList>
                    </td>
                </tr>
            </table>                
        </div>
    </div>  
    <div class="col-1">
        <label class="labelLeyenda">
            En caso de requerir alimentación y/o bebidas para eventos Internos y Externos, favor de contestar lo siguiente: 
            <a onClick="linkExterno('alimentos')">(Aclaración Importante)</a>
            <textarea id="txtJustificacion" name="txtJustificacion" placeholder="Justificación de Gastos: (Motivos que originan la organización del evento)" rows="1" tabindex="180"></textarea>
            <textarea id="txtBeneficiarios" name="txtBeneficiarios" placeholder="Beneficiarios: (Número y nombre de beneficiarios y áreas a la que se encuentran adscritos)" rows="1" tabindex="182"></textarea>
            <textarea id="txtObjetivos" name="txtObjetivos" placeholder="Objetivos a los que se dará cumplimiento:" rows="1" tabindex="184"></textarea>
            <textarea id="txtProgramas" name="txtProgramas" placeholder="Programas a los que se dará cumplimiento:" rows="1" tabindex="186"></textarea>
        </label>
    </div>

	<input type="hidden" value="19 VEHICULOS Y OTROS SERVICIOS">
    <div class="col-2" style="height:180px;">
        <label>
            <asp:SqlDataSource ID="sqlDSVehiculos" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatInsumos] WHERE (([TipoInsumo] = @TipoInsumo) AND ([Activo] = @Activo) AND ([MuestraUsuario] = @MuestraUsuario))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="VEHICULOS" Name="TipoInsumo" Type="String" />
                    <asp:Parameter DefaultValue="S" Name="Activo" Type="String" />
                    <asp:Parameter DefaultValue="SI" Name="MuestraUsuario" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>            
            <asp:GridView ID="gvVehiculos" runat="server" AutoGenerateColumns="False" DataKeyNames="InsumoId" DataSourceID="sqlDSVehiculos" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" InsertVisible="False" ReadOnly="True" SortExpression="InsumoId" />
                    <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" NullDisplayText="_" SortExpression="Precio" />
                    <asp:BoundField DataField="Url" HeaderText="Url" NullDisplayText="_" SortExpression="Url" />
                    <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                    <asp:BoundField DataField="OtroTxt" HeaderText="OtroTxt" NullDisplayText="_" SortExpression="OtroTxt" />
                    <asp:BoundField DataField="OtroTipo" HeaderText="OtroTipo" NullDisplayText="_" SortExpression="OtroTipo" />
                    <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
                    <asp:BoundField DataField="MuestraUsuario" HeaderText="MuestraUsuario" SortExpression="MuestraUsuario" />
                    <asp:BoundField DataField="MuestraUsuarioOtroTxt" HeaderText="MuestraUsuarioOtroTxt" SortExpression="MuestraUsuarioOtroTxt" />
                </Columns>
        </asp:GridView>           
        Veh&iacute;culos
        </label>
        <asp:CheckBoxList ID="chkVehiculos" class="optionList" runat="server" tabindex="190" 
            DataSourceID="sqlDSVehiculos" DataTextField="Nombre" DataValueField="InsumoId"></asp:CheckBoxList>
	</div>
    <div class="col-2" style="box-shadow:none;">
        <label>
            <asp:SqlDataSource ID="sqlDSServicios" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatInsumos] WHERE (([TipoInsumo] = @TipoInsumo) AND ([Activo] = @Activo) AND ([MuestraUsuario] = @MuestraUsuario))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="SERVICIOS" Name="TipoInsumo" Type="String" />
                    <asp:Parameter DefaultValue="S" Name="Activo" Type="String" />
                    <asp:Parameter DefaultValue="SI" Name="MuestraUsuario" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>            
            <asp:GridView ID="gvServicios" runat="server" AutoGenerateColumns="False" DataKeyNames="InsumoId" DataSourceID="sqlDSServicios" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" InsertVisible="False" ReadOnly="True" SortExpression="InsumoId" />
                    <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" NullDisplayText="_" SortExpression="Precio" />
                    <asp:BoundField DataField="Url" HeaderText="Url" NullDisplayText="_" SortExpression="Url" />
                    <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                    <asp:BoundField DataField="OtroTxt" HeaderText="OtroTxt" NullDisplayText="_" SortExpression="OtroTxt" />
                    <asp:BoundField DataField="OtroTipo" HeaderText="OtroTipo" NullDisplayText="_" SortExpression="OtroTipo" />
                    <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
                    <asp:BoundField DataField="MuestraUsuario" HeaderText="MuestraUsuario" SortExpression="MuestraUsuario" />
                    <asp:BoundField DataField="MuestraUsuarioOtroTxt" HeaderText="MuestraUsuarioOtroTxt" SortExpression="MuestraUsuarioOtroTxt" />
                </Columns>
        </asp:GridView>           
        Otros servicios
        </label>
        <asp:CheckBoxList ID="chkServicios" class="optionList" runat="server" tabindex="192" 
            DataSourceID="sqlDSServicios" DataTextField="Nombre" DataValueField="InsumoId"></asp:CheckBoxList>
	</div>
    <hr />

	<input type="hidden" value="20 APOYOS Y ACTIVIDADES CULTURALES">
    <div class="col-2">
        <label>
            <asp:SqlDataSource ID="sqlDSApoyo" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatInsumos] WHERE (([TipoInsumo] = @TipoInsumo) AND ([Activo] = @Activo) AND ([MuestraUsuario] = @MuestraUsuario)) ORDER BY Orden">
                <SelectParameters>
                    <asp:Parameter DefaultValue="APOYO" Name="TipoInsumo" Type="String" />
                    <asp:Parameter DefaultValue="S" Name="Activo" Type="String" />
                    <asp:Parameter DefaultValue="SI" Name="MuestraUsuario" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>            
            <asp:GridView ID="gvApoyo" runat="server" AutoGenerateColumns="False" DataKeyNames="InsumoId" DataSourceID="sqlDSApoyo" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" InsertVisible="False" ReadOnly="True" SortExpression="InsumoId" />
                    <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" NullDisplayText="_" SortExpression="Precio" />
                    <asp:BoundField DataField="Url" HeaderText="Url" NullDisplayText="_" SortExpression="Url" />
                    <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                    <asp:BoundField DataField="OtroTxt" HeaderText="OtroTxt" NullDisplayText="_" SortExpression="OtroTxt" />
                    <asp:BoundField DataField="OtroTipo" HeaderText="OtroTipo" NullDisplayText="_" SortExpression="OtroTipo" />
                    <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
                    <asp:BoundField DataField="MuestraUsuario" HeaderText="MuestraUsuario" SortExpression="MuestraUsuario" />
                    <asp:BoundField DataField="MuestraUsuarioOtroTxt" HeaderText="MuestraUsuarioOtroTxt" SortExpression="MuestraUsuarioOtroTxt" />
                </Columns>
        </asp:GridView>           
        Apoyos (<a onClick="linkExterno('http://eventos.cibnor.mx/Solicitudes/Mensajes?fl=6')">Aclaraci&oacute;n importante</a>)
        </label>
        <asp:CheckBoxList ID="chkApoyo" class="optionList" runat="server" tabindex="200" 
            DataSourceID="sqlDSApoyo" DataTextField="Nombre" DataValueField="InsumoId"></asp:CheckBoxList>
	</div>
    <div class="col-2" style="box-shadow:none;">
        <label>
            <asp:SqlDataSource ID="sqlDSCultural" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatInsumos] WHERE (([TipoInsumo] = @TipoInsumo) AND ([Activo] = @Activo) AND ([MuestraUsuario] = @MuestraUsuario)) ORDER BY Orden">
                <SelectParameters>
                    <asp:Parameter DefaultValue="CULTURAL" Name="TipoInsumo" Type="String" />
                    <asp:Parameter DefaultValue="S" Name="Activo" Type="String" />
                    <asp:Parameter DefaultValue="SI" Name="MuestraUsuario" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>            
            <asp:GridView ID="gvCultural" runat="server" AutoGenerateColumns="False" DataKeyNames="InsumoId" DataSourceID="sqlDSCultural" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" InsertVisible="False" ReadOnly="True" SortExpression="InsumoId" />
                    <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" NullDisplayText="_" SortExpression="Precio" />
                    <asp:BoundField DataField="Url" HeaderText="Url" NullDisplayText="_" SortExpression="Url" />
                    <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                    <asp:BoundField DataField="OtroTxt" HeaderText="OtroTxt" NullDisplayText="_" SortExpression="OtroTxt" />
                    <asp:BoundField DataField="OtroTipo" HeaderText="OtroTipo" NullDisplayText="_" SortExpression="OtroTipo" />
                    <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
                    <asp:BoundField DataField="MuestraUsuario" HeaderText="MuestraUsuario" SortExpression="MuestraUsuario" />
                    <asp:BoundField DataField="MuestraUsuarioOtroTxt" HeaderText="MuestraUsuarioOtroTxt" SortExpression="MuestraUsuarioOtroTxt" />
                </Columns>
        </asp:GridView>           
        Actividades culturales
        </label>
        <asp:CheckBoxList ID="chkCultural" class="optionList" runat="server" tabindex="202" 
            DataSourceID="sqlDSCultural" DataTextField="Nombre" DataValueField="InsumoId"></asp:CheckBoxList>
	</div>
    <hr />

	<input type="hidden" value="21 DIVULGACION Y 22 OTRO APOYO">
    <div class="col-1">
        <label>
            <asp:SqlDataSource ID="sqlDSDisenio" runat="server" ConnectionString="<%$ ConnectionStrings:LocalWindowsAuthConnectionStringEventos %>" SelectCommand="SELECT * FROM [CatInsumos] WHERE (([TipoInsumo] = @TipoInsumo) AND ([Activo] = @Activo) AND ([MuestraUsuario] = @MuestraUsuario)) ORDER BY Orden">
                <SelectParameters>
                    <asp:Parameter DefaultValue="DISENIO" Name="TipoInsumo" Type="String" />
                    <asp:Parameter DefaultValue="S" Name="Activo" Type="String" />
                    <asp:Parameter DefaultValue="SI" Name="MuestraUsuario" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>            
            <asp:GridView ID="gvDisenio" runat="server" AutoGenerateColumns="False" DataKeyNames="InsumoId" DataSourceID="sqlDSDisenio" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="InsumoId" HeaderText="InsumoId" InsertVisible="False" ReadOnly="True" SortExpression="InsumoId" />
                    <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" SortExpression="TipoInsumo" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" NullDisplayText="_" SortExpression="Precio" />
                    <asp:BoundField DataField="Url" HeaderText="Url" NullDisplayText="_" SortExpression="Url" />
                    <asp:BoundField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                    <asp:BoundField DataField="OtroTxt" HeaderText="OtroTxt" NullDisplayText="_" SortExpression="OtroTxt" />
                    <asp:BoundField DataField="OtroTipo" HeaderText="OtroTipo" NullDisplayText="_" SortExpression="OtroTipo" />
                    <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
                    <asp:BoundField DataField="MuestraUsuario" HeaderText="MuestraUsuario" SortExpression="MuestraUsuario" />
                    <asp:BoundField DataField="MuestraUsuarioOtroTxt" HeaderText="MuestraUsuarioOtroTxt" SortExpression="MuestraUsuarioOtroTxt" />
                </Columns>
        </asp:GridView>           
        Depto. de ext. y div. cient&iacute;fica (<a onClick="linkExterno('http://eventos.cibnor.mx/Solicitudes/Mensajes?fl=7')">Aclaraci&oacute;n importante</a>)
        </label>
        <asp:CheckBoxList ID="chkDisenio" class="optionList" runat="server" tabindex="210" 
            DataSourceID="sqlDSDisenio" DataTextField="Nombre" DataValueField="InsumoId"></asp:CheckBoxList>
	</div>
    <div class="col-1">
        <label class="labelBlockDisplay">
            Otro apoyo
            <input placeholder="Especifique..." id="txtOtroApoyoEspecifique" name="txtOtroApoyoEspecifique" tabindex="220">
        </label>
	</div>
    
    <div class="col-header">
        <label class="encabezado">datos adicionales</label>
    </div>
    
    <div class="col-1">
        <label class="labelBlockDisplay">
            <textarea id="txtComentarios" name="txtComentarios" placeholder="Comentarios adicionales..." rows="2" style="height:54px;" tabindex="230"></textarea>
        </label>
    </div>
        
    <div class="col-submit">
        <button id="btnContinuar" class="submitbtn" type="button" tabindex="500">Continuar</button>
    </div>
         
  </form>
  </div>
</body>
<footer>
    <link rel="stylesheet" type="text/css" media="all" href="css/styles.css"><!-- CSS general de la plantilla -->
    <link rel="stylesheet" type="text/css" media="all" href="css/switchery.min.css"> <!-- CSS general de la plantilla -->
    <script type="text/javascript" src="js/switchery.min.js"></script><!-- JS de la plantilla -->
    
    <script type="text/javascript" src="js/jquery.js"></script><!-- JQ base ver1.11  -->
    
	<script type="text/javascript" src="js/jquery.timepicker.js"></script><!-- JQ timepicker  -->
    <link rel="stylesheet" type="text/css" href="css/jquery.timepicker.css" /><!-- CSS timepicker  -->
    
	<script type="text/javascript" src="datepicker/jquery-ui.min.js"></script>
	<script type="text/javascript" src="datepicker/jquery.ui.datepicker-es.js"></script>
	<link type="text/css" rel="stylesheet" href="datepicker/jquery-ui.css"/>

    <script type="text/javascript" src="js/actions.js"></script><!-- JS personalizado  -->
    <script type="text/javascript" src="js/validations.js"></script><!-- JS validaciones posteriores  -->

    <script src="js/heartcode-canvasloader-min.js"></script> <!-- JS del loader -->

    <!--  Parametros para el div del loader -->
    <script> 
        var cl3 = new CanvasLoader("cl_rect", { id: "canvasLoader", safeVML: true });
        cl3.setColor('#2ec23d');
        cl3.setShape("square");
        cl3.setDiameter(240);
        cl3.setDensity(18);
        cl3.setSpeed(1);
        cl3.setFPS(24);
        cl3.setRange(0.90);
        cl3.show();
    </script>

    <script type="text/javascript">
        // JS para autollenado y pruebas 
        //document.getElementById("ddlTitular").selectedIndex = 111;
        //document.getElementById("ddlProyecto").selectedIndex = 3;
        //document.getElementById("txtSolicitanteNombre").value = 'jcg';
        //document.getElementById("txtSolicitanteCorreo").value = 'jorgecollins@hotmail.com';
        //document.getElementById("txtSolicitanteTelefono").value = '1234567890';
        //document.getElementById("txtTituloEvento").value = 'Test';
        //document.getElementById("txtNumeroAsistentes").value = '12';
        //document.getElementById("txtDescripcionEvento").value = 'No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.';
        //document.getElementById("ddlCategoria").selectedIndex = 1;
        //document.getElementById("ddlDirector").selectedIndex = 1;
        //document.getElementById("txtFecha").value = '01/10/2017';
        //document.getElementById("txtHoraI").value = '10:00';
        //document.getElementById("txtHoraT").value = '17:00';
        //document.getElementById("rdbTipoInterno").checked = true;
        //document.getElementById("chkMontaje_0").checked = true;
//        document.getElementById("chkMontaje_7").checked = true;
        ////document.getElementById("chkComputo_0").checked = true;
//        document.getElementById("chkAlimentos_1").checked = true;
        //document.getElementById("chkVehiculos_1").checked = true;
//        document.getElementById("chkApoyo_6").checked = true;
//        document.getElementById("txtInsumoId_50").value = 'hospedaje ponentes';
        //        document.getElementById("secConfirm").style.bottom = '-50%';


    </script>
</footer>

</html>
