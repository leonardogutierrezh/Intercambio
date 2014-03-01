/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.EstudianteUSB;
import Clases.Idiomas;
import Clases.PlanDeEstudio;
import Clases.SuperArray;
import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import java.util.Arrays;
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
 * @author andelnunez
 */
public class GuardarPostu_septi extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
    private static final String patronCedula = "[0-9]+";
    private static final String patroncarnet = "[0-9]{2}-[0-9]{5}";
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private static final String ERROR = "error";
    private static final String MODIFICAR = "modificar";
    private Pattern patron;
    private Matcher match;

    public boolean validate(final String username) {
        patron = Pattern.compile(patronEmail);
        match = patron.matcher(username);
        return match.matches();
    }

    public boolean validate2(final String pat) {
        patron = Pattern.compile(patronCedula);
        match = patron.matcher(pat);
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


        Clases.PlanillaUSB p = (Clases.PlanillaUSB) form;
        ActionErrors error = new ActionErrors();
        boolean huboError = false;
        boolean arre[] = new boolean[7];
        String Datos[] = {"Datos Personales", "Información de Domicilio",
            "Datos de Contacto", "Programas", "Información Académica",
            "Datos de Financiamiento", "Contacto en Caso de Emergencia"};
        Arrays.fill(arre, false);
        String Meses[] = {"Enero", "Febrero", "Marzo", "Abril", "Mayo",
            "Junio", "Julio", "Agosto", "Septiembre", "Octubre",
            "Noviembre", "Diciembre"};
        
        
        // PONER NOMBRE>> APELLIDO... cosas que no deberian ir en el formulario.
        String nombreUsuario = p.getNombreUsuario();
        System.out.println(nombreUsuario);
        
        EstudianteUSB es = DBMS.getInstance().obtenerDatosEstUsb(nombreUsuario); 
        p.setApellido1(es.getpApellido());
        p.setNombre1(es.getpNombre());        
        p.setCarnet(es.getCarnet());
        
        // ####################################
        //        Validacion de datos.
        // ####################################

        //Paso 1.7

        // Verifica que los apellidos del representante no esten vacios
        if (p.getApellidosRep().equals("")) {
            error.add("apellidosRep", new ActionMessage("error.apellidosRep.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }

        // Verifica que los nombres del representante no esten vacios
        if (p.getNombresRep().equals("")) {
            error.add("nombresRep", new ActionMessage("error.nombresRep.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }

        // Verifica que el celular del representante no este vacio
        if (p.getCelRep().equals("")) {
            error.add("celRep", new ActionMessage("error.celRep.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }

        // Verifica que el telf local del representante no este vacio
        if (p.getTlfRepCasa().equals("")) {
            error.add("tlfRepCasa", new ActionMessage("error.tlfRepCasa.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }

        // Verifica que la relacion no este vacia
        if (p.getRelacion().equals("")) {
            error.add("relacion", new ActionMessage("error.relacion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }

        // Verifica que la direccion no este vacia
        if (p.getDireccionRep().equals("")) {
            error.add("direccionRep", new ActionMessage("error.direccionRep.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }

        //Verifica que el email del Representante no sea vacio y que este estructurado correctamente.
        if (p.getEmailRep().equals("")) {
            error.add("emailRep", new ActionMessage("error.email.required"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;

        } else if (validate(p.getEmailRep()) == false) {
            error.add("emailRep", new ActionMessage("error.email.malformulado"));
            saveErrors(request, error);
            huboError = true;
            arre[6] = true;
        }

        Usuario u = new Usuario();
        u.setNombreusuario(p.getNombreUsuario());
        u.setConfirmar(p.getPeriodo());
        
        if (huboError) {
            System.out.println("HUBO ERRORRRRR " + huboError);
            String especial = ",";

            for (int i = 0; i < 7; i++) {
                if (arre[i]) {
                    especial = especial + Datos[i] + ", ";

                }
            }
            u.setNombre(especial);
            request.setAttribute("Usuario", u);
            return mapping.findForward(ERROR);

        } else if (DBMS.getInstance().guardarPostu_septi(p)) {
            request.setAttribute("Usuario", u);
            
            return mapping.findForward(SUCCESS);

        } else {
            return mapping.findForward(FAIL);

        }
    }    
}
