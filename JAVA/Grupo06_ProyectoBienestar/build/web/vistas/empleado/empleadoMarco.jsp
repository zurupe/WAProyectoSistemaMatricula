<%-- 
    Document   : empleadoMarco
    Created on : 11 dic 2025, 9:40:56 a. m.
    Author     : pablo
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Formulario de Empleado</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/AdminLTE.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/skins/skin-blue.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

    <style>
        .preview-container {
            position: relative;
            width: 150px;
            height: 150px;
            margin: 0 auto;
        }
        .preview-image {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%; /* Redondo */
            border: 3px solid #d2d6de; /* Gris AdminLTE */
        }
        /* Ajuste para que los tabs se vean bien dentro de la caja */
        .nav-tabs-custom {
            box-shadow: none;
            margin-bottom: 0;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">

    <section class="content">
        <div class="row">
            <div class="col-md-10 col-md-offset-1"> <form action="EmpleadoServlet" method="post" enctype="multipart/form-data" id="formEmpleado">
                    
                    <input type="hidden" name="id" value="${empleado.idEmpleado}">
                    <input type="hidden" name="fotoActual" value="${empleado.foto}">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">
                                <i class="fa fa-user-plus"></i> 
                                ${empleado != null ? 'Editar Empleado' : 'Nuevo Empleado'}
                            </h3>
                            
                            <div class="box-tools pull-right">
                                <a href="EmpleadoServlet?accion=listar" class="btn btn-default btn-sm btn-flat" title="Volver">
                                    <i class="fa fa-arrow-left"></i> Volver
                                </a>
                            </div>
                        </div>
                        
                        <div class="box-body">
                            
                            <div class="row">
                                <div class="col-md-3 text-center" style="border-right: 1px solid #eee;">
                                    <div class="preview-container" style="margin-bottom: 15px;">
                                        <img src="${not empty empleado.foto ? empleado.foto : 'https://via.placeholder.com/150?text=Sin+Foto'}" 
                                             id="imgPreview" 
                                             class="preview-image">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="btn btn-primary btn-flat btn-block btn-sm">
                                            <i class="fa fa-upload"></i> Subir Foto
                                            <input type="file" name="foto" id="txtFoto" accept="image/*" style="display: none;">
                                        </label>
                                        <p class="help-block text-muted small">Formatos: JPG, PNG</p>
                                    </div>
                                </div>

                                <div class="col-md-9">
                                    <h4 class="text-light-blue" style="margin-top: 0; border-bottom: 1px solid #eee; padding-bottom: 10px;">
                                        Datos de Identificación
                                    </h4>
                                    
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Código / ID</label>
                                                <input type="text" class="form-control" name="identificador" 
                                                       value="${empleado.identificador}" required placeholder="Ej: EMP-001">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Nombre</label>
                                                <input type="text" class="form-control" name="nombre" 
                                                       value="${empleado.nombre}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Apellidos</label>
                                                <input type="text" class="form-control" name="apellidos" 
                                                       value="${empleado.apellidos}" required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="nav-tabs-custom">
                                        <ul class="nav nav-tabs">
                                            <li class="active"><a href="#info-pane" data-toggle="tab"><i class="fa fa-info-circle"></i> Información Personal</a></li>
                                            <li><a href="#contacto-pane" data-toggle="tab"><i class="fa fa-phone"></i> Contacto</a></li>
                                        </ul>
                                        
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="info-pane">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Ciudad</label>
                                                            <input type="text" class="form-control" name="ciudad" value="${empleado.ciudad}">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Dirección</label>
                                                            <input type="text" class="form-control" name="direccion" value="${empleado.direccion}">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Estado Civil</label>
                                                            <select class="form-control" name="estadoCivil">
                                                                <option value="">-- Seleccione --</option>
                                                                <option value="Soltero" ${empleado.estadoCivil == 'Soltero' ? 'selected' : ''}>Soltero</option>
                                                                <option value="Casado" ${empleado.estadoCivil == 'Casado' ? 'selected' : ''}>Casado</option>
                                                                <option value="Divorciado" ${empleado.estadoCivil == 'Divorciado' ? 'selected' : ''}>Divorciado</option>
                                                                <option value="Viudo" ${empleado.estadoCivil == 'Viudo' ? 'selected' : ''}>Viudo</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="text-primary">Cargo (Rol)</label>
                                                            <select class="form-control" name="cboCargo" required style="border-color: #3c8dbc;">
                                                                <option value="">-- Seleccione Cargo --</option>
                                                                <c:forEach var="c" items="${listaCargos}">
                                                                    <option value="${c.codigo}" ${empleado.cargo.codigo == c.codigo ? 'selected' : ''}>
                                                                        ${c.nombreCargo}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="contacto-pane">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Teléfono / Celular</label>
                                                            <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                                <input type="text" class="form-control" name="telefono" value="${empleado.telefono}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Correo Electrónico</label>
                                                            <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                                                <input type="email" class="form-control" name="correo" value="${empleado.correo}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <div class="box-footer text-right"> <a href="EmpleadoServlet?accion=listar" class="btn btn-default btn-flat">Cancelar</a>
                            <button type="submit" class="btn btn-success btn-flat">
                                <i class="fa fa-save"></i> Guardar
                            </button>
                        </div>
                    </div>
                    </form>
            </div>
        </div>
    </section>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/js/adminlte.min.js"></script>

    <script>
        const inputFile = document.getElementById('txtFoto');
        const imgPreview = document.getElementById('imgPreview');

        inputFile.addEventListener('change', function(event) {
            const file = event.target.files[0];
            
            if (file) {
                // Validar que sea imagen
                if (!file.type.startsWith('image/')) {
                    alert('Por favor, selecciona un archivo de imagen válido.');
                    this.value = ''; // Limpiar input
                    return;
                }

                // Crear URL temporal para previsualizar
                const reader = new FileReader();
                reader.onload = function(e) {
                    imgPreview.src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>