using System;
using System.Collections.Generic;

namespace Video_Teca.Models;

public partial class Episode
{
    public string? episode_id { get; set; }

    public string? title { get; set; }

    public TimeSpan? duration { get; set; }

    public int? episode_number { get; set; }

    public string? movie_series_id { get; set; }

    public int? season_number { get; set; }

    public virtual MoviesAndSeries? movie_series { get; set; }
}
