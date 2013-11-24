/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import DBMS.*;

/**
 *
 * @author gustavo
 */
public class ConsultarUsuario2 extends org.apache.struts.action.Action {

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
            Usuario user = (Usuario) form;
            String redi = user.getConfirmar();
            user = DBMS.getInstance().obtenerDatos(user);
            
        if( user.getNombreusuario() != null){
            Integer tmp = user.getPrivilegio();
            if (tmp == 1){
                user.setConfirmar("Administrador");
            }else if (tmp ==2){
                user.setConfirmar("Decanato || DRIC");
            }else if (tmp == 3){
                user.setConfirmar("Coordinacion");
            }else if (tmp ==4){
                user.setConfirmar("Universidad Ext");
            }else if (tmp ==5){
                user.setConfirmar("Estudiante USB");
            }else if (tmp == 6){
                user.setConfirmar("Estudiante Ext");
            }
            
            request.setAttribute("usuario", user);
            
            if(redi.equals("postulante")){
                return mapping.findForward("postu");  
            }else if(redi.equals("gestor")){
                return mapping.findForward("gestor");  
            }
            
            return mapping.findForward(SUCCESS);  
        }else{
            return mapping.findForward(FAIL); 
        }
        
    }
}
