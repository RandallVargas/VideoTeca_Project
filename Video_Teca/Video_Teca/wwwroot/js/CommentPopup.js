$(document).ready(function () {
    $(".btn-popup").click(function () {// cuando la 
        var movieId = $(this).data("movie-id");
        $.ajax({
            url: "/Client/GetComments",
            type: "POST",
            data: { id: movieId },
            success: function (result) {
                $("#popup-container").fadeIn();
                $("#popup-content").html(result);
                localStorage.getItem("idUser");
            },
            error: function () {
                alert("Error al cargar la informaci�n de la pel�cula.");
            }
        });
    });

    $("#popup-container").click(function () {
        $("#popup-container").fadeOut();
    });

    $("#popup-content").click(function (event) {
        event.stopPropagation();
    });
});