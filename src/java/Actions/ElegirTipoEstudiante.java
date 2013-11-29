/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions;

import Clases.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author andel
 */
public class ElegirTipoEstudiante extends org.apache.struts.action.Action{
    private static final String ESTUDIANTEUSB = "estudianteUSB";
    private static final String ESTUDIANTEEXT = "estudianteExt";


    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Usuario u = (Usuario) form;
 
        if (u.getPrivilegio() == 5){
            return mapping.findForward(ESTUDIANTEUSB);
        }else {
            return mapping.findForward(ESTUDIANTEEXT);
        } 
    }    
}
