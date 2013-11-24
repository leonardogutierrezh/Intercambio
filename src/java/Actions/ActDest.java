/*
 * To change this template, choose Tools | Templates
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
 * @author gustavo
 */
public class ActDest extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

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
        Usuario f = (Usuario) form;
        Usuario u = new Usuario();
        boolean b;
        if (f.getConfirmar().equalsIgnoreCase("desactivar")) {
            b = DBMS.getInstance().CambiarSistema(false);
        } else {
            b = DBMS.getInstance().CambiarSistema(true);
        }

        HttpSession session = request.getSession();
        Usuario obj = (Usuario) session.getAttribute("Usuario");
        String accion = null;

        if (b) {
            u.setConfirmar("Inactivo");
            accion = "Desactivó el sistema";
        } else {
            u.setConfirmar("Activado");
            accion = "Activó el sistema";
        }

        boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(), accion);
        request.setAttribute("usuario", u);
        return mapping.findForward(SUCCESS);
    }
}