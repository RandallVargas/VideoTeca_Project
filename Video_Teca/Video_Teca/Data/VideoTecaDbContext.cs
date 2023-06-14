using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Video_Teca.Models;

namespace Video_Teca.Data;

public partial class VideoTecaDbContext : DbContext
{
    public VideoTecaDbContext()
    {
    }

    public VideoTecaDbContext(DbContextOptions<VideoTecaDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Actor> Actors { get; set; }

    public virtual DbSet<AspNetRole> AspNetRoles { get; set; }

    public virtual DbSet<AspNetRoleClaim> AspNetRoleClaims { get; set; }

    public virtual DbSet<AspNetUser> AspNetUsers { get; set; }

    public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }

    public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }

    public virtual DbSet<AspNetUserToken> AspNetUserTokens { get; set; }

    public virtual DbSet<Comment> Comments { get; set; }

    public virtual DbSet<Episode> Episodes { get; set; }

    public virtual DbSet<Genre> Genres { get; set; }

    public virtual DbSet<MovieActor> MovieActors { get; set; }

    public virtual DbSet<MovieGenre> MovieGenres { get; set; }

    public virtual DbSet<MoviesAndSeries> MoviesAndSeries { get; set; }

    public virtual DbSet<Rating> Ratings { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserImg> UserImgs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=163.178.173.130;Database=Video_Teca_C13448_B98314;user id=basesdedatos;password=rpbases.2022;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Actor>(entity =>
        {
            entity.HasKey(e => e.actor_id).HasName("PK__Actors__8B2447B498692522");

            entity.Property(e => e.actor_id).ValueGeneratedNever();
            entity.Property(e => e.actor_first_name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.actor_img)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.actor_last_name)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<AspNetRole>(entity =>
        {
            entity.HasIndex(e => e.NormalizedName, "RoleNameIndex")
                .IsUnique()
                .HasFilter("([NormalizedName] IS NOT NULL)");

            entity.Property(e => e.Name).HasMaxLength(256);
            entity.Property(e => e.NormalizedName).HasMaxLength(256);
        });

        modelBuilder.Entity<AspNetRoleClaim>(entity =>
        {
            entity.HasIndex(e => e.RoleId, "IX_AspNetRoleClaims_RoleId");

            entity.HasOne(d => d.Role).WithMany(p => p.AspNetRoleClaims).HasForeignKey(d => d.RoleId);
        });

        modelBuilder.Entity<AspNetUser>(entity =>
        {
            entity.HasIndex(e => e.NormalizedEmail, "EmailIndex");

            entity.HasIndex(e => e.NormalizedUserName, "UserNameIndex")
                .IsUnique()
                .HasFilter("([NormalizedUserName] IS NOT NULL)");

            entity.Property(e => e.Email).HasMaxLength(256);
            entity.Property(e => e.NormalizedEmail).HasMaxLength(256);
            entity.Property(e => e.NormalizedUserName).HasMaxLength(256);
            entity.Property(e => e.UserName).HasMaxLength(256);

            entity.HasMany(d => d.Roles).WithMany(p => p.Users)
                .UsingEntity<Dictionary<string, object>>(
                    "AspNetUserRole",
                    r => r.HasOne<AspNetRole>().WithMany().HasForeignKey("RoleId"),
                    l => l.HasOne<AspNetUser>().WithMany().HasForeignKey("UserId"),
                    j =>
                    {
                        j.HasKey("UserId", "RoleId");
                        j.ToTable("AspNetUserRoles");
                        j.HasIndex(new[] { "RoleId" }, "IX_AspNetUserRoles_RoleId");
                    });
        });

        modelBuilder.Entity<AspNetUserClaim>(entity =>
        {
            entity.HasIndex(e => e.UserId, "IX_AspNetUserClaims_UserId");

            entity.HasOne(d => d.User).WithMany(p => p.AspNetUserClaims).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<AspNetUserLogin>(entity =>
        {
            entity.HasKey(e => new { e.LoginProvider, e.ProviderKey });

            entity.HasIndex(e => e.UserId, "IX_AspNetUserLogins_UserId");

            entity.HasOne(d => d.User).WithMany(p => p.AspNetUserLogins).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<AspNetUserToken>(entity =>
        {
            entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });

            entity.HasOne(d => d.User).WithMany(p => p.AspNetUserTokens).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<Comment>(entity =>
        {
            entity.HasKey(e => e.comment_id).HasName("PK__Comments__E79576872F1834ED");

            entity.Property(e => e.comment_id)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Username)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.comment1)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("comment");
            entity.Property(e => e.movie_series_id)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.movie_series).WithMany(p => p.Comments)
                .HasForeignKey(d => d.movie_series_id)
                .HasConstraintName("FK__Comments__movie___68487DD7");

            entity.HasOne(d => d.user).WithMany(p => p.Comments)
                .HasForeignKey(d => d.userid)
                .HasConstraintName("FK__Comments__userid__693CA210");
        });

        modelBuilder.Entity<Episode>(entity =>
        {
            entity.HasNoKey();

            entity.Property(e => e.movie_series_id)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.title)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.movie_series).WithMany()
                .HasForeignKey(d => d.movie_series_id)
                .HasConstraintName("FK__Episodes__movie___6E01572D");
        });

        modelBuilder.Entity<Genre>(entity =>
        {
            entity.HasKey(e => e.genre_id).HasName("PK__Genres__18428D42264BF613");

            entity.Property(e => e.genre_id)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.genre_name)
                .HasMaxLength(30)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MovieActor>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("MovieActor");

            entity.Property(e => e.movie_id)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.actor).WithMany()
                .HasForeignKey(d => d.actor_id)
                .HasConstraintName("FK__MovieActo__actor__08B54D69");

            entity.HasOne(d => d.movie).WithMany()
                .HasForeignKey(d => d.movie_id)
                .HasConstraintName("FK__MovieActo__movie__07C12930");
        });

        modelBuilder.Entity<MovieGenre>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("MovieGenre");

            entity.Property(e => e.genre_id)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.movie_id)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.genre).WithMany()
                .HasForeignKey(d => d.genre_id)
                .HasConstraintName("FK__MovieGenr__genre__0B91BA14");

            entity.HasOne(d => d.movie).WithMany()
                .HasForeignKey(d => d.movie_id)
                .HasConstraintName("FK__MovieGenr__movie__0A9D95DB");
        });

        modelBuilder.Entity<MoviesAndSeries>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__MoviesAn__3213E83F45A5D960");

            entity.Property(e => e.id)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.clasification)
                .HasMaxLength(3)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.date_addded).HasColumnType("date");
            entity.Property(e => e.director)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.media_type)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.movie_cover)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.release_year).HasColumnType("date");
            entity.Property(e => e.synopsis)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.title)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.year_of_release).HasColumnType("date");
        });

        modelBuilder.Entity<Rating>(entity =>
        {
            entity.HasNoKey();

            entity.Property(e => e.movie_series_id)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.rating1).HasColumnName("rating");
            entity.Property(e => e.user_id)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.movie_series).WithMany()
                .HasForeignKey(d => d.movie_series_id)
                .HasConstraintName("FK__Ratings__movie_s__75A278F5");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.Username)
                .HasMaxLength(30)
                .IsUnicode(false);
        });

        modelBuilder.Entity<UserImg>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("UserImg");

            entity.Property(e => e.imagen).HasColumnType("image");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
