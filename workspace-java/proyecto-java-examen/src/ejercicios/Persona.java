package ejercicios;

import java.util.Date;

public class Persona {
    private TipoDocumento tipoDocumento;
    private Integer nroDocumento;
    private String nombre;
    private String apellido;
    private Date fechaNacimiento;

    public Persona(
            TipoDocumento tipoDocumento,
            Integer nroDocumento,
            String nombre,
            String apellido,
            Date fechaNacimiento
    ) {
        this.tipoDocumento = tipoDocumento;
        this.nroDocumento = nroDocumento;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
    }

    public TipoDocumento getTipoDocumento() {
        return this.tipoDocumento;
    }

    public Integer getNroDocumento() {
        return this.nroDocumento;
    }

    public String getNombre() {
        return this.nombre;
    }

    public String getApellido() {
        return this.apellido;
    }

    public Date getFechaNacimiento() {
        return this.fechaNacimiento;
    }
}
