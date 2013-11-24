/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.util.ArrayList;

/**
 *
 * @author karen
 */
public class PlanExtranjero extends org.apache.struts.action.ActionForm {

    /**
     * Atributos para la clase del plan de estudio, donde consta de:
     *  3 arraylist donde estaran guardados, el codigo de la materia en la usb,
     *  su nombre, sus creditos,
     * Ademas se disponen de 3 indices para poder agregar cada formulario a su arraylist
     * asociado y en la posicion que concuerden con el resto de los arraylist
    */
    private String nombreUsuario;
    private ArrayList listMateriaUSB;
    private String materiaUSB;
    private ArrayList listCodigoUSB;
    private String codigoUSB;
    private ArrayList listCreditosUSB;
    private Integer creditosUSB;
    private Integer indexCodUSB;
    private Integer indexNomUSB;
    private Integer indexCreUSB;

    public PlanExtranjero() {

        /*Se crea un plan de estudio con los arraylist, limpios y los indices en 0*/
        listCodigoUSB = new ArrayList();
        listCreditosUSB = new ArrayList();
        listMateriaUSB = new ArrayList();
        indexCodUSB = 0;
        indexNomUSB = 0;
        indexCreUSB = 0;
    }

    /*Metodos de la clase:
        todos los metodos hacen basicamente los mismo que es obtener los datos
        del formulario, insertarlos en el arraylist asociado, aumentar su indice
        y poner un metodo para obtener el arraylist completo cuando se necesite.
        Ademas de proveer el getter y el setter del nombreusuario asociado al
        * Plan de estudio.*/
    
    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String NombreUsuario) {
        this.nombreUsuario = NombreUsuario;
    }

    public String getMateriaUSB(int index) {
        return (String)this.listMateriaUSB.get(index);
    }

    public void setMateriaUSB(int index, String materia) {

        this.materiaUSB = materia;
        setListMateriaUSB(materiaUSB);
        indexNomUSB++;
    }

    public ArrayList getListMateriaUSB() {
        return this.listMateriaUSB;
    }

    public void setListMateriaUSB(String materia) {
        this.listMateriaUSB.add(indexNomUSB, materia);
    }

    public String getCodigoUSB(int index) {
        return (String)this.listCodigoUSB.get(index);
    }

    public void setCodigoUSB(int index, String codigo) {

        this.codigoUSB = codigo;
        setListCodigoUSB(codigoUSB);
        this.indexCodUSB++;
    }

    public ArrayList getListCodigoUSB() {
        return this.listCodigoUSB;
    }

    public void setListCodigoUSB(String codigo) {
        this.listCodigoUSB.add(indexCodUSB, codigo);
    }

    public int getCreditosUSB(int index) {
      return (Integer)this.listCreditosUSB.get(index);
    }

    public void setCreditosUSB(int index, int credito) {

        this.creditosUSB = credito;
        setListCreditosUSB(creditosUSB);
        indexCreUSB++;
    }

    public ArrayList getListCreditoUSB() {
        return this.listCreditosUSB;
    }

    public void setListCreditosUSB(int credito) {
        this.listCreditosUSB.add(indexCreUSB, credito);

    }

}