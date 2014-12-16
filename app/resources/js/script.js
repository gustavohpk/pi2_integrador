//PÁGINA MEDIA

$(".btn-media-photos").click(function(){
	$("#media-main").hide();
	$("#media-videos").hide();
	$("#media-photos").fadeIn();
	setTimeout(
	  function() 
	  {
	  	$("#progress-photos").removeClass('active');
	    $("#progress-photos").removeClass('active');
	    $("#progress-photos").removeClass('progress-striped');
	    $("#progressbar1").removeClass('progress-bar-default');
	    $("#progressbar1").addClass('progress-bar-success');
	    $("#progressbar1").text('Carregado');
	    $("#progress-photos").fadeOut('slow');
	    $(".photos-list").fadeIn('slow');
	  }, 2500);
 });

$(".btn-media-videos").click(function(){
	$("#media-main").hide();
	$("#media-photos").hide();
	$("#media-videos").fadeIn();
	setTimeout(
	  function() 
	  {
	    $("#progress-videos").removeClass('active');
	    $("#progress-videos").removeClass('progress-striped');
	    $("#progressbar2").removeClass('progress-bar-default');
	    $("#progressbar2").addClass('progress-bar-success');
	    $("#progressbar2").text('Carregado');
	    $("#progress-videos").fadeOut('slow');
	    $(".videos-list").fadeIn('slow');
	  }, 2500);
 });

$(document).ready(function(){
	$('#phone1').mask("(99) 99999999?9");
	$('#phone2').mask("(99) 99999999?9");
	$('#cpf').mask("999.999.999-99");
	$("#cep").mask("99.999-999");
	$("#birthday").mask("99/99/9999");
	$("input[name='event[start_date]']").mask("99/99/9999 99:99");
	$("input[name='event[end_date]']").mask("99/99/9999 99:99");
	$("input[name='event[start_date_enrollment]']").mask("99/99/9999 99:99");
	$("input[name='event[end_date_enrollment]']").mask("99/99/9999 99:99");
	$("input[name='cost[date_max][]']").mask("99/99/9999");

	validName = true;
	$("input[name='participant[name]']").change(function(){
		text = $("input[name='participant[name]']").val();
		re = /^[a-zA-Z\s]*$/;
		if(!re.test(text)){
			if (validName == true){
				$("#name-group").append("<span id='name-error' class='glyphicon glyphicon-remove form-control-feedback'></span>");
				$("#name-group").addClass("has-error");
				validName = false;
				$("input[name='participant[name]']").attr("title", "Digite apenas letras e espacos");
			}
		}else if(validName == false){
			validName = true;
			$("#name-error").remove();
			$("#name-group").removeClass("has-error");
			$("input[name='participant[name]']").attr("title", "");
		}
	});

	securePW = true;
	$("input[name='participant[password]']").change(function(){
		text = $("input[name='participant[password]']").val();
		if(text.length < 8 && text.length > 0){
			if (securePW == true){
				$("#password-group").append("<span id='password-warning' class='glyphicon glyphicon-warning-sign form-control-feedback'></span>");
				$("#password-group").addClass("has-warning");
				securePW = false;
				$("input[name='participant[password]']").attr("title", "Para melhor segurança de sua conta, use uma senha com pelo menos 8 dígitos contendo letras e números.");
			}
		}else if(securePW == false){
			securePW = true;
			$("#password-warning").remove();
			$("#password-group").removeClass("has-warning");
			$("input[name='participant[password]']").attr("title", "");
		}
	});

	error = false;
	success = false;
	
	$("input[name='participant[cpf]']").change(function(){
		cpf = $("input[name='participant[cpf]']").val();
		cpf = cpf.replace("-", "");
		cpf = cpf.replace(".","");
		cpf = cpf.replace(".","");
		$.ajax({
			url: validateCpfUrl + cpf,
			success: function(data) {
				if(cpf.length > 0){
					if(data != 1){
						if(error == false){
							$("#cpf-success").remove();
							$("#cpf-group").removeClass("has-success");
							$("#cpf-group").append("<span id='cpf-error' class='glyphicon glyphicon-remove form-control-feedback'></span>");
							$("#cpf-group").addClass("has-error");
							error = true;
							success = false;
							$("input[name='participant[cpf]']").attr("title", "O CPF é inválido ou já está cadastrado.");							
						}
					}else if (success == false){
						$("#cpf-error").remove();
						$("#cpf-group").removeClass("has-error");
						$("#cpf-group").append("<span id='cpf-success' class='glyphicon glyphicon-ok form-control-feedback'></span>");
						$("#cpf-group").addClass("has-success");
						$("input[name='participant[cpf]']").attr("title", "CPF Válido");
						error = false;
						success = true;
					}
				}else{
					error = false;
					success = false;
					$("#cpf-error").remove();
					$("#cpf-success").remove();
					$("#cpf-group").removeClass("has-error");
					$("#cpf-group").removeClass("has-success");
					$("input[name='participant[cpf]']").attr("title", "");		
				}
			}
		});
	});

});


//ADMIN



//Admin Media edit/new


// window.onload = function() {
// 	checked = $("input[name='media[media_type]']:checked").val();
// 	if (checked == "p"){
// 		$("#video-source").hide();
// 		$("#photo-source").show();
// 	}else if (checked == "v"){
// 		$("#photo-source").hide();
// 		$("#video-source").show();
// 	}
// };


$("input[name='media[media_type]']").change(function() {
	checked = $("input[name='media[media_type]']:checked").val();
	if (checked == "p"){
		$("#video-source").hide();
		$("#photo-source").show();
	}else if (checked == "v"){
		$("#photo-source").hide();
		$("#video-source").show();
	}
});

$('.btn-danger').click(function() {
    return window.confirm("Você realmente deseja excluir?");
});

$(document).ready(function() {

    $("[data-toggle=tooltip]").tooltip();
});

$("#address-button").click(function(){
	$("input[name='event[local]']").val("UTFPR - Campus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR");
});

//Relatorios
$.datepicker.setDefaults({
    dateFormat: 'dd/mm/yy',
    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
    dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab','Dom'],
    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
    nextText: 'Próximo',
    prevText: 'Anterior'
});


$("input[name='reports[date_from]']").datepicker();
$("input[name='reports[date_to]']").datepicker();
$("input[name='reports[time_from]']").mask("99:99");
$("input[name='reports[time_to]']").mask("99:99");




$("#cost-add_button").click(function() {
	// $("#cost-table").append("<tr class='cost-row'></tr>");
	// var htmlString = $(".cost-row");
	$(".cost-row").last().clone().insertAfter(".cost-row:last");
	$(".cost-row").last().find(":input[type='hidden']").val("");
	$(".cost-row").last().find(":input[type='number']").val("");
	$(".cost-row").last().find(":input[type='text']").val("");
});

$(".cost-delete-button").click(function() {
	$(this).closest('tr').remove();
});

$("input[name='cost[date_max][]']").datepicker();

$('#searchValue').bind('keypress', function(e)
{
   if(e.keyCode == 13)
   {
   		$("#form-button").click();
   		return false;
   }
});

$("body").on("change", "select[name='event']", function(){
	eventId = $("select[name='event']").val();
  	$.getJSON( enrollmentsUrl + eventId, function (data) {
  		if (data.length <= 0){
  			$("#participant-row").slideUp();
  		}else{
	  		$("select[name='participant']").empty();
	  		$.each(data, function(i, enrollment){
	  			$("select[name='participant']").append("<option value='" + enrollment.id_participant +"'>" + enrollment.participant_name +"</option>");
	  		})
	    	$("#participant-row").slideDown();
	    }
    });
});