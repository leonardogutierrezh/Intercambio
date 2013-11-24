/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.Usuario;
import Clases.Idiomas;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author gustavo
 */
public class CargarIdioma extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // aqui recibimos los idiomas puestos en el form

        Idiomas idioma = (Idiomas) form;
        Idiomas iditmp = new Idiomas();
        Idiomas idiDB = new Idiomas();
        Usuario u = new Usuario();
        Usuario u2 = new Usuario();
        u.setNombreusuario(idioma.getNombreusuario());
        int i;
        u2 = DBMS.getInstance().obtenerDatos(u);
        idiDB = DBMS.getInstance().obtenerIdiomas(u);

        /*obtenemos los arraylist para los campos de cada idioma*/

        ArrayList escri = idioma.getListEscrito();
        ArrayList verb = idioma.getListVerbal();
        ArrayList idi = idioma.getListIdioma();
        ArrayList conv = idioma.getListConversacional();
        ArrayList audi = idioma.getListAuditivo();
        
        /* para ver si se instancia bien lengua materna y curso español*/
        System.out.println("TIene lenguamaterna?: "+ idioma.getLenguaMaterna());
        System.out.println("TIene curso español?: "+ idioma.getTomarCursoDeEspaniol());
        

        ArrayList idiomaDB = idiDB.getListIdioma();

        /*Revisamos que todos los campos tenga almenos un valor*/
        for (int j = 0; j < audi.size(); j++) {
            if (audi.get(j).toString().equalsIgnoreCase("")) {
                if (u2.getPrivilegio() == 5) {
                    return mapping.findForward("usberror");
                }
                return mapping.findForward("exterror");
            }
        }
        for (int j = 0; j < conv.size(); j++) {
            if (conv.get(j).toString().equalsIgnoreCase("")) {
                if (u2.getPrivilegio() == 5) {
                    return mapping.findForward("usberror");
                }
                return mapping.findForward("exterror");
            }
        }
        for (int j = 0; j < escri.size(); j++) {
            if (escri.get(j).toString().equalsIgnoreCase("")) {
                if (u2.getPrivilegio() == 5) {
                    return mapping.findForward("usberror");
                }
                return mapping.findForward("exterror");
            }
        }
        for (int j = 0; j < idi.size(); j++) {
            if (idi.get(j).toString().equalsIgnoreCase("")) {
                if (u2.getPrivilegio() == 5) {
                    return mapping.findForward("usberror");
                }
                return mapping.findForward("exterror");
            }
        }
        for (int j = 0; j < verb.size(); j++) {
            if (verb.get(j).toString().equalsIgnoreCase("")) {
                if (u2.getPrivilegio() == 5) {
                    return mapping.findForward("usberror");
                }
                return mapping.findForward("exterror");
            }
        }

        /*por ultimo ejecutamos la funcion que inserta en la base de datos los
         diferentes idiomas de un usuario*/

        for (i = 0; i < escri.size(); i++) {
            if (!idiomaDB.contains((String) idi.get(i))) {

                iditmp.setIdiomaDest(0, (String) idi.get(i));
                iditmp.setNivelConversacional(0, (String) conv.get(i));
                iditmp.setNivelEscrito(0, (String) escri.get(i));
                iditmp.setNivelVerbal(0, (String) verb.get(i));
                iditmp.setNivelAuditivo(0, (String) audi.get(i));
                iditmp.setNombreusuario(idioma.getNombreusuario());
                iditmp.setLenguaMaterna(idioma.getLenguaMaterna());
                iditmp.setTomarCursoDeEspaniol(idioma.getTomarCursoDeEspaniol());
                System.out.println("TIene lenguamaterna Guardar?: "+ iditmp.getLenguaMaterna());
                System.out.println("TIene curso español GUARdar?: "+ iditmp.getTomarCursoDeEspaniol());

                if (!DBMS.getInstance().InsertarIdioma(iditmp)) {

                    System.out.println("Falloooooo");
                }
            } else {
                iditmp.setIdiomaDest(0, (String) idi.get(i));
                iditmp.setNivelConversacional(0, (String) conv.get(i));
                iditmp.setNivelEscrito(0, (String) escri.get(i));
                iditmp.setNivelVerbal(0, (String) verb.get(i));
                iditmp.setNivelAuditivo(0, (String) audi.get(i));
                iditmp.setNombreusuario(idioma.getNombreusuario());
                iditmp.setLenguaMaterna(idioma.getLenguaMaterna());
                iditmp.setTomarCursoDeEspaniol(idioma.getTomarCursoDeEspaniol());
                System.out.println("TIene lenguamaterna ENTRA?: "+ iditmp.getLenguaMaterna());
                System.out.println("TIene curso español ENTRA?: "+ iditmp.getTomarCursoDeEspaniol());


                if (!DBMS.getInstance().modificarIdioma(iditmp)) {
                    System.out.println("yey");
                }
            }
        }

        String accion = "Guardó en el sistema los idiomas que domina";
        boolean boo = DBMS.getInstance().registrar(u2.getNombreusuario(), accion);

        if (u2.getPrivilegio() == 5) {
            return mapping.findForward("usb");
        }
        return mapping.findForward("ext");
    }
}