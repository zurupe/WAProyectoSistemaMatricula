# Walkthrough: Replica del Proyecto Java en .NET

Se ha creado una solución .NET Core 9.0 con arquitectura MVC replicando la funcionalidad y apariencia del proyecto Java original (`Grupo06_ProyectoBienestar`).

## Estructura del Proyecto

El proyecto se encuentra en la carpeta `DOTNET/SistemaBienestar.Web`.

### Componentes Migrados

1.  **Modelos (Base de Datos)**
    *   `Usuario` (Tabla `usuario`)
    *   `Cargo` (Tabla `cargo`)
    *   `Empleado` (Tabla `empleado`)
    *   **Contexto de Datos**: `ApplicationDbContext` configurado con Entity Framework Core.

2.  **Controladores (Lógica)**
    *   `AccountController`: Maneja el inicio y cierre de sesión (reemplaza a `UsuarioServlet`).
    *   `UsuariosController`: CRUD completo de usuarios con asignación de roles.
    *   `EmpleadosController`: CRUD completo de empleados.
    *   `HomeController`: Panel principal (Dashboard).

3.  **Vistas (UI)**
    *   Se ha implementado la plantilla **AdminLTE** en `_Layout.cshtml`.
    *   `Account/Login.cshtml`: Réplica exacta del login original.
    *   `Home/Index.cshtml`: Réplica del panel de estadísticas (`resumen.jsp`).
    *   `Usuarios/Index`, `Create`, `Edit`: Gestión de usuarios.
    *   `Empleados/Index`, `Create`, `Edit`: Gestión de empleados.

## Configuración de Base de Datos

El proyecto usa **SQL Server**. La cadena de conexión está en `appsettings.json`:

```json
"DefaultConnection": "Data Source=localhost;Initial Catalog=bdsys;Integrated Security=True;TrustServerCertificate=True"
```

### Migraciones

Se ha creado una migración inicial (`InitialCreate`). Para aplicar la estructura a la base de datos, ejecute el siguiente comando en la terminal dentro de `SistemaBienestar.Web`:

```bash
dotnet dotnet-ef database update
```

## Ejecución

Para iniciar el proyecto:

1.  Abrir la terminal en `SistemaBienestar.Web`.
2.  Ejecutar:
    ```bash
    dotnet run
    ```
3.  Abrir el navegador en `http://localhost:5032` (o el puerto indicado).

## Notas

*   La autenticación usa Cookies.
*   Se requiere tener SQL Server (LocalDB o instancia completa) ejecutándose.
*   Las librerías de cliente (AdminLTE, Bootstrap) se cargan vía CDN para simplificar la estructura de archivos, igual que en el proyecto original.
