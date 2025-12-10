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
}
