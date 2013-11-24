/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.util.ArrayList;

/**
 *
 * @author caponte
 */
public class PlanillaUSB extends org.apache.struts.action.ActionForm {

    // Seccion De Datos Personales
    private String estadoSolicitud;
    private String nombreUsuario;   //nombreUsuario db
    private String periodo;
    private String apellido1;       //apellido1 db
    private String apellido2;       //apellido1 db
    private String nombre1;         //nombres db
    private String nombre2;         //apellido1 db
    private String sexo;            //sexo db
    private String urbanizacion;    //db
    private String calle;           //db
    private String edificio;        //db
    private String apartamento;     //db
    private String ciudad;          //db
    private String estado;          //db
    private String codPostal;       //db
    private String telefonoCelular; //db
    private String telefonoCasa;    //db
    private String fax;             //db
    private String email;           //db
    private String fechaNacimiento; //db
    private String nacionalidad;    //db
    private String cedula;          //db estudianteUSB
    private String carnet;          //db estudianteUSB
    private String pasaporte;       //db estudianteUSB
    //tipo Programa
    private String programaOpcion1;
    private String programaOpcion2;
    private String duracionProgramaOpcion1;
    private String duracionProgramaOpcion2;
    private String paisOpcion1;
    private String paisOpcion2;    
    //Nombre de la Universidad
    private String nombreOpcion1;   //db
    private String nombreOpcion2;    
    // Nombre Programa
    private String nombreProgramaOpcion1;
    private String nombreProgramaOpcion2;    
    //Queda pendiente la foto
    //Programa de Intercambio (Plan estudio)
    private String mesFechaIni1;       //db
    private String mesFechaFin1;       //db
    private String anoFechaIni1;       //db
    private String anoFechaFin1;       //db   
    private String mesFechaIni2;       //db
    private String mesFechaFin2;       //db
    private String anoFechaIni2;       //db
    private String anoFechaFin2;       //db      
    
    private String idiomaDest;      //db
    private String nivelVerbal;     //db
    private String nivelEscrito;    //db
    
    //ESTAS DOS NO SE USAN
    private String nombreProg1;     //db
    private String nombrePais1;
    
    //Informacion Academica 
    private String carrera;         //db
    private String decanato;         //db
    private String areaEstud;         //db    
    private String indice;          //db
    private String opcion;          //db
    private int creditosApro;       //db
    private ArrayList<Materias> lista;
    //Area Coordinacion (Postulacion)
    private String fechaSolicitud;          //db      
    private String recomendacion;           //db
    private String comentarioRecomendacion; //db
    // Financiamiento
    private String fuenteFinanciamiento;
    private String descripcion1;
    private String descripcion2;    
    private String ayudaEc;
    //Representantes
    private String apellidosRep;  //db
    private String nombresRep;
    private String celRep;              //db
    private String tlfRepCasa;              //db    
    private String emailRep;            //db
    private String relacion;            //db
    private String direccionRep;        //db    

    public PlanillaUSB() {
        super();
    }

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
    
    public String getApellido2() {
        return apellido2;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }
    
    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getNombre1() {
        return nombre1;
    }

   public String getNombre2() {
        return nombre2;
    }

   public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
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

    public String getUrbanizacion() {
        return urbanizacion;
    }

