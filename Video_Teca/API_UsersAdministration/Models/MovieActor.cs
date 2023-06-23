using System;
using System.Collections.Generic;

namespace API_UsersAdministration.Models;

public partial class MovieActor
{
    public string? movie_id { get; set; }

    public int? actor_id { get; set; }

    public virtual Actor? actor { get; set; }

    public virtual MoviesAndSeries? movie { get; set; }
}
