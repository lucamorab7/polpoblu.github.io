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

