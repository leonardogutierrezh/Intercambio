/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author gustavo
 */
import java.util.*;
import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class FileUploadForm extends ActionForm {

    /*Atributos para la clase FileUploadForm, donde consta de:
     1 arraylist donde estaran los archivos.
     Ademas se disponen de 1 indice para poder agregar cada formulario a su arraylist
     asociado y en la posicion que concuerden con el resto de los arraylist*/
    private FormFile theFile;
    private ArrayList listFile;
    private Integer index = 0;
    private String nombreusuario;

    public FileUploadForm() {
        
        /*Se crea un FileUploadForm con el arraylist limpios y el indice en 0*/
        
        listFile = new ArrayList();
        this.index = 0;
    }

    /*Metodos de la clase:
        todos los metodos se centran en los archivos, asi hay metodo para obtener
        * los archivos del form, agregar los archivos al arraylist, obtener el arraylist
        * y llenar el arraylist, tambien se disponen de 2 metodos para obtener y
        * guardar el nombre del usuario asociado a los archivos.*/
    
    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public FormFile getTheFile(int indice) {
        return this.theFile;
    }

    public void setTheFile(int indice, FormFile theFile) {

        this.theFile = theFile;
        setListFile(theFile);
        this.index++;
    }

    public ArrayList getListFile() {
        return this.listFile;
    }

    public void setListFile(FormFile theFile) {
        this.listFile.add(index, theFile);
    }
}