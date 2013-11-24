/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Correo;
import Clases.EstudianteUSB;
import Clases.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import DBMS.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

/**
 *
 * @author caponte
 */
public class AgregarEstudiantes extends org.apache.struts.action.Action {

    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "failure";
    private static final String ERROR = "error";
    private Pattern patron;
    private Matcher match;

    public AgregarEstudiantes() {
        patron = Pattern.compile(patronEmail);
    }

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
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        HttpSession session = request.getSession(true);
        String nombuser = (String) session.getAttribute("nombreusuario");
        
        String [] tmp = DBMS.getInstance().getInfoPostulante(nombuser);
        
        
        if(tmp[0].equals("Coordinacion")){
            tmp.toString();
            return mapping.findForward("cord");
        
        }else{

        return mapping.findForward("uniex");
        }

    }
}
