/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author brahyam
 */
public class Busqueda extends org.apache.struts.validator.ValidatorForm {
    private String nombre;
    private String apellido;
    private String carnet;
    private String indice;
    private String carrera;
    private String pais;
    private String opcion1;
    private String confirmar;
    private String nombrePostu;
    private String tipoPostu;
    private String Gestor;
    
    public Busqueda(){
        super();
    }
    
    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * @return the carnet
     */
    public String getCarnet() {
        return carnet;
    }

    /**
     * @param carnet the carnet to set
     */
    public void setCarnet(String carnet) {
        this.carnet = carnet;
    }

    /**
     * @return the indice
     */
    public String getIndice() {
        return indice;
    }

    /**
     * @param indice the indice to set
     */
    public void setIndice(String indice) {
        this.indice = indice;
    }

    /**
     * @return the carrera
     */
    public String getCarrera() {
        return carrera;
    }

    /**
     * @param carrera the carrera to set
     */
    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    /**
     * @return the opcion1
     */
    public String getOpcion1() {
        return opcion1;
    }

    /**
     * @param opcion1 the opcion1 to set
     */
    public void setOpcion1(String opcion1) {
        this.opcion1 = opcion1;
    }

    /**
     * @return the pais
     */
    public String getPais() {
        return pais;
    }

    /**
     * @param pais the pais to set
     */
    public void setPais(String pais) {
        this.pais = pais;
    }
    
    
    public String getConfirmar() {
        return confirmar;
    }

    public void setConfirmar(String confirmar) {
        this.confirmar = confirmar;
    }

    public String getNombrePostu() {
        return nombrePostu;
    }

    public void setNombrePostu(String nombrePostu) {
        this.nombrePostu = nombrePostu;
    }

    public String getTipoPostu() {
        return tipoPostu;
    }

    public void setTipoPostu(String tipoPostu) {
        this.tipoPostu = tipoPostu;
    }

    public String getGestor() {
        return Gestor;
    }

    public void setGestor(String Gestor) {
        this.Gestor = Gestor;
    }   

    
}