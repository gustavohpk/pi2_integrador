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
});


//ADMIN
function openEvent(link){
	eventId = $("#event-id").val();
	if (eventId){
		eventLink = $("#event-link").val();
		eventLink = eventLink.replace("idevento", eventId);
		window.open(eventLink);
	}
};

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