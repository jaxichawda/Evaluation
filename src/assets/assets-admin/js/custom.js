const body = document.querySelector('body');
var count = jQuery(window).height() - 138;
body.style.setProperty('--screen-height', count+"px");
// Scroll Header
if (screen.width < 768) {
    var sticky = $('header');
	sticky.addClass('header_fixed');
}
else {
    $(window).scroll(function(){
	  var sticky = $('header'),
		  scroll = $(window).scrollTop();

	  if (scroll >= 200){ sticky.addClass('header_fixed');}
	  else {sticky.removeClass('header_fixed');}
	});
}

// End Scroll Header

//header nav
$('ul.nav li.dropdown').hover(function() {
  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
}, function() {
  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
});
//end header nav

// Back to Top 
$(function(){
  $(window).scroll(function(){
    var scrolled = $(window).scrollTop();
    if (scrolled > 200){ $('.go_top').fadeIn('slow');}
    if (scrolled < 200){ $('.go_top').fadeOut('slow');}
  });
  
  $('.go_top').click(function () {
    $("html, body").animate({ scrollTop: "0" },  500);
  });

});
// End Back to Top

// Tooltip
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});
// End Tooltip 

// Apply Online Scroll
$(".apply_online").click(function() {
    $('html, body').animate({
        scrollTop: $("#apply_online").offset().top
    }, 2000);
});
 $(document).ready(function(){
   $('.file_upload input[type="file"]').change(function(e){
       var fileName = e.target.files[0].name;
	   $('.file_upload input[type="text"]').val(fileName);
   });
});
// Apply Online Scroll

