using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SistemaBienestar.Web.Data;
using SistemaBienestar.Web.Models;

namespace SistemaBienestar.Web.Controllers
{
    [Authorize]
    public class UsuariosController : Controller
    {
        private readonly ApplicationDbContext _context;

        public UsuariosController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            // Load data for Permission Management UI
            ViewBag.Menus = await _context.Menus.ToListAsync();
            ViewBag.Cargos = await _context.Cargos.Where(c => c.Estado == true).ToListAsync();

            var usuarios = await _context.Usuarios.Include(u => u.Cargo).ToListAsync();
            return View(usuarios);
        }

        [HttpGet]
        public async Task<IActionResult> GetPermisos(int idCargo)
        {
            var permisos = await _context.Permisos
                .Where(p => p.IdCargo == idCargo)
                .Select(p => p.IdMenu)
                .ToListAsync();
            return Json(permisos);
        }

        [HttpPost]
        public async Task<IActionResult> SavePermisos(int idCargo, List<int> idMenus)
        {
            var existingPermisos = await _context.Permisos
                .Where(p => p.IdCargo == idCargo)
                .ToListAsync();

            _context.Permisos.RemoveRange(existingPermisos);

            if (idMenus != null && idMenus.Any())
            {
                foreach (var idMenu in idMenus)
                {
                    _context.Permisos.Add(new Permiso { IdCargo = idCargo, IdMenu = idMenu });
                }
            }

            await _context.SaveChangesAsync();
            return Json(new { success = true, message = "Permisos actualizados correctamente" });
        }

        public IActionResult Create()
        {
            ViewBag.IdCargo = new SelectList(_context.Cargos, "IdCargo", "NombreCargo");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Usuario usuario)
        {
            if (ModelState.IsValid)
            {
                _context.Add(usuario);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewBag.IdCargo = new SelectList(_context.Cargos, "IdCargo", "NombreCargo", usuario.IdCargo);
            return View(usuario);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();

            var usuario = await _context.Usuarios.FindAsync(id);
            if (usuario == null) return NotFound();

            ViewBag.IdCargo = new SelectList(_context.Cargos, "IdCargo", "NombreCargo", usuario.IdCargo);
            return View(usuario);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Usuario usuario)
        {
            if (id != usuario.IdUsuario) return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(usuario);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UsuarioExists(usuario.IdUsuario)) return NotFound();
                    else throw;
                }
                return RedirectToAction(nameof(Index));
            }
            ViewBag.IdCargo = new SelectList(_context.Cargos, "IdCargo", "NombreCargo", usuario.IdCargo);
            return View(usuario);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();

            var usuario = await _context.Usuarios
                .Include(u => u.Cargo)
                .FirstOrDefaultAsync(m => m.IdUsuario == id);
            if (usuario == null) return NotFound();

            return View(usuario);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var usuario = await _context.Usuarios.FindAsync(id);
            if (usuario != null)
            {
                _context.Usuarios.Remove(usuario);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Perfiles()
        {
            ViewBag.Cargos = await _context.Cargos.Where(c => c.Estado == true).ToListAsync();
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> GetUsuariosPorCargo(int idCargo)
        {
            var usuarios = await _context.Usuarios.ToListAsync();
            
            var asignados = usuarios.Where(u => u.IdCargo == idCargo)
                                    .Select(u => new { u.IdUsuario, u.NombreUsuario })
                                    .OrderBy(u => u.NombreUsuario)
                                    .ToList();

            var noAsignados = usuarios.Where(u => u.IdCargo != idCargo)
                                      .Select(u => new { u.IdUsuario, u.NombreUsuario })
                                      .OrderBy(u => u.NombreUsuario)
                                      .ToList();

            return Json(new { asignados, noAsignados });
        }

        [HttpPost]
        public async Task<IActionResult> AsignarCargo(int idUsuario, int idCargo)
        {
            var usuario = await _context.Usuarios.FindAsync(idUsuario);
            if (usuario == null) return Json(new { success = false, message = "Usuario no encontrado" });

            usuario.IdCargo = idCargo;
            await _context.SaveChangesAsync();

            return Json(new { success = true });
        }

        [HttpPost]
        public async Task<IActionResult> RemoverCargo(int idUsuario)
        {
            var usuario = await _context.Usuarios.FindAsync(idUsuario);
            if (usuario == null) return Json(new { success = false, message = "Usuario no encontrado" });

            usuario.IdCargo = null;
            await _context.SaveChangesAsync();

            return Json(new { success = true });
        }

        private bool UsuarioExists(int id)
        {
            return _context.Usuarios.Any(e => e.IdUsuario == id);
        }
    }
}
