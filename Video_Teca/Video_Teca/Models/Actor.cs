using System;
using System.Collections.Generic;

namespace Video_Teca.Models;

public partial class Actor
{
    public int actor_id { get; set; }

    public string? actor_first_name { get; set; }

    public string? actor_last_name { get; set; }

    public string? movies_series_id { get; set; }

    public virtual MoviesAndSeries? movies_series { get; set; }
}
