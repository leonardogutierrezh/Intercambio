/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Anuncio;
import Clases.Usuario;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author caponte
 */
public class PublicarAnuncio extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "failure";
    private static final String ERROR = "error";

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

        ActionErrors error = new ActionErrors();
        Anuncio datos = (Anuncio) form;
        boolean huboError = false;

        HttpSession session = request.getSession();


        if (datos.getTitulo().equals("")) {

            error.add("titulo", new ActionMessage("error.titulo.required"));
            huboError = true;
        }

        if (datos.getMensaje().equals("")) {


            error.add("mensaje", new ActionMessage("error.mensaje.required"));
            huboError = true;

        }


        if (huboError) {
            return mapping.findForward(ERROR);

        } else if (DBMS.getInstance().agregarAnuncio(datos)) {
            Usuario obj = (Usuario) session.getAttribute("Usuario");
            boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(), "Envio del anuncio " + datos.getTitulo() + "a los usuarios seleccionados");
            return mapping.findForward(SUCCESS);

        } else {
            return mapping.findForward(FAIL);
        }
    }
}
