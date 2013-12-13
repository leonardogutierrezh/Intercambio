/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Idiomas;
import Clases.PlanDeEstudio;
import Clases.PlanillaUSB;
import Clases.SuperArray;
import Clases.Usuario;
import Clases.EstudianteUSB;

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
 * @author caponte
 */
public class LlenarPlanilla_EstUSB extends org.apache.struts.action.Action {

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


        PlanillaUSB p = (PlanillaUSB) form;
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

        //        PASO 1.1
        //Verifica que los apellidos no  esten vacios.

        if (p.getApellido1().equals("")) {
            error.add("apellido1", new ActionMessage("error.apellidos.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        if (p.getApellido2().equals("")) {
            error.add("apellido2", new ActionMessage("error.apellidos.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        //Verifica que los nombres no  esten vacios.
        if (p.getNombre1().equals("")) {
            error.add("nombre1", new ActionMessage("error.nombres.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }
        /*
         if (p.getNombre2().equals("")) {
         error.add("nombre2", new ActionMessage("error.nombres.required"));
         saveErrors(request, error);
         huboError = true;
         arre[0] = true;
         }
         */
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

        // Carnet no  vacio y bien estructurado
        if (p.getCarnet().equals("")) {
            error.add("carnet", new ActionMessage("error.carnet.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;

        } else if (!p.getCarnet().matches("[0-9]{2}\\-[0-9]{5}")) {
            error.add("carnet", new ActionMessage("error.carnet.malestructurado"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }


//        PASO 1.2
        // Calle no  vacio.
        if (p.getCalle().equals("")) {
            error.add("calle", new ActionMessage("error.calle.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }

        // Edificio/Casa no vacio
        if (p.getEdificio().equals("")) {
            error.add("edificio", new ActionMessage("error.edificio.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }

        // Apartamento no vacio
        if (p.getApartamento().equals("")) {
            error.add("apartamento", new ActionMessage("error.apartamento.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }

        // Ciudad no  vacio.
        if (p.getCiudad().equals("")) {
            error.add("ciudad", new ActionMessage("error.ciudad.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }

        // Estado no vacio.
        if (p.getEstado().equals("")) {
            error.add("estado", new ActionMessage("error.estado.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }


        // Codigo postal no vacio
        if (p.getCodPostal().equals("")) {
            error.add("codPostal", new ActionMessage("error.codpostal.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }
        // urbanizacion no vacia
        if (p.getUrbanizacion().equals("")) {
            error.add("urbanizacion", new ActionMessage("error.urbanizacion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[1] = true;
        }

//        PASO 1.3
        // Verifica que el telefono celular no sea vacio
        if (p.getTelefonoCelular().equals("")) {
            error.add("telefonoCelular", new ActionMessage("error.telefono.required"));
            saveErrors(request, error);
            huboError = true;
            arre[2] = true;
        }

        // Verifica que el telefono de la casa no sea vacio
        if (p.getTelefonoCasa().equals("")) {
            error.add("telefonoCasa", new ActionMessage("error.telefonocasa.required"));
            saveErrors(request, error);
            huboError = true;
            arre[2] = true;
        }

        //Verifica que el email no sea vacio y que este estructurado correctamente.
        if (p.getEmail().equals("")) {
            error.add("email", new ActionMessage("error.email.required"));
            saveErrors(request, error);
            huboError = true;
            arre[2] = true;
        } else if (validate(p.getEmail()) == false) {
            error.add("email", new ActionMessage("error.email.malformulado"));
            saveErrors(request, error);
            huboError = true;
            arre[2] = true;
        }


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




        // Paso 1.5 INFORMACION ACADEMICA
        if (p.getDecanato().equalsIgnoreCase("0")) {
            error.add("decanato", new ActionMessage("error.decanato.required"));
            saveErrors(request, error);
            huboError = true;
            arre[4] = true;
        }

        if (p.getAreaEstud().equalsIgnoreCase("-")
                || p.getAreaEstud().equalsIgnoreCase("0")) {
            error.add("areaEstud", new ActionMessage("error.areaEstud.required"));
            saveErrors(request, error);
            huboError = true;
            arre[4] = true;
        }
        if (p.getCarrera().equalsIgnoreCase("-")
                || p.getCarrera().equalsIgnoreCase("0")) {
            error.add("carrera", new ActionMessage("error.carrera.required"));
            saveErrors(request, error);
            huboError = true;
            arre[4] = true;
        }

        if (p.getCreditosApro() < 130) {
            error.add("creditosApro", new ActionMessage("error.creditosApro.required"));
            saveErrors(request, error);
            huboError = true;
            arre[4] = true;
        }

        if (p.getIndice().equalsIgnoreCase("")) {
            error.add("indice", new ActionMessage("error.indice.required"));
            saveErrors(request, error);
            huboError = true;
            arre[4] = true;
        } else if (!p.getIndice().matches("[0-4]\\.[0-9]{4}|5\\.0{4}")) {
            error.add("indice", new ActionMessage("error.indice.malestructurado"));
            saveErrors(request, error);
            huboError = true;
        }


        //PASO 1.6
        if (p.getFuenteFinanciamiento().equalsIgnoreCase("Seleccione")) {
            error.add("fuenteFinanciamiento", new ActionMessage("error.fuentefinan.required"));
            saveErrors(request, error);
            huboError = true;
            arre[5] = true;
        }
        if (p.getDescripcion1().equalsIgnoreCase("")) {
            error.add("descripcion1", new ActionMessage("error.descripcion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[5] = true;
        }
        if (p.getAyudaEc().equalsIgnoreCase("Seleccione")) {
            error.add("ayudaEc", new ActionMessage("error.ayuda.required"));
            saveErrors(request, error);
            huboError = true;
            arre[5] = true;
        }
        if (p.getDescripcion2().equalsIgnoreCase("")) {
            error.add("descripcion2", new ActionMessage("error.descripcion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[5] = true;
        }

        // ####################################
        //   Validacion del representante
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




//  ############### Comparar ambas fechas

//        else if ((p.getFechaI().compareTo(p.getFechaFin1())) >= 0) {
//            error.add("fechaIni1", new ActionMessage("error.fecha.orden"));
//            saveErrors(request, error);
//            huboError = true;
//        }
//
////
////
////
////// ############# Comparar ambas fechas.
////        if ((p.getFechaIni2().compareTo(p.getFechaFin2())) >= 0) {
////            error.add("fechaIni1", new ActionMessage("error.fecha.orden"));
////            saveErrors(request, error);
////            huboError = true;
////        }
//
//
//
//        // Indice no  vacio y bien estructurado
//        if (p.getIndice().equals("")) {
//            error.add("indice", new ActionMessage("error.campo.required"));
//            saveErrors(request, error);
//            huboError = true;
//        } else if (p.getCarnet().matches("[0-4]\\.[0-9]{4}|5\\.0{4}")) {
//
//            error.add("indice", new ActionMessage("error.indice.malestructurado"));
//            saveErrors(request, error);
//            huboError = true;
//        }

        Usuario u = new Usuario();
        u.setNombreusuario(p.getNombreUsuario());
        u.setConfirmar(p.getPeriodo());
        
        //Para cargar los idiomas y el plan de estudio ya que ya esta en la db

        PlanillaUSB hay = DBMS.getInstance().obtenerPlanillaUSB(u);
        PlanDeEstudio plan = DBMS.getInstance().obtenerPlanDeEstudio(u);
        Idiomas idio = DBMS.getInstance().obtenerIdiomas(u);
        ArrayList<SuperArray> arra = new ArrayList();
        ArrayList<SuperArray> sup = new ArrayList();
        for (int i = 0; i < plan.getListCodigoUSB().size(); i++) {
            SuperArray a = new SuperArray();
            a.setCamp1(plan.getCodigoUSB(i));
            a.setCamp2(plan.getMateriaUSB(i));
            a.setCamp3(Integer.toString(plan.getCreditosUSB(i)));
            a.setCamp4(plan.getCodigoUniv(i));
            a.setCamp5(plan.getMateriaUniv(i));
            a.setCamp6(Integer.toString(plan.getCreditosUniv(i)));
            sup.add(a);
        }

        for (int i = 0; i < idio.getListIdio().size(); i++) {
            SuperArray a = new SuperArray();
            a.setCamp1((String) idio.getListIdio().get(i));
            a.setCamp2((String) idio.getListVerb().get(i));
            a.setCamp3((String) idio.getListEscr().get(i));
            a.setCamp4((String) idio.getListConversacional().get(i));
            a.setCamp5((String) idio.getListAuditivo().get(i));
            arra.add(a);
        }
        request.setAttribute("plan", sup);
        request.setAttribute("lang", arra);


        if (huboError) {
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
        } else if (DBMS.getInstance().agregarPlanillaUSB(p)) {

            boolean boo = DBMS.getInstance().registrar(p.getNombreUsuario(), "Creacion de la planilla por parte del estudiante nacional");
            return mapping.findForward(SUCCESS);

        } else {
            return mapping.findForward(FAIL);

        }
    }
}
