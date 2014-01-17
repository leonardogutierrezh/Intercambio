/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions;

import Clases.Universidad;
import Clases.UniversidadAsignada;
import Clases.Usuario;
import DBMS.DBMS;
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
public class AsignarUniversidadGuardar extends org.apache.struts.action.Action {

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
                System.out.println("aqui viene la universidad si tiene");
                System.out.println(u.getConfirmar2());
              
                if (u.getConfirmar2().equals("failure")){
                  System.out.println("entro aqui");
                  Universidad uni = DBMS.getInstance().obtenerUniversidadExtrangera(u.getConfirmar());
                  System.out.println(uni.getNombre());
                  boolean resta = DBMS.getInstance().restarCupo(uni);
                  UniversidadAsignada asignada = new UniversidadAsignada();
                  asignada.setNombre(uni.getNombre());
                  asignada.setNombreUsuario(u.getNombreusuario());
                  asignada.setPais("Pais");
                  boolean asignar = DBMS.getInstance().InsertarUniversidadAsignada(asignada);
                }else{
                  System.out.println("se fue por el else");
                  Universidad uni = DBMS.getInstance().obtenerUniversidadExtrangera(u.getConfirmar());
                  Universidad old = DBMS.getInstance().obtenerUniversidadExtrangera(u.getConfirmar2());
                  System.out.println(uni.getNombre());
                  boolean resta = DBMS.getInstance().restarCupo(uni);
                  boolean suma = DBMS.getInstance().sumarCupo(old);
                  UniversidadAsignada asignada = new UniversidadAsignada();
                  asignada.setNombre(uni.getNombre());
                  asignada.setNombreUsuario(u.getNombreusuario());
                  asignada.setPais("Pais");
                  boolean asignar = DBMS.getInstance().cambiarUniversidadAsignada(asignada);
                }
                u.setConfirmar("Universidad Asignada");
                boolean cambiar = DBMS.getInstance().cambiarEstadoSolicitud(u);
        return mapping.findForward(SUCCESS);
    }
}
