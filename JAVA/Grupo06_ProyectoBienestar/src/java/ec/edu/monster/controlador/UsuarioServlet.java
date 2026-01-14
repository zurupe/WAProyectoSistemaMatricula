package ec.edu.monster.controlador;

import ec.edu.monster.modelo.DAOUSUARIO;
import ec.edu.monster.modelo.cargo;
import ec.edu.monster.modelo.usuario;
import ec.edu.monster.modelo.Menu; // <--- IMPORTANTE: Importar la clase Menu
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author pablo
 */
@WebServlet(name ="UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Instanciamos el DAO
    DAOUSUARIO dao = new DAOUSUARIO();

    // doGet: Navegación y AJAX
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {
            case "nuevo":
                request.getRequestDispatcher("vistas/usuario/usuarioForm.jsp").forward(request, response);
                break;
                
            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                usuario usu = dao.leerPorId(idEditar);
                request.setAttribute("user", usu);
                // También necesitamos cargos en el form de edición si es un select
                request.setAttribute("listaCargos", dao.listarCargos()); 
                request.getRequestDispatcher("vistas/usuario/usuarioForm.jsp").forward(request, response);
                break;
                
            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("UsuarioServlet?accion=listar");
                break;
                
            case "listar": 
                // 1. Lista principal de usuarios
                List<usuario> lista = dao.listar();
                request.setAttribute("listaUsuarios", lista);
                
                // 2. NUEVO: Listas para la sección de "Gestión de Permisos"
                request.setAttribute("listaCargos", dao.listarCargos());
                request.setAttribute("listaMenus", dao.listarTodosLosMenus());
                
                request.getRequestDispatcher("vistas/usuario/usuarioMain.jsp").forward(request, response);
                break;

            // --- NUEVO CASO PARA AJAX (JavaScript) ---
            case "obtenerPermisosJson":
                int cargoId = Integer.parseInt(request.getParameter("idCargo"));
                List<Integer> permisos = dao.obtenerIdsMenusPorCargo(cargoId);
                
                // Construimos el JSON manualmente: [1, 2, 5]
                StringBuilder json = new StringBuilder("[");
                for (int i = 0; i < permisos.size(); i++) {
                    json.append(permisos.get(i));
                    if (i < permisos.size() - 1) json.append(",");
                }
                json.append("]");
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json.toString());
                break;
        }
    }

    // doPost: Procesar formularios
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Verificamos qué formulario se envió. 
        // Si no viene parámetro 'accion', asumimos que es guardar usuario (compatibilidad)
        String accion = request.getParameter("accion");
        if(accion == null) accion = "guardarUsuario"; 

        switch(accion) {
            case "guardarPermisos":
                // LÓGICA PARA GUARDAR LOS CHECKBOXES
                try {
                    int idCargo = Integer.parseInt(request.getParameter("cboCargo"));
                    String[] menusSeleccionados = request.getParameterValues("chkMenu"); // Array de strings
                    
                    boolean exito = dao.guardarPermisos(idCargo, menusSeleccionados);
                    
                    // Volvemos a cargar la página principal
                    response.sendRedirect("UsuarioServlet?accion=listar");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("UsuarioServlet?accion=listar");
                }
                break;

            default: 
                // LÓGICA ORIGINAL: GUARDAR/EDITAR USUARIO
                procesarUsuario(request, response);
                break;
        }
    }

    // He separado tu lógica original de guardar usuario en un método privado para mantener el código ordenado
    private void procesarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 1. Recibir parámetros del formulario HTML
        String idStr = request.getParameter("id"); 
        String nombre = request.getParameter("nombre");
        String clave = request.getParameter("clave");
        String estadoStr = request.getParameter("estado"); 
        String cargoIdStr = request.getParameter("cboCargo"); 

        // 2. Crear y llenar el objeto Usuario
        usuario u = new usuario();
        u.setNombreUsuario(nombre);
        u.setClave(clave);
        u.setEstado(estadoStr != null); 

        // 3. Crear y llenar el objeto Cargo
        if(cargoIdStr != null && !cargoIdStr.isEmpty()){
            cargo c = new cargo();
            c.setCodigo(Integer.parseInt(cargoIdStr)); 
            u.setCargo(c); 
        }

        // 4. Decidir si Guardar o Actualizar
        if (idStr == null || idStr.isEmpty()) {
            dao.registrar(u);
        } else {
            u.setId_usuario(Integer.parseInt(idStr));
            dao.actualizar(u);
        }

        // 5. Redireccionar al listado
        response.sendRedirect("UsuarioServlet?accion=listar");
    }
}
