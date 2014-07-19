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

    //$("[data-toggle=tooltip]").tooltip();
});

$("#address-button").click(function(){
	$("input[name='event[local]']").val("UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR");
})

$("#cost-add_button").click(function() {
	$("#cost_event").append($(".first-cost").html());
});