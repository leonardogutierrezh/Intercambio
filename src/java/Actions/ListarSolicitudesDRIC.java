/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions;

import Clases.UniversidadAsignada;
import Clases.Usuario;
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
 * @author leonardo
 */
public class ListarSolicitudesDRIC extends org.apache.struts.action.Action {

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
            
            ArrayList<Usuario> users = DBMS.getInstance().listarPostuladosDRIC();
            System.out.println("aqui empieza");
            for (Usuario s : users){
              System.out.println(s.getNombre());
              boolean existe = DBMS.getInstance().existeUniversidadAsignada(s.getNombreusuario());
              System.out.println(existe);
              if (existe){
                UniversidadAsignada uni = DBMS.getInstance().obtenerUniversidadAsignada(s.getNombreusuario());
                s.setConfirmar2(uni.getNombre());
              }else{
                s.setConfirmar2("Sin asignar");
              }

            }

            System.out.println(users);
            request.setAttribute("usuarios", users);
            return mapping.findForward(SUCCESS);
    }
}
