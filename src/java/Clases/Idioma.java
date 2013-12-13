/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Clases;

/**
 *
 * @author leonardo
 */
public class Idioma {
    private String nombreidioma;
    private String nivelverbal;
    private String nivelescrito;
    
     public Idioma() {
        super();
    }

    public String getNombreidioma() {
        return nombreidioma;
    }

    public void setNombreidioma(String nombreidioma) {
        this.nombreidioma = nombreidioma;
    }
    
    public String getNivelverbal() {
        return nivelverbal;
    }

    public void setNivelverbal(String nivelverbal) {
        this.nivelverbal = nivelverbal;
    }

    public String getNivelescrito() {
        return nivelescrito;
    }

    public void setNivelescrito(String nivelescrito) {
        this.nivelescrito = nivelescrito;
    }
}
