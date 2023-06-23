function deleteMovie() {
    var movieOrSeriesId = $(this).data("movieseries-id");
    document.getElementById('btn-confirmed-delete').addEventListener('click', function () {
        $.ajax({
            url: "/MovSerAdmin/DeleteMS",
            type: "POST",
            data: { id: movieOrSeriesId },
            success: function () {
                // Haz algo despu�s de eliminar la pel�cula o serie
                location.reload();
            },
            error: function () {
                // Muestra una notificaci�n de error
                var modal = new bootstrap.Modal(document.getElementById('modal-movie-deleted'));
                modal.show();
            }
        });
    });

    var modal = new bootstrap.Modal(document.getElementById('modal-delete'));
    modal.show();
}