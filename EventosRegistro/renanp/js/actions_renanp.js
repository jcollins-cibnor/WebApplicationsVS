// JavaScript Document 1
$(document).ready(function () {
    var tipoRegistro = document.getElementById('txtType').value;

    $('#divConfirmacion').hide(); 
    $('#divFacturacion').hide();

    /* Desplegado de informacion sobre el formulario opacando el resto */
    $('#divMensajeEspera').hide();

    // Para 1a /////////////////////////////////////////////////
    //$("#txtSalidaFecha1, #txtSalidaFecha2, #txtRegresoFecha1, #txtRegresoFecha2").datepicker({
    //    showOn: "focus", // "both", // o "button"
    //    changeYear: true,
    //    //dateFormat: 'yy-mm-dd', //ESTE CAMBIO SOLO ES PARA PRODUCCION
    //    dateFormat: 'dd-MM-yy',
    //    changeMonth: true
    //});


    //$('#rblTraslado input').click(function () { // El selector aqui debe de ser "[id] input" para que funcione
    //    var rblvalue = $('#rblTraslado input').index(this); // Obtenemos el indice del valor seleccionado

    //    if (rblvalue == 0) { // en caso de mas de dos opciones, aplicamos los "else if" necesarios
    //        $('#divItinerarios').fadeOut(200); // ocultamos el control
    //    }
    //    else {
    //        $('#divItinerarios').fadeIn(200); // mostramos el control
    //    }
    //    //alert(rblvalue);
    //});

    // Para 2a /////////////////////////////////////////////////
    $('#divCRuta').hide();
    $("#txtCSalidaFecha1, #txtCSalidaFecha2, #txtCRegresoFecha1, #txtCRegresoFecha2").datepicker({
        showOn: "focus", // "both", // o "button"
        changeYear: true,
        //dateFormat: 'yy-mm-dd', //ESTE CAMBIO SOLO ES PARA PRODUCCION
        dateFormat: 'dd-MM-yy',
        changeMonth: true
    });


    $('#rblCTraslado input').click(function () { // El selector aqui debe de ser "[id] input" para que funcione
        var rblCvalue = $('#rblCTraslado input').index(this); // Obtenemos el indice del valor seleccionado

        if (rblCvalue == 0) { // en caso de mas de dos opciones, aplicamos los "else if" necesarios
            $('#divCItinerarios').fadeOut(200); // ocultamos el control
            $('#divCRuta').fadeOut(200); // ocultamos el control
        }
        else if (rblCvalue == 1) {
            $('#divCItinerarios').fadeIn(200); // mostramos el control
            $('#divCRuta').fadeOut(200); // ocultamos el control
        }
        else {
            $('#divCItinerarios').fadeOut(200); // mostramos el control
            $('#divCRuta').fadeIn(200); // ocultamos el control
        }
        //alert(rblvalue);
    });

    $('#btnEnviar').click(function () {
        $('#divContainer').css('opacity', '0.2');
        $('#divContainer').css('-webkit-opacity', '0.2');
        $('#divMensajeEspera').fadeIn(300);
    });
    /* EOF: Desplegado de informacion sobre el formulario opacando el resto */

    // Esta funcion revisa un campo requerido
    function valCampo(objCampo) {
        valor = objCampo.value;
        //var campo = document.getElementById('txtNombres');
        if (valor == '') {
            objCampo.style.border = '1px solid red';
            alert("Captura los campos requeridos | Capture the required fields.");
            return false;
        }
        objCampo.style.border = 'none';
        return true;
    }

    // Esta funcion revisa si se esta adjuntando un archivo en el control
    function valAdjunto(objCampo) {
        if ($.trim($(objCampo).val()) === "") {
            objCampo.style.border = '1px solid red';
            alert("Adjunta el documento | Attach the document.");
            return false;
        }
        objCampo.style.border = 'none';
        return true;
    }

    // Esta funcion revisa que el correo introducido tenga la sintaxis correcta
    function valEmail(objCampo) {
        valor = objCampo.value;
        expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (valor == '') {
            objCampo.style.border = '1px solid red';
            alert("Captura el correo | Capture the email.");
            return false;
        }
        if (!expr.test(valor)) {
            objCampo.style.border = '1px solid red';
            alert(valor + " no es un correo valido | is not a valid email.");
            return false;
        }
        objCampo.style.border = 'none';
        return true;
    }

    // Esta funcion valida que dos campos sean iguales, en este caso la confirmacion del correo
    function valCamposIguales(objCampo1, objCampo2) {
        valor1 = objCampo1.value;
        valor2 = objCampo2.value;
        if (valor1 != valor2) {
            objCampo2.style.border = '1px solid red';
            alert("Confirme el dato.");
            return false;
        }
        objCampo2.style.border = 'none';
        return true;
    }

    // Esta funcion valida que se seleccione de un DropDownList cualquier opcion diferente a la primera
    function valDropDownList(objCampo) {
        if (objCampo.selectedIndex == 0) {
            objCampo.style.border = '1px solid red';
            alert("Selecciona una opcion");
            return false;
        }
        objCampo.style.border = 'none';
        return true;
    }

    // Esta funcion valida el maxLength de un textArea
    function valMaxLengthTextArea(objCampo, maxLength) {
        if (objCampo.value.length > maxLength) {
            objCampo.style.border = '1px solid red';
            objCampo.focus();
            alert(maxLength + " caracteres, maximo.");
            return false;
        }
        objCampo.style.border = 'none';
        return true;
    }
    
    $('#btnContinuar').click(function () {
        // **********************************************************************************************
        // Esta funcion es la principal y revisa los campos uno por uno y "deja pasar" si todo esta bien
        // Creamos una variable para cada campo a validar y lo agregamos al if -principal-
        var varNombre = document.getElementById('txtNombre');
        var varCorreo = document.getElementById('txtCorreo');
        var varCorreoConfirma = document.getElementById('txtCorreoConfirma');
        var varComentarios = document.getElementById('txtComentarios');

        var validado = false;
        //alert(tipoRegistro);
        switch (tipoRegistro) {
            case "AGS":
            case "SCC":
                if (
                    valCampo(varNombre) && valEmail(varCorreo) &&
                    valCamposIguales(varCorreo, varCorreoConfirma) &&
                    valMaxLengthTextArea(varComentarios, 1000)
                    ) {
                    validado = true;
                }
                else { validado = false; break; }
                if ($('#rblCTraslado input:checked').val() == "si") {
                    var varCSalidaOrigen1 = document.getElementById('txtCSalidaOrigen1');
                    var varCSalidaNoVuelo1 = document.getElementById('txtCSalidaNoVuelo1');
                    var varCSalidaFecha1 = document.getElementById('txtCSalidaFecha1');
                    var varCSalidaHora1 = document.getElementById('txtCSalidaHora1');
                    var varCSalidaNoVuelo2 = document.getElementById('txtCSalidaNoVuelo2');
                    var varCSalidaFecha2 = document.getElementById('txtCSalidaFecha2');
                    var varCSalidaHora2 = document.getElementById('txtCSalidaHora2');
                    var varCRegresoOrigen1 = document.getElementById('txtCRegresoOrigen1');
                    var varCRegresoNoVuelo1 = document.getElementById('txtCRegresoNoVuelo1');
                    var varCRegresoFecha1 = document.getElementById('txtCRegresoFecha1');
                    var varCRegresoHora1 = document.getElementById('txtCRegresoHora1');
                    var varCRegresoNoVuelo2 = document.getElementById('txtCRegresoNoVuelo2');
                    var varCRegresoFecha2 = document.getElementById('txtCRegresoFecha2');
                    var varCRegresoHora2 = document.getElementById('txtCRegresoHora2');
                    if (valCampo(varCSalidaOrigen1) && valCampo(varCSalidaNoVuelo1) && valCampo(varCSalidaFecha1) && valCampo(varCSalidaHora1) &&
                        //valCampo(varCSalidaNoVuelo2) && valCampo(varCSalidaFecha2) && valCampo(varCSalidaHora2) &&
                        valCampo(varCRegresoOrigen1) && valCampo(varCRegresoNoVuelo1) && valCampo(varCRegresoFecha1) && valCampo(varCRegresoHora1)
                        //&& valCampo(varCRegresoNoVuelo2) && valCampo(varCRegresoFecha2) && valCampo(varCRegresoHora2)
                        ) {
                        validado = true;
                    }
                    else { validado = false; break; }
                }
                else { validado = true; }
                if ($('#rblCTraslado input:checked').val() == "sb") {
                    var varCRutaOrigen = document.getElementById('txtCRutaOrigen');
                    var varCRutaHoraLlegada = document.getElementById('txtCRutaHoraLlegada');
                    if (valCampo(varCRutaOrigen) && valCampo(varCRutaHoraLlegada)
                        ) {
                        validado = true;
                    }
                    else { validado = false; break; }
                }
                break;

            default: break;
        }

        if (validado) { continuar(); }

    });

    function continuar() {
        $("#divDatos *").attr("disabled", "disabled").off('click');
        $('#btnContinuar').hide();
        $('#divConfirmacion').fadeIn(200); // Presentamos el modulo de confirmacion
    }

    //$('#chkFactura').click(function () {

    //    if (document.getElementById('chkFactura').checked) {
    //        //alert("checked");
    //        $('#divFacturacion').fadeIn(200);
    //    }
    //    else {
    //        //alert("You didn't check it! Let me check it for you.");
    //        $('#divFacturacion').hide();
    //    }

    //});


    // MODULO DE PRUEBA INDIVIDUAL
    //$('#btnContinuar').click(function () {
    //    if (valCampo(factRFC) && valCampo(factNombre) && valCampo(factDomicilio)) {
    //        $("#divDatos *").attr("disabled", "disabled").off('click');
    //        $('#btnContinuar').hide();
    //        $('#divConfirmacion').fadeIn(200); // Presentamos el modulo de confirmacion
    //    }
    //    else {
    //    }
    //});
    // **********************************************************************************************

    // Si regresa a modificar algo, se habilita la edicion
    $('#btnRegresar').click(function () {
        $("#divDatos *").removeAttr("disabled");
        $('#divConfirmacion').hide(); // Ocultamos el modulo de confirmacion
        $('#btnContinuar').fadeIn(200);
    });

    // Antes de enviar es necesario habilitar los controles
    $('#btnEnviar').click(function () {
        //$('#btnEnviar').prop('disabled', true);
        $("#divDatos *").removeAttr("disabled");
    });
});