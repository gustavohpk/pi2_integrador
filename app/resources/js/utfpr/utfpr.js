function toggleMenuDescription(descriptionDiv){

	descriptionDiv.slideToggle("medium");



// 	descriptionDiv.animate({
// 		width: parseInt(descriptionDiv.css('width'),10) == 0 ? descriptionDiv.css('marginLeft', $(window).width()) : 0,
// 		//height: parseInt(descriptionDiv.css('width'),10) == 0 ? 0 : '100%',
// 		marginLeft: -15,
// 	});



// 	setTimeout(
// 		  function() 
// 		  {
// 		  	if(parseInt(descriptionDiv.css('width'),10) == 0){
// 		  		//$("#menu-item-description").empty();
// 		  		descriptionDiv.css('marginLeft', $(window).width());
// 		  	}else{

// 		  	}
// 		  }, 1)
}

$( "#main-menu ul li:nth-child(1)").hover(function(){
	toggleMenuDescription($("#menu-item1-description"));
});

// $("#main-menu ul li:nth-child(2)").hover(function(){
// 	setTimeout(
// 		function() 
// 		{
// 			if($("#menu-item2-description:hover").length == 0)
// 				toggleMenuDescription($("#menu-item2-description"));
// 		}, 500)
	
// });


$("#main-menu ul li:nth-child(2)").mouseenter(function(){
	$("#menu-item2-description").slideDown("medium");
});

$("#main-menu ul li:nth-child(2)").mouseleave(function(){
	setTimeout(
		function() 
		{
			if($("#menu-item2-description:hover").length == 0)
				$("#menu-item2-description").slideUp("medium");
		}, 150)
});

$("#menu-item2-description").mouseleave(function(){
	setTimeout(
		function() 
		{
			if($("#main-menu ul li:nth-child(2):hover").length == 0)
				$("#menu-item2-description").slideUp("medium");
		}, 150)
});


$("#main-menu ul li:nth-child(2)").click(function(){
	$("#main-menu ul li:nth-child(2)").toggleClass("hvr-bubble-float-bottom");
	$("#menu-item2-description .menu-option").toggleClass("flash-background");
	setTimeout(
		function() 
		{
			$("#main-menu ul li:nth-child(2)").toggleClass("hvr-bubble-float-bottom");
			$("#menu-item2-description .menu-option").toggleClass("flash-background");
		}, 500)
});

$("#main-menu ul li:nth-child(5)").click(function(){
	$("#main-menu ul li:nth-child(5)").toggleClass("hvr-bubble-float-bottom");
	$("#menu-item5-description .menu-option").toggleClass("flash-background");
	setTimeout(
		function() 
		{
			$("#main-menu ul li:nth-child(5)").toggleClass("hvr-bubble-float-bottom");
			$("#menu-item5-description .menu-option").toggleClass("flash-background");
		}, 500)
});



// $("#menu-item2-description").hover(function(){
	// if($("#main-menu ul li:nth-child(2):hover").length == 0)
		//toggleMenuDescription($("#menu-item2-description"));
// });

$( "#main-menu ul li:nth-child(3)" ).hover(function(){
	toggleMenuDescription($("#menu-item3-description"));
});

$( "#main-menu ul li:nth-child(4)" ).hover(function(){
	toggleMenuDescription($("#menu-item4-description"));
});

$("#menu-item5-description i").hover(function(){
	$("#menu-item5-description i").toggleClass("fa-spin");
});

$("#main-menu ul li:nth-child(5)").mouseenter(function(){
	$("#menu-item5-description").slideDown("medium");
});

$("#main-menu ul li:nth-child(5)").mouseleave(function(){
	setTimeout(
		function() 
		{
			if($("#menu-item5-description:hover").length == 0)
				$("#menu-item5-description").slideUp("medium");
		}, 150)
});

$("#menu-item5-description").mouseleave(function(){
	setTimeout(
		function() 
		{
			if($("#main-menu ul li:nth-child(5):hover").length == 0)
				$("#menu-item5-description").slideUp("medium");
		}, 150)
});

$( "#main-menu ul li:nth-child(6)" ).hover(function(){
	toggleMenuDescription($("#menu-item6-description"));
});

$( "#main-menu ul li:nth-child(7)" ).hover(function(){
	toggleMenuDescription($("#menu-item7-description"));
});

$( "#main-menu ul li:nth-child(8)" ).hover(function(){
	toggleMenuDescription($("#menu-item8-description"));
});