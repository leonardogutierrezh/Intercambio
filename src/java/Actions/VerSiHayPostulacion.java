/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions;

import Clases.Idiomas;
import Clases.Estudiante;
import Clases.EstudianteUSB;
import Clases.Usuario;
import Clases.PlanillaUSB;
import Clases.PlanDeEstudio;
import Clases.SuperArray;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author andel
 */
public class VerSiHayPostulacion extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Usuario u = (Usuario) form;
        
        boolean hayPost = DBMS.getInstance().verSiHayPostulacion(u);

        request.setAttribute("Usuario", u);
        
        if (hayPost){

            System.out.println("YA SE ESTA EVALUANDO");
            
            // BUSCARE LOS DATOS DE LA PLANILLA
            Estudiante e = DBMS.getInstance().buscarEstudiante(u);
            EstudianteUSB estUSB = DBMS.getInstance().buscarCarnet(u);
            request.setAttribute("Estudiante", e);
            request.setAttribute("EstudianteUSB", estUSB);
            
            PlanillaUSB pla_USB = DBMS.getInstance().obtenerDatosPlanillaUSB(u);
            System.out.println("estudiante " + e.getpApellido());
            request.setAttribute("pla_USB", pla_USB);
            return mapping.findForward(FAIL);
            
        } else  {
            Estudiante e = DBMS.getInstance().buscarEstudiante(u);
            EstudianteUSB estUSB = DBMS.getInstance().buscarCarnet(u);
            request.setAttribute("Estudiante", e);
            request.setAttribute("EstudianteUSB", estUSB);
            System.out.println("no se ha postulado");
            return mapping.findForward(SUCCESS);    
        }
    }
}
