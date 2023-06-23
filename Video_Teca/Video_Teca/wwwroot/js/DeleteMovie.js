$(document).ready(function () {
    $('.btn-eliminar').click(function () {
        var movieOrSeriesId = $(this).data("movie-series-id");

        document.getElementById('btn-confirmed-delete').addEventListener('click', function () {
            $.ajax({
                url: "/AdminMovSer/DeleteMS",
                type: "POST",
                data: { id: movieOrSeriesId },
                success: function () {
                    // Haz algo después de eliminar la película o serie
                    location.reload();
                },
                error: function () {
                    // Muestra una notificación de error
                    var modal = new bootstrap.Modal(document.getElementById('modal-error'));
                    modal.show();
                }
            });
        });

        var modal = new bootstrap.Modal(document.getElementById('modal-delete'));
        modal.show();
    });
});