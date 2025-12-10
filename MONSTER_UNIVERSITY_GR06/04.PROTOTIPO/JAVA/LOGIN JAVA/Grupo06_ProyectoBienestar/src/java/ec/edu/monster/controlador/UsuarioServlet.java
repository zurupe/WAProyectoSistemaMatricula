/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.monster.controlador;

import ec.edu.monster.modelo.DAOUSUARIO;
import ec.edu.monster.modelo.cargo;
import ec.edu.monster.modelo.usuario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
/**
 *
 * @author pablo
 */
@WebServlet(name ="UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Instanciamos el DAO
    DAOUSUARIO dao = new DAOUSUARIO();

    // doGet: Se usa para navegar (Listar, ir al formulario de nuevo, ir al de editar, eliminar)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {
            case "nuevo":
                // Enviamos al formulario vacío
                request.getRequestDispatcher("vistas/usuario/usuarioForm.jsp").forward(request, response);
                break;
                
            case "editar":
                // Obtenemos el ID, buscamos el usuario y lo mandamos al JSP para llenar los campos
                int idEditar = Integer.parseInt(request.getParameter("id"));
                usuario usu = dao.leerPorId(idEditar);
                request.setAttribute("user", usu);
                request.getRequestDispatcher("vistas/usuario/usuarioForm.jsp").forward(request, response);
                break;
                
            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                // Redireccionamos a listar para refrescar la tabla
                response.sendRedirect("UsuarioServlet?accion=listar");
                break;
                
            case "listar": 
                List<usuario> lista = dao.listar();
                request.setAttribute("listaUsuarios", lista);
                request.getRequestDispatcher("vistas/usuario/usuarioMain.jsp").forward(request, response);
                break;
        }
    }

    // doPost: Se usa para procesar el formulario (Guardar o Actualizar)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Recibir parámetros del formulario HTML
        String idStr = request.getParameter("id"); // Estará vacío si es nuevo
        String nombre = request.getParameter("nombre");
        String clave = request.getParameter("clave");
        String estadoStr = request.getParameter("estado"); // Checkbox
        String cargoIdStr = request.getParameter("cboCargo"); // El value del <select>

        // 2. Crear y llenar el objeto Usuario
        usuario u = new usuario();
        u.setNombreUsuario(nombre);
        u.setClave(clave);
        // El checkbox envía "on" si está marcado, o null si no.
        u.setEstado(estadoStr != null); 

        // 3. Crear y llenar el objeto Cargo
        cargo c = new cargo();
        c.setCodigo(Integer.parseInt(cargoIdStr)); // Asignamos el código que vino del select
        u.setCargo(c); // Metemos el cargo dentro del usuario

        // 4. Decidir si Guardar o Actualizar
        if (idStr == null || idStr.isEmpty()) {
            // Es nuevo
            dao.registrar(u);
        } else {
            // Es edición
            u.setId_usuario(Integer.parseInt(idStr));
            dao.actualizar(u);
        }

        // 5. Redireccionar al listado
        response.sendRedirect("UsuarioServlet?accion=listar");
    }
}
