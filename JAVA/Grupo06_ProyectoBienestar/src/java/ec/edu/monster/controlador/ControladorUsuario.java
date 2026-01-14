package ec.edu.monster.controlador;

import ec.edu.monster.modelo.DAOUSUARIO;
import ec.edu.monster.modelo.Menu;
import ec.edu.monster.modelo.usuario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "srvUsuario", urlPatterns = {"/srvUsuario"})
public class ControladorUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try {
            if (accion != null) {
                switch (accion) {
                    case "verificar":
                        verificar(request, response);
                        break;
                    case "cerrar":
                        cerrarsession(request, response);
                    default:
                        response.sendRedirect("login.jsp");
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/mensaje.jsp").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Error" + e.getMessage());
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void verificar(HttpServletRequest request, HttpServletResponse response) throws Exception {
    HttpSession sesion;
    DAOUSUARIO dao = new DAOUSUARIO();
    usuario usuario = this.obtenerUsuario(request); // Tu método que captura txtUsu y txtPass

    // 1. Verificar credenciales
    usuario = dao.identificar(usuario);

    if (usuario != null && usuario.isEstado()) {
        // Usuario logueado correctamente
        sesion = request.getSession();
        
        // 2. MAGIA: Obtenemos el ID del cargo del usuario logueado
        int idCargo = usuario.getCargo().getCodigo(); // Asegúrate que sea .getCodigo() o .getIdCargo() según tu modelo
        
        // 3. Traemos la lista de menús permitidos desde la BD
        List<Menu> listaMenus = dao.obtenerMenusPorRol(idCargo);
        
        // 4. Guardamos todo en sesión
        sesion.setAttribute("usuario", usuario);
        sesion.setAttribute("menus", listaMenus); // <--- ESTO ES LO NUEVO
        
        // 5. Redirigimos siempre al main (el menú dinámico se encargará de mostrar lo correcto)
        this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/main.jsp").forward(request, response);
        
    } else {
        request.setAttribute("msje", "Credenciales Incorrectas o Usuario Inactivo");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}

    private void cerrarsession(HttpServletRequest request, HttpServletResponse response) throws Exception{
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuario", null);
        sesion.invalidate();
        response.sendRedirect("login.jsp");
        
    }

    private usuario obtenerUsuario(HttpServletRequest request) {
        usuario u = new usuario();
        u.setNombreUsuario(request.getParameter("txtUsu"));
        u.setClave(request.getParameter("txtPass"));
        return u;
    }

}
