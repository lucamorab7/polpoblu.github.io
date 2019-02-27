 // MDB Lightbox Init
        $(function () {
            $("#mdb-lightbox-ui").load("mdb-addons/mdb-lightbox-ui.html");
        });

        // Adding animations to the sections
        $("section").addClass("wow fadeIn");

        // Animations Init
        new WOW().init();

var figure = $(".video").hover( hoverVideo, hideVideo );

function hoverVideo(e) {  
    $('video-fluid', this).get(0).play(); 
}

function hideVideo(e) {
    $('video-fluid', this).get(0).pause(); 
}
