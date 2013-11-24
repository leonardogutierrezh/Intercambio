/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import Clases.Correo;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import DBMS.*;

/**
 *
 * @author caponte
 */
public class AccionAgregarUsuario extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";
    private static final String FAIL = "failure";
    private static final String GESTOR = "gestor";
    private static final String COORDINACION = "coordinacion";
    private static final String UEXTRANJERA = "uextranjera";
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
 
        if (u.getPrivilegio() == 2) {
            return mapping.findForward(GESTOR);
        }else if (u.getPrivilegio() == 3){
            return mapping.findForward(COORDINACION);
        }else if (u.getPrivilegio() == 4){
            return mapping.findForward(UEXTRANJERA);
        }else if (u.getPrivilegio() == 5){
            return mapping.findForward(ESTUDIANTEUSB);
        }else if (u.getPrivilegio () == 6){
            return mapping.findForward(ESTUDIANTEEXT);
        } else {
            return mapping.findForward(FAIL);
        }
    }
}
