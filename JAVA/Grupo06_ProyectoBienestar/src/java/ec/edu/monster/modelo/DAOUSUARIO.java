/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.edu.monster.modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Pablo Zurita
 */
public class DAOUSUARIO extends conexion {

    /**
     * MÉTODO DE LOGIN
     * Verifica usuario, contraseña y estado activo.
     */
    public usuario identificar(usuario user) {
        usuario usu = null;
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String sql = "SELECT U.IDUSUARIO, U.NOMBREUSUARIO, U.ESTADO, "
                   + "C.IDCARGO, C.NOMBRECARGO "
                   + "FROM usuario U "
                   + "INNER JOIN cargo C ON U.IDCARGO = C.IDCARGO "
                   + "WHERE U.ESTADO = 1 AND U.NOMBREUSUARIO = ? AND U.CLAVE = ?";
                   
        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            ps.setString(1, user.getNombreUsuario());
            ps.setString(2, user.getClave());
            rs = ps.executeQuery();
            
            if (rs.next()) {
                usu = new usuario();
                usu.setId_usuario(rs.getInt("IDUSUARIO"));
                usu.setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                usu.setEstado(true);
                
                // Mapeo del objeto Cargo
                cargo c = new cargo();
                c.setCodigo(rs.getInt("IDCARGO"));       // BD: IDCARGO -> Java: codigo
                c.setNombreCargo(rs.getString("NOMBRECARGO"));
                usu.setCargo(c);
            }
        } catch (Exception e) {
            System.out.println("Error en identificar: " + e.getMessage());
        } finally {
            cerrarRecursos(cn, ps, rs);
        }
        return usu;
    }

    /**
     * LISTAR (READ)
     * Trae todos los usuarios con el nombre de su cargo.
     */
    public List<usuario> listar() {
        List<usuario> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String sql = "SELECT U.IDUSUARIO, U.NOMBREUSUARIO, U.CLAVE, U.ESTADO, "
                   + "C.IDCARGO, C.NOMBRECARGO "
                   + "FROM usuario U "
                   + "INNER JOIN cargo C ON U.IDCARGO = C.IDCARGO "
                   + "ORDER BY U.IDUSUARIO ASC";
        
        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                usuario usu = new usuario();
                usu.setId_usuario(rs.getInt("IDUSUARIO"));
                usu.setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                usu.setClave(rs.getString("CLAVE")); // Opcional mostrarla
                usu.setEstado(rs.getBoolean("ESTADO"));
                
                // Mapeo del objeto Cargo
                cargo c = new cargo();
                c.setCodigo(rs.getInt("IDCARGO"));     // Aquí usamos tu getter/setter 'Codigo'
                c.setNombreCargo(rs.getString("NOMBRECARGO"));
                usu.setCargo(c);
                
                lista.add(usu);
            }
        } catch (Exception e) {
            System.out.println("Error al listar: " + e.getMessage());
        } finally {
            cerrarRecursos(cn, ps, rs);
        }
        return lista;
    }

    /**
     * REGISTRAR (CREATE)
     * Inserta un usuario nuevo recuperando el código del cargo del objeto.
     */
    public boolean registrar(usuario usu) {
        Connection cn = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO usuario (NOMBREUSUARIO, CLAVE, ESTADO, IDCARGO) VALUES (?, ?, ?, ?)";
        
        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            ps.setString(1, usu.getNombreUsuario());
            ps.setString(2, usu.getClave());
            ps.setBoolean(3, usu.isEstado());
            
            // OJO: Aquí extraemos el 'codigo' del objeto cargo dentro del usuario
            ps.setInt(4, usu.getCargo().getCodigo()); 
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al registrar: " + e.getMessage());
            return false;
        } finally {
            cerrarRecursos(cn, ps, null);
        }
    }

    /**
     * LEER POR ID (Para cargar formulario de edición)
     */
    public usuario leerPorId(int id) {
        usuario usu = null;
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM usuario WHERE IDUSUARIO = ?";
        
        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                usu = new usuario();
                usu.setId_usuario(rs.getInt("IDUSUARIO"));
                usu.setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                usu.setClave(rs.getString("CLAVE"));
                usu.setEstado(rs.getBoolean("ESTADO"));
                
                // Solo necesitamos el código del cargo para pre-seleccionar el combo box
                cargo c = new cargo();
                c.setCodigo(rs.getInt("IDCARGO")); 
                usu.setCargo(c);
            }
        } catch (Exception e) {
            System.out.println("Error al leerPorId: " + e.getMessage());
        } finally {
            cerrarRecursos(cn, ps, rs);
        }
        return usu;
    }

    /**
     * ACTUALIZAR (UPDATE)
     */
    public boolean actualizar(usuario usu) {
        Connection cn = null;
        PreparedStatement ps = null;
        String sql = "UPDATE usuario SET NOMBREUSUARIO=?, CLAVE=?, ESTADO=?, IDCARGO=? WHERE IDUSUARIO=?";
        
        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            ps.setString(1, usu.getNombreUsuario());
            ps.setString(2, usu.getClave());
            ps.setBoolean(3, usu.isEstado());
            ps.setInt(4, usu.getCargo().getCodigo()); // Usamos getCodigo()
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al actualizar: " + e.getMessage());
            return false;
        } finally {
            cerrarRecursos(cn, ps, null);
        }
    }

    /**
     * ELIMINAR (DELETE)
     */
    public boolean eliminar(int id) {
        Connection cn = null;
        PreparedStatement ps = null;
        String sql = "DELETE FROM usuario WHERE IDUSUARIO = ?";
        
        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al eliminar: " + e.getMessage());
            return false;
        } finally {
            cerrarRecursos(cn, ps, null);
        }
    }

    // Método auxiliar para evitar repetir código de cierre
    private void cerrarRecursos(Connection cn, Statement st, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (cn != null) cn.close();
        } catch (Exception e) { e.printStackTrace(); }
    }
    /**
     * OBTENER MENÚS POR ROL
     * Recupera las opciones de navegación permitidas según el ID del Cargo.
     */
    public List<Menu> obtenerMenusPorRol(int idCargo) {
        List<Menu> listaMenus = new ArrayList<>();
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // Esta consulta une MENU con PERMISO filtrando por el CARGO del usuario
        String sql = "SELECT m.IDMENU, m.NOMBRE, m.URL, m.ICONO " +
                     "FROM menu m " +
                     "INNER JOIN permiso p ON m.IDMENU = p.IDMENU " +
                     "WHERE p.IDCARGO = ? " +
                     "ORDER BY m.IDMENU ASC";

        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idCargo);
            rs = ps.executeQuery();

            while (rs.next()) {
                Menu m = new Menu();
                m.setIdMenu(rs.getInt("IDMENU"));
                m.setNombre(rs.getString("NOMBRE"));
                m.setUrl(rs.getString("URL"));
                m.setIcono(rs.getString("ICONO"));
                
                listaMenus.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error al obtener menús: " + e.getMessage());
        } finally {
            cerrarRecursos(cn, ps, rs);
        }
        return listaMenus;
    }
    // --------------------------------------------------------
    // MÉTODOS PARA GESTIÓN DE PERMISOS (Agrega esto al final)
    // --------------------------------------------------------

    // 1. Listar todos los cargos para el ComboBox
    public List<cargo> listarCargos() {
        List<cargo> lista = new ArrayList<>();
        String sql = "SELECT * FROM cargo";
        try (Connection cn = conectar(); PreparedStatement ps = cn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                cargo c = new cargo();
                c.setCodigo(rs.getInt("IDCARGO"));
                c.setNombreCargo(rs.getString("NOMBRECARGO"));
                lista.add(c);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }

    // 2. Listar todos los menús disponibles para los Checkboxes
    public List<Menu> listarTodosLosMenus() {
        List<Menu> lista = new ArrayList<>();
        String sql = "SELECT * FROM menu";
        try (Connection cn = conectar(); PreparedStatement ps = cn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Menu m = new Menu();
                m.setIdMenu(rs.getInt("IDMENU"));
                m.setNombre(rs.getString("NOMBRE"));
                lista.add(m);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }

    // 3. Obtener IDs de menús que ya tiene un cargo (para marcarlos en el frontend)
    public List<Integer> obtenerIdsMenusPorCargo(int idCargo) {
        List<Integer> ids = new ArrayList<>();
        String sql = "SELECT IDMENU FROM permiso WHERE IDCARGO = ?";
        try (Connection cn = conectar(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, idCargo);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ids.add(rs.getInt("IDMENU"));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return ids;
    }

    // 4. GUARDAR PERMISOS (Transacción: Borra los viejos e inserta los nuevos)
    public boolean guardarPermisos(int idCargo, String[] idsMenus) {
        Connection cn = null;
        try {
            cn = conectar();
            cn.setAutoCommit(false); // Iniciamos transacción

            // A. Borramos permisos anteriores de ese cargo
            String sqlDelete = "DELETE FROM permiso WHERE IDCARGO = ?";
            try (PreparedStatement psDel = cn.prepareStatement(sqlDelete)) {
                psDel.setInt(1, idCargo);
                psDel.executeUpdate();
            }

            // B. Insertamos los nuevos (si hay alguno seleccionado)
            if (idsMenus != null) {
                String sqlInsert = "INSERT INTO permiso (IDCARGO, IDMENU) VALUES (?, ?)";
                try (PreparedStatement psIns = cn.prepareStatement(sqlInsert)) {
                    for (String idMenu : idsMenus) {
                        psIns.setInt(1, idCargo);
                        psIns.setInt(2, Integer.parseInt(idMenu));
                        psIns.executeUpdate();
                    }
                }
            }
            
            cn.commit(); // Confirmamos cambios
            return true;
        } catch (Exception e) {
            try { if (cn != null) cn.rollback(); } catch (Exception ex) {}
            e.printStackTrace();
            return false;
        } finally {
            try { if (cn != null) cn.close(); } catch (Exception ex) {}
        }
    }
    // --------------------------------------------------------
    // MÉTODOS PARA GESTIÓN DE PERFILES (Dual List Box)
    // --------------------------------------------------------

    // A. Obtener usuarios que SI tienen el cargo X
    public List<usuario> listarUsuariosPorCargo(int idCargo) {
        List<usuario> lista = new ArrayList<>();
        String sql = "SELECT IDUSUARIO, NOMBREUSUARIO FROM usuario WHERE IDCARGO = ? AND ESTADO = 1";
        try (Connection cn = conectar(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, idCargo);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    usuario u = new usuario();
                    u.setId_usuario(rs.getInt("IDUSUARIO"));
                    u.setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                    lista.add(u);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }

    // B. Obtener usuarios que NO tienen el cargo X (tienen otros cargos o null)
    public List<usuario> listarUsuariosSinCargo(int idCargo) {
        List<usuario> lista = new ArrayList<>();
        // Seleccionamos usuarios cuyo cargo sea diferente al seleccionado O sea nulo
        String sql = "SELECT IDUSUARIO, NOMBREUSUARIO FROM usuario WHERE (IDCARGO <> ? OR IDCARGO IS NULL) AND ESTADO = 1";
        try (Connection cn = conectar(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, idCargo);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    usuario u = new usuario();
                    u.setId_usuario(rs.getInt("IDUSUARIO"));
                    u.setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                    lista.add(u);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }

    // C. ACTUALIZACIÓN MASIVA
    // Estrategia: 
    // 1. Ponemos en NULL el cargo de TODOS los usuarios que tenían este cargo (limpieza).
    // 2. Asignamos el cargo a los IDs que vienen en la lista nueva.
    public boolean guardarAsignacionPerfil(int idCargo, String[] idsUsuarios) {
        Connection cn = null;
        try {
            cn = conectar();
            cn.setAutoCommit(false); // Transacción

            // 1. Limpiar: Todos los que eran de este cargo, ahora no lo son (temporalmente)
            String sqlNull = "UPDATE usuario SET IDCARGO = NULL WHERE IDCARGO = ?";
            try (PreparedStatement psNull = cn.prepareStatement(sqlNull)) {
                psNull.setInt(1, idCargo);
                psNull.executeUpdate();
            }

            // 2. Asignar: Solo si hay usuarios seleccionados en la derecha
            if (idsUsuarios != null && idsUsuarios.length > 0) {
                // Construimos una query dinámica para el IN (...)
                // Ejemplo: UPDATE usuario SET IDCARGO = 1 WHERE IDUSUARIO IN (5, 8, 10)
                StringBuilder sb = new StringBuilder("UPDATE usuario SET IDCARGO = ? WHERE IDUSUARIO IN (");
                for (int i = 0; i < idsUsuarios.length; i++) {
                    sb.append("?");
                    if (i < idsUsuarios.length - 1) sb.append(",");
                }
                sb.append(")");

                try (PreparedStatement psUpdate = cn.prepareStatement(sb.toString())) {
                    psUpdate.setInt(1, idCargo);
                    // Llenamos los IDs
                    for (int i = 0; i < idsUsuarios.length; i++) {
                        psUpdate.setInt(i + 2, Integer.parseInt(idsUsuarios[i]));
                    }
                    psUpdate.executeUpdate();
                }
            }

            cn.commit();
            return true;
        } catch (Exception e) {
            try { if(cn!=null) cn.rollback(); } catch(Exception ex){}
            e.printStackTrace();
            return false;
        } finally {
            try { if(cn!=null) cn.close(); } catch(Exception ex){}
        }
    }
}
