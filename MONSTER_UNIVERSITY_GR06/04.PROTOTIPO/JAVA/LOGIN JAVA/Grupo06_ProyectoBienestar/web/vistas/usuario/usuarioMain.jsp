<%-- 
    Document   : usuario
    Created on : 8 dic 2025, 12:03:32 p. m.
    Author     : pablo
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ec.edu.monster.modelo.usuario" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lista de Usuarios</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container mt-5">
        
        <div class="row mb-4">
            <div class="col-md-8">
                <h1 class="display-6">Gestión de Usuarios</h1>
            </div>
            <div class="col-md-4 text-end">
                <a href="${pageContext.request.contextPath}/UsuarioServlet?accion=nuevo" class="btn btn-primary">
                    + Nuevo Usuario
                </a>
                <a href="${pageContext.request.contextPath}/vistas/resumen.jsp" class="btn btn-secondary ms-2">Volver</a>
            </div>
        </div>

        <div class="card shadow-sm">
            <div class="card-body">
                <table class="table table-striped table-hover align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nombre Usuario</th>
                            <th>Estado</th>
                            <th>Cargo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            // Recuperamos la lista
                            List<usuario> lista = (List<usuario>) request.getAttribute("listaUsuarios");
                            
                            if (lista != null && !lista.isEmpty()) {
                                for (usuario u : lista) {
                        %>
                        <tr>
                            <td><%= u.getId_usuario() %></td>
                            <td><strong><%= u.getNombreUsuario() %></strong></td>
                            <td>
                                <% if(u.isEstado()) { %>
                                    <span class="badge bg-success">Activo</span>
                                <% } else { %>
                                    <span class="badge bg-danger">Inactivo</span>
                                <% } %>
                            </td>
                            <td><%= (u.getCargo() != null) ? u.getCargo().getNombreCargo() : "Sin Cargo" %></td> 
                            <td>
                                <a href="${pageContext.request.contextPath}/UsuarioServlet?accion=editar&id=<%= u.getId_usuario() %>" 
                                   class="btn btn-warning btn-sm text-dark">
                                    Editar
                                </a>
                                
                                <a href="${pageContext.request.contextPath}/UsuarioServlet?accion=eliminar&id=<%= u.getId_usuario() %>" 
                                   class="btn btn-danger btn-sm" 
                                   onclick="return confirm('¿Estás seguro de eliminar al usuario <%= u.getNombreUsuario() %>?');">
                                    Eliminar
                                </a>
                            </td>
                        </tr>
                        <% 
                                }
                            } else {
                        %>
                            <tr>
                                <td colspan="5" class="text-center text-muted py-4">
                                    No hay usuarios registrados en la base de datos.
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
