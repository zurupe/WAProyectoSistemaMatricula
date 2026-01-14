/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ec.edu.monster.controlador.empleado;

import ec.edu.monster.modelo.cargo;
import ec.edu.monster.modelo.empleado.DAOEMPLEADO;
import ec.edu.monster.modelo.empleado.empleado;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
// Imports para PDF (iText 5)
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.OutputStream;

/**
 *
 * @author pablo
 */
@MultipartConfig
@WebServlet(name = "EmpleadoServlet", urlPatterns = {"/EmpleadoServlet"})
public class EmpleadoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    // Instancia del DAO
    DAOEMPLEADO dao = new DAOEMPLEADO();

    // -------------------------------------------------------------------------
    // MÉTODO DOGET: Para navegar (Listar, ir a Nuevo, ir a Editar, Eliminar)
    // -------------------------------------------------------------------------
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {
            case "nuevo":
                // Cargar la lista de cargos para el <select> del formulario
                cargarListaCargos(request);
                // Enviar al JSP de formulario
                request.getRequestDispatcher("vistas/empleado/empleadoMarco.jsp").forward(request, response);
                break;
            case "reportePDF":
            // Llamamos al método que genera el PDF
            generarPDF(response);
            break;

            case "editar":
                // Obtener ID, buscar empleado y enviarlo al formulario
                int id = Integer.parseInt(request.getParameter("id"));
                empleado emp = dao.leerPorId(id);
                
                cargarListaCargos(request); // También necesitamos los cargos aquí
                request.setAttribute("empleado", emp);
                
                request.getRequestDispatcher("vistas/empleado/empleadoMarco.jsp").forward(request, response);
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                // Redireccionar al listado
                response.sendRedirect("EmpleadoServlet?accion=listar");
                break;

            case "listar":
            default:
                List<empleado> lista = dao.listar();
                request.setAttribute("listaEmpleados", lista);
                request.getRequestDispatcher("vistas/empleado/empleadoMain.jsp").forward(request, response);
                break;
        }
    }

    // -------------------------------------------------------------------------
    // MÉTODO DOPOST: Para procesar el Formulario (Guardar / Actualizar + FOTO)
    // -------------------------------------------------------------------------
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // A. Recibir parámetros de texto
        // ---------------------------------------------------
        String idStr = request.getParameter("id");
        String identificador = request.getParameter("identificador");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        
        // Pestaña 1
        String ciudad = request.getParameter("ciudad");
        String direccion = request.getParameter("direccion");
        String estadoCivil = request.getParameter("estadoCivil");
        int idCargo = Integer.parseInt(request.getParameter("cboCargo"));
        
        // Pestaña 2
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        
        // B. Lógica de Subida de Archivo (Imagen) - CORREGIDA
        // ---------------------------------------------------
        Part filePart = request.getPart("foto"); 
        String nombreFoto = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); 
        String rutaFotoDB = ""; 

        // Verificamos si subió un archivo nuevo
        if (nombreFoto != null && !nombreFoto.isEmpty()) {
            try {
                // 1. Definir ruta relativa del proyecto (carpeta 'imagenes')
                String uploadPath = getServletContext().getRealPath("/imagenes");
                
                // Si getRealPath falla (a veces pasa en servidores locales), poner una ruta temporal segura
                if (uploadPath == null) {
                    uploadPath = "C:/temp/imagenes_proyecto"; 
                }

                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs(); // Crea la carpeta si no existe
                }

                // 2. Crear nombre único para evitar sobreescribir (ID + NombreOriginal)
                // Usamos System.currentTimeMillis() por si es un empleado nuevo sin ID
                String nuevoNombre = System.currentTimeMillis() + "_" + nombreFoto;
                
                // 3. Crear el archivo destino
                File file = new File(uploadDir, nuevoNombre);
                
                // 4. Copiar los bytes (SOLUCIÓN AL ERROR DE RUTAS)
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }

                // 5. Guardar la ruta relativa para la base de datos
                rutaFotoDB = "imagenes/" + nuevoNombre;

            } catch (Exception e) {
                e.printStackTrace();
                // Si falla, intentamos no romper todo y dejamos la foto vacía o anterior
                rutaFotoDB = request.getParameter("fotoActual");
            }

        } else {
            // Si no subió foto nueva, mantenemos la que ya tenía (viene del input hidden)
            rutaFotoDB = request.getParameter("fotoActual");
        }

        // C. Llenar el Objeto Empleado
        // ---------------------------------------------------
        empleado e = new empleado();
        e.setIdentificador(identificador);
        e.setNombre(nombre);
        e.setApellidos(apellidos);
        e.setFoto(rutaFotoDB); 
        e.setCiudad(ciudad);
        e.setDireccion(direccion);
        e.setEstadoCivil(estadoCivil);
        e.setTelefono(telefono);
        e.setCorreo(correo);
        
        cargo c = new cargo();
        c.setCodigo(idCargo); 
        e.setCargo(c);

        // D. Guardar en Base de Datos
        // ---------------------------------------------------
        if (idStr == null || idStr.isEmpty()) {
            dao.registrar(e);
        } else {
            e.setIdEmpleado(Integer.parseInt(idStr));
            dao.actualizar(e);
        }

        // Redireccionar al finalizar
        response.sendRedirect("EmpleadoServlet?accion=listar");
    }

    // Método auxiliar para llenar el combo de cargos
    private void cargarListaCargos(HttpServletRequest request) {
        List<cargo> listaCargos = dao.listarCargos(); 
        request.setAttribute("listaCargos", listaCargos);
    }
    /**
     * MÉTODO PARA GENERAR EL PDF
     */
    private void generarPDF(HttpServletResponse response) {
        try {
            // 1. Configurar la respuesta HTTP para que sea un PDF
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=ReporteEmpleados.pdf");

            // 2. Crear el documento
            Document documento = new Document();
            PdfWriter.getInstance(documento, response.getOutputStream());
            documento.open();

            // 3. Título del Documento
            Font fontTitulo = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK);
            Paragraph titulo = new Paragraph("Reporte General de Empleados", fontTitulo);
            titulo.setAlignment(Element.ALIGN_CENTER);
            titulo.setSpacingAfter(20); // Espacio abajo del título
            documento.add(titulo);

            // 4. Crear la Tabla (5 columnas)
            PdfPTable tabla = new PdfPTable(5); 
            tabla.setWidthPercentage(100); // Ancho al 100% de la hoja
            // Definir anchos relativos de columnas (ID, Código, Nombre, Cargo, Teléfono)
            float[] anchos = {1f, 2f, 4f, 2f, 2f}; 
            tabla.setWidths(anchos);

            // --- Encabezados de la Tabla ---
            String[] cabeceras = {"ID", "Cód", "Nombre Completo", "Cargo", "Teléfono"};
            // Fuente blanca para la cabecera
            Font fontHeader = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE);
            
            for (String texto : cabeceras) {
                PdfPCell celda = new PdfPCell(new Phrase(texto, fontHeader));
                celda.setBackgroundColor(BaseColor.DARK_GRAY); // Color de fondo oscuro
                celda.setHorizontalAlignment(Element.ALIGN_CENTER);
                celda.setPadding(8);
                tabla.addCell(celda);
            }

            // 5. Llenar datos desde la Base de Datos
            List<empleado> lista = dao.listar(); // Usamos tu DAO existente
            
            // Fuente normal para los datos
            Font fontData = FontFactory.getFont(FontFactory.HELVETICA, 10, BaseColor.BLACK);

            for (empleado e : lista) {
                // ID
                PdfPCell c1 = new PdfPCell(new Phrase(String.valueOf(e.getIdEmpleado()), fontData));
                c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                tabla.addCell(c1);

                // Identificador
                PdfPCell c2 = new PdfPCell(new Phrase(e.getIdentificador(), fontData));
                c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                tabla.addCell(c2);

                // Nombre Completo
                tabla.addCell(new Phrase(e.getNombre() + " " + e.getApellidos(), fontData));

                // Cargo (Accedemos al objeto cargo)
                String nombreCargo = (e.getCargo() != null) ? e.getCargo().getNombreCargo() : "Sin Cargo";
                tabla.addCell(new Phrase(nombreCargo, fontData));

                // Teléfono
                tabla.addCell(new Phrase(e.getTelefono(), fontData));
            }

            // 6. Agregar tabla al documento y cerrar
            documento.add(tabla);
            documento.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}