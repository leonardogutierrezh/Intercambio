package Clases;

/**
 *
 * @author dreabalbas
 */

public class Universidad {
    private String nombre;
    private String pais;
    private Integer cupo;

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
    
        public void setCupo(Integer cupo) {
        this.cupo = cupo;
    }
    
    public Integer getCupo(){
        return cupo;
    }
    
     public String toString(){
        return this.nombre + " - " + this.pais;
    }
}
