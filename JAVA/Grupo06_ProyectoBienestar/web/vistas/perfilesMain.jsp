<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Perfiles</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/AdminLTE.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/skins/skin-blue.min.css">
    
    <style>
        /* Estilo para las listas de selección */
        .dual-list {
            height: 300px !important;
            font-size: 14px;
        }
        .btn-move {
            margin-bottom: 10px;
            width: 100%;
        }
        .center-buttons {
            margin-top: 80px;
        }
    </style>
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <div class="content-wrapper" style="min-height: 500px; margin-left: 0;"> 
            <section class="content-header">
                <h1>Asignación de Usuarios a Cargos</h1>
                <ol class="breadcrumb">
                    <li><a href="vistas/resumen.jsp"><i class="fa fa-dashboard"></i> Inicio</a></li>
                    <li class="active">Perfiles</li>
                </ol>
            </section>

            <section class="content">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Selección de Perfil</h3>
                        <a href="${pageContext.request.contextPath}/UsuarioServlet?accion=listar" class="btn btn-default btn-flat">Volver</a>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label>Seleccione el Cargo a gestionar:</label>
                            <select id="cboCargo" class="form-control" onchange="cargarListas()">
                                <option value="">-- Seleccione un Cargo --</option>
                                <c:forEach var="c" items="${listaCargos}">
                                    <option value="${c.codigo}">${c.nombreCargo}</option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <div id="panelDualList" style="display:none;">
                            <hr>
                            <div class="row">
                                <div class="col-md-5">
                                    <label class="text-muted">Usuarios Disponibles (Otros Cargos)</label>
                                    <select name="listaIzquierda" id="listaIzquierda" class="form-control dual-list" multiple>
                                        </select>
                                </div>

                                <div class="col-md-2 center-buttons text-center">
                                    <button type="button" class="btn btn-default btn-move" onclick="moverTodoDerecha()" title="Mover Todos">
                                        <i class="fa fa-angle-double-right"></i>
                                    </button>
                                    <button type="button" class="btn btn-primary btn-move" onclick="moverDerecha()" title="Mover Seleccionados">
                                        <i class="fa fa-angle-right"></i>
                                    </button>
                                    <button type="button" class="btn btn-primary btn-move" onclick="moverIzquierda()" title="Quitar Seleccionados">
                                        <i class="fa fa-angle-left"></i>
                                    </button>
                                    <button type="button" class="btn btn-default btn-move" onclick="moverTodoIzquierda()" title="Quitar Todos">
                                        <i class="fa fa-angle-double-left"></i>
                                    </button>
                                </div>

                                <div class="col-md-5">
                                    <label class="text-success" id="lblCargoSeleccionado">Usuarios en el Cargo</label>
                                    <select name="listaDerecha" id="listaDerecha" class="form-control dual-list" multiple>
                                        </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer text-right">
                        <button type="button" class="btn btn-success" onclick="guardarCambios()" id="btnGuardar" disabled>
                            <i class="fa fa-save"></i> Guardar Asignación
                        </button>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        // 1. CARGAR LISTAS AL CAMBIAR EL COMBO
        function cargarListas() {
            var idCargo = $('#cboCargo').val();
            var nombreCargo = $('#cboCargo option:selected').text();

            $('#listaIzquierda').empty();
            $('#listaDerecha').empty();

            if (idCargo === "") {
                $('#panelDualList').slideUp();
                $('#btnGuardar').prop('disabled', true);
                return;
            }

            // Actualizar etiqueta
            $('#lblCargoSeleccionado').text("Usuarios Asignados a: " + nombreCargo);
            $('#panelDualList').slideDown();
            $('#btnGuardar').prop('disabled', false);

            $.ajax({
                url: 'PerfilesServlet',
                data: { accion: 'cargarListasJson', idCargo: idCargo },
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    // Llenar Izquierda (Fuera)
                    $.each(data.fuera, function(i, item) {
                        $('#listaIzquierda').append($('<option>', { value: item.id, text: item.nombre }));
                    });
                    // Llenar Derecha (Dentro)
                    $.each(data.dentro, function(i, item) {
                        $('#listaDerecha').append($('<option>', { value: item.id, text: item.nombre }));
                    });
                }
            });
        }

        // 2. FUNCIONES DE MOVIMIENTO (VISUAL)
        function moverDerecha() {
            $('#listaIzquierda option:selected').appendTo('#listaDerecha');
        }
        
        function moverIzquierda() {
            $('#listaDerecha option:selected').appendTo('#listaIzquierda');
        }

        function moverTodoDerecha() {
            $('#listaIzquierda option').appendTo('#listaDerecha');
        }

        function moverTodoIzquierda() {
            $('#listaDerecha option').appendTo('#listaIzquierda');
        }

        // 3. GUARDAR CAMBIOS
        function guardarCambios() {
            var idCargo = $('#cboCargo').val();
            
            // Recolectar TODOS los IDs que quedaron en la derecha
            var idsDerecha = [];
            $('#listaDerecha option').each(function() {
                idsDerecha.push($(this).val());
            });

            // Enviar al Servlet
            $.ajax({
                url: 'PerfilesServlet',
                type: 'POST',
                // Traditional true permite enviar arrays simples
                traditional: true, 
                data: { 
                    accion: 'guardar', 
                    cboCargo: idCargo, 
                    usuariosAsignados: idsDerecha 
                },
                success: function(res) {
                    alert("¡Asignaciones guardadas correctamente!");
                    cargarListas(); // Recargar para confirmar visualmente
                },
                error: function() {
                    alert("Error al guardar.");
                }
            });
        }
    </script>
</body>
</html>