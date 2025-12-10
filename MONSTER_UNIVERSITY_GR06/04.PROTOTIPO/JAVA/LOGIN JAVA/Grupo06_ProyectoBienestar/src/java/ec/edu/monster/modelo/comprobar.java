
package ec.edu.monster.modelo;


public class comprobar {
    public static void main(String[] args){
        conexion c = new conexion();
        if(c.conectar()!= null){
            System.out.println("La conexión es correcta :D");
        }else{
            System.out.println("La conexión fue erronea D:, ponganos 20");
        }
    }
}
