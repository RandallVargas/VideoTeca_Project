using System;
using System.Collections.Generic;

namespace Video_Teca.Models;

public partial class Comment
{
    public string comment_id { get; set; } = null!;

    public string? movie_series_id { get; set; }

    public int? userid { get; set; }

    public string? comment1 { get; set; }

    public string? Username { get; set; }

    public virtual MoviesAndSeries? movie_series { get; set; }

    public virtual User? user { get; set; }
}
