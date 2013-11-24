/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.util.ArrayList;

/**
 *
 * @author katty
 */
public class PlanDeEstudio extends org.apache.struts.action.ActionForm {

    /*Atributos para la clase del plan de estudio, donde consta de:
        6 arraylist donde estaran guardados, el codigo de la materia en la usb,
        su nombre, sus creditos, el codigo de la materia equivalente en la
        universidad extranjera, el nombre, y la cantidad de creditos equivalentes.
     Ademas se disponen de 6 indices para poder agregar cada formulario a su arraylist
     asociado y en la posicion que concuerden con el resto de los arraylist*/
    private String nombreUsuario;
    private ArrayList listMateriaUSB;
    private String materiaUSB;
    private ArrayList listCodigoUSB;
    private String codigoUSB;
    private ArrayList listCreditosUSB;
    private Integer creditosUSB;
    private String codigoUniv;
    private ArrayList listCodigoUniv;
    private String materiaUniv;
    private ArrayList listMateriaUniv;
    private Integer creditosUniv;
    private ArrayList listCreditosUniv;
    private Integer indexCodUSB;
    private Integer indexNomUSB;
    private Integer indexCreUSB;
    private Integer indexCodUniv;
    private Integer indexNomUniv;
    private Integer indexCreUniv;

    public PlanDeEstudio() {

        /*Se crea un plan de estudio con los arraylistset, limpios y los indices en 0*/
        listCodigoUSB = new ArrayList();
        listCodigoUniv = new ArrayList();
        listCreditosUSB = new ArrayList();
        listCreditosUniv = new ArrayList();
        listMateriaUSB = new ArrayList();
        listMateriaUniv = new ArrayList();
        indexCodUSB = 0;
        indexNomUSB = 0;
        indexCreUSB = 0;
        indexCodUniv = 0;
        indexNomUniv = 0;
        indexCreUniv = 0;
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

    public String getCodigoUniv(int index) {
        return (String)this.listCodigoUniv.get(index);
    }

    public void setCodigoUniv(int index, String codigo) {

        this.codigoUniv = codigo;
        setListCodigoUniv(codigoUniv);
        indexCodUniv++;
    }

    public ArrayList getListCodigoUniv() {
        return this.listCodigoUniv;
    }

    public void setListCodigoUniv(String codigo) {
        this.listCodigoUniv.add(indexCodUniv, codigo);
    }

    public String getMateriaUniv(int index) {
        return (String)this.listMateriaUniv.get(index);
    }

    public void setMateriaUniv(int index, String materia) {

        this.materiaUniv = materia;
        setListMateriaUniv(materiaUniv);
        indexNomUniv++;
    }

    public ArrayList getListMateriaUniv() {
        return this.listMateriaUniv;
    }

    public void setListMateriaUniv(String materia) {
        this.listMateriaUniv.add(indexNomUniv, materia);

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

    public int getCreditosUniv(int index) {
        return (Integer)this.listCreditosUniv.get(index);
    }

    public void setCreditosUniv(int index, int credito) {

        this.creditosUniv = credito;
        setListCreditosUniv(creditosUniv);
        indexCreUniv++;
    }

    public ArrayList getListCreditoUniv() {
        return this.listCreditosUniv;
    }

    public void setListCreditosUniv(int credito) {
        this.listCreditosUniv.add(indexCreUniv, credito);

    }    
}