// JavaScript Document, Inicializacion de los elementos y su comportamiento

	// OPCIONES PARA EL DATEPICKER
	var optionsDP = {'showOn':'focus', 'changeYear':true, 'changeMonth':true, 'numberOfMonths':1, 'dateFormat':'dd/mm/yy'};

	// OPCIONES PARA EL TIMEPICKER
	var optionsI = {'minTime':'8:30am','maxTime':'9:00pm', 'timeFormat': 'H:i','show2400':'true', 'disableTextInput': true};
	var optionsT = {'minTime':'9:00am','maxTime':'10:00pm', 'timeFormat': 'H:i','show2400':'true', 'disableTextInput': true};

$(document).ready(function(){

	// INCIALIZA LOS CONTROLES DE ACUERDO A LA PLANTILLA
	var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));	
	elems.forEach(function(html) {
		var switchery = new Switchery(html);
	});
	// EOF		

	// INICIALIZAMOS EL DATEPICKER
	$(".inputFechas").datepicker(optionsDP);
	// EOF		

	// INICIALIZAMOS EL TIMEPICKER
	$('.inputHorasI').timepicker(optionsI);
	$('.inputHorasT').timepicker(optionsT);
	// EOF

	// INICIALIZA EL STATUS DE LAS SECCIONES
//	$('#divFolioOriginal').hide();
	$('#divMultiplesFechasI').hide();
	$('#divMultiplesFechasT').hide();
	$('#divEventoInterno').hide();
	$('#divEventoExterno').hide();
	$('#secErrorMsg').hide();
    // EOF

    // Realiza esta funcion hasta que se carga el gridView
	do {
	    setTimeout(function () { }, 20);
	    //alert("hola");
	} while (document.getElementById("gvTipoInterno") == null)

	
	// INICIALIZA LOS CATALOGOS
	editarInsumosLugares("chkTipoInterno","gvTipoInterno");
	editarInsumosLugares("chkTipoExterno","gvTipoExterno");

	editarInsumosGenerales("chkMontaje","gvMontaje");
	editarInsumosGenerales("chkMobiliario","gvMobiliario");
	editarInsumosGenerales("chkAudiovisual","gvAudiovisual");
	editarInsumosGenerales("chkComputo","gvComputo");

	editarInsumosGenerales("chkAlimentos","gvAlimentos");
	editarInsumosGenerales("chkProveedor","gvProveedor");
	editarInsumosGenerales("chkVehiculos","gvVehiculos");
	editarInsumosGenerales("chkServicios","gvServicios");
	editarInsumosGenerales("chkApoyo","gvApoyo");
	editarInsumosGenerales("chkCultural","gvCultural");
	editarInsumosGenerales("chkDisenio","gvDisenio");
    // EOF

	// INICIALIZA EL VALOR DE LAS CONSTANTES LOCALES
	var varfadeIn = 300;
	var varfadeOut = 150;
	// EOF

	// SI EL TITULAR ES EL SOLICITANTE...
	var varTitular = document.getElementById('chkTitular');
	$('#chkTitular').click( function() {
		if (varTitular.checked) { $('#secSolicitante').fadeOut(varfadeOut); }
		else { $('#secSolicitante').fadeIn(varfadeIn); }	
	});
	// EOF
	
//	// SI ES UN EVENTO REPROGRAMADO...
//	var varEventoReprogramado = document.getElementById('chkEventoReprogramado');
//	$('#chkEventoReprogramado').click( function() {
//		if (varEventoReprogramado.checked) { $('#divFolioOriginal').fadeIn(varfadeIn); }
//		else { $('#divFolioOriginal').fadeOut(varfadeOut); }
//	});
//	// EOF
	
	// SI ES DE MULTIPLES FECHAS...
	var varMultiplesFechas = document.getElementById('chkMultiplesFechas');
	$('#chkMultiplesFechas').click( function() {
		if (varMultiplesFechas.checked) { 
			$('#divMultiplesFechasI').fadeIn(varfadeIn); 
			$('#divMultiplesFechasT').fadeIn(varfadeIn); 
		}
		else { 
			$('#divMultiplesFechasI').fadeOut(varfadeOut); 
			$('#divMultiplesFechasT').fadeOut(varfadeOut); 
			removeAllRows();
		}
	});
	// EOF
	
	// SI ES EVENTO INTERNO...
	var varTipoInterno = document.getElementById('rdbTipoInterno');
	$(varTipoInterno).click( function() {
		if (varTipoInterno.checked) {
			$('#divEventoInterno').fadeIn(varfadeIn);
			$('#divEventoExterno').hide();
		}
	});
	
	// O EXTERNO...
	var varTipoExterno = document.getElementById('rdbTipoExterno');
	$(varTipoExterno).click( function() {
		if (varTipoExterno.checked) {
			$('#divEventoInterno').hide();
			$('#divEventoExterno').fadeIn(varfadeIn);
		}
	});
	
	document.getElementById("ddlTitular").focus(); // Le damos el foco al 1er elemento del formulario
});

