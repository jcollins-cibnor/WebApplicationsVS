// JavaScript Document
$(document).ready(function () {
    $('#divConfirmacion').hide();
    $('#divEquipo').hide();
    $('#divTipoPago').hide();

    $('#rblNumeroEstudiantes input').click(function () { // El selector aqui debe de ser "[id] input" para que funcione
        var rblvalue = $('#rblNumeroEstudiantes input').index(this); // Obtenemos el indice del valor seleccionado

        if (rblvalue == 0) { // en caso de mas de dos opciones, aplicamos los "else if" necesarios
            $('#divEquipo').fadeOut(200); // ocultamos el control
        }
        else {
            $('#divEquipo').fadeIn(200); // mostramos el control
        }
    });

    $('#rblTipoPago input').click(function () { // El selector aqui debe de ser "[id] input" para que funcione
        var rblvalue = $('#rblTipoPago input').index(this); // Obtenemos el indice del valor seleccionado

        if (rblvalue == 0) { // en caso de mas de dos opciones, aplicamos los "else if" necesarios
            $('#divTipoPago').fadeOut(200); // ocultamos el control
        }
        else {
            $('#divTipoPago').fadeIn(200); // mostramos el control
        }
    });


    /* Desplegado de informacion sobre el formulario opacando el resto */
    $('#divMensajeEspera').hide();

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
            alert("Adjunta el documento | Attach the document.");
            return false;
        }
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


    // **********************************************************************************************
    // Esta funcion es la principal y revisa los campos uno por uno y "deja pasar" si todo esta bien
    // Creamos una variable para cada campo a validar...
    var varNombres = document.getElementById('txtNombreEst1');
    var varCorreo = document.getElementById('txtCorreoEst1');
    var varTelefono = document.getElementById('txtTelefonoEst1');
    var varSexo = document.getElementById('ddlSexoEst1');
    var varEdad = document.getElementById('txtEdadEst1');

    var varInstitucion = document.getElementById('txtInstitucion');
    var varDomicilio = document.getElementById('txtDomicilio');
    var varNombreAsesor = document.getElementById('txtNombreAsesor');
    var varCorreoAsesor = document.getElementById('txtCorreoAsesor');

    var varNombreProyecto = document.getElementById('txtNombreProyecto');
    var varCategoria = document.getElementById('ddlCategoria');
    var varArea = document.getElementById('ddlArea');

    var varDescripcionProyecto = document.getElementById('txtDescripcionProyecto');
    //var validacionNum = 0; // para pruebas

    $('#btnContinuar').click(function () {
        //validacionNum++; // para pruebas
        //alert("validacionNum: " + validacionNum); // para pruebas

        // ...y lo agregamos al if principal
        if (
            valCampo(varNombres) && valEmail(varCorreo) &&
            valCampo(varTelefono) && valDropDownList(varSexo) && valCampo(varEdad)
            &&
            valCampo(varInstitucion) && valCampo(varDomicilio) &&
            valCampo(varNombreAsesor) && valEmail(varCorreoAsesor)
            &&
            valCampo(varNombreProyecto) &&
            valDropDownList(varCategoria) && valDropDownList(varArea) &&
            valCampo(varDescripcionProyecto) && valMaxLengthTextArea(varDescripcionProyecto, 1000)
            ) {
            $("#divDatos *").attr("disabled", "disabled").off('click');
            $('#btnContinuar').hide();
            $('#divConfirmacion').fadeIn(200); // Presentamos el modulo de confirmacion
        }
        else {
        }

    });

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
        $("#divDatos *").removeAttr("disabled");
    });
});