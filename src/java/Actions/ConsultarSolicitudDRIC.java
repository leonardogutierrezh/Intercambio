/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions;

import Clases.AntecedentesAcademicos;
import Clases.Estudiante;
import Clases.Idioma;
import Clases.Idiomas;
import Clases.Materias;
import Clases.PlanDeEstudio;
import Clases.PlanMaterias;
import Clases.Representante;
import Clases.UniversidadPrograma;
import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author leonardo
 */
public class ConsultarSolicitudDRIC extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

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
            Usuario user = (Usuario) form;
            String redi = user.getConfirmar();
            user = DBMS.getInstance().obtenerDatos(user);
            Estudiante estudiante = new Estudiante();
            estudiante = DBMS.getInstance().obtenerEstudiante(user);
            Representante representante = new Representante();
            representante = DBMS.getInstance().obtenerRepresentante(user);
            ArrayList<Idioma> idiomas = DBMS.getInstance().obtenerIdioma(user);
            UniversidadPrograma uni1 = DBMS.getInstance().obtenerUniversidad(user, "1");
            UniversidadPrograma uni2 = DBMS.getInstance().obtenerUniversidad(user, "2");
            AntecedentesAcademicos antecedentes = DBMS.getInstance().obtenerAntecedente(user);
            System.out.println(antecedentes.getCoordinacion());
            ArrayList<PlanMaterias> materias; 
            materias = DBMS.getInstance().obtenerPlanMaterias(user);
            System.out.println("aqui va el estudianteaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
            System.out.println(materias);
            request.setAttribute("user", user);
            request.setAttribute("estudiante", estudiante);
            request.setAttribute("representante", representante);
            request.setAttribute("idiomas", idiomas);
            request.setAttribute("uni1", uni1);
            request.setAttribute("uni2", uni2);
            request.setAttribute("antecedentes", antecedentes);
            request.setAttribute("materias", materias);

        return mapping.findForward(SUCCESS);
    }
}
