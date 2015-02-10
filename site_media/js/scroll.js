$(document).ready(function() {
    		
    // #scroll_top button effect 
	$(document).on('scroll', function() {
		if ($(this).scrollTop() > 100) {
			$('#scroll_top').fadeIn(200);
		} else {
			$('#scroll_top').fadeOut(200);
		}
	});
    		
	// Scroll to the top of page
	$(document).on('click', '#scroll_top', function() {
		$("html, body").animate({ scrollTop: 0 }, 600);
		return false;
	});
	
});