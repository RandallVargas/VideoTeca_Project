$(document).ready(function () {
    var popupContainer = $("#popup-container");

    $(".btn-popup").click(function () {
        var movieId = $(this).data("movie-id");
        var popupType = $(this).data("popup-type");

        if (popupContainer.is(":visible")) {
            popupContainer.fadeOut();
        } else {
            if (popupType === "actors") {
                // L�gica para cargar y mostrar los actores
                $.ajax({
                    url: "/Client/GetContent",
                    type: "POST",
                    data: { id: movieId, type: popupType },
                    success: function (result) {
                        $("#popup-content").html(result);
                        localStorage.getItem("idUser");
                        popupContainer.fadeIn();
                    },
                    error: function () {
                        alert("Error al cargar los actores de la pel�cula.");
                    }
                });
            } else if (popupType === "reviews") {
                // L�gica para cargar y mostrar los comentarios
                $.ajax({
                    url: "/Client/GetContent",
                    type: "POST",
                    data: { id: movieId, type: popupType },
                    success: function (result) {
                        $("#popup-content").html(result);
                        localStorage.getItem("idUser");
                        popupContainer.fadeIn();
                    },
                    error: function () {
                        alert("Error al cargar los comentarios de la pel�cula.");
                    }
                });
            }
        }
    });

    $(document).on("click", "#popup-container, .btn-popup", function (event) {
        event.stopPropagation();
    });

    $(document).click(function () {
        if (popupContainer.is(":visible")) {
            popupContainer.fadeOut();
        }
    });
});