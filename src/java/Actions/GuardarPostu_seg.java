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
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author andelnunez
 */
public class GuardarPostu_seg extends org.apache.struts.action.Action{
  
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
        System.out.println("segundoooo: NOMBREUSUARIO "+ nombreUsuario);
        
        EstudianteUSB es = DBMS.getInstance().obtenerDatosEstUsb(nombreUsuario); 
        p.setApellido1(es.getpApellido());
        p.setNombre1(es.getpNombre());        
        p.setCarnet(es.getCarnet());
        
        // ####################################
        //        Validacion de datos.
        // ####################################

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

        System.out.println("fin de validacion");

        Usuario u = new Usuario();
        u.setNombreusuario(p.getNombreUsuario());
        u.setConfirmar(p.getPeriodo());
        
        //Para cargar los idiomas y el plan de estudio ya que ya esta en la db

        if (huboError) {
            Estudiante e = DBMS.getInstance().buscarEstudiante(u);
            EstudianteUSB estUSB = DBMS.getInstance().buscarCarnet(u);
            request.setAttribute("Estudiante", e);
            request.setAttribute("EstudianteUSB", estUSB);
            
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

        } else  {
            if (DBMS.getInstance().guardarPostu_seg(p)) {

                return mapping.findForward(SUCCESS);

            } else {
                return mapping.findForward(FAIL);

            }
        }
    }
    
}
