/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.monster.modelo.empleado;

import ec.edu.monster.modelo.cargo;
import ec.edu.monster.modelo.conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pablo
 */
public class DAOEMPLEADO extends conexion {

    /**
     * LISTAR (READ)
     * Trae todos los empleados con el nombre de su cargo (JOIN).
     */
    public List<empleado> listar() {
        List<empleado> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT E.IDEMPLEADO, E.IDENTIFICADOR, E.NOMBRE, E.APELLIDOS, E.FOTO, "
                   + "E.CIUDAD, E.DIRECCION, E.ESTADOCIVIL, E.TELEFONO, E.CORREO, "
                   + "C.IDCARGO, C.NOMBRECARGO "
                   + "FROM empleado E "
                   + "INNER JOIN cargo C ON E.IDCARGO = C.IDCARGO "
                   + "ORDER BY E.IDEMPLEADO ASC";

        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                empleado emp = new empleado();
                emp.setIdEmpleado(rs.getInt("IDEMPLEADO"));
                emp.setIdentificador(rs.getString("IDENTIFICADOR"));
                emp.setNombre(rs.getString("NOMBRE"));
                emp.setApellidos(rs.getString("APELLIDOS"));
                emp.setFoto(rs.getString("FOTO"));
                emp.setCiudad(rs.getString("CIUDAD"));
                emp.setDireccion(rs.getString("DIRECCION"));
                emp.setEstadoCivil(rs.getString("ESTADOCIVIL"));
                emp.setTelefono(rs.getString("TELEFONO"));
                emp.setCorreo(rs.getString("CORREO"));

                // Mapeo del objeto Cargo (Igual que en tu DAO Usuario)
                cargo c = new cargo();
                c.setCodigo(rs.getInt("IDCARGO"));      
                c.setNombreCargo(rs.getString("NOMBRECARGO"));
                emp.setCargo(c);

                lista.add(emp);
            }
        } catch (Exception e) {
            System.out.println("Error al listar empleados: " + e.getMessage());
        } finally {
            cerrarRecursos(cn, ps, rs);
        }
        return lista;
    }

    /**
     * REGISTRAR (CREATE)
     */
    public boolean registrar(empleado emp) {
        Connection cn = null;
        PreparedStatement ps = null;
        
        String sql = "INSERT INTO empleado (IDENTIFICADOR, NOMBRE, APELLIDOS, FOTO, "
                   + "CIUDAD, DIRECCION, ESTADOCIVIL, TELEFONO, CORREO, IDCARGO) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            ps.setString(1, emp.getIdentificador());
            ps.setString(2, emp.getNombre());
            ps.setString(3, emp.getApellidos());
            ps.setString(4, emp.getFoto());
            ps.setString(5, emp.getCiudad());
            ps.setString(6, emp.getDireccion());
            ps.setString(7, emp.getEstadoCivil());
            ps.setString(8, emp.getTelefono());
            ps.setString(9, emp.getCorreo());
            
            // Obtenemos el ID del cargo desde el objeto Cargo
            ps.setInt(10, emp.getCargo().getCodigo()); 

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al registrar empleado: " + e.getMessage());
            return false;
        } finally {
            cerrarRecursos(cn, ps, null);
        }
    }

    /**
     * LEER POR ID (Para cargar formulario de edición)
     */
    public empleado leerPorId(int id) {
        empleado emp = null;
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        // Hago JOIN también aquí por si quieres mostrar el nombre del cargo en la edición
        String sql = "SELECT * FROM empleado WHERE IDEMPLEADO = ?";

        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                emp = new empleado();
                emp.setIdEmpleado(rs.getInt("IDEMPLEADO"));
                emp.setIdentificador(rs.getString("IDENTIFICADOR"));
                emp.setNombre(rs.getString("NOMBRE"));
                emp.setApellidos(rs.getString("APELLIDOS"));
                emp.setFoto(rs.getString("FOTO"));
                emp.setCiudad(rs.getString("CIUDAD"));
                emp.setDireccion(rs.getString("DIRECCION"));
                emp.setEstadoCivil(rs.getString("ESTADOCIVIL"));
                emp.setTelefono(rs.getString("TELEFONO"));
                emp.setCorreo(rs.getString("CORREO"));
                
                // Solo necesitamos el código para que el <select> se posicione bien
                cargo c = new cargo();
                c.setCodigo(rs.getInt("IDCARGO"));
                emp.setCargo(c);
            }
        } catch (Exception e) {
            System.out.println("Error al leerPorId empleado: " + e.getMessage());
        } finally {
            cerrarRecursos(cn, ps, rs);
        }
        return emp;
    }

    /**
     * ACTUALIZAR (UPDATE)
     */
    public boolean actualizar(empleado emp) {
        Connection cn = null;
        PreparedStatement ps = null;
        
        String sql = "UPDATE empleado SET IDENTIFICADOR=?, NOMBRE=?, APELLIDOS=?, FOTO=?, "
                   + "CIUDAD=?, DIRECCION=?, ESTADOCIVIL=?, TELEFONO=?, CORREO=?, IDCARGO=? "
                   + "WHERE IDEMPLEADO=?";

        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            ps.setString(1, emp.getIdentificador());
            ps.setString(2, emp.getNombre());
            ps.setString(3, emp.getApellidos());
            ps.setString(4, emp.getFoto());
            ps.setString(5, emp.getCiudad());
            ps.setString(6, emp.getDireccion());
            ps.setString(7, emp.getEstadoCivil());
            ps.setString(8, emp.getTelefono());
            ps.setString(9, emp.getCorreo());
            
            // Actualizamos la FK del cargo
            ps.setInt(10, emp.getCargo().getCodigo());
            
            ps.setInt(11, emp.getIdEmpleado());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al actualizar empleado: " + e.getMessage());
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
        String sql = "DELETE FROM empleado WHERE IDEMPLEADO = ?";

        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al eliminar empleado: " + e.getMessage());
            return false;
        } finally {
            cerrarRecursos(cn, ps, null);
        }
    }

    // Método auxiliar (copiado de tu DAO Usuario)
    private void cerrarRecursos(Connection cn, Statement st, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (cn != null) cn.close();
        } catch (Exception e) { e.printStackTrace(); }
    }
    /**
     * MÉTODO AUXILIAR: LISTAR CARGOS
     * Se usa solo para llenar el ComboBox (Select) en el formulario de empleados.
     */
    public List<cargo> listarCargos() {
        List<cargo> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM cargo"; // Si tienes un campo 'estado', usa: WHERE ESTADO=1

        try {
            cn = conectar();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cargo c = new cargo();
                c.setCodigo(rs.getInt("IDCARGO"));
                c.setNombreCargo(rs.getString("NOMBRECARGO"));
                lista.add(c);
            }
        } catch (Exception e) {
            System.out.println("Error al listar cargos: " + e.getMessage());
        } finally {
            cerrarRecursos(cn, ps, rs);
        }
        return lista;
    }
}
