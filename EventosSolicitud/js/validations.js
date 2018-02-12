// JavaScript Document
$(document).ready(function () {
	var varfadeIn = 300;
	var varfadeOut = 150;
    
    $('#btnContinuar').click(function () {
        // **********************************************************************************************
        // Esta funcion es la principal y revisa los campos uno por uno y "deja pasar" si todo esta bien

		var arrayControlesInvalidos = []; // Arreglo para los controles no validos
        var validado = false; // variable para indicar el estado de todo el formulario

		var arrayMsgError = []; // Aqui vamos a insertar todas las leyendas de error de: las horas, catalogos, y de sus campos requeridos

		var varCampoRequerido = document.getElementById('ddlTitular');
		validado = (valDropDownList(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);
		varCampoRequerido = document.getElementById('ddlProyecto');
		validado = (valDropDownList(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);

		// ¿El titular es quien llena esta solicitud? NO -- Entonces valida lo siguiente
		if (!document.getElementById('chkTitular').checked) {
			varCampoRequerido = document.getElementById('txtSolicitanteNombre');
			validado = (valCampo(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);
			varCampoRequerido = document.getElementById('txtSolicitanteCorreo');
			validado = ( valEmail(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);
			varCampoRequerido = document.getElementById('txtSolicitanteTelefono');
			validado = (valCampo(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);		
		}

		varCampoRequerido = document.getElementById('txtTituloEvento');
		validado = (valCampo(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);
        varCampoRequerido = document.getElementById('txtNumeroAsistentes');
        validado = (valCampoNumero(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);
		varCampoRequerido = document.getElementById('ddlCategoria');
		validado = (valDropDownList(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);	

		varCampoRequerido = document.getElementById('txtFecha');
		validado = (valCampo(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);
		varCampoRequerido = document.getElementById('txtHoraI');
		validado = (valCampo(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);
		varCampoRequerido = document.getElementById('txtHoraT');
		validado = (valCampo(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);

		// ¿Evento con multiples fechas? SI -- Entonces valida todos los campos de la tabla...
		if (document.getElementById('chkMultiplesFechas').checked) {
			var tblRows = document.getElementById('tabla').rows.length;
			tblRows = tblRows - 1;
			for (var r = 1; r <= tblRows; r++) {
				posfix = '_' + r;
				tempID = 'txtFecha' + posfix;
				//alert(tempID);
				varCampoRequerido = document.getElementById(tempID);
				validado = (valCampo(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);
				tempID = 'txtHoraI' + posfix;
				varCampoRequerido = document.getElementById(tempID);
				validado = (valCampo(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);
				tempID = 'txtHoraT' + posfix;
				varCampoRequerido = document.getElementById(tempID);
				validado = (valCampo(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);
			}
		}
		// Comprobamos la siguiente regla: "la hora de inicio debe ser menor que la hora de termino"
		var errorVal = false; // Aqui se recibe el resultado de la funcion que compara las horas
		var errorFlag = false; // Bandera que indica si ya se ha presentado el error antes
		var tblRows = document.getElementById('tabla').rows.length; // Obtenemos el total de renglones de la tabla
		for (var r = 0; r < tblRows; r++) { // Para cada renglon en la tabla de fechas...
			// Obtenemos la hora inicial y la de termino de cada renglon
			posfix = (r > 0) ? '_' + r : '';
			varHoraI = document.getElementById('txtHoraI' + posfix);
			varHoraT = document.getElementById('txtHoraT' + posfix);
			
			errorVal = (valHoraMenorQue(varHoraI,varHoraT)); // Hubo validacion de la regla?
			if (!errorVal) { // Si NO fue validada la regla...
				if (errorFlag == false) { // Si NO se habia agregado en el arreglo de mensajes de error...
					arrayMsgError.push('Horario del evento - la hora de inicio debe ser menor a la hora de termino.'); // Se agrega el msg
					arrayControlesInvalidos.push(varHoraI.id); // Se agrega el control en la lista de controles invalidos
					errorFlag = true; // Se levanta la bandera, este error ya esta reportado, las siguientes iteraciones ya no lo hacen
				}
			}	
		}

		var varCampoRequerido = document.getElementsByName('rdoTipoEvento');
		var varCampoRequeridoID = document.getElementById('fstTipoEvento');
		validado = (valRadioByName(varCampoRequerido, varCampoRequeridoID)) ? true : arrayControlesInvalidos.push(varCampoRequeridoID.id);

		// Comprobamos la siguiente regla: "el campo texto de un elemento de catalogo no debe quedar vacio si esta seleccionado"
		var msgtext = ' - Ingrese el dato requerido para el elemento seleccionado.';
		var chklist = ["chkMontaje", "chkMobiliario", "chkAudiovisual", "chkComputo"];
		for (i = 0; i < chklist.length; i++) {
			chkResult = GetCheckBoxListValues(chklist[i]);
			if (chkResult != true) {
				arrayControlesInvalidos.push(chkResult.id);
				msgheader = chklist[i].substr(3);
				arrayMsgError.push(msgheader + msgtext);
			}
		}
		
		// Comprobamos la regla: "los campos de justificacion no deben quedar vacios si cualquier servicio de alimento esta seleccionado"
		var result = 0;
		chklist = ["chkAlimentos", "chkProveedor"];
		chklist.forEach(chkAlimentosProveedor);

		function chkAlimentosProveedor(list) {
			var chkBox = document.getElementById(list);
			var options = chkBox.getElementsByTagName('input'); 
			for (var i = 0; i < options.length; i++) {
				if (options[i].checked) {
					result += 1;
				}
			}
		};
		chklist = ["txtJustificacion", "txtBeneficiarios", "txtObjetivos", "txtProgramas"];
		chklist.forEach(
			function myFunction(item) {
				varCampoRequerido = document.getElementById(item);
				varCampoRequerido.style.border = 'none';
				if (result > 0) {
					validado = (valCampo(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);
				}
			}
		);
		
		// Comprobamos la siguiente regla: "el campo texto de un elemento de catalogo no debe quedar vacio si esta seleccionado"
		var chklist = ["chkVehiculos", "chkServicios", "chkApoyo", "chkCultural", "chkDisenio"];
		for (i = 0; i < chklist.length; i++) {
			chkResult = GetCheckBoxListValues(chklist[i]);
			msgheader = chklist[i].substr(3);
			msgheader = (msgheader == "Disenio") ? msgheader = "Diseño" : msgheader = msgheader;
			if (chkResult != true) {
				arrayControlesInvalidos.push(chkResult.id);
				arrayMsgError.push(msgheader + msgtext);
			}
		}

// ----------------------- Finaliza la validacion en particular, inician las consecuencias -----------------------

		$('#secErrorMsg').hide();
		if (arrayControlesInvalidos.length > 0) { // Si por lo menos 1 control no paso la validacion...
			// ... se le da el foco de atencion al primer elemento que no esta capturado adecuadamente...
			if (document.getElementById(arrayControlesInvalidos[0]).id == "fstTipoEvento") {
				document.getElementById('rdbTipoInterno').focus(); 
			}
			else {
				document.getElementById(arrayControlesInvalidos[0]).focus(); 
			}		
			window.scrollBy(0, -200); // Recorremos el scroll 200 "para arriba"
			arrayMsgError.push("Los campos marcados con rojo son obligatorios.");
//            alert("Por favor, capture correctamente los campos requeridos."); // ... y avisamos al usuario con un alert

			// Mostramos los mensajes de error, si existen...
			if (arrayMsgError.length > 0) {
				var varErrorMsg = document.getElementById('lblErrorMsg');
				varErrorMsg.innerHTML = "Favor de atender lo siguiente:"; // Reseteamos el HTML....
				fLen = arrayMsgError.length; 
				text = "<ul style='list-style-type: disc; padding-left: 20px;'>";
				for (i = 0; i < fLen; i++) { // Agregamos cada mensaje en una -unordered list-
					text += "<li>" + arrayMsgError[i] + "</li>";
				}
				text += "</ul>";
				varErrorMsg.innerHTML += text; // Lo insertamos en el HTML....
				$('#secErrorMsg').slideDown(350); //... y lo mostramos
			}

			validado = false;
		}
		else {
			$('#secErrorMsg').hide();
			validado = true;
		}
//continuar();
        if (validado) { 
			// Armamos el -inputLugares- -----------------------------
			// Obtenemos el valor del roundChkbtn, dependiendo de este, hacemos un recorrido en -chkTipoInterno- o en -chkTipoExterno-
			var rdoVal = 0;
			var rdoObject = document.getElementsByName('rdoTipoEvento');
			for (var i = 0; i < rdoObject.length; i++) {
				rdoVal = (rdoObject[i].checked)? rdoObject[i].value : 0;
				if (rdoVal != 0) break;
			}
			var rdoPrefix = (rdoVal == 1)? "chkTipoInterno" : "chkTipoExterno"; // Asignamos el valor a la variable -rdoPrefix-
			
			var rdoResult = ""; // Inicializamos la variable que almacenara el resultado
			var chkTable = document.getElementById(rdoPrefix); // Obtenemos la tabla correspondiente
			for (var r = 0; r < chkTable.rows.length; r++) { // Para cada renglon en la tabla...
				chkOption = document.getElementById(rdoPrefix + "_" + r); // ... obtenemos el checkbox correspondiente al renglon
				
				if (chkOption.checked) { // Si este checkbox esta seleccionado...
					rdoResult += "v" + chkOption.value; // ... agregalo al resultado con una -v- como prefijo
					var tmpBox = document.getElementById( "txtLugarId_" + chkOption.value); // Obtenemos el textbox correspondiente
					if (tmpBox != null) { // Si existe el textbox...
						chkText = tmpBox.value;// ... obtenemos el texto introducido en el textbox
						if (chkText.length > 0) { // Si realmente hay texto en el textbox (longitud mayor a cero)...
							rdoResult += ":" + chkText; // ... agregalo al resultado con un -:- como prefijo
						}
					}
					rdoResult += "|"; // Cierra el par de valores con un -|- como posfijo
				}
			}
			document.getElementById("inputLugares").value = rdoResult; // Inserta el resultado en el -input- que se enviara por POST
			// EOF: -----------------------------
			
			// Armamos el -inputInsumos- -----------------------------			
			var chklist = ["chkMontaje", "chkMobiliario", "chkAudiovisual", "chkComputo", "chkAlimentos", "chkProveedor",
						   "chkVehiculos", "chkServicios", "chkApoyo", "chkCultural", "chkDisenio"];
			
			document.getElementById("inputInsumos").value = ""; // Inicializamos el control donde se almacenara el resultado final
			chklist.forEach(
				function myFunction(item) {
					var myTable = document.getElementById(item);
					var myResult = "";

					for (var r = 0; r < myTable.rows.length; r++) { // Para cada renglon en la tabla...
						myCheckbox = document.getElementById(item + "_" + r); // ... obtenemos el checkbox correspondiente al renglon
						
						if (myCheckbox.checked) {               // Si este checkbox esta seleccionado...
							myResult += "v" + myCheckbox.value; // ... agregalo al resultado con una -v- como prefijo
							var tmpBox = document.getElementById( "txtInsumoId_" + myCheckbox.value); // Obtenemos el textbox correspondiente
							if (tmpBox != null) {               // Si existe el textbox...
								chkText = tmpBox.value;         // ... obtenemos el texto introducido en el textbox
								if (chkText.length > 0) {       // Si realmente hay texto en el textbox (longitud mayor a cero)...
									myResult += ":" + chkText;  // ... agregalo al resultado con un -:- como prefijo
								}
							}
							myResult += "|"; // Cierra el par de valores con un -|- como posfijo
						}
					}
					document.getElementById("inputInsumos").value += myResult; // Agrega el resultado en el -input- que se enviara por POST
				}				
			); // Termina el -foreach-
			// EOF: -----------------------------
//			alert("Controles validados...");
			continuar(); 
		}

    });
	
	
// **********************************************************************************************

    // Esta funcion valida que se ingrese el dato requerido del insumo seleccionado
	// -- Unicamente devuelve el primer elemento por seccion que incumple 
	function GetCheckBoxListValues(chkBoxID) {
		var chkBox = document.getElementById(chkBoxID);
		var options = chkBox.getElementsByTagName('input');
		for (var i = 0; i < options.length; i++) {	
			var txtBox = document.getElementById("txtInsumoId_" + options[i].value);
			if (txtBox != null) {
				txtBox.style.border = '1px solid gray';
				if(options[i].checked) {
					valor = txtBox.value;
					if (valor == '') {
						txtBox.style.border = '1px solid red';
						return txtBox;
					}
				}
			}	
		}
		return true;
	}
    // Esta funcion valida que la hora de inicio sea menor que la hora de terminacion
	// -- Utilizada unicamente en la tabla de fechas
	function valHoraMenorQue(objCampo1, objCampo2) {
		var dI = new Date();
		dI.setFullYear(2000, 01, 01);
		dI.setHours(objCampo1.value.substr(0,2), objCampo1.value.substr(3,2), "00", "00");			
		var dT = new Date();
		dT.setFullYear(2000, 01, 01);
		dT.setHours(objCampo2.value.substr(0,2), objCampo2.value.substr(3,2), "00", "00");
		
		if (dI.getTime() >= dT.getTime()) { 
			objCampo1.style.border = '1px solid red';
			objCampo2.style.border = '1px solid red';
//			alert("La hora de inicio debe ser menor a la de termino. r=" + r);
			return false;
		}
		
		objCampo1.style.border = 'none';
		objCampo2.style.border = 'none';
		return true;
	}
    // Esta funcion valida que se seleccione un radio input asociados por su atributo 'Name'
	// -- Utilizada unicamente en la validacion de tipo de evento: interno o externo
    function valRadioByName(objCampo, objCampoID) {
		var rdoValue = 0;
		for (var i = 0; i < objCampo.length; i++) {
			rdoValue = (objCampo[i].checked)? objCampo[i].value : 0;
			if (rdoValue != 0) break;
		}
		if (rdoValue == 0) {
			objCampoID.style.border = '1px solid red';
			return false;
		}	
        objCampoID.style.border = 'none';
        return true;
    }	
    // Esta funcion valida que se seleccione de un DropDownList cualquier opcion diferente a la primera
    function valDropDownList(objCampo) {
        if (objCampo.selectedIndex == 0) {
            objCampo.style.border = '1px solid red';
            return false;
        }
        objCampo.style.border = 'none';
        return true;
    }	
    // Esta funcion revisa un campo requerido
    function valCampo(objCampo) {
        valor = objCampo.value;
        if (valor == '') {
            objCampo.style.border = '1px solid red';
            return false;
        }
        objCampo.style.border = 'none';
        return true;
    }
    // Esta funcion revisa un campo numero sea > 0
    function valCampoNumero(objCampo) {
        valor = objCampo.value;
        valorInt = parseInt(valor);
        if (valorInt < 1 || isNaN(valorInt)) {
            objCampo.style.border = '1px solid red';
            return false;
        }
        objCampo.style.border = 'none';
        return true;
    }
    // Esta funcion revisa que el correo introducido tenga la sintaxis correcta y no este vacio
    function valEmail(objCampo) {
        valor = objCampo.value;
        expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if ((valor == '') || (!expr.test(valor))) {
            objCampo.style.border = '1px solid red';
            return false;
        }
        objCampo.style.border = 'none';
        return true;
    }

//    // Esta funcion valida el maxLength de un textArea
//    function valMaxLengthTextArea(objCampo, maxLength) {
//        if (objCampo.value.length > maxLength) {
//            objCampo.style.border = '1px solid red';
//            objCampo.focus();
//            alert(maxLength + " caracteres, maximo.");
//            return false;
//        }
//        objCampo.style.border = 'none';
//        return true;
//    }
	
    function continuar() {
		$('html,body').animate({ scrollTop: 0 }, 450, "linear");
        $('#secConfirm').animate({bottom: "0%"}, 450); // Presentamos el modulo de confirmacion
        $('label > input, label > textarea, .DropDownList').css("opacity", "1");
		document.getElementById("btnEnviar").focus();	
    }
	// Si regresa a modificar algo, se habilita la edicion
    $('#btnRegresar').click(function () {
        $('#secConfirm').animate({bottom: "100%"}); // Ocultamos el modulo de confirmacion
        $('label > input, label > textarea, .DropDownList').css("opacity", "0.6");
		document.getElementById("ddlTitular").focus();
    });

    // 
    $('#btnEnviar').click(function () {
//        alert("Solicitud enviada - ¡Gracias!");
        $('#secSending').animate({ bottom: "0%" }, 450); // Presentamos el modulo del loader
    });

});

// Lo que sucede es que al presionar -btnEnviar- el navegador (el cliente) inicia el -window.onbeforeunload- el cual manda llamar a la 
// funcion -preventMultipleSubmissions-.
// Esto sucede simultaneamente mientras se obtiene una respuesta del evento -onserverclick- del boton, cuyo codigo 
// se ejecuta en el servidor, el cual se encuentra especificado en el archivo aspx.cs
function preventMultipleSubmissions() {
//	$('#btnEnviar').prop('innerHTML', 'Hola');
//	$('#btnEnviar').hide();
    $('#btnEnviar').prop('disabled', true);
}
window.onbeforeunload = preventMultipleSubmissions;

