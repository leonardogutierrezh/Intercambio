/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
public class ModificarPerfil extends org.apache.struts.action.Action {

    /* Patrones a Validar */
    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String ADMIN = "admin";
    private static final String GESTOR = "gestor";
    private static final String COORDINACION = "coordinacion";
    private static final String FAIL = "failure";
    private static final String ERROR = "error";
    private Pattern patron;
    private Matcher match;

    public ModificarPerfil() {
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

        HttpSession session = request.getSession(true);
        Usuario u = (Usuario) form;
        Usuario user = DBMS.getInstance().obtenerDatos(u);
        ActionErrors error = new ActionErrors();
        boolean huboError = false;
        //campos para evitar el error

        if (u.getConfirmar2() == null) {
            u.setConfirmar2("");
        }
        if (u.getNuevacontra() == null) {
            u.setNuevacontra("");
        }
        String confPswd = u.getConfirmar2();
        String mail = u.getEmail();
        String nuev = u.getNuevacontra();

        //Verifica que el nombre propio del usuario no sea vacio/.
        if (u.getNombre().equals("")) {
            error.add("nombre", new ActionMessage("error.nombre.required"));
            saveErrors(request, error);
            huboError = true;
        }
        if (!u.getConfirmar2().equals("") || !u.getNuevacontra().equals("")) {
            if (u.getContrasena().equals("")) {
                error.add("contrasena", new ActionMessage("error.contrasena.required"));
                saveErrors(request, error);
                huboError = true;
            } else if (u.getContrasena().length() < 6) {
                error.add("contrasena", new ActionMessage("error.contrasena.corta"));
                saveErrors(request, error);
                huboError = true;
            } else if (!user.getContrasena().equals(u.getContrasena())) {
                error.add("contrasena", new ActionMessage("error.contrasena.diferente"));
                saveErrors(request, error);
                huboError = true;

            }

            //Verificar que el campo nuevacontrasena del usuario no sea vacio/.

            if (u.getNuevacontra().equals("")) {
                error.add("nuevacontra", new ActionMessage("error.nuevacontra.required"));
                saveErrors(request, error);
                huboError = true;
            } else if (nuev.length() < 6) {
                error.add("nuevacontra", new ActionMessage("error.contrasena.corta"));
                saveErrors(request, error);
                huboError = true;
            }

            //Verificar que el campo confirmar del usuario no sea vacio/.

            if (u.getConfirmar2().equals("")) {
                error.add("confirmar2", new ActionMessage("error.confirmar.required"));
                saveErrors(request, error);
                huboError = true;
            } else if (confPswd.length() < 6) {
                error.add("confirmar2", new ActionMessage("error.contrasena.corta"));
                saveErrors(request, error);
                huboError = true;
            }

            if (!confPswd.equals(nuev)) {
                error.add("nuevacontra", new ActionMessage("error.contrasena.distintas"));
                saveErrors(request, error);
                huboError = true;
            }
        }
        //Verifica que el email no sea vacio y que este estructurado correctamente.
        if ( u.getEmail().equals("")) {
            error.add("email", new ActionMessage("error.email.required"));
            saveErrors(request, error);
            huboError = true;
        }
        if ( validate(mail) == false) {
            error.add("email", new ActionMessage("error.email.malformulado"));
            saveErrors(request, error);
            huboError = true;
        }

        // Si hubo error lo notifica, si no, procede a agregar en la BD.
        if (huboError) {

            switch (u.getPrivilegio()) {
                case 1:
                    return mapping.findForward(ERROR);
                case 2:
                    return mapping.findForward("errorgest");
                case 3:
                    return mapping.findForward("errorcord");
                case 4:
                    return mapping.findForward(ERROR);
                case 5:
                    return mapping.findForward("errorusb");
                case 6:
                    return mapping.findForward("errorext");
                default:
                    return mapping.findForward(ERROR);

            }

        } else if (DBMS.getInstance().modificarPerfil(u)) {

            boolean boo = DBMS.getInstance().registrar(u.getNombreusuario(), "Modificacion de perfil por parte del usuario");
            if (u.getPrivilegio() == 1) {
                return mapping.findForward(ADMIN);
            } else if (u.getPrivilegio() == 2) {
                ArrayList<Usuario> users = DBMS.getInstance().listarEstudiantesPostulados();
                request.setAttribute("usuarios", users);
                request.setAttribute("usuario", u);
                session.setAttribute("nombre", u.getNombre());
                session.setAttribute("nombreusuario", u.getNombreusuario());
                return mapping.findForward(GESTOR);
            } else if (u.getPrivilegio() == 3) {
                return mapping.findForward(COORDINACION);
            } else if (u.getPrivilegio() == 5) {
                return mapping.findForward("usb");
            } else if (u.getPrivilegio() == 6) {
                return mapping.findForward("ext");
            } else {
                return mapping.findForward(SUCCESS);
            }

        } else {
            return mapping.findForward(FAIL);
        }
    }
}
