/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions;

import Clases.Usuario;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author leonardo
 */
public class eliminarsolicitudcoordinacion extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "failure";
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
            Usuario u = (Usuario) form;
            u.setConfirmar("Rechazada por coordinacion");
            if (DBMS.getInstance().cambiarEstadoSolicitud(u)) {
                
                HttpSession session = request.getSession();
                Usuario obj = (Usuario)session.getAttribute("Usuario");
                String accion = "Eliminó del sistema al usuario " + u.getNombreusuario();
                boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(),accion);
                
                return mapping.findForward(SUCCESS);
            }else{
                return mapping.findForward(FAIL);  
            }
    }
}
