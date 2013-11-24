/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author dreabalbas
 */
public class Postulante extends Usuario {
    
    private String codigo;
    private String tipo;
    private String nombreUniExt;
    private String nombreCarrera;
    
    public Postulante(){
        super();
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNombreUniExt() {
        return nombreUniExt;
    }

    public void setNombreUniExt(String nombreUniExt) {
        this.nombreUniExt = nombreUniExt;
    }

    public String getNombreCarrera() {
        return nombreCarrera;
    }

    public void setNombreCarrera(String nombreCarrera) {
        this.nombreCarrera = nombreCarrera;
    }
    
}
