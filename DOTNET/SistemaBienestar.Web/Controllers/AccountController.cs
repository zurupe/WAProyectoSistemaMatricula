using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SistemaBienestar.Web.Data;
using SistemaBienestar.Web.Models;
using System.Security.Claims;

namespace SistemaBienestar.Web.Controllers
{
    public class AccountController : Controller
    {
        private readonly ApplicationDbContext _context;

        public AccountController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Login()
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string nombreUsuario, string clave)
        {
            if (string.IsNullOrEmpty(nombreUsuario) || string.IsNullOrEmpty(clave))
            {
                ViewBag.Error = "Usuario y contraseña son requeridos";
                return View();
            }

            // Logic from DAOUSUARIO.identificar
            // SELECT * FROM usuario JOIN cargo ... WHERE ESTADO=1 AND NOMBREUSUARIO=? AND CLAVE=?
            var user = await _context.Usuarios
                .Include(u => u.Cargo)
                .FirstOrDefaultAsync(u => u.NombreUsuario == nombreUsuario && u.Clave == clave && u.Estado == true);

            if (user != null)
            {
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, user.NombreUsuario),
                    new Claim("IdUsuario", user.IdUsuario.ToString()),
                    new Claim(ClaimTypes.Role, user.Cargo?.NombreCargo ?? "Sin Cargo")
                };

                var claimsIdentity = new ClaimsIdentity(claims, "CookieAuth");
                var authProperties = new AuthenticationProperties();

                await HttpContext.SignInAsync("CookieAuth", new ClaimsPrincipal(claimsIdentity), authProperties);

                return RedirectToAction("Index", "Home");
            }

            ViewBag.Error = "Credenciales incorrectas o usuario inactivo";
            return View();
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync("CookieAuth");
            return RedirectToAction("Login");
        }
    }
}
