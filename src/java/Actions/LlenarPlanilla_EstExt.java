/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Idiomas;
import Clases.PlanDeEstudio;
import Clases.PlanillaExt;
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
 * @author caponte
 */
public class LlenarPlanilla_EstExt extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
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


        PlanillaExt p = (PlanillaExt) form;
        ActionErrors error = new ActionErrors();
        boolean huboError = false;
        boolean arre[] = new boolean[6];
        String Datos[] = {"Datos Personales", "Información de Domicilio",
            "Datos de Contacto", "Programas", "Información Académica",
            "Contacto en Caso de Emergencia"};
        Arrays.fill(arre, false);

        // ####################################
        //        Validacion de datos.
        // ####################################

        /* ###### PASO 1.1 ######*/

        //Verifica que los apellidos no  esten vacios
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

        if (p.getNombre2().equals("")) {
            error.add("nombre2", new ActionMessage("error.nombres.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        // Verifica escogencia de Sexo
        if (p.getSexo().contains("Seleccione")) {
            error.add("sexo", new ActionMessage("error.sexo.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        //Verifica que la nacionalidad.
        if (p.getNacionalidad().contains("Seleccione")) {
            error.add("nacionalidad", new ActionMessage("error.nacionalidad.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        // Pasaporte no  vacio.
        if (p.getPasaporte().equals("")) {
            error.add("pasaporte", new ActionMessage("error.pasaporte.required"));
            saveErrors(request, error);
            huboError = true;
            arre[0] = true;
        }

        /* ###### PASO 1.2 ######*/

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

        /* ###### PASO 1.3 ######*/

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

        /* ###### PASO 1.4 ######*/

        // Verifica que se haya seleccionado un programa
        if (p.getNombrePrograma().equalsIgnoreCase("0")) {
            error.add("nombrePrograma", new ActionMessage("error.nombreprograma.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }

        // Verifica que se haya seleccionado un pais de origen
        if (p.getPaisOrigen().equalsIgnoreCase("-")
                || p.getPaisOrigen().equalsIgnoreCase("0")) {
            error.add("paisOrigen", new ActionMessage("error.paisopcion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }

        // Verifica que se haya seleccionado una universidad de origen
        if (p.getNombreUniOrigen().equalsIgnoreCase("-")
                || p.getNombreUniOrigen().equalsIgnoreCase("0")) {
            error.add("nombreUniOrigen", new ActionMessage("error.nombreopcion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }

        //Verifica que el nombre del coord de movilidad no sea vacio
        if (p.getNombreCoordMovilidad().equals("")) {
            error.add("nombreCoordMovilidad", new ActionMessage("error.nombreCoordMovilidad.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }

        //Verifica que el nombre del coord academico no sea vacio
        if (p.getNombreCoordAcademico().equals("")) {
            error.add("nombreCoordAcademico", new ActionMessage("error.nombreCoordAcademico.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }

        // Verifica que se haya seleccionado un tipo de programa
        if (p.getPrograma().equalsIgnoreCase("Seleccione")) {
            error.add("programa", new ActionMessage("error.programa.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }

        // Verifica que se haya seleccionado una duracion de intercambio
        if (p.getDuracionPrograma().equalsIgnoreCase("-")) {
            error.add("duracionPrograma", new ActionMessage("error.duracionPrograma.required"));
            saveErrors(request, error);
            huboError = true;
            arre[3] = true;
        }

        /* ###### PASO 1.5 ######*/

        // Verifica que se haya seleccionado un area de estudio
        if (p.getAreaEstud().equalsIgnoreCase("Seleccione")) {
            error.add("areaEstud", new ActionMessage("error.areaEstud.required"));
            saveErrors(request, error);
            huboError = true;
            arre[4] = true;
        }

        //Verifica que la carrera no sea vacia
        if (p.getCarrera().equals("")) {
            error.add("carrera", new ActionMessage("error.nombrecarrera.required"));
            saveErrors(request, error);
            huboError = true;
            arre[4] = true;
        }

        // Verifica que se haya introducido el anio de ingreso a la carrera
        if (p.getAnioIngreso() < 1980) {
            error.add("anioIngreso", new ActionMessage("error.anioIngreso.required"));
            saveErrors(request, error);
            huboError = true;
            arre[4] = true;
        }

        // Verifica que se haya introducido la cantidad de anios aprobados
        if (p.getAniosAprobados() <= 0) {
            error.add("aniosAprobados", new ActionMessage("error.aniosAprobados.required"));
            saveErrors(request, error);
            huboError = true;
            arre[4] = true;
        }

        // ####################################
        //   Validacion del representante
        // ####################################

        /* ###### PASO 1.6 ######*/

        // Verifica que los apellidos del representante no esten vacios
        if (p.getApellidosRep().equals("")) {
            error.add("apellidosRep", new ActionMessage("error.apellidosRep.required"));
            saveErrors(request, error);
            huboError = true;
            arre[5] = true;
        }

        // Verifica que los nombres del representante no esten vacios
        if (p.getNombresRep().equals("")) {
            error.add("nombresRep", new ActionMessage("error.nombresRep.required"));
            saveErrors(request, error);
            huboError = true;
            arre[5] = true;
        }

        //// Verifica que el celular del representante no este vacio
        if (p.getCelRep().equals("")) {
            error.add("celRep", new ActionMessage("error.celRep.required"));
            saveErrors(request, error);
            huboError = true;
            arre[5] = true;
        }

        // Verifica que el telf local del representante no este vacio
        if (p.getTlfRepCasa().equals("")) {
            error.add("tlfRepCasa", new ActionMessage("error.tlfRepCasa.required"));
            saveErrors(request, error);
            huboError = true;
            arre[5] = true;
        }

        // Verifica que la relacion no este vacia
        if (p.getRelacion().equals("")) {
            error.add("relacion", new ActionMessage("error.relacion.required"));
            saveErrors(request, error);
            huboError = true;
            arre[5] = true;
        }

        // Verifica que la direccion no este vacia
        if (p.getDireccionRep().equals("")) {
            error.add("direccionRep", new ActionMessage("error.direccionRep.required"));
            saveErrors(request, error);
            huboError = true;
            arre[5] = true;
        }

        //Verifica que el email del Representante no sea vacio y que este estructurado correctamente.
        if (p.getEmailRep().equals("")) {
            error.add("emailRep", new ActionMessage("error.email.required"));
            saveErrors(request, error);
            huboError = true;
            arre[5] = true;
        } else if (validate(p.getEmailRep()) == false) {
            error.add("emailRep", new ActionMessage("error.email.malformulado"));
            saveErrors(request, error);
            huboError = true;
            arre[5] = true;
        }


        /*
         //  ############### Comparar ambas fechas
        
         if ((p.getFechaIni1().compareTo(p.getFechaFin1())) >= 0) {
         error.add("fechaIni1", new ActionMessage("error.fecha.orden"));
         saveErrors(request, error);
         huboError = true;
         }


         // ############# Comparar ambas fechas.
         if ((p.getFechaIni2().compareTo(p.getFechaFin2())) >= 0) {
         error.add("fechaIni1", new ActionMessage("error.fecha.orden"));
         saveErrors(request, error);
         huboError = true;
         //        }*/
//
//
//
        /*
         // Verificar escogencia de Nivel verbal del idioma.
         if (p.getNivelVerbal().equals("")) {
         error.add("nivelVerbal", new ActionMessage("error.verbal.required"));
         saveErrors(request, error);
         huboError = true;
         }

         // Verificar escogencia de Nivel escrito del idioma. 
         if (p.getNivelEscrito().equals("")) {
         error.add("nivelEscrito", new ActionMessage("error.escrito.required"));
         saveErrors(request, error);
         huboError = true;
         }*/

        Usuario u = new Usuario();
        u.setNombreusuario(p.getNombreUsuario());
        u.setConfirmar(p.getPeriodo());

        PlanillaExt hay = DBMS.getInstance().obtenerPlanillaExt(u);
        PlanDeEstudio plan = DBMS.getInstance().obtenerPlanDeEstudio(u);
        Idiomas idio = DBMS.getInstance().obtenerIdiomas2(u);
        ArrayList<SuperArray> arra = new ArrayList();
        ArrayList<SuperArray> sup = new ArrayList();
        for (int i = 0; i < plan.getListCodigoUSB().size(); i++) {
            SuperArray a = new SuperArray();
            a.setCamp1(plan.getCodigoUSB(i));
            a.setCamp2(plan.getMateriaUSB(i));
            a.setCamp3(Integer.toString(plan.getCreditosUSB(i)));
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

            for (int i = 0; i < 6; i++) {
                if (arre[i]) {
                    especial = especial + Datos[i] + ", ";

                }
            }
            u.setNombre(especial);
            request.setAttribute("Usuario", u);
            return mapping.findForward(ERROR);

        } else if (hay.getNombreUsuario() != null) {

            if (DBMS.getInstance().modificarPlanillaExt(p)) {
                boolean boo = DBMS.getInstance().registrar(p.getNombreUsuario(), "Modificacion de la Planilla por parte del estudiante extranjero");
                return mapping.findForward(SUCCESS);
            } else {
                return mapping.findForward(FAIL);
            }

        } else if (DBMS.getInstance().agregarPlanillaExt(p)) {

            boolean boo = DBMS.getInstance().registrar(p.getNombreUsuario(), "Creacion del planilla por parte del estudiante extranjero");
            return mapping.findForward(SUCCESS);

        } else {
            return mapping.findForward(FAIL);

        }
    }
}
