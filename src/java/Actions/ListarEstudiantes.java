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
import javax.servlet.http.HttpSession;

/**
 *
 * @author gustavo
 */
public class ListarEstudiantes extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";

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

        HttpSession session = request.getSession();
        
        Usuario u = (Usuario) form;
       // Usuario u2 = new Usuario();
       // if (u.getNombreusuario() == null) {
       //     u.setNombreusuario(session.getAttribute("nombreusuario").toString());
       // }
       // String[] info = DBMS.getInstance().getInfoPostulante(u.getNombreusuario());
       // u2.setNombreusuario(info[3]);
       // ArrayList<Usuario> users = DBMS.getInstance().listarEstudiantes(u2);
       // request.setAttribute("usuario", users);
        return mapping.findForward(SUCCESS);
    }
}
