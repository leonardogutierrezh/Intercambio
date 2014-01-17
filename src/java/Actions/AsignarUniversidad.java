/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions;

import Clases.Estudiante;
import Clases.Pais;
import Clases.Universidad;
import Clases.UniversidadAsignada;
import Clases.UniversidadPrograma;
import Clases.Usuario;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.LabelValueBean;

/**
 *
 * @author leonardo
 */
public class AsignarUniversidad extends org.apache.struts.action.Action {

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
        HttpSession session = request.getSession();
        Usuario u = (Usuario) form;
        System.out.println(u.getNombreusuario());
        boolean existe = DBMS.getInstance().existeUniversidadAsignada(u.getNombreusuario());

        if (existe) {
          UniversidadAsignada asig = DBMS.getInstance().obtenerUniversidadAsignada(u.getNombreusuario());
          System.out.println(asig.getNombre());
          u.setConfirmar2(asig.getNombre());
        }else{
          u.setConfirmar2("failure");
        }
        System.out.println(existe);
        ArrayList<Pais> paises = DBMS.getInstance().obtenerPais();
        ArrayList<Universidad> unis = DBMS.getInstance().obtenerUniversidades();
        ArrayList paisaux = new ArrayList();
        UniversidadPrograma op1 = DBMS.getInstance().obtenerUniversidad(u,"1");
        UniversidadPrograma op2 = DBMS.getInstance().obtenerUniversidad(u,"2");
        Estudiante estudiante = DBMS.getInstance().obtenerEstudiante(u);
        for (Universidad p : unis){
            paisaux.add(new LabelValueBean(p.getNombre(), p.getNombre()));
        }
        System.out.println(u.getConfirmar2());
        System.out.println(u.getConfirmar2());
        request.setAttribute("paises", paisaux);
        request.setAttribute("paisesJ", paises);
        request.setAttribute("unis", unis);
        request.setAttribute("usuarios", u);
        request.setAttribute("estudiante", estudiante);
        request.setAttribute("opcion1", op1);
        request.setAttribute("opcion2", op2);
        return mapping.findForward(SUCCESS);
    }
}
