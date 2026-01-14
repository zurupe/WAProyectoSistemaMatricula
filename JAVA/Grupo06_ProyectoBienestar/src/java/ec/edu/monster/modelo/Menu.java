/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.monster.modelo;

/**
 *
 * @author pablo
 */

public class Menu {
    private int idMenu;
    private String nombre;
    private String url;
    private String icono;

    // Constructor vacío
    public Menu() {
    }

    // Getters y Setters
    public int getIdMenu() { return idMenu; }
    public void setIdMenu(int idMenu) { this.idMenu = idMenu; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }

    public String getIcono() { return icono; }
    public void setIcono(String icono) { this.icono = icono; }
}
