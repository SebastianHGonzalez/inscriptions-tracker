package ejercicios;

public class Alumno {

    private Persona persona;
    private Integer legajo;

    public Alumno(Persona persona, Integer legajo) {
        this.persona = persona;
        this.legajo = legajo;
    }

    public Persona getPersona() {
        return this.persona;
    }

    public Integer getLegajo() {
        return this.legajo;
    }
}
