/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Clases;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author andel
 */
public class UploadForm extends ActionForm{
    private FormFile excel;
    
    public FormFile getExcel(){
        return excel;
    }
    
    public void setExcel(FormFile excel){
        this.excel = excel;
    }
}
