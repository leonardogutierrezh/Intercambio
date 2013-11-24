/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import DBMS.DBMS;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author gustavo
 */
public class ModificarPerUSB extends org.apache.struts.action.Action {

    /* Patrones a Validar */
    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
    /* forward name="success" path="" */
    private static final String FAIL = "failureusb";
    private static final String ERROR = "errorusb";
    private Pattern patron;
    private Matcher match;

    public ModificarPerUSB() {
        patron = Pattern.compile(patronEmail);
    }

    public boolean validate(final String username) {

        match = patron.matcher(username);
        return match.matches();
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
     *
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {


        Usuario u = (Usuario) form;
        Usuario user = DBMS.getInstance().obtenerDatos(u);
        ActionErrors error = new ActionErrors();
        boolean huboError = false;
        String pswd = u.getContrasena();
        String confPswd = u.getConfirmar();
        String mail = u.getEmail();
        String nuev = u.getNuevacontra();

        //Verifica que el username no  sea vacio.
        if (u.getNombreusuario().equals("")) {
            error.add("nombreusuario", new ActionMessage("error.nombreusuario.required"));
            saveErrors(request, error);
            huboError = true;
        }

        //Verifica que el nombre propio del usuario no sea vacio/.
        if (u.getNombre().equals("")) {
            error.add("nombre", new ActionMessage("error.nombre.required"));
            saveErrors(request, error);
            huboError = true;
        }

        //Verificar que el campo contrasena del usuario no sea vacio/.

        if (u.getContrasena().equals("")) {
            error.add("contrasena", new ActionMessage("error.nombre.required"));
            saveErrors(request, error);
            huboError = true;
        } else if (validate(mail) == false) {
            error.add("email", new ActionMessage("error.email.malformulado"));
            saveErrors(request, error);
            huboError = true;
        }

        if (!user.getContrasena().equals(u.getContrasena())) {
            error.add("contrasena", new ActionMessage("error.contrasena.diferente"));
            saveErrors(request, error);
            huboError = true;

        }
        //Verificar que el campo nuevacontrasena del usuario no sea vacio/.

        if (u.getNuevacontra().equals("")) {
            error.add("nuevacontra", new ActionMessage("error.nuevacontra.required"));
            saveErrors(request, error);
            huboError = true;
        }

        //Verificar que el campo confirmar del usuario no sea vacio/.

        if (u.getConfirmar().equals("")) {
            error.add("confirmar", new ActionMessage("error.confirmar.required"));
            saveErrors(request, error);
            huboError = true;
        }

        //Verifica que el email no sea vacio y que este estructurado correctamente.
        if (u.getEmail().equals("")) {
            error.add("email", new ActionMessage("error.email.required"));
            saveErrors(request, error);
            huboError = true;
        }


        if (!confPswd.equals(nuev)) {
            error.add("nuevacontra", new ActionMessage("error.contrasena.distintas"));
            saveErrors(request, error);
            huboError = true;
        }


        // Si hubo error lo notifica, si no, procede a agregar en la BD.
        if (huboError) {
            if (user.getPrivilegio() == 5) {
                return mapping.findForward(ERROR);
            }
            return mapping.findForward("errorext");


        } else if (DBMS.getInstance().modificarPerfil(u)) {

            boolean boo = DBMS.getInstance().registrar(u.getNombreusuario(), "Modificacion del perfil de usuario nacional");
            if (user.getPrivilegio() == 5) {
                return mapping.findForward("usb");
            }
            return mapping.findForward("ext");

        } else {
            if (user.getPrivilegio() == 5) {
                return mapping.findForward(FAIL);
            }
            return mapping.findForward("failureext");
        }
    }
}
