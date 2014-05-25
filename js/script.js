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
	$('#phone1').mask("(99) 99999999?9");
	$('#phone2').mask("(99) 99999999?9");
	$('#cpf').mask("999.999.999-99");
});

// ADMIN

function hideDivs(){
	$('.events-list').hide();
	$('.news-list').hide();
	$('.news-edit').hide();
	$('.users-list').hide();
	$('.media-list').hide();
	$('.inscriptions-list').hide();
	$('.config').hide();
	$('.config-template').hide();
	$('.config-banners').hide();
	$('.dropdown-events').removeClass('active');
	$('.dropdown-news').removeClass('active');
	$('.dropdown-users').removeClass('active');
	$('.dropdown-media').removeClass('active');
	$('.dropdown-inscriptions').removeClass('active');
	$('.dropdown-config').removeClass('active');
}

$("#btn-events-list").click(function(){
	hideDivs();
	$('.events-list').fadeIn();
	$('.dropdown-events').addClass('active');
});

$("#btn-news-list").click(function(){
	hideDivs();
	$('.news-list').fadeIn();
	$('.dropdown-news').addClass('active');
});

$("#btn-news-new").click(function(){
	hideDivs();
	$('.news-edit').fadeIn();
	$('.dropdown-news').addClass('active');
});

$("#btn-users-list").click(function(){
	hideDivs();
	$('.users-list').fadeIn();
	$('.dropdown-users').addClass('active');
});

$("#btn-media-list").click(function(){
	hideDivs();
	$('.media-list').fadeIn();
	$('.dropdown-media').addClass('active');
});

$("#btn-inscriptions-list").click(function(){
	hideDivs();
	$('.inscriptions-list').fadeIn();
	$('.dropdown-inscriptions').addClass('active');
});

$("#btn-config").click(function(){
	hideDivs();
	$('.config').fadeIn();
	$('.dropdown-config').addClass('active');
});

$("#btn-config-template").click(function(){
	hideDivs();
	$('.config-template').fadeIn();
	$('.dropdown-config').addClass('active');
});

$("#btn-config-banners").click(function(){
	hideDivs();
	$('.config-banners').fadeIn();
	$('.dropdown-config').addClass('active');
});