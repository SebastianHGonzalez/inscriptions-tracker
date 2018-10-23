package ejercicios;

import java.util.Date;

/**
 * A. Crear una clase Persona con los siguientes campos
 * (con sus respectivos getters, setters y constructor)
 * 
 * TipoDocumento - enum (dni/libretacivica) 
 * NroDocumento - Integer
 * Nombre - String
 * Apellido - String
 * FechaNacimiento - Date
 * 
 * B. En el método main de la clase "Ejercicio2" crear una nueva instancia
 * de la clase persona y settearle valores reales con tus datos
 * 
 * 
 * C. En el método main de la clase "Ejercicio 2" imprimir los valores en 
 * consola 
 * (crear método main e imprimir valores) 
 *  
 * @author examen
 *
 */
public class Ejercicio2 {

    static Persona persona;

	/**
	 * 
	 */
	public Ejercicio2() {
		// TODO Auto-generated constructor stub
	}

    /**
     * @param args
     */
    public static void main(String[] args) {

        persona = new Persona(
                TipoDocumento.DNI,
                38698242,
                "Sebastian",
                "Gonzalez",
                new Date(Date.parse("1995-01-04"))
        );

        System.out.println(persona.getTipoDocumento());
        System.out.println(persona.getNroDocumento());
        System.out.println(persona.getNombre());
        System.out.println(persona.getApellido());
        System.out.println(persona.getFechaNacimiento());
    }

}
