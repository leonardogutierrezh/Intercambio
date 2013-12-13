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
public class Representante {
    
    private String nombres;
    private String apellidos;
    private String telefonocel;
    private String telefonohab;
    private String emailrep;
    private String tiporelacion;
    private String direccion;
    
    public Representante() {
        super();
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    
    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTelefonocel() {
        return telefonocel;
    }

    public void setTelefonocel(String telefonocel) {
        this.telefonocel = telefonocel;
    }

    public String getTelefonohab() {
        return telefonohab;
    }

    public void setTelefonohab(String telefonohab) {
        this.telefonohab = telefonohab;
    }

    public String getEmailrep() {
        return emailrep;
    }

    public void setEmailrep(String emailrep) {
        this.emailrep = emailrep;
    }
    
    public String getTiporelacion() {
        return tiporelacion;
    }

    public void setTiporelacion(String tiporelacion) {
        this.tiporelacion = tiporelacion;
    }
    
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }    
}
