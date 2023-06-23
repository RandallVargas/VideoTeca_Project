using System;
using System.Collections.Generic;

namespace API_UsersAdministration.Models;

public partial class MoviesAndSeries
{
    public string id { get; set; } = null!;

    public string? title { get; set; }

    public string? synopsis { get; set; }

    public DateTime? release_year { get; set; }

    public TimeSpan? duration { get; set; }

    public string? clasification { get; set; }

    public string? director { get; set; }

    public int? num_seasons { get; set; }

    public int? num_episodes { get; set; }

    public TimeSpan? episode_duration { get; set; }

    public string? movie_cover { get; set; }

    public DateTime? year_of_release { get; set; }

    public DateTime? date_addded { get; set; }

    public string? media_type { get; set; }

    public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

    public virtual ICollection<Rating> Ratings { get; set; } = new List<Rating>();
}