// Funcion para leer un gridView e insertar el contenido deseado en formato html en un controllist
function editarInsumosGenerales(list,gridview) 
{	var optionList = [];
	var gridViewRowCount = document.getElementById(gridview).rows.length;

	for (i = 0; i < gridViewRowCount; i++) {
		optionList.push(document.getElementById(list + '_' + i));
	}	
	$("#" + gridview + " tbody tr").each(function (index) { // para cada tr
		var cInsumoId, cNombre, cPrecio, cUrl, cOtroTxt, cOtroTipo, cMuestraUsuarioOtroTxt; // declaramos las variables a utilizar
		$(this).children("td").each(function (index2) { // para cada td
			switch (index2) { // Para cada case, se toma el texto de la celda y se guarda en su respectiva variable...
				case 0:
					cInsumoId = $(this).text(); break;
				case 2:
					cNombre = $(this).text(); break;
				case 3:
					cPrecio = $(this).text(); break;
				case 4:
					cUrl = $(this).text(); break;
				case 6:
					cOtroTxt = $(this).text(); break;
				case 7:
					cOtroTipo = $(this).text(); break;
				case 9:
					cMuestraUsuarioOtroTxt = $(this).text(); break;
			}
		}) // ... para al terminar de recorrer el renglon, poder armar el html a insertar
		var result = cNombre; // Armamos el html a insertar...
		// Agrega el Nombre del recurso con su respectivo link (si lo tiene)...
		if (cUrl != "_") { // Tiene indicado url?
			if (cUrl.length > 4) { // Si el URL esta indicado en su campo...
				result = "<a onClick=linkExterno('"+ cUrl +"')>" + cNombre + "</a>";
			}
		}
		result += "&nbsp;";
		
		// Agrega la linea con su respectivo link (si lo tiene)...
		var resultPrecio = "";
		if (cPrecio != "_") { // Si es diferente de NULL...

			if (cPrecio > 0) { 			
				resultPrecio = "- <strong>[ $ "+ cPrecio +".00 ]</strong>&nbsp;";
				result += resultPrecio;
			}
		}
				
		// AQUI SIGUE AGREGAR EL TEXTBOX EN CASO DE QUE LO TENGA CONFIGURADO
		if (cMuestraUsuarioOtroTxt == "SI") {
			if (cOtroTxt != "_") { // Si es diferente de NULL...
				if (cOtroTxt.length >= 4) {
					var resultOtroTxt = "<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + cOtroTxt + "&nbsp;";
					if (cOtroTipo != "_") { 
						var cWidth = (cOtroTipo == "NUM") ? "40px" : "210px";
						resultOtroTxt = "<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + cOtroTxt + "&nbsp;" +
							"<input id='"+ "txtInsumoId_" + cInsumoId +"' placeholder='...' style='width:"+ cWidth +
							"; margin:2px 0px 4px 0px; padding:2px 4px; height:16px; border:1px solid gray' >";
					}

					result += resultOtroTxt;
				}
				
			}						
		}
		var labelArray = optionList[index].parentNode.getElementsByTagName('label');
		labelArray[0].innerHTML = result;
	})
	$('#' + gridview).hide();
}

