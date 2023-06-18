$(document).ready(function () {
    // Evento de búsqueda en tiempo real
    $('#searchInput').keyup(function () {
        var searchText = $(this).val();
        if (searchText.length >= 3) {
            $.ajax({
                url: '/Client/GetSearch',
                type: 'GET',
                data: { searchText: searchText },
                success: function (data) {
                    $('#searchResults').html(data);
                }
            });
        } else {
            $('#searchResults').html('');
        }
    });

    // Resto del código onload
    // ...
});

$(document).ready(function () {
    $('#filterButton').click(function () {
        var selectedGenres = [];
        $('input[name="genre"]:checked').each(function () {
            selectedGenres.push($(this).val());
        });

        $.ajax({
            url: '/Client/FilterByGenres',
            type: 'POST',
            data: { genres: selectedGenres },
            success: function (data) {
                $('#filteredResults').html(data);
            },
            error: function () {
                alert('Error al filtrar los resultados.');
            }
        });
    });
});