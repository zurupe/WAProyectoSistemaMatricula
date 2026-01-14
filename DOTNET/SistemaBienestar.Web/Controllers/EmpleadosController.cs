using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SistemaBienestar.Web.Data;
using SistemaBienestar.Web.Models;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace SistemaBienestar.Web.Controllers
{
    [Authorize]
    public class EmpleadosController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;

        public EmpleadosController(ApplicationDbContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            _hostEnvironment = hostEnvironment;
        }

        public async Task<IActionResult> Index()
        {
            var empleados = await _context.Empleados.Include(e => e.Cargo).ToListAsync();
            return View(empleados);
        }

        public IActionResult Create()
        {
            ViewBag.IdCargo = new SelectList(_context.Cargos, "IdCargo", "NombreCargo");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Empleado empleado, IFormFile fotoArchivo)
        {
            if (ModelState.IsValid)
            {
                if (fotoArchivo != null && fotoArchivo.Length > 0)
                {
                    string wwwRootPath = _hostEnvironment.WebRootPath;
                    string fileName = Path.GetFileNameWithoutExtension(fotoArchivo.FileName);
                    string extension = Path.GetExtension(fotoArchivo.FileName);
                    fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                    string path = Path.Combine(wwwRootPath + "/imagenes/", fileName);
                    
                    using (var fileStream = new FileStream(path, FileMode.Create))
                    {
                        await fotoArchivo.CopyToAsync(fileStream);
                    }
                    empleado.Foto = "/imagenes/" + fileName;
                }

                _context.Add(empleado);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewBag.IdCargo = new SelectList(_context.Cargos, "IdCargo", "NombreCargo", empleado.IdCargo);
            return View(empleado);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();

            var empleado = await _context.Empleados.FindAsync(id);
            if (empleado == null) return NotFound();

            ViewBag.IdCargo = new SelectList(_context.Cargos, "IdCargo", "NombreCargo", empleado.IdCargo);
            return View(empleado);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Empleado empleado, IFormFile fotoArchivo)
        {
            if (id != empleado.IdEmpleado) return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    if (fotoArchivo != null && fotoArchivo.Length > 0)
                    {
                        string wwwRootPath = _hostEnvironment.WebRootPath;
                        string fileName = Path.GetFileNameWithoutExtension(fotoArchivo.FileName);
                        string extension = Path.GetExtension(fotoArchivo.FileName);
                        fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                        string path = Path.Combine(wwwRootPath + "/imagenes/", fileName);

                        using (var fileStream = new FileStream(path, FileMode.Create))
                        {
                            await fotoArchivo.CopyToAsync(fileStream);
                        }
                        empleado.Foto = "/imagenes/" + fileName;
                    }

                    _context.Update(empleado);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EmpleadoExists(empleado.IdEmpleado)) return NotFound();
                    else throw;
                }
                return RedirectToAction(nameof(Index));
            }
            ViewBag.IdCargo = new SelectList(_context.Cargos, "IdCargo", "NombreCargo", empleado.IdCargo);
            return View(empleado);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();

            var empleado = await _context.Empleados
                .Include(e => e.Cargo)
                .FirstOrDefaultAsync(m => m.IdEmpleado == id);
            if (empleado == null) return NotFound();

            return View(empleado);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var empleado = await _context.Empleados.FindAsync(id);
            if (empleado != null)
            {
                _context.Empleados.Remove(empleado);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }

        private bool EmpleadoExists(int id)
        {
            return _context.Empleados.Any(e => e.IdEmpleado == id);
        }

        public async Task<IActionResult> GenerarReporte()
        {
            var empleados = await _context.Empleados.Include(e => e.Cargo).ToListAsync();

            QuestPDF.Settings.License = QuestPDF.Infrastructure.LicenseType.Community;

            var document = QuestPDF.Fluent.Document.Create(container =>
            {
                container.Page(page =>
                {
                    page.Size(QuestPDF.Helpers.PageSizes.A4);
                    page.Margin(2, QuestPDF.Infrastructure.Unit.Centimetre);
                    page.PageColor(QuestPDF.Helpers.Colors.White);
                    page.DefaultTextStyle(x => x.FontSize(11));

                    page.Header()
                        .Text("Reporte de Empleados")
                        .SemiBold().FontSize(20).FontColor(QuestPDF.Helpers.Colors.Blue.Medium);

                    page.Content()
                        .PaddingVertical(1, QuestPDF.Infrastructure.Unit.Centimetre)
                        .Table(table =>
                        {
                            table.ColumnsDefinition(columns =>
                            {
                                columns.ConstantColumn(30);
                                columns.RelativeColumn();
                                columns.RelativeColumn();
                                columns.RelativeColumn();
                                columns.RelativeColumn();
                            });

                            table.Header(header =>
                            {
                                header.Cell().Element(CellStyle).Text("ID");
                                header.Cell().Element(CellStyle).Text("Nombres");
                                header.Cell().Element(CellStyle).Text("Apellidos");
                                header.Cell().Element(CellStyle).Text("Cargo");
                                header.Cell().Element(CellStyle).Text("Correo");

                                static QuestPDF.Infrastructure.IContainer CellStyle(QuestPDF.Infrastructure.IContainer container)
                                {
                                    return container.DefaultTextStyle(x => x.SemiBold()).PaddingVertical(5).BorderBottom(1).BorderColor(QuestPDF.Helpers.Colors.Black);
                                }
                            });

                            foreach (var item in empleados)
                            {
                                table.Cell().Element(CellStyle).Text(item.IdEmpleado.ToString());
                                table.Cell().Element(CellStyle).Text(item.Nombre);
                                table.Cell().Element(CellStyle).Text(item.Apellidos);
                                table.Cell().Element(CellStyle).Text(item.Cargo?.NombreCargo ?? "N/A");
                                table.Cell().Element(CellStyle).Text(item.Correo ?? "N/A");

                                static QuestPDF.Infrastructure.IContainer CellStyle(QuestPDF.Infrastructure.IContainer container)
                                {
                                    return container.BorderBottom(1).BorderColor(QuestPDF.Helpers.Colors.Grey.Lighten2).PaddingVertical(5);
                                }
                            }
                        });

                    page.Footer()
                        .AlignCenter()
                        .Text(x =>
                        {
                            x.Span("Página ");
                            x.CurrentPageNumber();
                        });
                });
            });

            var stream = new MemoryStream();
            document.GeneratePdf(stream);
            stream.Position = 0;

            return File(stream, "application/pdf", "ReporteEmpleados.pdf");
        }
    }
}
