/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Idiomas;
import Clases.PlanDeEstudio;
import Clases.Usuario;
import Clases.PlanillaExt;
import Clases.SuperArray;
import DBMS.DBMS;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author dreabalbas
 */
public class CargarLlenarPlanillaExt extends org.apache.struts.action.Action {

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
        
        PlanillaExt p = (PlanillaExt) form;
        
        Usuario u = new Usuario();
        u.setNombreusuario(p.getNombreUsuario());
        PlanDeEstudio plan = DBMS.getInstance().obtenerPlanDeEstudio(u);
        Idiomas idio = DBMS.getInstance().obtenerIdiomas2(u);
        ArrayList<SuperArray> arra = new ArrayList();
        ArrayList<SuperArray> sup = new ArrayList();
        for (int i = 0; i < plan.getListCodigoUSB().size(); i++) {
            SuperArray a = new SuperArray();
            a.setCamp1(plan.getCodigoUSB(i));
            a.setCamp2(plan.getMateriaUSB(i));
            a.setCamp3(Integer.toString(plan.getCreditosUSB(i)));
            sup.add(a);
        }

        for (int i = 0; i < idio.getListIdio().size(); i++) {
            SuperArray a = new SuperArray();
            a.setCamp1((String) idio.getListIdio().get(i));
            a.setCamp2((String) idio.getListVerb().get(i));
            a.setCamp3((String) idio.getListEscr().get(i));
            a.setCamp4((String) idio.getListConversacional().get(i));
            a.setCamp5((String) idio.getListAuditivo().get(i));
            arra.add(a);
        }
        request.setAttribute("plan", sup);
        request.setAttribute("lang", arra);

        
        return mapping.findForward(SUCCESS);
    }
}
