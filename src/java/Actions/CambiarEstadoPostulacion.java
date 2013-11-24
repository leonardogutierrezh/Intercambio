/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import Clases.Correo;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
/**
 *
 * @author caponte
 */
public class CambiarEstadoPostulacion extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "failure";
    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
    private Pattern patron;
    private Matcher match;

    public CambiarEstadoPostulacion(){
        patron = Pattern.compile(patronEmail);
    }
    
    public boolean validate (final String username){
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

        if (DBMS.getInstance().cambiarEstadoSolicitud(u)) {
            
            HttpSession session = request.getSession();
            Usuario obj = (Usuario)session.getAttribute("Usuario");
            String accion = "Cambió el estado de solicitud del estudiante " + u.getNombreusuario() + 
                             "al estado: " + u.getConfirmar();
            boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(),accion);
            
            Correo c = new Correo();
            String asunto = "Sistema de Gestión de Intercambios - Cambio en el estado de su postulación";
            String mensaje = "Se ha modificado el estado de su solicitud de intercambio. Su nuevo estado"
                    + "es: " + u.getConfirmar();
            c.setAsunto(asunto);
            c.setMensaje(mensaje);
            boolean correoEnviado = c.enviar(u.getEmail());
            
            if (correoEnviado){
                return mapping.findForward(SUCCESS);
            }else{
                return mapping.findForward(FAIL);
            }
            
        }
        
        return mapping.findForward(FAIL);
    }
}