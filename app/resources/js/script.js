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

window.onload = function() {
	checked = $("input[name='mediatype']:checked").val();
	if (checked == "photo"){
		$("#video-source").hide();
		$("#photo-source").show();
	}else if (checked == "video"){
		$("#photo-source").hide();
		$("#video-source").show();
	}
};

$("input[name='mediatype']").change(function() {
	checked = $("input[name='mediatype']:checked").val();
	if (checked == "photo"){
		$("#video-source").hide();
		$("#photo-source").show();
	}else if (checked == "video"){
		$("#photo-source").hide();
		$("#video-source").show();
	}
});