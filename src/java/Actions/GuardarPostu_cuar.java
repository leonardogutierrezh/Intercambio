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
public class GuardarPostu_cuar extends org.apache.struts.action.Action {

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

        //PASO 1.4 PROGRAMAS
        if (p.getNombreProgramaOpcion1().equalsIgnoreCase("0")) {
            error.add("nombreProgramaOpcion1", new ActionMessage("error.nombreprograma.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getNombreProgramaOpcion2().equalsIgnoreCase("0")) {
            error.add("nombreProgramaOpcion2", new ActionMessage("error.nombreprograma.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getPaisOpcion1().equalsIgnoreCase("0")
                || p.getPaisOpcion1().equalsIgnoreCase("-")) {
            error.add("paisOpcion1", new ActionMessage("error.paisopcion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getPaisOpcion2().equalsIgnoreCase("0")
                || p.getPaisOpcion2().equalsIgnoreCase("-")) {
            error.add("paisOpcion2", new ActionMessage("error.paisopcion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getNombreOpcion1().equalsIgnoreCase("-")
                || p.getNombreOpcion1().equalsIgnoreCase("Seleccione")) {
            error.add("nombreOpcion1", new ActionMessage("error.nombreopcion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getNombreOpcion2().equalsIgnoreCase("-")
                || p.getNombreOpcion2().equalsIgnoreCase("Seleccione")) {
            error.add("nombreOpcion2", new ActionMessage("error.nombreopcion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }

        if (p.getNombreOpcion1().equalsIgnoreCase(p.getNombreOpcion2())
                && !(p.getNombreOpcion2().equalsIgnoreCase("-")
                || p.getNombreOpcion2().equalsIgnoreCase("Seleccione"))
                && !(p.getNombreOpcion1().equalsIgnoreCase("-")
                || p.getNombreOpcion1().equalsIgnoreCase("Seleccione"))) {

            error.add("nombreOpcion1", new ActionMessage("error.unisdifer.required"));
            error.add("nombreOpcion2", new ActionMessage("error.unisdifer.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getProgramaOpcion1().equalsIgnoreCase("Seleccione")) {
            error.add("programaOpcion1", new ActionMessage("error.programaopcion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getProgramaOpcion2().equalsIgnoreCase("Seleccione")) {
            error.add("programaOpcion2", new ActionMessage("error.programaopcion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        //Primera fecha
        if (p.getMesFechaIni1().equalsIgnoreCase("Mes")) {
            error.add("mesFechaIni1", new ActionMessage("error.mes.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getMesFechaIni2().equalsIgnoreCase("Mes")) {
            error.add("mesFechaIni2", new ActionMessage("error.mes.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getMesFechaFin1().equalsIgnoreCase("Mes")) {
            error.add("mesFechaFin1", new ActionMessage("error.mes.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getMesFechaFin2().equalsIgnoreCase("Mes")) {
            error.add("mesFechaFin2", new ActionMessage("error.mes.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        //Segunda fecha
        if (p.getAnoFechaIni1().equalsIgnoreCase("Año")) {
            error.add("anoFechaIni1", new ActionMessage("error.ano.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getAnoFechaIni2().equalsIgnoreCase("Año")) {
            error.add("anoFechaIni2", new ActionMessage("error.ano.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getAnoFechaFin1().equalsIgnoreCase("Año")) {
            error.add("anoFechaFin1", new ActionMessage("error.ano.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getAnoFechaFin2().equalsIgnoreCase("Mes")) {
            error.add("anoFechaFin2", new ActionMessage("error.ano.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        //Corecciones de que la fecha de inicio sea menor a la fecha fin
        if (p.getAnoFechaIni1().compareToIgnoreCase(
                p.getAnoFechaFin1()) > 0) {
            error.add("anoFechaIni1", new ActionMessage("error.menorano.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        } else if (p.getAnoFechaIni1().compareToIgnoreCase(
                p.getAnoFechaFin1()) == 0) {
            if (java.util.Arrays.asList(Meses).indexOf(
                    p.getMesFechaIni1()) >= java.util.Arrays.asList(
                    Meses).indexOf(p.getMesFechaFin1())) {
                error.add("mesFechaIni1", new ActionMessage("error.menormes.required"));
                saveErrors(request, error);
                huboError = true;
                arre[3] = true;
            }
        }
        if (p.getAnoFechaIni2().compareToIgnoreCase(
                p.getAnoFechaFin2()) > 0) {
            error.add("anoFechaIni2", new ActionMessage("error.menorano.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        } else if (p.getAnoFechaIni2().compareToIgnoreCase(
                p.getAnoFechaFin2()) == 0) {
            if (java.util.Arrays.asList(Meses).indexOf(
                    p.getMesFechaIni2()) >= java.util.Arrays.asList(
                    Meses).indexOf(p.getMesFechaFin2())) {
                error.add("mesFechaIni2", new ActionMessage("error.menormes.required"));
                saveErrors(request, error);
                huboError = true;
                arre[3] = true;
            }
        }
        if (p.getDuracionProgramaOpcion1().equalsIgnoreCase("Seleccione")) {
            error.add("duracionProgramaOpcion1", new ActionMessage("error.duracionprograma.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }
        if (p.getDuracionProgramaOpcion2().equalsIgnoreCase("Seleccione")) {
            error.add("duracionProgramaOpcion2", new ActionMessage("error.duracionprograma.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }


        Usuario u = new Usuario();
        u.setNombreusuario(p.getNombreUsuario());
        u.setConfirmar(p.getPeriodo());
        
        //Para cargar los idiomas y el plan de estudio ya que ya esta en la db

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

        }  else if (DBMS.getInstance().guardarPostu_cuar(p)) {

            boolean boo = DBMS.getInstance().registrar(p.getNombreUsuario(), "Creacion de la planilla por parte del estudiante nacional");
            return mapping.findForward(SUCCESS);

        } else {
            return mapping.findForward(FAIL);

        }
    }
    
}
