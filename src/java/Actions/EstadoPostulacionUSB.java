/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions;

import Clases.Usuario;
import Clases.PlanillaUSB;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author andel
 */
public class EstadoPostulacionUSB extends org.apache.struts.action.Action {
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Usuario u = (Usuario) form;
        System.out.println(u.getNombreusuario());
        
        Usuario estado = DBMS.getInstance().obtenerEstadoSolicitud(u);
        request.setAttribute("Usuario", u);
        return mapping.findForward(SUCCESS);
    }
}