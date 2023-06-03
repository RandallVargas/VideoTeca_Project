using System;
using System.Collections.Generic;

namespace Video_Teca.Models;

public partial class UserImg
{
    public int UserID { get; set; }

    public byte[] imagen { get; set; } = null!;
}
