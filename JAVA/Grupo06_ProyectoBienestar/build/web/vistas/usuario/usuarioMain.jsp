<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ec.edu.monster.modelo.usuario" %>
<%@ page import="ec.edu.monster.modelo.cargo" %>
<%@ page import="ec.edu.monster.modelo.Menu" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sistema | Gestión Usuarios y Permisos</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/AdminLTE.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/skins/skin-blue.min.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <div class="content-wrapper" style="min-height: 500px; margin-left: 0;"> 
            <section class="content-header">
                <h1>Gestión de Seguridad <small>Usuarios y Accesos</small></h1>
            </section>

            <section class="content">
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Listado de Usuarios</h3>
                                <div class="box-tools pull-right">
                                    <a href="${pageContext.request.contextPath}/UsuarioServlet?accion=nuevo" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-user-plus"></i> Nuevo</a>
                                    <a href="${pageContext.request.contextPath}/PerfilesServlet" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-user-plus"></i> Perfiles</a>
                                </div>
                            </div>
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th><th>Usuario</th><th>Estado</th><th>Cargo</th><th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            List<usuario> lista = (List<usuario>) request.getAttribute("listaUsuarios");
                                            if (lista != null && !lista.isEmpty()) {
                                                for (usuario u : lista) {
                                        %>
                                        <tr>
                                            <td><%= u.getId_usuario() %></td>
                                            <td><%= u.getNombreUsuario() %></td>
                                            <td>
                                                <% if(u.isEstado()) { %><span class="label label-success">Activo</span><% } else { %><span class="label label-danger">Inactivo</span><% } %>
                                            </td>
                                            <td><%= (u.getCargo() != null) ? u.getCargo().getNombreCargo() : "Sin Cargo" %></td> 
                                            <td>
                                                <a href="${pageContext.request.contextPath}/UsuarioServlet?accion=editar&id=<%= u.getId_usuario() %>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i></a>
                                            </td>
                                        </tr>
                                        <% } } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="box box-danger">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-key"></i> Configurar Permisos por Cargo</h3>
                            </div>
                            
                            <form action="${pageContext.request.contextPath}/UsuarioServlet" method="POST">
                                <input type="hidden" name="accion" value="guardarPermisos">
                                
                                <div class="box-body">
                                    <div class="form-group">
                                        <label>Seleccione el Cargo a Configurar:</label>
                                        <select class="form-control" name="cboCargo" id="cboCargo" onchange="cargarPermisos()" required>
                                            <option value="">-- Seleccione --</option>
                                            <%
                                                List<cargo> cargos = (List<cargo>) request.getAttribute("listaCargos");
                                                if (cargos != null) {
                                                    for (cargo c : cargos) {
                                            %>
                                                <option value="<%= c.getCodigo() %>"><%= c.getNombreCargo() %></option>
                                            <%      } 
                                                } 
                                            %>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Seleccione las opciones de Menú visibles:</label>
                                        <div class="well" style="max-height: 200px; overflow-y: auto;">
                                            <%
                                                List<Menu> menus = (List<Menu>) request.getAttribute("listaMenus");
                                                if (menus != null) {
                                                    for (Menu m : menus) {
                                            %>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="chkMenu" class="chk-menu" value="<%= m.getIdMenu() %>"> 
                                                        <%= m.getNombre() %>
                                                    </label>
                                                </div>
                                            <%      } 
                                                } 
                                            %>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button type="submit" class="btn btn-danger pull-right">
                                        <i class="fa fa-save"></i> Guardar Permisos
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                         <div class="callout callout-info">
                            <h4>¿Cómo funciona?</h4>
                            <p>Seleccione un cargo en la lista desplegable. El sistema marcará automáticamente las opciones a las que ese cargo tiene acceso actualmente. Marque o desmarque las casillas y haga clic en "Guardar" para actualizar los accesos.</p>
                        </div>
                    </div>
                </div>

            </section>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/js/adminlte.min.js"></script>

    <script>
        function cargarPermisos() {
            var idCargo = document.getElementById("cboCargo").value;
            
            // 1. Limpiar todos los checkboxes primero
            $('.chk-menu').prop('checked', false);

            if (idCargo === "") return;

            // 2. Hacer petición AJAX al Servlet para ver qué permisos tiene ese cargo
            $.ajax({
                url: '${pageContext.request.contextPath}/UsuarioServlet',
                type: 'GET',
                data: { 
                    accion: 'obtenerPermisosJson', 
                    idCargo: idCargo 
                },
                dataType: 'json',
                success: function(idsPermitidos) {
                    // idsPermitidos será un array ej: [1, 3, 5]
                    
                    // 3. Recorrer checkboxes y marcar los que coincidan
                    $('.chk-menu').each(function() {
                        // $(this).val() es un String, lo convertimos a entero para comparar
                        var idMenuActual = parseInt($(this).val());
                        
                        // Si el array contiene este ID, lo marcamos
                        if (idsPermitidos.includes(idMenuActual)) {
                            $(this).prop('checked', true);
                        }
                    });
                },
                error: function(err) {
                    console.error("Error al cargar permisos", err);
                    alert("Error al cargar los permisos del cargo.");
                }
            });
        }
    </script>
</body>
</html>