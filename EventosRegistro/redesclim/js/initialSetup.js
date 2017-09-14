//(function()){

// Inicializacion y comportamiento ----------------------------------------
$(document).ready(function () {
    // Inicializa los elementos "Fecha"
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    });

    // Inicializa los elementos "Hora"
    $('.timepicker').timepicki();


    var divTrasladoAereo = document.getElementById('trasladoAereo');
    var divTrasladoAutobus = document.getElementById('trasladoAutobus');

    $('#rbTrasladoCuenta').click(function () {
        if (checkInputRadio('rbTrasladoCuenta')) {
            $('#' + divTrasladoAereo.id).fadeOut(200);
            $('#' + divTrasladoAutobus.id).fadeOut(200);
        }
    });
    $('#rbTrasladoAereo').click(function () {
        if (checkInputRadio('rbTrasladoAereo')) {
            $('#' + divTrasladoAereo.id).fadeIn(200);
            $('#' + divTrasladoAutobus.id).fadeOut(200);
        }
    });
    $('#rbTrasladoAutobus').click(function () {
        if (checkInputRadio('rbTrasladoAutobus')) {
            $('#' + divTrasladoAereo.id).fadeOut(200);
            $('#' + divTrasladoAutobus.id).fadeIn(200);
        }
    });

    function checkInputRadio(inputRadioId) {
        var checked = document.getElementById(inputRadioId).checked;
        return checked;
    }
});

// ------------------------------------------------------------------
// Validacion del formulario ----------------------------------------
function valCampo(objCampo) {
    valor = objCampo.value;
    if (valor == '' || valor == null) {
        $('#' + objCampo.id).addClass('alert-danger');
        return false;
    }
    else {
        $('#' + objCampo.id).removeClass('alert-danger');
        return true;
    }
}
function valEmail(objCampo) {
    valor = objCampo.value;
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if ((valor == '') || (valor == null) || !expr.test(valor)) {
        $('#' + objCampo.id).addClass('alert-danger');
        return false;
    }
    else {
        $('#' + objCampo.id).removeClass('alert-danger');
        return true;
    }
}

var formulario = document.getElementById('form1'),
    nombres = document.getElementById('nombres'),
    apellidos = document.getElementById('apellidos'),
    correo = document.getElementById('correo'),
    error = document.getElementById('divError'),
    errorList = document.getElementById('ulError');

function validarFormulario(e)
{
    var totalErrors = 0;
    errorList.innerHTML = "";

    // Valida los campos principales
    var camposArray = [nombres, apellidos];
    for (var i = 0; i < camposArray.length; i++) {
        if (valCampo(camposArray[i]) == false) { totalErrors++; }
    }
    // Valida el correo
    camposArray = [correo];
    if (valEmail(camposArray[0]) == false) { totalErrors++; }
    // Valida los campos de traslado aereo
    var rbTrasladoAereo = document.getElementById('rbTrasladoAereo').checked;
    if (rbTrasladoAereo) {
        var salidaRuta1 = document.getElementById('salidaRuta1'), salidaVuelo1 = document.getElementById('salidaVuelo1'),
            salidaFecha1 = document.getElementById('salidaFecha1'), salidaHora1 = document.getElementById('salidaHora1'),
            regresoRuta1 = document.getElementById('regresoRuta1'), regresoVuelo1 = document.getElementById('regresoVuelo1'),
            regresoFecha1 = document.getElementById('regresoFecha1'), regresoHora1 = document.getElementById('regresoHora1');

        var camposArray = [salidaRuta1, salidaVuelo1, salidaFecha1, salidaHora1, regresoRuta1, regresoVuelo1, regresoFecha1, regresoHora1];
        for (var i = 0; i < camposArray.length; i++) {
            if (valCampo(camposArray[i]) == false) { totalErrors++; }
        }
    }
    // Valida los campos de traslado en autobus
    var rbTrasladoAutobus = document.getElementById('rbTrasladoAutobus').checked;
    if (rbTrasladoAutobus) {
        var rutaOrigen = document.getElementById('rutaOrigen'), rutaLlegada = document.getElementById('rutaLlegada');

        var camposArray = [rutaOrigen, rutaLlegada];
        for (var i = 0; i < camposArray.length; i++) {
            if (valCampo(camposArray[i]) == false) { totalErrors++; }
        }
    }

    if (totalErrors > 0) {
        error.style.display = 'block';
        errorList.innerHTML += '<li>Campos requeridos.</li>';
        e.preventDefault(); // Detiene el envio del formulario
    }
    else {
        $('#btnLoading').removeClass('hidden');
        $('#btnEnviar').addClass('hidden');
        //e.preventDefault(); // Detiene el envio del formulario
    }
}

formulario.addEventListener('submit', validarFormulario);
//}())