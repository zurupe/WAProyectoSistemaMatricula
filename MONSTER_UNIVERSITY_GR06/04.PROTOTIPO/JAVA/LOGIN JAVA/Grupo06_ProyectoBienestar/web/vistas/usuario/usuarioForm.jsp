<%-- 
    Document   : usuarioForm
    Created on : 9 dic 2025, 5:44:56 p. m.
    Author     : pablo
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ec.edu.monster.modelo.usuario" %>
<%
    // Recuperamos el usuario si viene del botón "Editar"
    usuario u = (usuario) request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Formulario Usuario</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0"><%= (u != null) ? "Editar Usuario" : "Nuevo Usuario" %></h4>
                    </div>
                    
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/UsuarioServlet" method="post">
                            
                            <input type="hidden" name="id" value="<%= (u != null) ? u.getId_usuario() : "" %>">

                            <div class="mb-3">
                                <label class="form-label">Nombre de Usuario:</label>
                                <input type="text" name="nombre" class="form-control" 
                                       value="<%= (u != null) ? u.getNombreUsuario() : "" %>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Clave:</label>
                                <input type="text" name="clave" class="form-control" 
                                       value="<%= (u != null) ? u.getClave() : "" %>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Cargo:</label>
                                <select name="cboCargo" class="form-select">
                                    <option value="1" <%= (u != null && u.getCargo() != null && u.getCargo().getCodigo() == 1) ? "selected" : "" %>>Administrador</option>
                                    <option value="2" <%= (u != null && u.getCargo() != null && u.getCargo().getCodigo() == 2) ? "selected" : "" %>>Empleado</option>
                                </select>
                            </div>

                            <div class="mb-3 form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="estado" id="chkEstado" 
                                       <%= (u == null || u.isEstado()) ? "checked" : "" %>>
                                <label class="form-check-label" for="chkEstado">Usuario Activo</label>
                            </div>

                            <hr>

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/UsuarioServlet?accion=listar" class="btn btn-secondary">Cancelar</a>
                                
                                <button type="submit" class="btn btn-success">Guardar</button>
                            </div>

                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>