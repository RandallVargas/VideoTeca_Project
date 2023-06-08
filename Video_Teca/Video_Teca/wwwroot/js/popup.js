$(document).ready(function () {
    $(".btn-popup").click(function () {
        var movieId = $(this).data("movie-id");
        var popupContent = $("#popup-content-" + movieId);

        $.ajax({
            url: "/Client/GetMovieInfo",
            data: { id: movieId },
            type: "GET",
            success: function (data) {
                popupContent.html(data);
                $("#overlay").fadeIn();
                $("#popup").fadeIn();

            },
            error: function () {
                alert("Error al obtener la información de la película.");
            }
        });
    });

    $("#btn-cerrar-popup").click(function () {
        $("#overlay").fadeOut();
        $("#popup").fadeOut();
    });

    $(document).on("click", function (event) {
        if ($(event.target).closest("#popup").length === 0 && $(event.target).closest(".btn-popup").length === 0) {
            $("#overlay").fadeOut();
            $("#popup").fadeOut();
        }
    });
});

var btnpopup = document.getElementById('btn-popup'),
    overlay = document.getElementById('overlay'),
    popup = document.getElementById('popup'),
    btncerrarpopup = document.getElementById('btn-cerrar-popup');

//btnpopup.addEventListener('click', function () {
//    overlay.classList.add('active');
//    popup.classList.add('active');
   
//});
btncerrarpopup.addEventListener('click', function () {
    overlay.classList.remove('active');
    popup.classList.remove('active');
});

