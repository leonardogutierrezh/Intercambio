/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import Clases.Correo;
import DBMS.DBMS;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import nl.captcha.Captcha;

/**
 *
 * @author dreabalbas
 */
public class recContrasena extends org.apache.struts.action.Action {

    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";
    private final static String ERROR = "error";
    private static final String patronEmail =
            "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
    private Pattern patron;
    private Matcher match;

    public recContrasena() {
        patron = Pattern.compile(patronEmail);
    }

    public boolean validate(final String username) {

        match = patron.matcher(username);
        return match.matches();
    }

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Usuario u = (Usuario) form;
        ActionErrors error = new ActionErrors();
        HttpSession session = request.getSession();
        boolean huboError = false;

        String nombreusuario = u.getNombreusuario();
        String email = u.getEmail();

        String[] datos = new String[3];

        Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
        request.setCharacterEncoding("UTF-8");
        String answer = request.getParameter("answer");
        if (answer.equals("")) {
            error.add("captcha",
                    new ActionMessage("error.captcha.required"));
            saveErrors(request, error);
            huboError = true;
        } else if (!captcha.isCorrect(answer)) {
            error.add("captcha",
                    new ActionMessage("error.captcha.invalido"));
            saveErrors(request, error);
            huboError = true;
        }
        
        //Verifica si se dejaron campos vacios
        if (nombreusuario.equals("") && email.equals("")){
                error.add("nombreusuario", new ActionMessage("error.reccontrasena.required"));
                saveErrors(request, error);
                error.add("email", new ActionMessage("error.reccontrasena.required"));
                saveErrors(request, error);
                huboError = true;
        }else{
            //Si el nombre de usuario no esta vacio
            if (!nombreusuario.equals("")){
                // Intento extraer los datos del nombre de usuario introducido
                datos = DBMS.getInstance().existeUsuario(nombreusuario);
                //Si el nombre de usuario no existe y el correo esta vacio, error
                if (datos == null && email.equals("")){
                    error.add("nombreusuario", new ActionMessage("error.nombreusuariomiss.required"));
                    saveErrors(request, error);
                    huboError = true;
                //Si el nombre de usuario no existe pero se introdujo un correo,
                // se intenta con el correo
                }else if (datos == null && !email.equals("")){
                    // Se verfica si el email es valido o no
                    if (!validate(email)){
                        error.add("email", new ActionMessage("error.email.malformulado"));
                        saveErrors(request, error);
                        huboError = true;
                    // Si es valido, intento extraer los datos asociados al correo
                    }else{
                        datos = DBMS.getInstance().existeEmail(email);
                        //Si el correo no existe, error
                        if (datos == null){
                            error.add("nombreusuario", new ActionMessage("error.nombreusuariomiss.required"));
                            saveErrors(request, error);
                            huboError = true;
                            error.add("email", new ActionMessage("error.emailmiss.required"));
                            saveErrors(request, error);
                            huboError = true;
                        }
                    }
                }
            //Si el nombre de usuario esta vacio, se verifica el correo
            }else{
                //Se verifica si es valido o no
                if (!validate(email)){
                        error.add("email", new ActionMessage("error.email.malformulado"));
                        saveErrors(request, error);
                        huboError = true;
                }else{
                    //Si es valido, se intenta extraer los datos asociados
                    datos = DBMS.getInstance().existeEmail(email);
                    //Si no hay datos asociados, error.
                    if (datos == null){
                        error.add("email", new ActionMessage("error.emailmiss.required"));
                        saveErrors(request, error);
                        huboError = true;
                    }
                }
            }
        }
        
        if (huboError){
            return mapping.findForward(ERROR);
        }else{
            
            if (datos != null){
                
                Correo c = new Correo();
                String msj = "Su usuario es: " + datos[0] + ".\n"
                        + "Su contraseña es:" + datos[1] + ".\n";
                String asunto = "Recuperación de contraseña";
                c.setAsunto(asunto);
                c.setMensaje(msj);
                boolean envio = c.enviarUsuario(datos[2]);

                if(envio){
                return mapping.findForward(SUCCESS);
                }
            }
        }
        
        return mapping.findForward(FAILURE);
    
    }
}
