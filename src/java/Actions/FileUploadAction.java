/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.EstudianteUSB;
import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import Clases.FileUploadForm;
import Clases.Usuario;
import DBMS.DBMS;

public class FileUploadAction extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // aqui recibimos el archivo puesto en el form
        Usuario user = new Usuario();
        FileUploadForm fileUploadForm = (FileUploadForm) form;
        String nom = fileUploadForm.getNombreusuario();
        Usuario u = new Usuario();
        Usuario u2 = new Usuario();
        u.setNombreusuario(nom);
        boolean error = false;
        u2 = DBMS.getInstance().obtenerDatos(u);
        File folder;
        //obtenemos los archivos de un arraylist
        ArrayList archivos = fileUploadForm.getListFile();
        ArrayList tam = fileUploadForm.getListFile();
        int cant = 0;
        int cantArchivos = 0;
        /*revizamos que haya introducio almenos un archivo y que sea la foto*/
        for (int i = 0; i < tam.size(); i++) {
            FormFile f = (FormFile) tam.get(i);
            if (i == 0 && !(f.getContentType().contains("image/jpeg") || f.getContentType().contains("image/png"))) {
                u2.setNombre("La foto debe ser en formato PNG o JPG");
                request.setAttribute("Usuario", u2);
                if (u2.getPrivilegio() == 5) {
                    return mapping.findForward("errorusb");
                }
                return mapping.findForward("errorext");

            } else if (!f.getFileName().equalsIgnoreCase("")) {
                cantArchivos++;
            }
        }
        if (cantArchivos < 3) {
            u2.setNombre("Debe incluir todos archivos obligatorios");
            request.setAttribute("Usuario", u2);
            if (u2.getPrivilegio() == 5) {
                return mapping.findForward("errorusb");
            }
            return mapping.findForward("errorext");
        }



        /*iteramos sobre la lista de archivos y sumamos sus tamaños para obtener
         el peso de toda la carga y revizamos y extension*/
        for (int i = 0; i < tam.size(); i++) {
            FormFile file2 = (FormFile) tam.get(i);
            cant = cant + file2.getFileSize();
            if (!(file2.getContentType().contains("application/pdf")
                    || file2.getContentType().contains("image/png")
                    || file2.getContentType().contains("image/jpeg")) && !file2.getFileName().equalsIgnoreCase("")) {
                error = true;
            }

        }
        /*si la carga es mayor de 5000000 de bytes que es 5Mbytes no se cargan
         los archivos o los archivos no son pdf o png o jpg*/
        if (cant > 3145728 || error) {
            String noti = "";
            if (error) {
                noti = noti + "Los archivos deben ser de extension PDF, JPG o PNG\n";
            } else {
                noti = noti + "Los archivos superaron la capacidad maxima intente de nuevo\n";
            }
            u2.setNombre(noti);
            request.setAttribute("Usuario", u2);
            if (u2.getPrivilegio() == 5) {
                return mapping.findForward("errorusb");
            }
            return mapping.findForward("errorext");

        }
        /*en caso contrario*/
        user.setNombreusuario(nom);
        EstudianteUSB est = new EstudianteUSB();
        est.setNombreusuario(user.getNombreusuario());
        est.setCarnet("0");
        est.setCedula("0");

        //buscamos el path real para guardar el archivo, 
        //este path lo guarda en el la capeta build/web/Documentos

        String filePath =
                getServlet().getServletContext().getRealPath("/") + "Documentos/" + nom;
        String documentos = getServlet().getServletContext().getRealPath("/") + "Documentos/";
        /*Guardamos el path de los archivos relacionados a un usuario en la base
         de datos*/
        if (!DBMS.getInstance().InsertarPath(filePath, est)) {
            System.out.println("No funciona el insertar");
        }


        folder = new File(documentos);
        if (!folder.exists()) {
            folder.mkdir();
        }


        /*Creamos la carpeta donde se guardaran los archivos, si ya existe seguimos,
         si no la creamos*/
        folder = new File(filePath);
        if (!folder.exists()) {
            folder.mkdir();
        }

        /*Para cada archivo*/
        for (int i = 0; i < archivos.size(); i++) {

            //del archivo del form obtenemos el archivo como tal
            FormFile file = (FormFile) archivos.get(i);

            //obtenemos el nombre
            String fileName = file.getFileName();
            //obtenemos el arreglo de bytes del archivo
            byte[] fileData = file.getFileData();


            if (!fileName.equals("")) {

                /* Se crea el archivo para poder guardalo en el servidor
                 */
                File newFile;
                switch (i) {
                    case 0:
                        newFile = new File(filePath, "Foto.png");
                        break;
                    case 1:
                        newFile = new File(filePath, "Informe.pdf");
                        break;
                    default:
                        newFile = new File(filePath, fileName);
                        break;
                }

                // si existe el archivo lo sobreescribe

                FileOutputStream fos = new FileOutputStream(newFile);
                fos.write(file.getFileData());
                fos.flush();
                fos.close();


                String accion = "Adjuntó archivos a su solicitud";
                boolean boo = DBMS.getInstance().registrar(u2.getNombreusuario(), accion);

            }

        }

        if (u2.getPrivilegio() == 5) {
            return mapping.findForward("usb");
        }
        return mapping.findForward("ext");
    }
}
