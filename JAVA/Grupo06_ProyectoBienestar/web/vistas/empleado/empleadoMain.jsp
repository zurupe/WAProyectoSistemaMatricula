<%-- 
    Document   : empleadoMain
    Created on : 10 dic 2025, 11:13:29 a. m.
    Author     : pablo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sistema | Gestión de Empleados</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/AdminLTE.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/skins/skin-blue.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <div class="content-wrapper" style="min-height: 500px; margin-left: 0;"> <section class="content-header">
             
            </section>

            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Tabla de Registros</h3>
                                
                                <div class="box-tools pull-right">
                                    <a href="EmpleadoServlet?accion=reportePDF" target="_blank" class="btn btn-primary btn-sm btn-flat">
                                        <i class="fa fa-book"></i>  Reporte PDF
                                    </a>
                                    <a href="EmpleadoServlet?accion=nuevo" class="btn btn-primary btn-sm btn-flat">
                                        <i class="fa fa-user-plus"></i> Nuevo Empleado
                                    </a>
                                </div>
                            </div>
                            
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Foto</th>
                                            <th>Identificador</th>
                                            <th>Nombre Completo</th>
                                            <th>Cargo</th>
                                            <th>Estado Civil</th>
                                            <th>Contacto</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="e" items="${listaEmpleados}">
                                            <tr>
                                                <td style="vertical-align: middle;">${e.idEmpleado}</td>
                                                <td>
                                                    <img src="${not empty e.foto ? e.foto : 'https://via.placeholder.com/50?text=Sin+Foto'}" 
                                                         class="img-circle" 
                                                         alt="Perfil" 
                                                         style="width: 40px; height: 40px; object-fit: cover;">
                                                </td>
                                                <td style="vertical-align: middle;">
                                                    <span class="label label-default">${e.identificador}</span>
                                                </td>
                                                <td style="vertical-align: middle;">${e.nombre} ${e.apellidos}</td>
                                                
                                                <td style="vertical-align: middle;">
                                                    <span class="label ${e.cargo.nombreCargo == 'ADMINISTRADOR' ? 'label-danger' : 'label-success'}">
                                                        ${e.cargo.nombreCargo}
                                                    </span>
                                                </td>
                                                
                                                <td style="vertical-align: middle;">${e.estadoCivil}</td>
                                                <td style="vertical-align: middle;">
                                                    <small>
                                                        <i class="fa fa-phone"></i> ${e.telefono}<br>
                                                        <i class="fa fa-envelope"></i> ${e.correo}
                                                    </small>
                                                </td>
                                                <td style="vertical-align: middle;">
                                                    <div class="btn-group">
                                                        <a href="EmpleadoServlet?accion=editar&id=${e.idEmpleado}" class="btn btn-warning btn-xs btn-flat" title="Editar">
                                                            <i class="fa fa-edit"></i>
                                                        </a>
                                                        <a href="EmpleadoServlet?accion=eliminar&id=${e.idEmpleado}" 
                                                           class="btn btn-danger btn-xs btn-flat" 
                                                           onclick="return confirm('¿Estás seguro de eliminar al empleado ${e.nombre}?');"
                                                           title="Eliminar">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                
                                <c:if test="${empty listaEmpleados}">
                                    <div class="alert alert-info alert-dismissible" style="margin: 20px;">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <h4><i class="icon fa fa-info"></i> Aviso!</h4>
                                        No hay empleados registrados en la base de datos.
                                    </div>
                                </c:if>
                            </div>
                            </div>
                        </div>
                </div>
            </section>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/js/adminlte.min.js"></script>
</body>
</html>
