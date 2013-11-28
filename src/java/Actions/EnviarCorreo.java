/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Correo;
import Clases.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import nl.captcha.Captcha;

/**
 *
 * @author dreabalbas
 */
public class EnviarCorreo extends org.apache.struts.action.Action {
    
    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";
    private final static String ERROR = "error";
    
    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
    
    private Pattern patron;
    private Matcher match;

    public EnviarCorreo() {
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
        System.out.println("entreeeeeeee yayyyy");
        Correo c = (Correo) form;
       // Usuario u = (Usuario) form;
        HttpSession session = request.getSession(true);
        ActionErrors error = new ActionErrors();
        boolean huboError = false;
        
        String nombreR = c.getNombreRemitente();
        String mailR = c.getCorreoRemitente();
        String asunto = c.getAsunto();
        String mnsj = c.getMensaje();
        String email = c.getEmail();
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
        
        
        //Verifica que el nombre del remitente no sea vacio
        if (nombreR.equals("")) {
            error.add("nombreRemitente", new ActionMessage("error.nombreRemitente.required"));
            saveErrors(request, error);
            huboError = true;
        }

        //Verifica que el email no sea vacio y que este estructurado correctamente.
        if (mailR.equals("")) {
            error.add("correoRemitente", new ActionMessage("error.correoRemitente.required"));
            saveErrors(request, error);
            huboError = true;
        } else if (validate(mailR) == false) {
            error.add("correoRemitente", new ActionMessage("error.correoRemitente.malformulado"));
            saveErrors(request, error);
            huboError = true;
        }
        
        //Verifica que el asunto no sea vacio
        if (asunto.equals("")) {
            error.add("asunto", new ActionMessage("error.asunto.required"));
            saveErrors(request, error);
            huboError = true;
        }
        
        //Verifica que el mensaje no sea vacio
        if (mnsj.equals("")) {
            error.add("mensaje", new ActionMessage("error.mensaje.required"));
            saveErrors(request, error);
            huboError = true;
        }

         if (huboError) {
            return mapping.findForward(ERROR);

        } else{
        
            String enviarA = email; // Aqui debe ir el correo de la DRIC.
            boolean envioCorreo = c.enviar(enviarA);
            
            // Hace la validacion de que se envia
            if (!envioCorreo) {
                return mapping.findForward(FAILURE);
            } else {

              request.setAttribute("confirmacion", c);
              return mapping.findForward(SUCCESS);
            }
        }
    }
    
}
