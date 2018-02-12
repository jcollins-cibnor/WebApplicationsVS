
 function valida_fecha(dia,mes,anio){
	//alert('dia'+dia);
	//alert('mes'+mes);
	//alert('anio'+anio);
	if( isNaN(dia) || isNaN(mes) || isNaN(anio) ){
		//alert('no son números el mes el dia o el año');
		alert('El formato de la fecha es incorrecto, recuerde que el formato debe ser aaaa-mm-dd.');
		return false;	
	}
	else if( dia.length != 2 || mes.length !=2 || anio.length !=4 ){
		//alert('la longitud del dia mes o año no es la correcta');
		alert('El formato de la fecha es incorrecto, recuerde que el formato debe ser aaaa-mm-dd.');
		return false;	
	}
	else if( mes > 12 ){
		//alert('el mes no es válido, es mayor a 12');
		alert('El formato de la fecha es incorrecto, recuerde que el formato debe ser aaaa-mm-dd.');
		return false;	
	}
	else if( dia > 31 ){
		//alert('el dia no es válido, es mayor a 31');
		alert('El formato de la fecha es incorrecto, recuerde que el formato debe ser aaaa-mm-dd.');
		return false;	
	}
	else if( dia == 31 && (mes!= 1 && mes!= 3 && mes!= 5 && mes!= 7 &&  mes!= 8 &&  mes!= 10 &&  mes!= 12 ) ){
		//alert('el dia no es válido porq este mes no tiene 31 dias');
		alert('El formato de la fecha  es incorrecto, recuerde que el formato debe ser aaaa-mm-dd.');
		return false;	
	}
	else if( mes==2 && dia== 30 ) {
		//alert('el dia no es válido porq febrero no tiene 30 dias');
		alert('El formato de la fecha es incorrecto, recuerde que el formato debe ser aaaa-mm-dd.');
		return false;	
	}
	else if( mes==2 && dia== 29 && (anio%4)!=0){
		//alert('el dia no es válido porq el año no es bisiesto');
		alert('El formato de la fecha  es incorrecto, recuerde que el formato debe ser aaaa-mm-dd.');
		return false;	
	}
	else{
		return true;	
	}
 }
/*
 function DoCustomValidation(){
	
	var frm = document.forms["add_form_users"];
	var vigencia=frm.usu_vigencia.value;
	var amd=vigencia.split('-');
	
	if(amd.length > 0 ){
		return valida_fecha(amd[2],amd[1],amd[0])
	}
	else{
		amd=vigencia.split('/');
		if(amd.length > 0 ){
			return valida_fecha(amd[2],amd[1],amd[0])
		}
		else
			return false;
	}
 }
 
 frmvalidator.setAddnlValidationFunction(DoCustomValidation);
 frmvalidator.DoCustomValidation;
 */