// Funcion para leer un gridView e insertar el contenido deseado en formato html en un controllist
function editarInsumosLugares(list,gridview) 
{	var optionList = [];
	var gridViewRowCount = document.getElementById(gridview).rows.length;

	for (i = 0; i < gridViewRowCount; i++) {
		optionList.push(document.getElementById(list + '_' + i));
	}	
	$("#" + gridview + " tbody tr").each(function (index) { // para cada tr
		var cLugarId, cNombre, cMsgId, cUrl, cLineaMsg, cMsgIdLineaMsg, cUrlLineaMsg, cTieneDato; // declaramos las variables a utilizar
		$(this).children("td").each(function (index2) { // para cada td
			switch (index2) { // Para cada case, se toma el texto de la celda y se guarda en su respectiva variable...
				case 0:
					cLugarId = $(this).text(); break;
				case 2:
					cNombre = $(this).text(); break;
				case 3:
					cMsgId = $(this).text(); break;
				case 4:
					cUrl = $(this).text(); break;
				case 5:
					cLineaMsg = $(this).text(); break;
				case 6:
					cMsgIdLineaMsg = $(this).text(); break;
				case 7:
					cUrlLineaMsg = $(this).text(); break;
				case 8:
					cTieneDato = $(this).text(); break;
			}
		}) // ... para al terminar de recorrer el renglon, poder armar el html a insertar
		var result = ""; // Armamos el html a insertar...
		// Agrega el Nombre del recurso con su respectivo link (si lo tiene)...
		if (cMsgId != "_") { // Tiene indicado un link en MsgId?
			if (cMsgId == 0) { // Si el URL es el indicado en su campo...
				result = "<a onClick=linkExterno('"+ cUrl +"')>";
			}
			else { // Ó si el URL es un mensaje configurado en la seccion admva.
				var tmpurl = "http://eventos.cibnor.mx/Solicitudes/Mensajes?fl=" + cMsgId;
				result = "<a onClick=linkExterno('"+ tmpurl +"')>";
			}
			result += cNombre + "</a>"; // Se cierra el anchor
		}
		else { // No tiene indicado MsgId, por lo tanto no lleva link
			result = cNombre;
		}
		result += "&nbsp";
		// Agrega la linea con su respectivo link (si lo tiene)...
		var resultLinea = "";
		if (cLineaMsg.length >= 4) { // Tiene texto la linea en LineaMsg?

			if (cMsgIdLineaMsg != "_") { // Si es diferente de NULL...			
				if (cMsgIdLineaMsg == 0) { // Si el link esta indicado en el campo UrlLineaMsg
					resultLinea = "<a onClick=linkExterno('"+ cUrlLineaMsg +"')>"+ cLineaMsg +"</a>";
				}
				else { // Si el link es a un mensaje configurado en la parte admva.
					var tmpurl = "http://eventos.cibnor.mx/Solicitudes/Mensajes?fl=" + cMsgIdLineaMsg;
					resultLinea = "<a onClick=linkExterno('"+ tmpurl +"')>"+ cLineaMsg +"</a>";
				}
			}
			else { // Si cMsgIdLineaMsg es igual a NULL, es decir es texto unicamente
				resultLinea = cLineaMsg;
			}
			result += resultLinea + "&nbsp;&nbsp;"; // Se cierra el anchor
		}
		// AQUI SIGUE AGREGAR EL TEXTBOX EN CASO DE QUE LO TENGA CONFIGURADO + "' name='txtLugar" + cLugarId + "' " 
		if (cTieneDato == "SI") {
			var resultTieneDato = "<input id='txtLugarId_" + cLugarId +
				"' placeholder='...' style='width:210px; margin:0px; padding:2px 4px; height:16px; border:1px solid gray' tabindex='150' >";
			result += resultTieneDato;
		}
		var labelArray = optionList[index].parentNode.getElementsByTagName('label');
		labelArray[0].innerHTML = result;
	})
	$('#' + gridview).hide();
}

function linkExterno(msg) {
	//window.location.assign("http://eventos.cibnor.mx/intranet/facilities.html")
//	var dominioMensajes = "http://200.23.162.100/eventos/solicitudes/Mensajes.aspx";
	var dominioMensajes = "http://eventos.cibnor.mx/Solicitudes/Mensajes";
	var opciones = "toolbar=no, scrollbars=yes, resizable=yes, width=840, height=600, left=100, top=50";
	switch(msg) {
		case "alimentos":
			window.open(dominioMensajes + "?fl=19", "_blank", opciones);
			break;

		case "montajes":
			window.open("http://eventos.cibnor.mx/intranet/facilities.html", "_blank", opciones);
			break;

		case "eventoInterno":
			window.open(dominioMensajes + "?fl=10", "_blank", opciones);
			break;
			
		case "eventoExterno":
			window.open(dominioMensajes + "?fl=11", "_blank", opciones);
			break;
			
		case "salaUsosMultiples":
			window.open("http://eventos.cibnor.mx/intranet/facilities.html", "_blank", opciones);
			break;
			
		case "auditorio":
			window.open(dominioMensajes + "?fl=5", "_blank", opciones);
			break;
			
		case "hotel":
			window.open("http://www.cibnor.gob.mx/tarifas-hoteleras?tmpl=component&print=1&page=", "_blank", opciones);
			break;		

		case "horario":
			window.open(dominioMensajes + "?fl=15", "_blank", opciones);
			break;
	
		case "horarioRe":
			window.open(dominioMensajes + "?fl=9", "_blank", opciones);
			break;

		case "horarioIr":
			window.open(dominioMensajes + "?fl=8", "_blank", opciones);
			break;
	
		default: 
			window.open(msg, "_blank", opciones);
			break;
	}
}

