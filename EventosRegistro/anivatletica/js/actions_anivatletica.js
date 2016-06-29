// JavaScript Document
$(document).ready(function () {
    $('#sec2').hide();
    $('#divConfirmacion').hide();

    /* div para el Desplegado de informacion sobre el formulario opacando el resto */
    $('#divMensajeEspera').hide();

    $('#rblTipoIndividual').click(function () {
        $('#sec2').fadeOut(300);
    });

    $('#rblTipoEquipo').click(function () {
        $('#sec2').fadeIn(300);
    });

    $('#btnEnviar').click(function () {
        $('#divContainer').css('opacity', '0.2');
        $('#divContainer').css('-webkit-opacity', '0.2');
        $('#divMensajeEspera').fadeIn(300);
    });
    /* EOF: */

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

    function validarDatosPersonales() {
        if (valCampo(nombres) && valEmail(email) && valCamposIguales(email, emailconfirma) &&
            valCampo(edad) && valDropDownList(sexo)
            ) { return true; }
        else { return false; }
    }

    function validarEquipo() {
        if (valCampo(nombreequipo) &&
            valCampo(part2nombre) && valCampo(part2edad) && valDropDownList(part2sexo) &&
            valCampo(part3nombre) && valCampo(part3edad) && valDropDownList(part3sexo) &&
            valCampo(part4nombre) && valCampo(part4edad) && valDropDownList(part4sexo) 
            ) { return true; }
        else { return false; }
    }

    function validarEquipoPares() {
        var pares = 0;
        if (sexo.selectedIndex == 1) { pares++; }
        if (sexo.selectedIndex == 2) { pares--; }
        if (part2sexo.selectedIndex == 1) { pares++; }
        if (part2sexo.selectedIndex == 2) { pares--; }
        if (part3sexo.selectedIndex == 1) { pares++; }
        if (part3sexo.selectedIndex == 2) { pares--; }
        if (part4sexo.selectedIndex == 1) { pares++; }
        if (part4sexo.selectedIndex == 2) { pares--; }

        if (pares == 0) { return true; }
        else {
            alert("El equipo debe estar formado por dos hombres y dos mujeres");
            return false;
        }
    }

    // **********************************************************************************************
    // Esta funcion es la principal y revisa los campos uno por uno y "deja pasar" si todo esta bien
    // Creamos una variable para cada campo a validar...
    var nombres = document.getElementById('txtNombres');
    var email = document.getElementById('txtCorreo');
    var emailconfirma = document.getElementById('txtCorreoConfirma');
    var edad = document.getElementById('txtEdad');
    var sexo = document.getElementById('ddlSexo');

    var nombreequipo = document.getElementById('txtNombreEquipo');
    var part2nombre = document.getElementById('txtNombreParticipante2');
    var part2edad = document.getElementById('txtEdadParticipante2');
    var part2sexo = document.getElementById('ddlSexoParticipante2');
    var part3nombre = document.getElementById('txtNombreParticipante3');
    var part3edad = document.getElementById('txtEdadParticipante3');
    var part3sexo = document.getElementById('ddlSexoParticipante3');
    var part4nombre = document.getElementById('txtNombreParticipante4');
    var part4edad = document.getElementById('txtEdadParticipante4');
    var part4sexo = document.getElementById('ddlSexoParticipante4');

    var tipoRegistro = document.getElementsByName('rblTipoRegistro');
    var validacion = false;
    //var validacionNum = 0; // para pruebas
    $('#btnContinuar').click(function () {
        //validacionNum++; // para pruebas
        //alert("validacionNum: " + validacionNum); // para pruebas

        // ...y lo agregamos al if principal
        //if (valCampo(nombres) && valEmail(email) && valCamposIguales(email, emailconfirma) &&
        //    valCampo(edad) && valDropDownList(sexo)
        //    ) {

        var tipoInd = tipoRegistro.item(0).checked.valueOf();
        var tipoEq = false; // tipoRegistro.item(1).checked.valueOf();
        
        // Obtenemos el valor del tipo de registro AQUI ME QUEDE !!!!!!!!!!!!!!
        if (tipoInd) {
            validacion = validarDatosPersonales();
        }
        else if (tipoEq) {
            validacion = validarDatosPersonales() && validarEquipo() && validarEquipoPares();
//            validacion = validarEquipoPares();
        }
        else { alert("Selecciona un tipo de registro"); }

//        alert(validacion);
        
        if (validacion) {
            $("#divDatos *").attr("disabled", "disabled").off('click');
            $('#btnContinuar').hide();
            $('#divConfirmacion').fadeIn(200); // Presentamos el modulo de confirmacion
        }
        else {
        }

    });


    //// MODULO DE PRUEBA INDIVIDUAL
    //$('#btnContinuar').click(function () {
    //    if (valCampo(nombrepart1)) {
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