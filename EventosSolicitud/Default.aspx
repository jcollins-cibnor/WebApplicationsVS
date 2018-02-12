<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />

    <title>CIBNOR - Solicitud de Evento</title>
    <!--<link rel="icon" href="img/icon_eventos.ico"> -->
</head>

<body style="padding-top:20px;">
<div id="wrapper">

  <form id="form1" runat="server">
        
    <div class="col-header" style="margin-top:20px;">      
        <label class="encabezado">Solicitud de Evento</label>
    </div>
	<div class="col-1">
        <label class="labelLeyenda">
			<ul>
                <li>Si desea una nueva solicitud, presione Siguiente.</li>
                <li>Si ya cuenta con una, es posible reprogramarla.</li>
			</ul>
        </label>
    </div>
	<input type="hidden" value="8 REQUIERE PRESENCIA DEL DG, REPROGRAMADO?, FOLIO PREVIO">
    <input type="hidden" value="EL PADDING DEL DIV Y EL DEL LABEL SIGUIENTE FUERON NECESARIOS PARA IGUALAR LO ALTO DEL RENGLON A LOS DEMAS">
    <div class="col-2" style="padding-top:16px; padding-bottom:1px;">
       	<label style="padding:29px 0px 9px 20px;" tabindex="82">&iquest;Evento reprogramado?&nbsp;&nbsp;
			<input type="checkbox" class="js-switch" id="chkEventoReprogramado" style="margin:0px; padding:0px;" >
        </label>
    </div>
    <div class="col-2" id="divFolioOriginal">
        <label>
        	Folio previo (9 digitos)
            <input placeholder="Numero..." id="txtFolioOriginal" tabindex="84" >
        </label>
    </div>
            
    <hr>
        
    <div class="col-submit">
        <button id="btnSiguiente" type="button" class="submitbtn btnConfirm" tabindex="100">Siguiente</button>
    </div>
        
  </form>

</div>
</body>
<footer>

    <link rel="stylesheet" type="text/css" media="all" href="css/styles.css"><!-- CSS general de la plantilla -->
    <link rel="stylesheet" type="text/css" media="all" href="css/switchery.min.css"> <!-- CSS general de la plantilla -->
    <script type="text/javascript" src="js/switchery.min.js"></script><!-- JS de la plantilla -->
    
    <script type="text/javascript" src="js/jquery.js"></script><!-- JQ base ver1.11  -->

    <script type="text/javascript" src="js/validations.js"></script><!-- JS validaciones posteriores  -->

    <script type="text/javascript">
    $(document).ready(function () { 
        var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch')); // INCIALIZA LOS CONTROLES
        elems.forEach(function (html) {
            var switchery = new Switchery(html);
        });
        // EOF		

        $('#divFolioOriginal').hide();

        var varEventoReprogramado = document.getElementById('chkEventoReprogramado'); // SI ES UN EVENTO REPROGRAMADO...
        $('#chkEventoReprogramado').click( function() {
        	if (varEventoReprogramado.checked) { $('#divFolioOriginal').fadeIn(300); }
        	else { $('#divFolioOriginal').fadeOut(300); }
        });
        // EOF
        document.getElementById("btnSiguiente").focus(); // Le damos el foco al boton

        $('#btnSiguiente').click(function () {

            var arrayControlesInvalidos = []; // Arreglo para los controles no validos
            var validado = false; // variable para indicar el estado de todo el formulario
            // ¿Evento reporgramado? SI -- Entonces valida lo siguiente
            if (document.getElementById('chkEventoReprogramado').checked) {
            	varCampoRequerido = document.getElementById('txtFolioOriginal');
            	validado = (valCampo(varCampoRequerido)) ? true : arrayControlesInvalidos.push(varCampoRequerido.id);

            	if (arrayControlesInvalidos.length > 0) { // No paso la validacion...
            	    document.getElementById(arrayControlesInvalidos[0]).focus();
            	    alert("Por favor, capture el campo requerido."); // ... y avisamos al usuario con un alert
            	}
            	else {
            	    var folio = document.getElementById('txtFolioOriginal').value;
            	    window.location.assign("./ConsultaIndividual.aspx?Id=" + folio); // Para pruebas
            	    // window.location.assign("./SolicitudRep.aspx?Id=" + folio); // Se descomenta cuando se desarrolle la parte de reprogramar evento
            	}

            }
            else {
                window.location.assign("./solicitudNva.aspx");
            }


        });

        // Esta funcion revisa el campo requerido
        function valCampo(objCampo) {
            valor = objCampo.value;
            if ((valor == '') || (valor.length != 9)) {
                objCampo.style.border = '1px solid red';
                return false;
            }
            objCampo.style.border = 'none';
            return true;
        }

    });
    </script>


</footer>

</html>