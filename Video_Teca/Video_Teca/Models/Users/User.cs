﻿namespace Video_Teca.Models.Users
{
    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; } = null!;

        public string Email { get; set; } = null!;

        public string Name { get; set; } = null!;
    }
}