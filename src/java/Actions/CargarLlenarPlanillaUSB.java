/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Idiomas;
import Clases.Usuario;
import Clases.PlanillaUSB;
import Clases.PlanDeEstudio;
import Clases.SuperArray;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author caponte
 */
public class CargarLlenarPlanillaUSB extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String MODIFICAR = "modificar";

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

        PlanillaUSB p = (PlanillaUSB) form;
        HttpSession session = request.getSession(true);

        Usuario u = new Usuario();
        if (p.getNombreUsuario() == null) {
            u.setNombreusuario(session.getAttribute("nombreusuario").toString());
        } else {
            u.setNombreusuario(p.getNombreUsuario());
        }
        u.setConfirmar("2013-2014");

        Clases.PlanillaUSB hay = DBMS.getInstance().obtenerPlanillaUSB(u);
        ArrayList<SuperArray> arra = new ArrayList();
        ArrayList<SuperArray> sup = new ArrayList();

        if (hay.getNombreUsuario() != null) {
            //Para cargar los idiomas y el plan de estudio ya que ya esta en la db
            p = DBMS.getInstance().obtenerPlanillaUSB(u);
            PlanDeEstudio plan = DBMS.getInstance().obtenerPlanDeEstudio(u);
            Idiomas idio = DBMS.getInstance().obtenerIdiomas(u);
            for (int i = 0; i < plan.getListCodigoUSB().size(); i++) {
                SuperArray a = new SuperArray();
                a.setCamp1(plan.getCodigoUSB(i));
                a.setCamp2(plan.getMateriaUSB(i));
                a.setCamp3(Integer.toString(plan.getCreditosUSB(i)));
                a.setCamp4(plan.getCodigoUniv(i));
                a.setCamp5(plan.getMateriaUniv(i));
                a.setCamp6(Integer.toString(plan.getCreditosUniv(i)));
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
            u.setNombre("");
            request.setAttribute("PlanillaUSB", p);
            request.setAttribute("Usuario", u);
            request.setAttribute("plan", sup);
            request.setAttribute("lang", arra);
            return mapping.findForward(MODIFICAR);
        }

        u.setNombre("");
        request.setAttribute("plan", sup);
        request.setAttribute("lang", arra);
        request.setAttribute("Usuario", u);
        return mapping.findForward(SUCCESS);
    }
}
