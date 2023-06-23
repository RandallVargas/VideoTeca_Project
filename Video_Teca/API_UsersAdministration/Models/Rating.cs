using System;
using System.Collections.Generic;

namespace API_UsersAdministration.Models;

public partial class Rating
{
    public int rating_id { get; set; }

    public string? movie_series_id { get; set; }

    public string? user_id { get; set; }

    public int? rating1 { get; set; }

    public virtual MoviesAndSeries? movie_series { get; set; }
}
