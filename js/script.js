//PÁGINA ACCOUNT
$("#btn-account-login").click(function(){
	$("#account-register").hide();
	$("#account-login").fadeIn();
 });

$("#btn-account-register").click(function(){
	$("#account-login").hide();
	$("#account-register").fadeIn();
 });


//PÁGINA MEDIA

$("#btn-media-photos").click(function(){
	$("#media-videos").hide();
	$("#media-photos").fadeIn();
	setTimeout(
	  function() 
	  {
	    $("#progress-photos").removeClass('active');
	    $("#progress-photos").removeClass('progress-striped');
	    $("#progressbar1").removeClass('progress-bar-default');
	    $("#progressbar1").addClass('progress-bar-success');
	    $("#progressbar1").text('Carregado');
	    $("#progress-photos").fadeOut('slow');
	    $(".photos-list").fadeIn('slow');
	  }, 2500);
 });

$("#btn-media-videos").click(function(){
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
  $('#phone1').mask("(00) 000000009", {placeholder: "(__) - _________"});
  $('#phone2').mask("(00) 000000009", {placeholder: "(__) - _________"});
  $('#cpf').mask("000.000.000-00", {placeholder: "___.___.___-__"});
});