$(document).ready(function () {
    $('.btn-details').on('click', function () {
        var movieId = $(this).data('movie-id');
        window.location.href = '/Client/Details?id=' + movieId;
    });
});//$(document).ready(function () {
//    $('.btn-more-details').on('click', function () {
//        var movieId = $(this).data('movie-id');
//        loadDetailsView(movieId);
//    });
//});

//function loadDetailsView(movieId) {
//    $.ajax({
//        url: '/Client/Details',
//        type: 'GET',
//        data: { id: movieId },
//        success: function (response) {
//            // Cargar la vista "Details" en algún elemento del DOM
//            $('#detailsContainer').html(response);
//            //location.reload();
//        },
//        error: function (xhr, status, error) {
//            console.error("Error al cargar la vista Details:", error);
//        }
//    });
//}