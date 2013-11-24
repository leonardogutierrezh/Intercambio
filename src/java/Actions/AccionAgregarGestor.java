package Actions;

import Clases.Correo;
import Clases.Usuario;
import DBMS.*;
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
 * @author dreabalbas
 */
public class AccionAgregarGestor extends org.apache.struts.action.Action {

    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
    private Pattern patron;
    private Matcher match;
    private static final String SUCCESS = "success";
    private static final String FAIL = "failure";
    private static final String ERROR = "error";
       
    public AccionAgregarGestor() {
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
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Usuario u = (Usuario) form;
        ActionErrors error = new ActionErrors();
        boolean huboError = false;
        String pswd = u.generarContrasena();
        String confPswd = pswd;
        String mail = u.getEmail();

        u.setPrivilegio(2);
        u.setContrasena(pswd);
        u.setConfirmar(confPswd);
        
         if (u.getNombreusuario().equals("")) {
            error.add("nombreusuario", new ActionMessage("error.nombreusuario.required"));
            saveErrors(request, error);
            huboError = true;
        }else if(DBMS.getInstance().existeUsuario(u)){
            error.add("nombreusuario", new ActionMessage("error.nombreusuarioexiste"));
            saveErrors(request, error);
            huboError = true;
        }
         
         if (u.getNombre().equals("")) {
            error.add("nombre", new ActionMessage("error.nombre.required"));
            saveErrors(request, error);
            huboError = true;
        }
        
        if (u.getEmail().equals("")) {
            error.add("email", new ActionMessage("error.email.required"));
            saveErrors(request, error);
            huboError = true;
        }else if (!validate(u.getEmail())) {
            error.add("email", new ActionMessage("error.email.malformulado"));
            saveErrors(request, error);
            huboError = true;
        }
        
        if (huboError) {
            return mapping.findForward(ERROR);

        } else if (DBMS.getInstance().agregarUsuario(u)) {
            if (DBMS.getInstance().agregarGestor(u)) {

                HttpSession session = request.getSession();
                Usuario obj = (Usuario)session.getAttribute("Usuario");
                String accion = "Agregó al sistema al gestor: " + u.getNombre();
                boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(),accion);
                
                Correo c = new Correo();
                String asunto = "Su usuario en el Sistema de Gestión de Intercambios ha sido creado";
                String mensaje = "Su usuario en el Sistema de Gestión de Intercambios ha sido creado."
                        + "\nSu usuario es: " + u.getNombreusuario()
                        + "\nSu clave de acceso temporal es: " + u.getContrasena();
                c.setAsunto(asunto);
                c.setMensaje(mensaje);
                boolean correoEnviado = c.enviarUsuario(u.getEmail());

                if (correoEnviado) {
                    return mapping.findForward(SUCCESS);
                } else {
                    return mapping.findForward(FAIL);
                }
            }
        }else{
            return mapping.findForward(FAIL);
        }
        
        return null;
        
    }
}