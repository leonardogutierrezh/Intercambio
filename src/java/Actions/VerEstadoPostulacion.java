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
public class VerEstadoPostulacion extends org.apache.struts.action.Action {
    private static final String SINPOSTULAR = "sinPostular";
    private static final String SINPOSTULAR_FALTA = "sinPostular_falta";
    private static final String POSTULADO = "postulado";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
            Usuario u = (Usuario) form;        
            int hayPost = DBMS.getInstance().verEstadoPostulacion(u);

            request.setAttribute("Usuario", u);        
            //Sin postular
            if (hayPost == 0) { 
                Estudiante e = DBMS.getInstance().buscarEstudiante(u);
                EstudianteUSB estUSB = DBMS.getInstance().buscarCarnet(u);
                request.setAttribute("Estudiante", e);
                request.setAttribute("EstudianteUSB", estUSB);
                return mapping.findForward(SINPOSTULAR);
            }

            // Sin postular - falta llenar datos
            if (hayPost == 1){
                Estudiante e = DBMS.getInstance().buscarEstudiante(u);
                EstudianteUSB estUSB = DBMS.getInstance().buscarCarnet(u);
                PlanillaUSB pla_USB = DBMS.getInstance().obtenerPrimeraPlanilla(u);
                request.setAttribute("Estudiante", e);
                request.setAttribute("EstudianteUSB", estUSB);
                request.setAttribute("pla_USB", pla_USB); 
                return mapping.findForward(SINPOSTULAR_FALTA);
            }

            // Postulado
            if (hayPost ==2){
                // BUSCARE LOS DATOS DE LA PLANILLA
                Estudiante e = DBMS.getInstance().buscarEstudiante(u);
                EstudianteUSB estUSB = DBMS.getInstance().buscarCarnet(u);
                request.setAttribute("Estudiante", e);
                request.setAttribute("EstudianteUSB", estUSB);

                PlanillaUSB pla_USB = DBMS.getInstance().obtenerDatosPlanillaUSB(u);
                System.out.println("estudiante " + e.getpApellido());
                request.setAttribute("pla_USB", pla_USB);
                return mapping.findForward(POSTULADO);
            }
            
            return mapping.findForward(SINPOSTULAR);
        
    }
}
