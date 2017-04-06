$(document).ready( function() {
    $('#myCarousel').carousel({
		interval:   4000
	});
	
	var clickEvent = false;
	$('#myCarousel').on('click', '.carouselnav a', function() {
			clickEvent = true;
			$('.carouselnav li').removeClass('active');
			$(this).parent().addClass('active');		
	}).on('slid.bs.carousel', function(e) {
		if(!clickEvent) {
			var count = $('.carouselnav').children().length -1;
			var current = $('.carouselnav li.active');
			current.removeClass('active').next().addClass('active');
			var id = parseInt(current.data('slide-to'));
			if(count == id) {
				$('.carouselnav li').first().addClass('active');	
			}
		}
		clickEvent = false;
	});
});