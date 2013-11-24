/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.util.ArrayList;

/**
 *
 * @author dreabalbas
 */
public class PlanillaExt extends org.apache.struts.action.ActionForm {

        // Seccion De Datos Personales
    private String estadoSolicitud;
    private String nombreUsuario;   //nombreUsuario db
    private String periodo;
    private String apellido1;       //apellido1 db
    private String apellido2;       //apellido1 db
    private String nombre1;         //nombres db
    private String nombre2;         //apellido1 db
    private String sexo;            //sexo db
    private String calle;           //db
    private String edificio;        //db
    private String apartamento;     //db
    private String ciudad;          //db
    private String estado;          //db
    private String codPostal;       //db
    private String telefonoCelular; //db
    private String telefonoCasa;    //db
    private String email;           //db
    private String fechaNacimiento; //db
    private String nacionalidad;    //db
    private String pasaporte;       //db estudianteExt
    
    private String paisOrigen;
    private String nombreUniOrigen;   //db
    
    //tipo Programa
    private String nombrePrograma;
    private String programa;
    private String duracionPrograma;

    private int anioIngreso;
    private int aniosAprobados;
    private String areaEstud;         //db   
    private String carrera;
    
    private String nombreCoordMovilidad;
    private String nombreCoordAcademico;
    
    //Informacion Academica 

    private ArrayList<Materias> lista;
    
    //Conocimiento de idiomas
    
    private String idiomaDest;      //db
    private String nivelVerbal;     //db
    private String nivelEscrito;    //db
    private String nivelConversacional;
    
    //Area Coordinacion (Postulacion)
    private String fechaSolicitud;          //db      
    private String recomendacion;           //db
    private String comentarioRecomendacion; //db

    
    //Representante
    private String apellidosRep;  //db
    private String nombresRep;
    private String celRep;              //db
    private String tlfRepCasa;              //db    
    private String emailRep;            //db
    private String relacion;            //db
    private String direccionRep;        //db    

    public String getEstadoSolicitud() {
        return estadoSolicitud;
    }

    public void setEstadoSolicitud(String estadoSolicitud) {
        this.estadoSolicitud = estadoSolicitud;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getNombre1() {
        return nombre1;
    }

    public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
    }

    public String getNombre2() {
        return nombre2;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getEdificio() {
        return edificio;
    }

    public void setEdificio(String edificio) {
        this.edificio = edificio;
    }

    public String getApartamento() {
        return apartamento;
    }

    public void setApartamento(String apartamento) {
        this.apartamento = apartamento;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCodPostal() {
        return codPostal;
    }

    public void setCodPostal(String codPostal) {
        this.codPostal = codPostal;
    }

    public String getTelefonoCelular() {
        return telefonoCelular;
    }

    public void setTelefonoCelular(String telefonoCelular) {
        this.telefonoCelular = telefonoCelular;
    }

    public String getTelefonoCasa() {
        return telefonoCasa;
    }

    public void setTelefonoCasa(String telefonoCasa) {
        this.telefonoCasa = telefonoCasa;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getPasaporte() {
        return pasaporte;
    }

    public void setPasaporte(String pasaporte) {
        this.pasaporte = pasaporte;
    }

    public String getPaisOrigen() {
        return paisOrigen;
    }

    public void setPaisOrigen(String paisOrigen) {
        this.paisOrigen = paisOrigen;
    }

    public String getNombreUniOrigen() {
        return nombreUniOrigen;
    }

    public void setNombreUniOrigen(String nombreUniOrigen) {
        this.nombreUniOrigen = nombreUniOrigen;
    }

    public String getNombrePrograma() {
        return nombrePrograma;
    }

    public void setNombrePrograma(String nombrePrograma) {
        this.nombrePrograma = nombrePrograma;
    }

    public String getPrograma() {
        return programa;
    }

    public void setPrograma(String programa) {
        this.programa = programa;
    }

    public String getDuracionPrograma() {
        return duracionPrograma;
    }

    public void setDuracionPrograma(String duracionPrograma) {
        this.duracionPrograma = duracionPrograma;
    }

    public int getAnioIngreso() {
        return anioIngreso;
    }

    public void setAnioIngreso(int anioIngreso) {
        this.anioIngreso = anioIngreso;
    }

    public int getAniosAprobados() {
        return aniosAprobados;
    }

    public void setAniosAprobados(int aniosAprobados) {
        this.aniosAprobados = aniosAprobados;
    }

    public String getAreaEstud() {
        return areaEstud;
    }

    public void setAreaEstud(String areaEstud) {
        this.areaEstud = areaEstud;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getNombreCoordMovilidad() {
        return nombreCoordMovilidad;
    }

    public void setNombreCoordMovilidad(String nombreCoordMovilidad) {
        this.nombreCoordMovilidad = nombreCoordMovilidad;
    }

    public String getNombreCoordAcademico() {
        return nombreCoordAcademico;
    }

    public void setNombreCoordAcademico(String nombreCoordAcademico) {
        this.nombreCoordAcademico = nombreCoordAcademico;
    }

    public ArrayList<Materias> getLista() {
        return lista;
    }

    public void setLista(ArrayList<Materias> lista) {
        this.lista = lista;
    }


    public String getIdiomaDest() {
        return idiomaDest;
    }

    public void setIdiomaDest(String idiomaDest) {
        this.idiomaDest = idiomaDest;
    }

    public String getNivelVerbal() {
        return nivelVerbal;
    }

    public void setNivelVerbal(String nivelVerbal) {
        this.nivelVerbal = nivelVerbal;
    }

    public String getNivelEscrito() {
        return nivelEscrito;
    }

    public void setNivelEscrito(String nivelEscrito) {
        this.nivelEscrito = nivelEscrito;
    }

    public String getNivelConversacional() {
        return nivelConversacional;
    }

    public void setNivelConversacional(String nivelConversacional) {
        this.nivelConversacional = nivelConversacional;
    }

    public String getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(String fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public String getRecomendacion() {
        return recomendacion;
    }

    public void setRecomendacion(String recomendacion) {
        this.recomendacion = recomendacion;
    }

    public String getComentarioRecomendacion() {
        return comentarioRecomendacion;
    }

    public void setComentarioRecomendacion(String comentarioRecomendacion) {
        this.comentarioRecomendacion = comentarioRecomendacion;
    }

     public String getNombresRep() {
        return nombresRep;
    }

    public void setNombresRep(String nombresRep) {
        this.nombresRep = nombresRep;
    }
    
    public String getApellidosRep() {
        return apellidosRep;
    }

    public void setApellidosRep(String apellidosRep) {
        this.apellidosRep = apellidosRep;
    }

    public String getCelRep() {
        return celRep;
    }

    public void setCelRep(String celRep) {
        this.celRep = celRep;
    }

    public String getTlfRepCasa() {
        return tlfRepCasa;
    }

    public void setTlfRepCasa(String tlfRepCasa) {
        this.tlfRepCasa = tlfRepCasa;
    }

    public String getEmailRep() {
        return emailRep;
    }

    public void setEmailRep(String emailRep) {
        this.emailRep = emailRep;
    }

    public String getRelacion() {
        return relacion;
    }

    public void setRelacion(String relacion) {
        this.relacion = relacion;
    }

    public String getDireccionRep() {
        return direccionRep;
    }

    public void setDireccionRep(String direccionRep) {
        this.direccionRep = direccionRep;
    }
 
}
