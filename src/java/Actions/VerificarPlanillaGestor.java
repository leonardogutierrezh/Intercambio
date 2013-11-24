/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Clases.PlanillaUSB;
import Clases.Usuario;
import DBMS.DBMS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dreabalbas
 */
public class VerificarPlanillaGestor extends org.apache.struts.action.Action {

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

        Usuario u = (Usuario) form;
        Document document = new Document();
        HttpSession session = request.getSession();


        // Archivo de salida
        String OUTPUTFILE = "/home/dreabalbas/Desktop/prueba.pdf";

        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(OUTPUTFILE));
        document.open();

        ArrayList<String> files = DBMS.getInstance().listarDocumentos(u);

        Iterator it = files.iterator();

        Image img;
        PdfImportedPage pagina;
        int cantPaginas;
        Image aux;

        while (it.hasNext()) {

            String archivo = (String) it.next();

            if (archivo.endsWith(".jpg")) {
                img = Image.getInstance(archivo);


                document.add(img);
            } else if (archivo.endsWith(".pdf")) {
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
        Usuario obj = (Usuario) session.getAttribute("Usuario");
        boolean boo = DBMS.getInstance().registrar(obj.getNombreusuario(), "Revision de planilla del usuario " + u.getNombreusuario());
        return mapping.findForward(SUCCESS);
    }
}