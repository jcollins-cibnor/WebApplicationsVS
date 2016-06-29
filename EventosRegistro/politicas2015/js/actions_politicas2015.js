// JavaScript Document
$(document).ready(function () {
    $('#divConfirmacion').hide();
    $('#divFacturacion').hide();

    /* Desplegado de informacion sobre el formulario opacando el resto */

    $('#divMensaje').hide();

    $('#btnEnviar').click(function () {
        $('#divContainer').css('opacity', '0.2');
        $('#divContainer').css('-webkit-opacity', '0.2');
        $('#divMensaje').fadeIn(800);
    });

    /* EOF: Desplegado de informacion sobre el formulario opacando el resto */


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
    //function valDropDownList(objCampo) {
    //    if (objCampo.selectedIndex == 0) {
    //        objCampo.style.border = '1px solid red';
    //        alert("Selecciona una opcion");
    //        return false;
    //    }
    //    objCampo.style.border = 'none';
    //    return true;
    //}

    // **********************************************************************************************
    // Esta funcion es la principal y revisa los campos uno por uno y "deja pasar" si todo esta bien
    // Creamos una variable para cada campo a validar...
    var campo = document.getElementById('txtNombres');
    var email = document.getElementById('txtCorreo');
    var emailconfirma = document.getElementById('txtCorreoConfirma');
    var tour = document.getElementById('ddlParticipa');
    var factRFC = document.getElementById('txtFacturaRfc');
    var factNombre = document.getElementById('txtFacturaNombre');
    var factDomicilio = document.getElementById('txtDomicilio');
    var comprobante = document.getElementById('fuArchivo');
    //var validacionNum = 0;
    $('#btnContinuar').click(function () {
        //validacionNum++;
        //alert("validacionNum: " + validacionNum);
        // ...y lo agregamos al if principal
        if (valCampo(campo) && valEmail(email) && valCamposIguales(email, emailconfirma)
            //&& valCampo(factRFC) && valCampo(factNombre) && valCampo(factDomicilio) && valCampo(comprobante)
            ) {
            $("#divDatos *").attr("disabled", "disabled").off('click');
            $('#btnContinuar').hide();
            $('#divConfirmacion').fadeIn(200); // Presentamos el modulo de confirmacion
        }
        else {
        }
    });

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