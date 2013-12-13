/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;
import Clases.Usuario;
import DBMS.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author gustavo
 */
public class AgregarComentario extends org.apache.struts.action.Action {

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
        System.out.println(u.getConfirmar2());
        if(!DBMS.getInstance().Recomendar(u)){
            return mapping.findForward(FAIL);
        }
        u.setConfirmar("En evaluacion por DRIC");
        if(!DBMS.getInstance().Recomendar(u)){
            return mapping.findForward(FAIL);
        }
        
        return mapping.findForward(SUCCESS);
    }
}
