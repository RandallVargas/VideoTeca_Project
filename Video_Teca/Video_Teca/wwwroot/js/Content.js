$(document).ready(function () {
    var popupContainer = $("#popup-container");

    $(".btn-popup").click(function () {
        var movieId = $(this).data("movie-id");
        var popupType = $(this).data("popup-type");

        if (popupContainer.is(":visible")) {
            popupContainer.fadeOut();
        } else {
            if (popupType === "actors") {
                // Lógica para cargar y mostrar los actores
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
                        alert("Error al cargar los actores de la película.");
                    }
                });
            } else if (popupType === "reviews") {
                // Lógica para cargar y mostrar los comentarios
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
                        alert("Error al cargar los comentarios de la película.");
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

$(document).ready(function () {
    $('input[name="estrellas"]').click(function () {
        $('input[name="estrellas"]').prop('checked', false);
        $(this).prop('checked', true);
    }).change(function () {
        var rating = $(this).val(); // Obtiene el valor seleccionado

        // Obtener el ID de la película desde el formulario
        var movieSeriesId = $(this).closest('form').data('movie-id');

        // Obtener el ID del usuario desde el localStorage
        var userId = localStorage.getItem("idUser");

        // Realiza la solicitud AJAX al controlador
        $.ajax({
            url: '/Client/SaveRating',
            type: 'POST',
            data: {
                movieSeriesId: movieSeriesId,
                userId: userId,
                rating: rating
            },
            success: function (data) {
                // Actualiza el elemento HTML que muestra el promedio
                $('#promedio').text('Promedio: ' + data);
            },
            error: function () {
                alert('Error al guardar la calificación.');
            }
        });
    });
});