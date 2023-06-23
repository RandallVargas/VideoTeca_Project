using System;
using System.Collections.Generic;

namespace API_UsersAdministration.Models;

public partial class UserImg
{
    public int UserID { get; set; }

    public byte[] imagen { get; set; } = null!;
}
