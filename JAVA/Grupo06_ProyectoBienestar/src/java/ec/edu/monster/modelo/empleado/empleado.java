/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.monster.modelo.empleado;

import ec.edu.monster.modelo.cargo;

/**
 *
 * @author pablo
 */
public class empleado {
    // Identificadores
    private int idEmpleado;
    private String identificador; 
    
    // Datos Básicos
    private String nombre;
    private String apellidos;
    private String foto; 
    
    // Info Personal
    private String ciudad;
    private String direccion;
    private String estadoCivil;
    
    // RELACIÓN: Igual que en tu clase 'usuario'
    private cargo cargo; 

    // Contacto
    private String telefono;
    private String correo;

    // Constructor vacío
    public empleado() {
    }

    // Getters y Setters
    public int getIdEmpleado() { return idEmpleado; }
    public void setIdEmpleado(int idEmpleado) { this.idEmpleado = idEmpleado; }

    public String getIdentificador() { return identificador; }
    public void setIdentificador(String identificador) { this.identificador = identificador; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getApellidos() { return apellidos; }
    public void setApellidos(String apellidos) { this.apellidos = apellidos; }

    public String getFoto() { return foto; }
    public void setFoto(String foto) { this.foto = foto; }

    public String getCiudad() { return ciudad; }
    public void setCiudad(String ciudad) { this.ciudad = ciudad; }

    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }

    public String getEstadoCivil() { return estadoCivil; }
    public void setEstadoCivil(String estadoCivil) { this.estadoCivil = estadoCivil; }

    // Getter y Setter del Objeto Cargo
    public cargo getCargo() { return cargo; }
    public void setCargo(cargo cargo) { this.cargo = cargo; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }
}