    public void setUrbanizacion(String urbanizacion) {
        this.urbanizacion = urbanizacion;
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

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
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

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getCarnet() {
        return carnet;
    }

    public void setCarnet(String carnet) {
        this.carnet = carnet;
    }

    public String getPasaporte() {
        return pasaporte;
    }

    public void setPasaporte(String pasaporte) {
        this.pasaporte = pasaporte;
    }

    public String getProgramaOpcion1() {
        return programaOpcion1;
    }

    public void setProgramaOpcion1(String programaOpcion1) {
        this.programaOpcion1 = programaOpcion1;
    }
    
    public String getProgramaOpcion2() {
        return programaOpcion2;
    }

    public void setProgramaOpcion2(String programaOpcion2) {
        this.programaOpcion2 = programaOpcion2;
    }

    public String getNombreProgramaOpcion2() {
        return nombreProgramaOpcion2;
    }

    public void setNombreProgramaOpcion2(String nombreProgramaOpcion2) {
        this.nombreProgramaOpcion2 = nombreProgramaOpcion2;
    }
    
    public String getNombreProgramaOpcion1() {
        return nombreProgramaOpcion1;
    }
    
    public void setNombreProgramaOpcion1(String nombreProgramaOpcion1) {
        this.nombreProgramaOpcion1 = nombreProgramaOpcion1;
    }

    public String getDuracionProgramaOpcion1() {
        return duracionProgramaOpcion1;
    }

    public void setDuracionProgramaOpcion1(String duracionProgramaOpcion1) {
        this.duracionProgramaOpcion1 = duracionProgramaOpcion1;
    }
    
    public String getDuracionProgramaOpcion2() {
        return duracionProgramaOpcion2;
    }

    public void setDuracionProgramaOpcion2(String duracionProgramaOpcion2) {
        this.duracionProgramaOpcion2 = duracionProgramaOpcion2;
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

    public String getMesFechaIni1() {
        return mesFechaIni1;
    }

    public void setMesFechaIni1(String mesFechaIni1) {
        this.mesFechaIni1 = mesFechaIni1;
    }
    
    public String getAnoFechaIni1() {
        return anoFechaIni1;
    }

    public void setAnoFechaIni1(String anoFechaIni1) {
        this.anoFechaIni1 = anoFechaIni1;
    }    

    public String getMesFechaFin1() {
        return mesFechaFin1;
    }
    
    public void setMesFechaFin1(String mesFechaFin1) {
        this.mesFechaFin1 = mesFechaFin1;
    }
    
    public String getAnoFechaFin1() {
        return anoFechaFin1;
    }

    public void setAnoFechaFin1(String anoFechaFin1) {
        this.anoFechaFin1 = anoFechaFin1;
    }

    public String getMesFechaIni2() {
        return mesFechaIni2;
    }

    public void setMesFechaIni2(String mesFechaIni2) {
        this.mesFechaIni2 = mesFechaIni2;
    }
    
    public String getAnoFechaIni2() {
        return anoFechaIni2;
    }

    public void setAnoFechaIni2(String anoFechaIni2) {
        this.anoFechaIni2 = anoFechaIni2;
    }    

    public String getMesFechaFin2() {
        return mesFechaFin2;
    }
    
    public void setMesFechaFin2(String mesFechaFin2) {
        this.mesFechaFin2 = mesFechaFin2;
    }
    
    public String getAnoFechaFin2() {
        return anoFechaFin2;
    }

    public void setAnoFechaFin2(String anoFechaFin2) {
        this.anoFechaFin2 = anoFechaFin2;
    }
    
    
    public String getNombreOpcion1() {
        return nombreOpcion1;
    }

    public void setNombreOpcion1(String nombreOpcion1) {
        this.nombreOpcion1 = nombreOpcion1;
    }

    public String getNombreOpcion2() {
        return nombreOpcion2;
    }

    public void setNombreOpcion2(String nombreOpcion2) {
        this.nombreOpcion2 = nombreOpcion2;
    }
    
    public String getPaisOpcion1() {
        return paisOpcion1;
    }

    public void setPaisOpcion1(String paisOpcion1 ) {
        this.paisOpcion1 = paisOpcion1;
    }

    public String getPaisOpcion2() {
        return paisOpcion2;
    }

    public void setPaisOpcion2(String paisOpcion2 ) {
        this.paisOpcion2 = paisOpcion2;
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

    public String getNombreProg1() {
        return nombreProg1;
    }

    public void setNombreProg1(String nombreProg1) {
        this.nombreProg1 = nombreProg1;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getNombrePais1() {
        return nombrePais1;
    }

    public void setNombrePais1(String nombrePais1) {
        this.nombrePais1 = nombrePais1;
    }
    
    public String getIndice() {
        return indice;
    }

    public void setIndice(String indice) {
        this.indice = indice;
    }

    public String getAreaEstud() {
        return areaEstud;
    }

    public void setAreaEstud(String areaEstud) {
        this.areaEstud = areaEstud;
    }

    public String getDecanato() {
        return decanato;
    }

    public void setDecanato(String decanato) {
        this.decanato = decanato;
    }
    
    public String getOpcion() {
        return opcion;
    }

    public void setOpcion(String opcion) {
        this.opcion = opcion;
    }

    public int getCreditosApro() {
        return creditosApro;
    }

    public void setCreditosApro(int creditosApro) {
        this.creditosApro = creditosApro;
    }

    /*public ArrayList<Materias> getLista() {
        return lista;
    }

    public void setLista(ArrayList<Materias> lista) {
        this.lista = lista;
    }*/

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

    public Boolean verificarPlanilla(PlanillaUSB P) {


        return true;
    }
    
    public String getFuenteFinanciamiento() {
        return fuenteFinanciamiento;
    }

    public void setFuenteFinanciamiento(String fuenteFinanciamiento) {
        this.fuenteFinanciamiento = fuenteFinanciamiento;
    }

    public String getDescripcion1() {
        return descripcion1;
    }

    public void setDescripcion1(String descripcion1) {
        this.descripcion1 = descripcion1;
    }

    public String getDescripcion2() {
        return descripcion2;
    }

    public void setDescripcion2(String descripcion2) {
        this.descripcion2 = descripcion2;
    }
    
    public String getAyudaEc() {
        return ayudaEc;
    }

    public void setAyudaEc(String ayudaEc) {
        this.ayudaEc = ayudaEc;
    }
    
    //@Override
    //public String toString() {
//        return "PlanillaUSB{" + "nombreUsuario=" + nombreUsuario + ", periodo=" + periodo + ", apellidos=" + apellidos + ", nombres=" + nombres + ", sexo=" + sexo + ", calle=" + calle + ", ciudad=" + ciudad + ", estado=" + estado + ", CodPostal=" + codPostal + ", telefonoCelular=" + telefonoCelular + ", telefonoCasa=" + telefonoCasa + ", Fax=" + fax + ", email=" + email + ", fechaNacimiento=" + fechaNacimiento + ", nacionalidad=" + nacionalidad + ", cedula=" + cedula + ", carnet=" + carnet + ", pasaporte=" + pasaporte + ", apellidoNombresRep=" + apellidoNombresRep + ", tlfRep=" + tlfRep + ", emailRep=" + emailRep + ", relacion=" + relacion + ", direccionRep=" + direccionRep + ", fechaIni1=" + fechaIni1 + ", fechaFin1=" + fechaFin1 + ", nombreOpcion1=" + nombreOpcion1 + ", fechaIni2=" + fechaIni2 + ", fechaFin2=" + fechaFin2 + ", nombreOpcion2=" + nombreOpcion2 + ", Idiomadest=" + idiomaDest + ", nivelVerbal=" + nivelVerbal + ", nivelEscrito=" + nivelEscrito + ", nombreProg1=" + nombreProg1 + ", nombreProg2=" + nombreProg2 + ", carrera=" + carrera + ", indice=" + indice + ", opcion=" + opcion + ", creditosApro=" + creditosApro + ", lista=" + lista + ", fechaSolicitud=" + fechaSolicitud + ", recomendacion=" + recomendacion + ", comentarioRecomendacion=" + comentarioRecomendacion + '}';
  //  }
}
