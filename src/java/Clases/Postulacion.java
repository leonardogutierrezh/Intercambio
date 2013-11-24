/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author karen
 */
public class Postulacion extends org.apache.struts.validator.ValidatorForm {
    private int Numero;
    private String Estado;
    private String NomEst;
    private String NomPostulante;
    private String CodigoPost;
    
    public int getNumero() {
        return Numero;
    }

    public void setNumero(int Numero) {
        this.Numero = Numero;
    }
    
    public String getEstado() {
        return Estado;
    }
    
    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    public String getNomEst(){
        return NomEst;
    }
    
    public void setNomEst(String NomEst){
        this.NomEst = NomEst;
    }
    
    public String getNomPostulante() {
        return NomPostulante;
    }
    
    public void setNomPostulante(String NomPostulante){
        this.NomPostulante = NomPostulante;
    }
    
    public String getCodigoPost() {
        return CodigoPost;
    }
    
    public void setCodigoPost(String CodigoPost) {
        this.CodigoPost = CodigoPost;
    }
    
    
    
}
