/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Actions;

import Clases.AntecedentesAcademicos;
import Clases.Estudiante;
import Clases.EstudianteUSB;
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
            ArrayList<Estudiante> lista = new ArrayList<Estudiante>();
            System.out.println("aqui empieza");
            String uniaux = "Nada";
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
              Estudiante aux = new Estudiante();
              if (!(uniaux.equalsIgnoreCase(s.getContrasena()))){
                  
                  Universidad ext = DBMS.getInstance().obtenerUniversidadExtrangera(s.getContrasena());
                  System.out.println(ext);
                  aux.setApartamento(ext.getNombre());
                  aux.setCalle(ext.getPais());
                  System.out.println("cupo " + ext.getCupo());
                  aux.setPage(ext.getCupo());
                  aux.setCiudad(s.getContrasena());
                  aux.setEstado("True");
                  lista.add(aux);
                  uniaux = s.getContrasena();
              }else{
                  aux.setConfirmar("False");
              }
              EstudianteUSB usb = DBMS.getInstance().obtenerDatosUSB(s);
              Estudiante est = DBMS.getInstance().obtenerEstudiante(s);
              Usuario post = DBMS.getInstance().obtenerRecomendacion(s);
              AntecedentesAcademicos ant = DBMS.getInstance().obtenerAntecedente(s);
              est.setOrigen(usb.getCarnet());
              est.setApartamento("3.55");
              est.setCiudad(post.getConfirmar2());
              est.setCalle(post.getConfirmar());
              s.setConfirmar2(est.getpNombre() + " " + est.getpApellido());
              
              lista.add(est);
            }

            System.out.println(users);
            request.setAttribute("usuarios", lista);
            return mapping.findForward(SUCCESS);
    }
}