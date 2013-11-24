/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author dreabalbas
 */
public class EstudianteInternacional extends Estudiante {
    
    private String Institucion;
    private Integer pasaporte;
    private String lenguamaterna;
    private String paisOrigen;
    private String uniOrigen;
    private boolean tomarCursoEspaniol;

    public Integer getPasaporte() {
        return pasaporte;
    }

    public void setPasaporte(Integer pasaporte) {
        this.pasaporte = pasaporte;
    }

    public String getLenguamaterna() {
        return lenguamaterna;
    }

    public void setLenguamaterna(String lenguamaterna) {
        this.lenguamaterna = lenguamaterna;
    }

    public String getPaisOrigen() {
        return paisOrigen;
    }

    public void setPaisOrigen(String paisOrigen) {
        this.paisOrigen = paisOrigen;
    }

    public String getUniOrigen() {
        return uniOrigen;
    }

    public void setUniOrigen(String uniOrigen) {
        this.uniOrigen = uniOrigen;
    }

    public String getInstitucion() {
        return Institucion;
    }

    public void setInstitucion(String Institucion) {
        this.Institucion = Institucion;
    }

    public boolean isTomarCursoEspaniol() {
        return tomarCursoEspaniol;
    }

    public void setTomarCursoEspaniol(boolean tomarCursoEspaniol) {
        this.tomarCursoEspaniol = tomarCursoEspaniol;
    }
    
}
