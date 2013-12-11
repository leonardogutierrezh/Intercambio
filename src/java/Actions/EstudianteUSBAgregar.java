/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions;

import Clases.Correo;
import Clases.EstudianteUSB;
import Clases.Usuario;
import DBMS.DBMS;
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
 * @author andel
 */
public class EstudianteUSBAgregar extends org.apache.struts.action.Action {
     private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private static final String ERROR = "error";
    private Pattern patron;
    private Matcher match;

    public EstudianteUSBAgregar() {
        patron = Pattern.compile(patronEmail);
    }

    public boolean validate(final String username) {

        match = patron.matcher(username);
        return match.matches();
    }

    /**
     * AccionAgregarEstudiante This is the action called from the Struts
     * framework.
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

        EstudianteUSB e = (EstudianteUSB) form;
        ActionErrors error = new ActionErrors();
        boolean huboError = false;
        String pswd = e.getContrasena();
        System.out.println("contasena " + pswd);
        String confPswd = pswd;
        String mail = e.getEmail();

        e.setPrivilegio(5);
        e.setConfirmar(confPswd);

        if (e.getNombreusuario().equals("")) {
            error.add("nombreusuario", new ActionMessage("error.nombreusuario.required"));
            saveErrors(request, error);
            huboError = true;
        }else if(DBMS.getInstance().existeUsuario(e)){
            error.add("nombreusuario", new ActionMessage("error.nombreusuarioexiste"));
            saveErrors(request, error);
            huboError = true;
        }

        if (e.getpNombre().equals("")) {
            error.add("pNombre", new ActionMessage("error.nombre.required"));
            saveErrors(request, error);
            huboError = true;
        }

        if (e.getpApellido().equals("")) {
            error.add("pApellido", new ActionMessage("error.apellidos.required"));
            saveErrors(request, error);
            huboError = true;
        }
        
        if (e.getEmail().equals("")) {
            error.add("email", new ActionMessage("error.email.required"));
            saveErrors(request, error);
            huboError = true;
        } else if (!validate(e.getEmail())) {
            error.add("email", new ActionMessage("error.email.malformulado"));
            saveErrors(request, error);
            huboError = true;
        }
        if (e.getCarnet().equals("")) {
            error.add("carnet", new ActionMessage("error.carnet.required"));
            saveErrors(request, error);
            huboError = true;
        }else if (!e.getCarnet().matches("[0-9]{2}\\-[0-9]{5}")) {
            error.add("carnet", new ActionMessage("error.carnet.malestructurado"));
            saveErrors(request, error);
            huboError = true;
        }
        
        if (e.getCodCarrera().equals("")) {
            error.add("codCarrera", new ActionMessage("error.codigo.required"));
            saveErrors(request, error);
            huboError = true;
        }

        //String tmp = e.getpNombre();
        e.setNombre(e.getpNombre() + " " + e.getpApellido());
        // Si hubo error lo notifica, si no, procede a agregar en la BD.
        if (huboError) {
            return mapping.findForward(ERROR);

        } else if (DBMS.getInstance().agregarUsuario(e)) {

            //e.setNombre(tmp);
            if (DBMS.getInstance().agregarEstudianteUSB(e)) {

                HttpSession session = request.getSession();
                Usuario obj = (Usuario)session.getAttribute("Usuario");
                String accion = "Agregó al sistema al estudiante USBista " + e.getNombre();
                boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(),accion);
                
                Correo c = new Correo();
                String asunto = "Su usuario en el Sistema de Gestión de Intercambios ha sido creado";
                String mensaje = "Su usuario en el Sistema de Gestión de Intercambios ha sido creado."
                        + "\nSu usuario es: " + e.getNombreusuario()
                        + "\nSu clave de acceso temporal es: " + e.getContrasena();
                c.setAsunto(asunto);
                c.setMensaje(mensaje);
                                //boolean correoEnviado = c.enviarUsuario(e.getEmail());
                boolean correoEnviado = true;
                System.out.println("correo enviado: " + correoEnviado);
                if (correoEnviado) {
                    return mapping.findForward(SUCCESS);
                } else {
                    System.out.println("correo enviado: " + correoEnviado);
                    return mapping.findForward(FAIL);
                }
            }

        } else {
            return mapping.findForward(FAIL);
        }
        
        return null;
    }
}