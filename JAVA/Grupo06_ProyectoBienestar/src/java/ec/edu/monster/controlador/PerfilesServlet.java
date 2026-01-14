package ec.edu.monster.controlador;

import ec.edu.monster.modelo.DAOUSUARIO;
import ec.edu.monster.modelo.usuario;
import ec.edu.monster.modelo.cargo;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "PerfilesServlet", urlPatterns = {"/PerfilesServlet"})
public class PerfilesServlet extends HttpServlet {
    
    DAOUSUARIO dao = new DAOUSUARIO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) accion = "vista";

        switch (accion) {
            case "vista":
                // Cargamos solo los cargos para el Combobox principal
                request.setAttribute("listaCargos", dao.listarCargos());
                request.getRequestDispatcher("vistas/perfilesMain.jsp").forward(request, response);
                break;

            case "cargarListasJson":
                // AJAX: Devuelve usuarios DENTRO y FUERA del cargo seleccionado
                int idCargo = Integer.parseInt(request.getParameter("idCargo"));
                
                List<usuario> dentro = dao.listarUsuariosPorCargo(idCargo);
                List<usuario> fuera = dao.listarUsuariosSinCargo(idCargo);

                // Construcción JSON Manual: {"dentro": [...], "fuera": [...]}
                StringBuilder json = new StringBuilder("{");
                
                json.append("\"dentro\": [");
                for(int i=0; i<dentro.size(); i++){
                    usuario u = dentro.get(i);
                    json.append("{\"id\":").append(u.getId_usuario())
                        .append(",\"nombre\":\"").append(u.getNombreUsuario()).append("\"}");
                    if(i < dentro.size()-1) json.append(",");
                }
                json.append("],");

                json.append("\"fuera\": [");
                for(int i=0; i<fuera.size(); i++){
                    usuario u = fuera.get(i);
                    json.append("{\"id\":").append(u.getId_usuario())
                        .append(",\"nombre\":\"").append(u.getNombreUsuario()).append("\"}");
                    if(i < fuera.size()-1) json.append(",");
                }
                json.append("]");
                
                json.append("}");

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json.toString());
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        
        if ("guardar".equals(accion)) {
            int idCargo = Integer.parseInt(request.getParameter("cboCargo"));
            // Recibimos los IDs que quedaron en la lista DERECHA
            String[] idsDerecha = request.getParameterValues("usuariosAsignados"); 
            
            dao.guardarAsignacionPerfil(idCargo, idsDerecha);
            
            // Respondemos con exito para el AJAX
            response.getWriter().write("ok");
        }
    }
}
