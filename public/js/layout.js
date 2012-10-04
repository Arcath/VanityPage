$(function(){
	window_height = $(window).height();
	$('.page').css("min-height", window_height - 60);
});

$('#navbar').scrollspy();