/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions;

import Clases.UploadForm;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author andel
 */
public class UploadeAction extends org.apache.struts.actions.DispatchAction{
    public ActionForward execute(ActionMapping mapping,
            ActionForm form, HttpServletRequest request, HttpServletResponse response){

                System.out.println("Leyendo");
                UploadForm forma = (UploadForm) form;
                FormFile myFile = forma.getExcel();

                //Leyendo el nombre del archivo
                System.out.println(myFile.getFileName());
                //Si es excel 2007 es una clase
                return mapping.findForward("inicio");
    }    
} 

