using System;
using System.Collections.Generic;

namespace API_UsersAdministration.Models;

public partial class MovieGenre
{
    public string? movie_id { get; set; }

    public string? genre_id { get; set; }

    public virtual Genre? genre { get; set; }

    public virtual MoviesAndSeries? movie { get; set; }
}
