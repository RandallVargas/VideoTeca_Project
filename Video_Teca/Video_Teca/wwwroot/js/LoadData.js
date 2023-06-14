$(document).ready(function () {
    // Asignar el evento de clic al bot�n
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
        console.log("El comentario est� en blanco. No se enviar�.");
        return;
    }
    $.ajax({
        url: '/Client/sendComment',
        type: 'POST',
        data: { comment: comment, idUser: idUser, username: username, movieId:movieId },
        success: function (response) {
            // Manejar la respuesta del controlador si es necesario
            console.log("Valores enviados al controlador con �xito.");
        },
        error: function (xhr, status, error) {
            // Manejar el error si ocurre alguno durante la solicitud AJAX
            console.error("Error al enviar los valores al controlador:", error);
        }
    });
}
