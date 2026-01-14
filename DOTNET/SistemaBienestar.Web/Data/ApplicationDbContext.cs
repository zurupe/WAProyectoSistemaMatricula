using Microsoft.EntityFrameworkCore;
using SistemaBienestar.Web.Models;

namespace SistemaBienestar.Web.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Cargo> Cargos { get; set; }
        public DbSet<Empleado> Empleados { get; set; }
        public DbSet<Menu> Menus { get; set; }
        public DbSet<Permiso> Permisos { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            
            // Map entities to lowercase table names to match Java project conventions
            modelBuilder.Entity<Usuario>().ToTable("usuario");
            modelBuilder.Entity<Cargo>().ToTable("cargo");
            modelBuilder.Entity<Empleado>().ToTable("empleado");
            modelBuilder.Entity<Menu>().ToTable("menu");
            modelBuilder.Entity<Permiso>().ToTable("permiso");

            // Configure composite key for Permiso
            modelBuilder.Entity<Permiso>()
                .HasKey(p => new { p.IdCargo, p.IdMenu });
        }
    }
}
