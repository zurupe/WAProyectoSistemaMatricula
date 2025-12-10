<%-- 
    Document   : index
    Created on : 7 dic 2025, 11:42:54 p. m.
    Author     : pablo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Verificamos si existe la sesión "usuario" (para Administrador según tu Servlet)
    if (session.getAttribute("usuario") == null) {
        // Si es nula, redirigimos al login
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return; // Detenemos la ejecución
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sistema Matricula | Inicio</title>
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

        <header class="main-header">
            <a href="#" class="logo">
                <span class="logo-mini"><b>S</b>MM</span>
                <span class="logo-lg"><b>Sistema Matricula</b> </span>
                
            </a>

            <nav class="navbar navbar-static-top" role="navigation">
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Navegación</span>
                </a>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="https://ui-avatars.com/api/?name=Usuario+Demo&background=random" class="user-image" alt="User Image">
                                <span class="hidden-xs">Usuario</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="user-header">
                                    <img src="https://ui-avatars.com/api/?name=Usuario+Demo&background=random" class="img-circle" alt="User Image">
                                    <p>
                                        Administrador
                                        <small>${usuario.nombreUsuario}</small>
                                    </p>
                                </li>
                                <li class="user-footer">
                                    <div class="pull-right">
                                        <a href="${pageContext.request.contextPath}/srvUsuario?accion=cerrar" class="btn btn-default btn-flat">Cerrar Sesión</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <aside class="main-sidebar">
            <section class="sidebar">
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="https://ui-avatars.com/api/?name=Usuario+Demo&background=random" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p>Bienvenido ${usuario.nombreUsuario}</p>
                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>

                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">INICIO</li>
                    <li class="active"><a href="#" onclick="cargarVista('vistas/resumen.jsp')"><i class="fa fa-link"></i> <span>Panel Administrativo</span></a></li>
                    
                    <li class="treeview">
                        <a href="#"><i class="glyphicon glyphicon-th-large"></i> <span>Registros</span>
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#" onclick="cargarVista('vistas/matricula/matriculaMain.jsp')">
                                <i class="fa fa-archive"></i>Matriculas
                            </a></li>
                            <li><a href="#" onclick="cargarVista('${pageContext.request.contextPath}/UsuarioServlet?accion=listar')">
                                <i class="fa fa-tags"></i>Usuarios
                            </a></li>

                            <li><a href="#"><i class="fa fa-cube"></i>Administradores</a></li>
                            <li><a href="#"><i class="fa fa-users"></i>Personas</a></li>
                        </ul>
                    </li>

                    <li class="treeview">
                        <a href="#"><i class="fa fa-cart-arrow-down"></i> <span>Ventas</span>
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-cart-arrow-down"></i>Nueva Venta</a></li>
                            <li><a href="#"><i class="fa fa-tags"></i>Administrar Ventas</a></li>
                        </ul>
                    </li>
                </ul>
            </section>
        </aside>

        <div class="content-wrapper">
            <section class="content-header">
                <h1>Panel de Control <small>Administrador</small></h1>
                <ol class="breadcrumb">
                    <li><a href="#" onclick="cargarVista('vistas/resumen.jsp')"><i class="fa fa-dashboard"></i> Inicio</a></li>
                    <li class="active">Panel Administrativo</li>
                </ol>
            </section>

            <section class="content">
                <!-- Contenido del panel central determinado por un iframe -->
              <iframe id="frameContent" 
                        src="vistas/resumen.jsp" 
                        style="width: 100%; height: 80vh; border: none;">
              </iframe>

                
            </section>
        </div>

        <footer class="main-footer">
            <div class="pull-right hidden-xs">Versión 1.0</div>
            <strong>Copyright &copy; 2025 <a href="#">Sistema Matricula Monster University</a>.</strong> Todos los derechos reservados.
        </footer>
    </div>
    <script>
    function cargarVista(vista) {
        document.getElementById("frameContent").src = vista;
    }
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/js/adminlte.min.js"></script>
</body>
</html>
