$(document).ready(function () {
    // Asignar el evento de clic al botón
    $('#myButton').on('click', function () {
        var movieId = $(this).data('movie-id');
        LoadUser(movieId);
    });
});

function LoadUser(movieId) {
    var idUser = localStorage.getItem("idUser");
    var username = localStorage.getItem("username");
    var comment = $("#myComment").val();

    if (comment.trim() === '') {
        console.log("El comentario está en blanco. No se enviará.");
        return;
    }

    $.ajax({
        url: '/Client/sendComment',
        type: 'POST',
        data: { comment: comment, idUser: idUser, username: username, movieId: movieId },
        success: function (response) {
            // Manejar la respuesta del controlador si es necesario
            console.log("Valores enviados al controlador con éxito.");
            clearInput(); // Limpiar el texto del input después de enviar el comentario
            showConfirmation(); // Mostrar el mensaje de confirmación después de enviar el comentario
        },
        error: function (xhr, status, error) {
            // Manejar el error si ocurre alguno durante la solicitud AJAX
            console.error("Error al enviar los valores al controlador:", error);
        }
    });
}

function clearInput() {
    $("#myComment").val(''); // Eliminar el texto del input
}

function showConfirmation() {
    alert("¡Comentario enviado con éxito!"); // Mostrar mensaje de confirmación
}