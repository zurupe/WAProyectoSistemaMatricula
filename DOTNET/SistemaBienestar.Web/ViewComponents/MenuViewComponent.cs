using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SistemaBienestar.Web.Data;
using SistemaBienestar.Web.Models;
using System.Security.Claims;

namespace SistemaBienestar.Web.ViewComponents
{
    public class MenuViewComponent : ViewComponent
    {
        private readonly ApplicationDbContext _context;

        public MenuViewComponent(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            // Get current user identity name from claims
            var identityName = HttpContext.User.Identity?.Name;
            
            if (string.IsNullOrEmpty(identityName))
            {
                 return View(new List<Menu>());
            }

            // Find the user to get their role (Cargo)
            // We need to join Usuario -> Cargo -> Permiso -> Menu
            // But we already have the Role name in Claims, though checking DB is safer for real-time changes
            
            var user = await _context.Usuarios
                .FirstOrDefaultAsync(u => u.NombreUsuario == identityName && u.Estado == true);

            if (user == null || user.IdCargo == null)
            {
                return View(new List<Menu>());
            }

            // Fetch menus allowed for this user's cargo
            var menus = await _context.Permisos
                .Where(p => p.IdCargo == user.IdCargo)
                .Include(p => p.Menu)
                .Select(p => p.Menu)
                .ToListAsync();

            return View(menus);
        }
    }
}
