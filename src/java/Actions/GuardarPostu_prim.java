/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Estudiante;
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
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author andelnunez
 */
public class GuardarPostu_prim extends org.apache.struts.action.Action{

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
        System.out.println("el nombre de usuario es " + nombreUsuario);
        
        EstudianteUSB es = DBMS.getInstance().obtenerDatosEstUsb(nombreUsuario); 
        p.setApellido1(es.getpApellido());
        p.setNombre1(es.getpNombre());        
        p.setCarnet(es.getCarnet());
        
        System.out.println("apellido 1 " + p.getApellido1());
        System.out.println("nombre 1 " + p.getNombre1());
        System.out.println("carnet " + p.getCarnet());
        
        // ####################################
        //        Validacion de datos.
        // ####################################

        //        PASO 1.1

        // Verifica escogencia de Sexo
        if (p.getSexo().contains("Seleccione")) {
            error.add("sexo", new ActionMessage("error.sexo.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        //Verifica que la nacionalidad.
        if (p.getNacionalidad().equals("")) {
            error.add("nacionalidad", new ActionMessage("error.nacionalidad.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }


        // Cedula no vacia y bien estructurada (solo numeros)
        if (p.getCedula().equals("")) {
            error.add("cedula", new ActionMessage("error.cedula.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;

        } else if (!validate2(p.getCedula())) {
            error.add("cedula", new ActionMessage("error.cedula.malestructurada"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        System.out.println("fin de validacion");


        Usuario u = new Usuario();
        u.setNombreusuario(p.getNombreUsuario());
        u.setConfirmar(p.getPeriodo());
        
        //Para cargar los idiomas y el plan de estudio ya que ya esta en la db

        Clases.PlanillaUSB hay = DBMS.getInstance().obtenerPlanillaUSB(u);

        if (huboError) {
            Estudiante e = DBMS.getInstance().buscarEstudiante(u);
            EstudianteUSB estUSB = DBMS.getInstance().buscarCarnet(u);
            request.setAttribute("Estudiante", e);
            request.setAttribute("EstudianteUSB", estUSB);
            
            System.out.println("hubo error");
            String especial = ",";

            for (int i = 0; i < 7; i++) {
                if (arre[i]) {
                    especial = especial + Datos[i] + ", ";

                }
            }
            u.setNombre(especial);
            request.setAttribute("Usuario", u);
            return mapping.findForward(ERROR);
        } else if (hay.getNombreUsuario() != null) {

            if (DBMS.getInstance().modificarPlanillaUSB(p)) {

                boolean boo = DBMS.getInstance().registrar(p.getNombreUsuario(), "Modificacion de la Planilla por parte del estudiante nacional");
                return mapping.findForward(SUCCESS);
            } else {
                return mapping.findForward(FAIL);
            }
        } else if (DBMS.getInstance().guardarPostu_prim(p)) {
            System.out.println("entre por creacion planila");
            boolean boo = DBMS.getInstance().registrar(p.getNombreUsuario(), "Creacion de la planilla por parte del estudiante nacional");
            return mapping.findForward(SUCCESS);

        } else {
            return mapping.findForward(FAIL);

        }
    }
 
}
