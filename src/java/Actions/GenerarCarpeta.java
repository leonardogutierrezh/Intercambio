/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.GeneradorPlanillas;
import Clases.Idiomas;
import Clases.PlanExtranjero;
import Clases.PlanillaExt;
import Clases.Usuario;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.File;
import javax.servlet.ServletOutputStream;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dreabalbas
 */
public class GenerarCarpeta extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS_USB = "successUSB";
    private static final String SUCCESS_Ext = "successExt";
    private static final String SUCCESS_Gest = "successGest";
    private static final String VACIO_USB = "vacioUSB";
    private static final String VACIO_Ext = "vacioEXT";
    private static final String VACIO_Gest = "vacioGest";

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
        Usuario obj = (Usuario) session.getAttribute("Usuario");
        Usuario u = (Usuario) form;
        Usuario UserData;
        Document document = new Document(PageSize.LETTER);
        document.setMargins( 10, 10, 10, 10);
       
        // Archivo de salida
        String filePath =
                getServlet().getServletContext().getRealPath("/") + "Documentos/" + u.getNombreusuario();
        String OUTPUTFILE = filePath + "/carpeta.pdf";
        /*Path para imagenes, lo usa generador de planillas*/
        String path = getServlet().getServletContext().getRealPath("/") + "images/";
        
        PdfWriter writer;
        
        ArrayList<String> files = DBMS.getInstance().listarDocumentos(u);
        
        
        if (u.getNuevacontra() != null) {
            UserData = DBMS.getInstance().obtenerDatos(u);
            System.out.print(UserData.getPrivilegio());
            
            u.setPrivilegio(UserData.getPrivilegio());
        }
        
        if (u.getPrivilegio() == 5) {
            /*Nos aseguramos que actualice la informacion de la planilla*/
            // Instanciacion de la clase PlanillaUSB
            Clases.PlanillaUSB p = DBMS.getInstance().obtenerPlanillaUSB(u);
            // Instanciacion de la clase Idiomas
            Clases.Idiomas idiomas = DBMS.getInstance().obtenerIdiomas(u);
            // Instanciacion de la clase PlanDeEstudio
            Clases.PlanDeEstudio materias = DBMS.getInstance().obtenerMaterias(u);
            GeneradorPlanillas g = new GeneradorPlanillas();
            boolean ha = g.generarPlanillaUSB(p, filePath, materias, idiomas,path);
            
            
            if (files == null) {
                if (u.getNuevacontra() != null) {
                    return mapping.findForward(VACIO_Gest);
                } else {
                    return mapping.findForward(VACIO_USB);
                }
            } else {
                if (!ha) {
                return mapping.findForward(VACIO_USB);
            }
                writer = PdfWriter.getInstance(document, new FileOutputStream(OUTPUTFILE));
                document.open();
                Iterator it = files.iterator();
                
                Image img;
                PdfImportedPage pagina;
                int cantPaginas;
                Image aux;
                
                while (it.hasNext()) {
                    
                    String archivo = (String) it.next();
                    
                    if ((archivo.endsWith(".jpg") || archivo.endsWith(".png"))
                            && !archivo.endsWith("Foto.png")
                            && !archivo.endsWith("Cedula.png")) {
                        img = Image.getInstance(archivo);
                        System.out.println("Veo el tamaño del archivo "+archivo+ ": "  + img.getHeight()+img.getWidth());
                        System.out.println("Veo la rotacion del archivo "+archivo+ ": "+ img.getImageRotation());
            
                        if (img.getWidth()>650 & img.getHeight()>750){
                            img.scaleAbsolute(612,792);
                        }
                        document.add(img);
                        
                    } else if (archivo.endsWith(".pdf")
                            && !archivo.endsWith("carpeta.pdf")) {
                        PdfReader reader = new PdfReader(archivo);
                        cantPaginas = reader.getNumberOfPages();
                        
                        for (int i = 1; i <= cantPaginas; i++) {
                            pagina = writer.getImportedPage(reader, i);
                            aux = Image.getInstance(pagina);
                            document.add(aux);
                        }
                    }
                }
                
                document.close();
                
                session.setAttribute("carpeta", OUTPUTFILE);

                /*De aqui empieza la magia para descargar el documento sacado de :
                 http://www.mkyong.com/struts/struts-download-file-from-website-example/
                 */
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment;filename=Carpeta.pdf");
                
                try {
                    //Get it from file system
                    FileInputStream in =
                            new FileInputStream(new File(OUTPUTFILE));
                    
                    ServletOutputStream out = response.getOutputStream();
                    
                    byte[] outputByte = new byte[4096];
                    //copy binary content to output stream
                    while (in.read(outputByte, 0, 4096) != -1) {
                        out.write(outputByte, 0, 4096);
                    }
                    in.close();
                    out.flush();
                    out.close();
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
                String accion1 = "Generó su carpeta";
                String accion2 = "Revisó la carpeta del estudiante "
                        + u.getNombreusuario();
                if (u.getNuevacontra() != null) {
                    boolean boo = DBMS.getInstance().registrar(u.getNuevacontra(), accion2);
                } else {
                    boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(), accion1);
                }
                return mapping.findForward(SUCCESS_USB);
            }
            
        }
        
        if (u.getPrivilegio() == 6) {
            /* verificamos que genere la carpeta con la ultima actualizacion de la planilla*/
            // Instanciacion de la clase PlanillaExtranjera
            PlanillaExt p = DBMS.getInstance().obtenerPlanillaExt(u);
            // Instanciacion de la clase Idiomas
            Idiomas idiomas = DBMS.getInstance().obtenerIdiomas2(u);
            // Instanciacion de la clase PlanDeEstudio
            PlanExtranjero materias = DBMS.getInstance().obtenerMateriasExt(u);
            GeneradorPlanillas g = new GeneradorPlanillas();
            boolean ha = g.generarPlanillaExt(p, filePath, materias, idiomas, path);
            if (files == null) {
                if (u.getNuevacontra() != null) {
                    return mapping.findForward(VACIO_Gest);
                } else {
                    return mapping.findForward(VACIO_Ext);
                }
                
            } else {
                if (!ha) {
                return mapping.findForward(VACIO_Ext);
            }
                
                writer = PdfWriter.getInstance(document, new FileOutputStream(OUTPUTFILE));
                document.open();
                Iterator it = files.iterator();
                
                Image img;
                PdfImportedPage pagina;
                int cantPaginas;
                Image aux;
                
                while (it.hasNext()) {
                    
                    String archivo = (String) it.next();
                    
                    if ((archivo.endsWith(".jpg") || archivo.endsWith(".png"))
                            && !archivo.endsWith("Foto.png")
                            && !archivo.endsWith("Cedula.png")) {
                        img = Image.getInstance(archivo);
                        if (img.getWidth()>650 & img.getHeight()>750){
                            img.scaleAbsolute(612,792);
                        }
                        document.add(img);
                        
                    } else if (archivo.endsWith(".pdf")
                            && !archivo.endsWith("carpeta.pdf")) {
                        PdfReader reader = new PdfReader(archivo);
                        cantPaginas = reader.getNumberOfPages();
                        
                        for (int i = 1; i <= cantPaginas; i++) {
                            pagina = writer.getImportedPage(reader, i);
                            aux = Image.getInstance(pagina);
                            document.add(aux);
                        }
                    }
                }
                
                document.close();
                session.setAttribute("carpeta", OUTPUTFILE);

                /*De aqui empieza la magia para descargar el documento sacado de :
                 http://www.mkyong.com/struts/struts-download-file-from-website-example/
                 */
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment;filename=Carpeta.pdf");
                
                try {
                    //Get it from file system
                    FileInputStream in =
                            new FileInputStream(new File(OUTPUTFILE));
                    
                    ServletOutputStream out = response.getOutputStream();
                    
                    byte[] outputByte = new byte[4096];
                    //copy binary content to output stream
                    while (in.read(outputByte, 0, 4096) != -1) {
                        out.write(outputByte, 0, 4096);
                    }
                    in.close();
                    out.flush();
                    out.close();
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
                String accion1 = "Generó su carpeta";
                String accion2 = "Revisó la carpeta del estudiante " + u.getNombreusuario();
                if (u.getNuevacontra() != null) {
                    boolean boo = DBMS.getInstance().registrar(u.getNuevacontra(), accion2);
                } else {
                    boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(), accion1);
                }
                return mapping.findForward(SUCCESS_Ext);
            }
            
        }
        
        return mapping.findForward("error");
    }
}
