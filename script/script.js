$(document).ready(function () {
    $(".button").on("click", function () {
        $(this).addClass("active").siblings().removeClass("active");
    }), $(".button").on("click", function () {
        var value = $(this).attr("data-filter");
        if (value == "all") {
            $('.filter').fadeIn(1000);
        } else {
            $('.filter').not('.' + value).fadeOut(1000);
            $('.filter').filter('.' + value).fadeIn(1000);
        }
    });
})

 $('.gallery ul li a').click(function() {
     var itemID = $(this).attr('href');
     $('.gallery ul').addClass('item_open');
     $(itemID).addClass('item_open');
     return false;
 });
 $('.close').click(function() {
     $('.port, .gallery ul').removeClass('item_open');
     return false;
 });

 $(".gallery ul li a").click(function() {
     $('html, body').animate({
         scrollTop: parseInt($("#top").offset().top)
     }, 400);
 });