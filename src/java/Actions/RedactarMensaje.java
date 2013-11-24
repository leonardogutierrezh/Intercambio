/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Anuncio;
import Clases.Correo;
import Clases.HiloCorreo;
import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import java.util.Arrays;
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
 * @author gustavo
 */
public class RedactarMensaje extends org.apache.struts.action.Action {

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

        Anuncio a = (Anuncio) form;
        Correo c = new Correo();
        HiloCorreo c2 = new HiloCorreo(a);
        ActionErrors error = new ActionErrors();
        boolean huboerror = false;


        HttpSession session = request.getSession();

        String[] emails = a.getEmails();

        if (a.getTitulo().equals("")) {
            error.add("titulo", new ActionMessage("error.titulo.required"));
            saveErrors(request, error);
            huboerror = true;
        }

        if (a.getMensaje().equals("")) {
            error.add("mensaje", new ActionMessage("error.mensaje.required"));
            saveErrors(request, error);
            huboerror = true;

        }
        if (emails == null) {
            error.add("titulo", new ActionMessage("error.emails.requerido"));
            saveErrors(request, error);
            huboerror = true;
        }

        if (huboerror) {
            ArrayList<Usuario> users = DBMS.getInstance().listarDestinatarios(a.getBackup());
            request.setAttribute("usuarios", users);
            return mapping.findForward("error");
        }

        ArrayList<String> pasaje = new ArrayList<String>(Arrays.asList(emails));

        if (DBMS.getInstance().agregarAnuncio(a)) {
            c2.start();
            Usuario obj = (Usuario) session.getAttribute("Usuario");
            boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(), "Envio del anuncio " + a.getTitulo() + "a los usuarios seleccionados");
            return mapping.findForward(SUCCESS);
        }
        return mapping.findForward("error");

    }
}
