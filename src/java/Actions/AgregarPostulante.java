package Actions;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import Clases.Postulante;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import DBMS.*;

/**
 *
 * @author caponte
 */
public class AgregarPostulante extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "failure";
    private static final String ERROR = "error";

    public AgregarPostulante() {
        super();
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

        Postulante p = (Postulante) form;
        ActionErrors error = new ActionErrors();
        boolean huboError = false;

        if (p.getNombreusuario().equals("")) {
            error.add("nombreusuario", new ActionMessage("error.nombreusuario.required"));
            saveErrors(request, error);
            huboError = true;
        }else if(DBMS.getInstance().existeUsuario(p)){
            error.add("nombreusuario", new ActionMessage("error.nombreusuarioexiste"));
            saveErrors(request, error);
            huboError = true;
        }

        if (p.getCodigo().equals("")) {
            error.add("codigo", new ActionMessage("error.codigo.required"));
            saveErrors(request, error);
            huboError = true;
        }

        if (p.getTipo().equals("")) {
            error.add("tipo", new ActionMessage("error.tipo.required"));
            saveErrors(request, error);
            huboError = true;
        }

        if (p.getNombreUniExt().equals("")) {
            error.add("nombreUniExt", new ActionMessage("error.nombreUniExt.required"));
            saveErrors(request, error);
            huboError = true;
        }

        if (p.getNombreCarrera().equals("")) {
            error.add("nombreCarrera", new ActionMessage("error.nombreCarrera.required"));
            saveErrors(request, error);
            huboError = true;
        }
        String t = p.getTipo();
        // Si hubo error lo notifica, si no, procede a agregar en la BD.
        if (huboError) {
            return mapping.findForward(ERROR);

            // Dependiendo del tipo de postulante, ejecuta una insercion u otra
        }else if (p.getTipo().equals("Coordinacion")) {
            if (DBMS.getInstance().agregarCoordUSB(p)) {
                return mapping.findForward(SUCCESS);
            }
        }else if (p.getTipo().equals("Universidad Extranjera")) {
            if (DBMS.getInstance().agregarUniExt(p)) {
                return mapping.findForward(SUCCESS);
            }
        }
        return mapping.findForward(FAIL);
    }
}
