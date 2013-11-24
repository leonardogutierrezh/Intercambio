/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author dreabalbas
 */
public class AntecedentesAcademicos extends org.apache.struts.validator.ValidatorForm{
    
    private String nombreUsuario;
    private double indice;
    private String carrera;
    private String decanato;
    private String coordinacion;
    private int anosCursados;
    private String tipoEstudiante;
    private String cursos;
    private String premios;
    private String distinciones;

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public double getIndice() {
        return indice;
    }

    public void setIndice(double indice) {
        this.indice = indice;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getDecanato() {
        return decanato;
    }

    public void setDecanato(String decanato) {
        this.decanato = decanato;
    }

    public String getCoordinacion() {
        return coordinacion;
    }

    public void setCoordinacion(String coordinacion) {
        this.coordinacion = coordinacion;
    }

    public int getAnosCursados() {
        return anosCursados;
    }

    public void setAnosCursados(int anosCursados) {
        this.anosCursados = anosCursados;
    }

    public String getTipoEstudiante() {
        return tipoEstudiante;
    }

    public void setTipoEstudiante(String tipoEstudiante) {
        this.tipoEstudiante = tipoEstudiante;
    }

    public String getCursos() {
        return cursos;
    }

    public void setCursos(String cursos) {
        this.cursos = cursos;
    }

    public String getPremios() {
        return premios;
    }

    public void setPremios(String premios) {
        this.premios = premios;
    }

    public String getDistinciones() {
        return distinciones;
    }

    public void setDistinciones(String distinciones) {
        this.distinciones = distinciones;
    }
    
    public AntecedentesAcademicos(){
        super();
    }
    
    
}
