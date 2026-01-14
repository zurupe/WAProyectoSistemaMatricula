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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Formulario Usuario</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/AdminLTE.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/skins/skin-blue.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-blue sidebar-mini">

    <div class="content-wrapper" style="margin-left: 0;">
        <section class="content-header">
            <h1>
                Usuarios
                <small><%= (u != null) ? "Edición" : "Registro" %></small>
            </h1>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">
                                <i class="fa fa-user"></i> 
                                <%= (u != null) ? "Editar Usuario" : "Nuevo Usuario" %>
                            </h3>
                        </div>
                        
                        <form role="form" action="${pageContext.request.contextPath}/UsuarioServlet" method="post">
                            <div class="box-body">
                                
                                <input type="hidden" name="id" value="<%= (u != null) ? u.getId_usuario() : "" %>">

                                <div class="form-group">
                                    <label for="nombre">Nombre de Usuario:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input type="text" name="nombre" class="form-control" 
                                               value="<%= (u != null) ? u.getNombreUsuario() : "" %>" required placeholder="Ingrese usuario">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="clave">Clave:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <input type="text" name="clave" class="form-control" 
                                               value="<%= (u != null) ? u.getClave() : "" %>" required placeholder="Ingrese contraseña">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Cargo:</label>
                                    <select name="cboCargo" class="form-control">
                                        <option value="1" <%= (u != null && u.getCargo() != null && u.getCargo().getCodigo() == 1) ? "selected" : "" %>>Administrador</option>
                                        <option value="2" <%= (u != null && u.getCargo() != null && u.getCargo().getCodigo() == 2) ? "selected" : "" %>>Empleado</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="estado" <%= (u == null || u.isEstado()) ? "checked" : "" %>> 
                                            <strong>Usuario Activo</strong>
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <div class="box-footer">
                                <a href="${pageContext.request.contextPath}/UsuarioServlet?accion=listar" class="btn btn-default btn-flat">Cancelar</a>
                                <button type="submit" class="btn btn-primary btn-flat pull-right">
                                    <i class="fa fa-save"></i> Guardar
                                </button>
                            </div>
                        </form>
                    </div>
                    </div>
            </div>
        </section>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/js/adminlte.min.js"></script>
</body>
</html>