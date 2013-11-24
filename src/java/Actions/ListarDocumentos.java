/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author caponte
 */
public class ListarDocumentos extends org.apache.struts.action.Action {

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

        Usuario u = (Usuario) form;

        ArrayList<String> documentos = DBMS.getInstance().listarDocumentos(u);
        ArrayList<Usuario> users = new ArrayList<Usuario>(0);
       
        for (String s : documentos) {
            Usuario tmp = new Usuario();
            tmp.setConfirmar(s);
            
            int pos = s.lastIndexOf('/');
            s = s.substring(pos+1);         
            tmp.setNombre(s);
            
            users.add(tmp);
        }
        request.setAttribute("usuarios", users);
        return mapping.findForward(SUCCESS);
    }
}
