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
                    if (data) {
                        $('#ContainerSearch').show();
                    } else {
                        $('#ContainerSearch').hide();
                    }
                    $('#searchResults').html(data);
                }
            });
        } else {
            $('#ContainerSearch').hide();
            $('#searchResults').html('');
        }
    });
  

    // Resto del código onload
    // ...
});

$(document).ready(function () {
    $('#genreFilterForm input[name="genre"]').change(function () {
        filterByGenres();
    });

    function filterByGenres() {
        var selectedGenres = [];
        $('#genreFilterForm input[name="genre"]:checked').each(function () {
            selectedGenres.push($(this).val());
        });

        $.ajax({
            url: '/Client/FilterByGenres',
            type: 'POST',
            data: { genres: selectedGenres },
            success: function (data) {
                $('#searchResults').html(data);
                toggleContainer();
            },
            error: function () {
                alert('Error al filtrar los resultados.');
            }
        });
    }

    // Mostrar u ocultar el contenedor según si hay resultados
    function toggleContainer() {
        var hasResults = ($('#searchResults').children().length > 0);
        if (hasResults) {
            $('#ContainerSearch').show();
        } else {
            $('#ContainerSearch').hide();
        }
    }

    // Llamar a toggleContainer al cargar la página
    toggleContainer();
});
$(document).ready(function () {
    $('#filterButton').click(function () {
        $('#genreFilter').toggle();
    });
});


