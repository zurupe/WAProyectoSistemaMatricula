
package ec.edu.monster.modelo;


public class comprobar {
    public static void main(String[] args){
        conexion c = new conexion();
        if(c.conectar()!= null){
            System.out.println("Correct DataBase Conexion");
        }else{
            System.out.println("Incorrect DataBasse Conexion");
        }
    }
}
