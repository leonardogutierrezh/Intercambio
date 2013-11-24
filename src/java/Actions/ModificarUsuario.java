/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import DBMS.DBMS;

/**
 *
 * @author caponte
 */
public class ModificarUsuario extends org.apache.struts.action.Action {

    /* Patrones a Validar */
    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "failure";
    private static final String ERROR = "error";
    private Pattern patron;
    private Matcher match;

   
    public ModificarUsuario() {
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
        ActionErrors error = new ActionErrors();
        boolean huboError = false;
        String pswd = u.getContrasena();
        String confPswd = u.getConfirmar();
        String mail = u.getEmail();

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

        //Verifica que el email no sea vacio y que este estructurado correctamente.
        if (u.getEmail().equals("")) {
            error.add("email", new ActionMessage("error.email.required"));
            saveErrors(request, error);
            huboError = true;
        } else if (validate(mail) == false) {
            error.add("email", new ActionMessage("error.email.malformulado"));
            saveErrors(request, error);
            huboError = true;
        }


        // Si hubo error lo notifica, si no, procede a agregar en la BD.
        if (huboError) {
            return mapping.findForward(ERROR);

        } else if (DBMS.getInstance().modificarUsuario(u)) {
            
            boolean boo = DBMS.getInstance().registrar(u.getNombreusuario(),"Modificacion del perfil del usuario");
            return mapping.findForward(SUCCESS);

        } else {
            return mapping.findForward(FAIL);
        }
    }
}