// AGREGAR Y ELIMINAR RENGLON PARA CUANDO SON MULTIPLES FECHAS
var numero = 0;
function addNewRow()
{
	var TABLE = document.getElementById("tabla"); 	// obtenemos acceso a la tabla por su ID
	var TROW = document.getElementById("celda"); 	// obtenemos acceso a la fila maestra por su ID
	
	var content = TROW.getElementsByTagName("td"); 	// tomamos la celda
	
	var newRow = TABLE.insertRow(-1); 	// creamos una nueva fila
	newRow.className = TROW.attributes['class'].value;
	
	var newCell = newRow.insertCell(newRow.cells.length) 	// creamos una nueva celda
	
	newID = '_' + (++numero); 	// creamos una nueva ID para el examinador
	
	// creamos un nuevo control (renglon)...
	txt = 
		'<div class="col-4"><label>Fecha:<input placeholder="Fecha adicional..." id="txtFecha' + newID + '" name="txtFecha' + newID +
            '" class="inputFechas" tabindex="110" ></label></div>' +
		'<div class="col-4"><label>De:<input placeholder="Hora de inicio..." id="txtHoraI' + newID + '" name="txtHoraI' + newID +
		  	'" class="inputHorasI" tabindex="110" ></label></div>' +
		'<div class="col-4"><label>A las:<input placeholder="Hora de terminaci&oacute;n..." id="txtHoraT' + newID + '" name="txtHoraT' + newID +
			'" class="inputHorasT" tabindex="110" ></label></div>' +
		'<div class="col-4" style="padding:0px;" ><label style="padding:0px; width:100%;"><button type="button" id="btnEliminarFecha' + newID + '" name="btnEliminarFecha' + newID +
			'" class="submitbtn" style="margin:10px 15% 9px 15%; width:70%;" onClick="removeThisRow(this.id)" tabindex="110">Eliminar</button></label></div>'		
	// ... y lo asignamos a la celda
	newCell.innerHTML = txt
	
	$('.inputHorasI').timepicker(optionsI); // Re-inicializamos la clase del TimePicker y el DatePicker,
	$('.inputHorasT').timepicker(optionsT); // ya que se acaban de crear estos controles
	$(".inputFechas").datepicker(optionsDP);
}

function removeThisRow(btnId) 
{
	// obtenemos la tabla
    var TABLE = document.getElementById("tabla");
    var CONTROL = document.getElementById("chkMultiplesFechas");
	var rowIndex = btnId.substr(17); // Obtenemos el renglon a eliminar en base al indice del boton presionado
	TABLE.deleteRow(rowIndex); // Eliminamos el renglon actual
	var tableLength = TABLE.rows.length; // Obtenemos la NUEVA cantidad de renglones
	for (var r = parseInt(rowIndex); r < tableLength; r++) { // Para cada renglon a partir del eliminado, renombramos los controles
		var rowIndex2 = r + 1; // Obtenemos el indice del control a buscar y a cada uno le asignamos su "id - 1"
		elementToRename = document.getElementById("txtFecha_" + rowIndex2).id = "txtFecha_" + r;
		elementToRename = document.getElementById("txtHoraI_" + rowIndex2).id = "txtHoraI_" + r;
		elementToRename = document.getElementById("txtHoraT_" + rowIndex2).id = "txtHoraT_" + r;
		elementToRename = document.getElementById("btnEliminarFecha_" + rowIndex2).id = "btnEliminarFecha_" + r;			
	}
	if (tableLength == 1) {
	    CONTROL.click();
	}
	--numero;
}

function removeLastRow() 
{
	// obtenemos la tabla
	var TABLE = document.getElementById("tabla");
	
	// si tenemos mas de una fila, borramos
	if(TABLE.rows.length >= 2) 
	{
		TABLE.deleteRow(TABLE.rows.length-1);
		--numero;
	}
	//alert("removeLastRow");
}

function removeAllRows() 
{
	// obtenemos la tabla
	var TABLE = document.getElementById("tabla");
	
	// si tenemos mas de una fila, borramos
	while(TABLE.rows.length >= 2) 
	{
		TABLE.deleteRow(TABLE.rows.length-1);
		--numero;
	}
	//alert("removeAll");
} 
// EOF