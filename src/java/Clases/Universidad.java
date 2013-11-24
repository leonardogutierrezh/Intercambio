package Clases;

/**
 *
 * @author dreabalbas
 */

public class Universidad {
    private String nombre;
    private String pais;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
    
    public String toString(){
        return this.nombre + " - " + this.pais;
    }
}
