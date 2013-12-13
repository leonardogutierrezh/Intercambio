/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import DBMS.DBMS;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.itextpdf.text.html.WebColors;

/**
 *
 * @author kattys
 */
public class GeneradorPlanillas {

    /*
     * To change this template, choose Tools | Templates
     * and open the template in the editor.
     */
    /**
     *
     * @author katty
     */
    public Boolean generarPlanillaUSB(PlanillaUSB p, String path, PlanDeEstudio plan, Idiomas idim,String filepath) throws BadElementException, DocumentException {
        Document document = new Document(PageSize.LETTER); // Pdf de tamano carta
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        System.out.println("Empeze a generar");

        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String creacion = dateFormat.format(cal.getTime());
            PdfWriter salida = PdfWriter.getInstance(document,
                    new FileOutputStream(path+"/PlanillaIntercambio_USB.pdf"));

            document.addTitle("Planilla Postulacion Intercambio."); //Titulo del PDF.
            document.addCreationDate(); // Fecha de cracion del PDF.
            document.addCreator("dycicle Systems"); // Crador del PDF.
            document.setMargins(36, 72, 108, 180);
            
            // FONTS
            Font fontTitulos1 = new Font(FontFamily.HELVETICA, 11, Font.BOLD, BaseColor.BLACK);
            //PAra titulos de bloque
            Font fontTitulos = new Font(FontFamily.HELVETICA, 10, Font.BOLD, BaseColor.BLACK);
            //PAra Subtitulos de bloque
            Font fontTitulos2 = new Font(FontFamily.HELVETICA, 7, Font.BOLD, BaseColor.BLACK);
            //PAra Opciones
            Font fontTitulos3 = new Font(FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.BLACK);
            //Para input
            Font fontCampo = new Font(FontFamily.HELVETICA, 8, Font.NORMAL, BaseColor.BLACK);
            //Para labels
            Font fontCampo2 = new Font(FontFamily.HELVETICA, 8, Font.BOLDITALIC, BaseColor.BLACK);
            //para textos pequeños
            Font fontPequena = new Font(FontFamily.HELVETICA, 6, Font.NORMAL, BaseColor.BLACK);
            
            // Color Areas
            BaseColor color = WebColors.getRGBColor("B0C2CB"); //gris clarito
            
            //Apertura Documento
            document.open();

            PdfContentByte canvas = salida.getDirectContent();


            /* ###########################################################
             * #  Header del pdf, titulo, foto del aplicante y logo USB. #
             * ###########################################################*/
            ColumnText ct = new ColumnText(canvas);
            
            //Estampado de fecha y hora de creacion
            Phrase campo = new Phrase("Fecha Creacion: "+ creacion, fontCampo);
            ct.setSimpleColumn(campo, 200, 70, 580, 80, 10, Element.ALIGN_RIGHT);
            ct.go();

            // TITULO PRINCIPAL
            Phrase titulo = new Phrase("FORMULARIO DE POSTULACIÓN AL PROGRAMA DE INTERCAMBIO DE ESTUDIANTES", fontTitulos1);
            //ct.setSimpleColumn(titulo, 30, 660, 600, 690, 25, Element.ALIGN_CENTER);
            ct.setSimpleColumn(titulo, 68, 660, 600, 690, 25, Element.ALIGN_LEFT);
            ct.go();

            //IMAGEN APLICANTE
            //Cambiar Path
            
            Image imagen = Image.getInstance(path+"/Foto.png");
            // define la posicion de la imagen del aplicante
            imagen.setAbsolutePosition(500f, 680f); 
            // define el tamano de la imagen del aplicante
            imagen.scaleAbsolute(75f, 75f); 
            // agrega la imagen al pdf
            document.add(imagen);
            
            //Cebolla USB_Logo                                
            imagen = Image.getInstance(filepath+"cebollaUSB.jpg");
            imagen.setAbsolutePosition(125f, 730f);
            imagen.scalePercent(20f);

            
            campo = new Phrase("                                             \n"
					+	"Coordinación de Apoyo a los Programas de Intercambio\n"
                    + "Programa de Intercambio de Estudiantes", fontTitulos2);
            ct.setSimpleColumn(campo, 200, 625, 480, 730, 10, Element.ALIGN_RIGHT);
            ct.go();

// agrega la imagen al pdf
            document.add(imagen);
            campo = new Phrase("                UNIVERSIDAD SIMÓN BOLÍVAR\n"
                    + "                                RECTORADO\n"
                    + "Dirección de Relaciones Internacionales y de Cooperación", fontTitulos2);
            ct.setSimpleColumn(campo, 60, 625, 340, 730, 10, Element.ALIGN_LEFT);
            ct.go();
            
            /* #################################
             * #      Datos Personales         #
             * #################################*/
            
            // Background area
            canvas.saveState();
            canvas.roundRectangle(70, 630, 455, 20,6);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();
            // Titulo del area
            campo = new Phrase("  DATOS PERSONALES", fontTitulos);
            ct.setSimpleColumn(campo, 70, 630, 560, 645, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Nombre
            campo = new Phrase("   - Nombre Completo:  ",  fontCampo2);
            ct.setSimpleColumn(campo, 70, 610, 300, 620, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNombre1()+ " "+ p.getNombre2()+" "+
                              p.getApellido1()+" "+ p.getApellido2(),  fontCampo);
            ct.setSimpleColumn(campo, 70, 610, 300, 620, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Género
            campo = new Phrase("   - Género:  ",  fontCampo2);
            ct.setSimpleColumn(campo, 70, 590, 350, 600, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getSexo(),  fontCampo);
            ct.setSimpleColumn(campo, 70, 590, 350, 600, 10, Element.ALIGN_LEFT);
            ct.go();            
            
            // Email
            campo = new Phrase("  - Email:  ",  fontCampo2);
            ct.setSimpleColumn(campo, 70, 570, 250, 580, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getEmail(),  fontCampo);
            ct.setSimpleColumn(campo, 70, 570, 250, 580, 10, Element.ALIGN_LEFT);
            ct.go();
            
            
            //Fecha de Nacimiento
            campo = new Phrase("  -  Fecha de Nacimiento:  ", fontCampo2);
            ct.setSimpleColumn(campo, 320, 590, 560, 600, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getFechaNacimiento(), fontCampo);
            ct.setSimpleColumn(campo, 320, 590, 560, 600, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Nacionalidad
            campo = new Phrase("  - Nacionalidad:  ", fontCampo2);
            ct.setSimpleColumn(campo, 320, 570, 600, 580, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNacionalidad(), fontCampo);
            ct.setSimpleColumn(campo, 320, 570, 600, 580, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Cédula de Identidad
            campo = new Phrase("  - Cédula de Identidad:  ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 550, 300, 560, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getCedula() , fontCampo);
            ct.setSimpleColumn(campo, 70, 550, 300, 560, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Carnet USB
            campo = new Phrase("  - Carné Estudiantil USB:  ",fontCampo2);
            ct.setSimpleColumn(campo, 70, 530, 300, 540, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getCarnet()  ,fontCampo);
            ct.setSimpleColumn(campo, 70, 530, 300, 540, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Tlf. Celular
            campo = new Phrase("  - Tlf. Celular:  ",fontCampo2);
            ct.setSimpleColumn(campo, 320, 550, 600, 560, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getTelefonoCelular() ,fontCampo);
            ct.setSimpleColumn(campo, 320, 550, 600, 560, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Tlf. Habitación
            campo = new Phrase("  - Tlf. Habitación:  ",fontCampo2);
            ct.setSimpleColumn(campo, 320, 530, 600, 540, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getTelefonoCasa() ,fontCampo);
            ct.setSimpleColumn(campo, 320, 530, 600, 540, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Domicilio
            campo = new Phrase("  - Domicilio Actual  ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 510, 300, 520, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Urb/Sector/Barrio
            campo = new Phrase("  * Urb/Sector/Barrio:  ",fontCampo2);
            ct.setSimpleColumn(campo, 90, 490, 300, 500, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getUrbanizacion() ,fontCampo);
            ct.setSimpleColumn(campo, 90, 490, 300, 500, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Calle
            campo = new Phrase("  * Calle:  ",fontCampo2);
            ct.setSimpleColumn(campo, 90, 470, 300, 480, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getCalle() ,fontCampo);
            ct.setSimpleColumn(campo, 90, 470, 300, 480, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Ciudad
            campo = new Phrase("  * Ciudad:  ",fontCampo2);
            ct.setSimpleColumn(campo, 90, 450, 300, 460, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getCiudad()  ,fontCampo);
            ct.setSimpleColumn(campo, 90, 450, 300, 460, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Codigo Postal
            campo = new Phrase("  * Código Postal:  " ,fontCampo2);
            ct.setSimpleColumn(campo, 90, 430, 300, 440, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getCodPostal()  ,fontCampo);
            ct.setSimpleColumn(campo, 90, 430, 300, 440, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Edificio/NombreCasa
            campo = new Phrase("  * Nombre (Edificio|Casa): "  ,fontCampo2);
            ct.setSimpleColumn(campo, 320, 490, 600, 500, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getEdificio()  ,fontCampo);
            ct.setSimpleColumn(campo, 320, 490, 600, 500, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Apartamento/Nro.Casa
            campo = new Phrase("  * Apartamento/Nro.Casa:  " ,fontCampo2);
            ct.setSimpleColumn(campo, 320, 470, 600, 480, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getApartamento() ,fontCampo);
            ct.setSimpleColumn(campo, 320, 470, 600, 480, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Estado
            campo = new Phrase("  * Estado:  ", fontCampo2);
            ct.setSimpleColumn(campo, 320, 450, 600, 460, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getEstado() , fontCampo);
            ct.setSimpleColumn(campo, 320, 450, 600, 460, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Cuadro Contenedor
            canvas.saveState();
            canvas.roundRectangle(70, 425, 455, 225,6);
            canvas.stroke();
            canvas.restoreState();
            
            
            /* #################################################
             * #  Identificacion del Programa y Lapso de tiempo #
             * ##################################################*/
            
            // Background area
            canvas.saveState();
            canvas.roundRectangle(70, 395, 455, 20,6);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();
            
            // Titulo del area.
            titulo = new Phrase("  IDENTIFICACIÓN DEL PROGRAMA Y LAPSO DE ESTUDIO EN INTERCAMBIO:  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 400, 450, 420, 20, Element.ALIGN_LEFT);
            ct.go();
            
            
            //Subtitulo Area PRIMERA OPCION
            titulo = new Phrase(" Primera Opción  ", fontTitulos);
            ct.setSimpleColumn(titulo, 80, 370, 445, 380, 10, Element.ALIGN_LEFT);
            ct.go();
            // Linea Titulo
            canvas.saveState();
            canvas.rectangle(80, 365, 80, 0);
            canvas.stroke();
            canvas.restoreState();
            
            // País de Destino
            campo = new Phrase("  - País de Destino:  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 350, 300, 360, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getPaisOpcion1() , fontCampo);
            ct.setSimpleColumn(campo, 70, 350, 300, 360, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Tipo de Programa
            campo = new Phrase("  - Tipo de Programa: " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 330, 600, 340, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getProgramaOpcion1()  , fontCampo);
            ct.setSimpleColumn(campo, 70, 330, 600, 340, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Duracion
            campo = new Phrase("  - Duración del Programa: " , fontCampo2);
            ct.setSimpleColumn(campo, 280, 350, 600, 360, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getDuracionProgramaOpcion1(), fontCampo);
            ct.setSimpleColumn(campo, 280, 350, 600, 360, 10, Element.ALIGN_LEFT);
            ct.go();

            //Universidad Destino 1
            campo = new Phrase("  - Nombre de la Universidad de Destino: ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 310, 600, 320, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNombreOpcion1(), fontCampo);
            ct.setSimpleColumn(campo, 70, 310, 600, 320, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Nombre Programa
            campo = new Phrase("  - Nombre del Programa: ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 290, 600, 300, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNombreProgramaOpcion1(), fontCampo);
            ct.setSimpleColumn(campo, 70, 290, 600, 300, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Fechas Tentativas 1:
            campo = new Phrase("  - Fechas tentativas de Inicio y Fin(según calendario de la Universidad de Destino)", fontCampo2);
            ct.setSimpleColumn(campo, 70, 270, 600, 280, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("  * Inicio: "+ p.getMesFechaIni1()+ " "+ p.getAnoFechaIni1() +"     "+ "  * Fin: "+p.getMesFechaFin1()+ " "+ p.getAnoFechaFin1(), fontCampo);
            //ct.setSimpleColumn(campo, 90, 250, 500, 260, 10, Element.ALIGN_CENTER);
            ct.setSimpleColumn(campo, 90, 250, 500, 260, 10, Element.ALIGN_LEFT);
            ct.go();
			
			
            //Subtitulo Area SEGUNDA OPCION
            titulo = new Phrase("  Segunda Opción  ", fontTitulos3);
            ct.setSimpleColumn(titulo, 80, 230, 445, 240, 10, Element.ALIGN_LEFT);
            ct.go();
            // Linea Subarea
            canvas.saveState();
            canvas.rectangle(80, 225, 85, 0);
            canvas.stroke();
            canvas.restoreState();
			
            campo = new Phrase("En caso de no ser aceptado en la Universidad seleccionada favor indique una segunda opción  ", fontPequena);
            ct.setSimpleColumn(campo, 80, 215, 550, 225, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // País de Destino 2
            campo = new Phrase("  - País de Destino:  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 200, 300, 210, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getPaisOpcion2() , fontCampo);
            ct.setSimpleColumn(campo, 70, 200, 300, 210, 10, Element.ALIGN_LEFT);
            ct.go();
			
            // Tipo de Programa
            campo = new Phrase("  - Tipo de Programa:  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 180, 600, 190, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getProgramaOpcion2() , fontCampo);
            ct.setSimpleColumn(campo, 70, 180, 600, 190, 10, Element.ALIGN_LEFT);
            ct.go();
			
            //Duracion del Programa
            campo = new Phrase("  - Duración del Programa:  " , fontCampo2);
            ct.setSimpleColumn(campo, 280, 200, 600, 210, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getDuracionProgramaOpcion2() , fontCampo);
            ct.setSimpleColumn(campo, 280, 200, 600, 210, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Universidad de Destino
            campo = new Phrase("  - Nombre Universidad de Destino: ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 160, 600, 170, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNombreOpcion2(), fontCampo);
            ct.setSimpleColumn(campo, 70, 160, 600, 170, 10, Element.ALIGN_LEFT);
            ct.go();
            //Nombre Programa
            campo = new Phrase("  - Nombre del Programa:  ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 140, 600, 150, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNombreProgramaOpcion2(), fontCampo);
            ct.setSimpleColumn(campo, 70, 140, 600, 150, 10, Element.ALIGN_LEFT);
            ct.go();
            
            campo = new Phrase("  - Fechas tentativas de Inicio y Fin(Según calendario de la Universidad de Destino: ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 120, 600, 130, 10, Element.ALIGN_LEFT);
            ct.go();
            
            campo = new Phrase("  * Inicio: "+ p.getMesFechaIni2()+" "+ p.getAnoFechaIni2() +"     "+ "  * Fin: " + p.getMesFechaFin2() +" "+ p.getAnoFechaFin2() , fontCampo);		
            ct.setSimpleColumn(campo, 90, 100, 500, 110, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //cuadro contenedor Area:
            canvas.saveState();
            canvas.roundRectangle(70, 90, 455, 325,6);
            canvas.stroke();
            canvas.restoreState();
            
            
            /* ###########################
             * #  Informacion Academica  #
             * ###########################*/

            document.newPage();

            //Estampado de numero de planilla, fecha y hora de creacion
            campo = new Phrase("Fecha Creación:  "  + creacion, fontCampo);
            ct.setSimpleColumn(campo, 200, 20, 580, 30, 10, Element.ALIGN_RIGHT);
            ct.go();
            
            //Background area
            canvas.saveState();
            canvas.roundRectangle(70, 715, 455, 20,6);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();

            // Titulo del area.
            titulo = new Phrase("  INFORMACIÓN ACADÉMICA:  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 720, 450, 745, 25, Element.ALIGN_LEFT);
            ct.go();
            
            //Decanato
            campo = new Phrase("  - Decanato: " , fontCampo2);
            ct.setSimpleColumn(campo, 310, 690, 600, 700, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getDecanato() , fontCampo);
            ct.setSimpleColumn(campo, 310, 690, 600, 700, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Nro de Créditos Aprobados
            campo = new Phrase("  - Nro de Créditos Aprobados a la Fecha de Postulación:" , fontCampo2);
            ct.setSimpleColumn(campo, 70, 690, 350, 700, 10, Element.ALIGN_LEFT);
            campo = new Phrase(" " + p.getCreditosApro() , fontCampo);
            ct.setSimpleColumn(campo, 70, 690, 350, 700, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Carrera
            campo = new Phrase("  - Carrera que estudia en la USB: " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 670, 600, 680, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getCarrera() , fontCampo);
            ct.setSimpleColumn(campo, 70, 670, 600, 680, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Índice Académico
            campo = new Phrase("  - Índice Académico a la Fecha de Postulación: " , fontCampo2);
            ct.setSimpleColumn(campo, 310, 650, 600, 660, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getIndice() , fontCampo);
            ct.setSimpleColumn(campo, 310, 650, 600, 660, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Área de Estudio
            campo = new Phrase("  - Área de Estudio: " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 650, 350, 660, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getAreaEstud() , fontCampo);
            ct.setSimpleColumn(campo, 70, 650, 350, 660, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Tablas de materias
            canvas.saveState();
	    canvas.rectangle(70, 420, 455, 191);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            //Rectangulo pequeño (linea)
            canvas.saveState();
            canvas.rectangle(70, 580, 455, 30);
            canvas.setLineWidth(0.9f);
            BaseColor color3 = WebColors.getRGBColor("B0C2CB");
            canvas.setColorFill(color3);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();
            
            //Línea
            canvas.saveState();
            canvas.rectangle(70, 580, 455, 0);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();

            // Tabla de la seccion 20
            // Lineas verticales
            canvas.saveState();
            canvas.rectangle(130, 420, 0, 190);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            canvas.saveState();
            canvas.rectangle(257, 420, 0, 190);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            canvas.saveState();
            canvas.rectangle(297, 420, 0, 190);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            


            // Tabla de la seccion 21
            // Lineas verticales
            canvas.saveState();
            canvas.rectangle(298, 420, 0, 190);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            canvas.saveState();
            canvas.rectangle(357, 420, 0, 190);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            canvas.saveState();
            canvas.rectangle(485, 420, 0, 190);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();


            // Plan de Estudio
            campo = new Phrase("  - Asignaturas del Plan de Estudio USB que aspira \n "
                             + "sean convalidadas u otorgadas en equivalencia:  ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 620, 350, 640, 10, Element.ALIGN_LEFT);
            ct.go();

            // Vaceado de Materias
            campo = new Phrase("Código", fontCampo2);
            ct.setSimpleColumn(campo, 80, 590, 115, 610, 10, Element.ALIGN_CENTER);
            ct.go();
            
            int vacea=0;
            int topeAr= plan.getListCodigoUSB().size();
            int valorH= 570;       
            while (vacea!=topeAr && valorH!=430){
            System.out.println("Aqui esta vacea "+ vacea);
            System.out.println("Aqui esta topeAr "+ topeAr);
            //Lleno por fila
            // Codigo USB    
            System.out.println("Aqui esta codUSB "+ plan.getCodigoUSB(vacea));
            
            campo = new Phrase(plan.getCodigoUSB(vacea), fontCampo);
            ct.setSimpleColumn(campo, 80, valorH, 140, (valorH+10), 10, Element.ALIGN_LEFT);
            ct.go();
            //Nombre USB
            campo = new Phrase(plan.getMateriaUSB(vacea), fontCampo);
            ct.setSimpleColumn(campo, 140, valorH, 256, (valorH+10), 10, Element.ALIGN_LEFT);
            ct.go();
            // Creditos USB
            campo = new Phrase(String.valueOf(plan.getCreditosUSB(vacea)), fontCampo);
            ct.setSimpleColumn(campo, 256, valorH, 288, (valorH+10), 10, Element.ALIGN_CENTER);
            ct.go();
            // Codigo Ext
            campo = new Phrase(plan.getCodigoUniv(vacea), fontCampo);
            ct.setSimpleColumn(campo, 308, valorH, 358, (valorH+10), 10, Element.ALIGN_LEFT);
            ct.go();
            // Nombre Ext
            campo = new Phrase(plan.getMateriaUniv(vacea), fontCampo);
            ct.setSimpleColumn(campo, 368, valorH, 485, (valorH+10), 10, Element.ALIGN_LEFT);
            ct.go();
            // Creditos Ext    
            campo = new Phrase(String.valueOf(plan.getCreditosUniv(vacea)), fontCampo);
            ct.setSimpleColumn(campo, 485, valorH, 525, (valorH+10), 10, Element.ALIGN_CENTER);
            ct.go();
            
            valorH=valorH-20;
            vacea=vacea+1;
                           
            }
            
            
            campo = new Phrase("Denominación", fontCampo2);
            ct.setSimpleColumn(campo, 115, 590, 256, 610, 10, Element.ALIGN_CENTER);
            ct.go();

            campo = new Phrase("Créditos \n USB", fontCampo2);
            ct.setSimpleColumn(campo, 258, 590, 298, 610, 10, Element.ALIGN_CENTER);
            ct.go();
            
            campo = new Phrase("Código", fontCampo2);
            ct.setSimpleColumn(campo, 288, 590, 358, 610, 10, Element.ALIGN_CENTER);
            ct.go();



            // Asignaturas a cursar
            campo = new Phrase("  - Asignaturas a cursar en la Universidad de Destino:  ", fontCampo2);
            ct.setSimpleColumn(campo, 310, 620, 600, 640, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Denominación", fontCampo2);
            ct.setSimpleColumn(campo, 358, 590, 485, 610, 10, Element.ALIGN_CENTER);
            ct.go();
            
            campo = new Phrase("Créditos \n Ext", fontCampo2);
            ct.setSimpleColumn(campo, 485, 590, 525, 610, 10, Element.ALIGN_CENTER);
            ct.go();
            
            //Cuadro de Aprobación de la Coordinación
            
            /*canvas.saveState();
            //canvas.rectangle(70, 390, 455, 30);
            canvas.roundRectangle(80, 390, 439, 30,6);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();*/
            
            // Mensaje Aprobación
            campo = new Phrase("Aprobación Coordinación de la Carrera  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 400, 300, 410, 10, Element.ALIGN_CENTER);
            ct.go();

            // línea firma
            canvas.saveState();
            canvas.rectangle(310, 400, 170, 0);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            // cuadro contenedor
            canvas.saveState();
            canvas.roundRectangle(70, 385, 455, 350,6);
            canvas.stroke();
            canvas.restoreState();

            
            /* ##############################
             * #  FUENTE DE FINANCIAMIENTOO #
             * ##############################*/
            
            // Background del area
            canvas.saveState();
            canvas.roundRectangle(70, 355, 455, 20,6);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();
            
            // Titulo del area.
            titulo = new Phrase("  FUENTE DE FINANCIAMIENTO DEL ESTUDIANTE:  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 350, 500, 370, 10, Element.ALIGN_LEFT);
            ct.go();
			
            //Fuente de Ingresos
            campo = new Phrase("  - Principal Fuente de Ingresos: ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 330, 320, 350, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getFuenteFinanciamiento(), fontCampo);
            ct.setSimpleColumn(campo, 70, 330, 320, 350, 10, Element.ALIGN_LEFT);
            ct.go();
            
            titulo = new Phrase("  * Otro: ", fontCampo2);
            ct.setSimpleColumn(titulo, 320, 330, 500, 350, 10, Element.ALIGN_LEFT);
            titulo = new Phrase(p.getDescripcion2(), fontCampo);
            ct.setSimpleColumn(titulo, 320, 330, 500, 350, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Becado o no
            campo = new Phrase("  - ¿Recibe ayuda económica por \n parte de la universidad u otro organismo?  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 310, 320, 330, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getAyudaEc() , fontCampo);
            ct.setSimpleColumn(campo, 70, 310, 320, 330, 10, Element.ALIGN_LEFT);
            ct.go();
            
            campo = new Phrase("  * Especifique:  " , fontCampo2);
            ct.setSimpleColumn(campo, 320, 310, 550, 330, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getDescripcion1()  , fontCampo);
            ct.setSimpleColumn(campo, 320, 310, 550, 330, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Cuadro contenedor
            
            canvas.saveState();
            canvas.roundRectangle(71, 300, 454, 75,6);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            
            
            /* ##############################
             * #  CONOCIMIENTO DE IDIOMAS   #
             * ##############################*/
            
            // Background area
            canvas.saveState();
            canvas.roundRectangle(70, 270, 455, 20,6);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();
            
            //Background Subtitulos
            // Cuadro nivel sufi
            canvas.saveState();
            canvas.rectangle(161, 254, 364, 14);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            //Relleno
            canvas.saveState();
            canvas.rectangle(71, 235, 453, 20);
            canvas.setColorFill(color3);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();
            
            
            // Titulo del area.
            titulo = new Phrase("  CONOCIMIENTO DE IDIOMAS  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 280, 450, 300, 20, Element.ALIGN_LEFT);
            ct.go();
            
            // Lineas verticales
            canvas.saveState();
            canvas.rectangle(161, 155, 0, 100);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            canvas.saveState();
            canvas.rectangle(252, 155, 0, 100);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            canvas.saveState();
            canvas.rectangle(343, 155, 0, 100);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            canvas.saveState();
            canvas.rectangle(434, 155, 0, 100);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
               
            //Primera línea horizontal del cuadro
            canvas.saveState();
            canvas.rectangle(70, 255, 455, 0);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            campo = new Phrase("Nivel de Suficiencia" , fontCampo2);
            ct.setSimpleColumn(campo, 160, 260, 520, 270, 10, Element.ALIGN_CENTER);
            ct.go();
            
            //Segunda linea horizontal
            canvas.saveState();
            canvas.rectangle(70, 235, 455, 0);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            //Titulos Tabla
            campo = new Phrase("Idioma a emplear ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 240, 160, 250, 10, Element.ALIGN_CENTER);
            ct.go();
            
            campo = new Phrase("Verbal ", fontCampo2);
            ct.setSimpleColumn(campo, 160, 240, 250, 250, 10, Element.ALIGN_CENTER);
            ct.go();
            
            campo = new Phrase("Oral ", fontCampo2);
            ct.setSimpleColumn(campo, 250, 240, 340, 250, 10, Element.ALIGN_CENTER);
            ct.go();
            
            campo = new Phrase("Auditivo ", fontCampo2);
            ct.setSimpleColumn(campo, 340, 240, 430, 250, 10, Element.ALIGN_CENTER);
            ct.go();
            
            campo = new Phrase("Escrito ", fontCampo2);
            ct.setSimpleColumn(campo, 430, 240, 520, 250, 10, Element.ALIGN_CENTER);
            ct.go();

            // Vaceado de Idiomas
            int vacea2=0;
            int topeAr2= idim.getListIdioma().size();
            int valorH2= 220; //Este es el valor para ir bajando
            while (vacea2!=topeAr2 && valorH2!=140){
            System.out.println("Aqui esta vacea "+ vacea2);
            
            //Lleno por fila
            // Nombre Idioma    
            System.out.println("Aqui esta idioma "+ idim.getIdiomaDest(vacea2));
            campo = new Phrase(idim.getIdiomaDest(vacea2), fontCampo);
            ct.setSimpleColumn(campo, 70, valorH2, 160, (valorH2+10), 10, Element.ALIGN_CENTER);
            ct.go();
            //Nivel verbal
            campo = new Phrase(idim.getNivelVerbal(vacea2), fontCampo);
            ct.setSimpleColumn(campo, 160, valorH2, 250, (valorH2+10), 10, Element.ALIGN_CENTER);
            ct.go();
            // Nivel oral
            campo = new Phrase(idim.getNivelConversacional(vacea2), fontCampo);
            ct.setSimpleColumn(campo, 250, valorH2, 340, (valorH2+10), 10, Element.ALIGN_CENTER);
            ct.go();
            // Nivel Auditivo
            campo = new Phrase(idim.getNivelAuditivo(vacea2), fontCampo);
            ct.setSimpleColumn(campo, 340, valorH2, 430, (valorH2+10), 10, Element.ALIGN_CENTER);
            ct.go();
            // Nivel Escrito
            campo = new Phrase(idim.getNivelEscrito(vacea2), fontCampo);
            ct.setSimpleColumn(campo, 430, valorH2, 520, (valorH2+10), 10, Element.ALIGN_CENTER);
            ct.go();
            
            valorH2=valorH2-20;
            vacea2=vacea2+1;
            }
            
            /* Cuadro contenedor idiomas*/
            canvas.saveState();
            canvas.roundRectangle(70, 155, 455, 135,6);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            /* ##############################
             * #  	INFO CONTACTO       #
             * ##############################*/
            
            // Background del area
            canvas.saveState();
            canvas.roundRectangle(70, 125, 455, 20,6);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();
            
            //Titulo del area.
            titulo = new Phrase("  DATOS DE CONTACTO EN CASO DE EMERGENCIA  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 130, 450, 150, 20, Element.ALIGN_LEFT);
            ct.go();
            
            campo = new Phrase("  - Nombre Contacto:  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 110, 500, 120, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNombresRep() + " "+ p.getApellidosRep(), fontCampo);
            ct.setSimpleColumn(campo, 70, 110, 500, 120, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Domicilio Contacto
            campo = new Phrase("  - Tlf. Habitación Contacto: " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 90, 300, 100, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getTlfRepCasa() , fontCampo);
            ct.setSimpleColumn(campo, 70, 90, 300, 100, 10, Element.ALIGN_LEFT);
            ct.go();
            
            campo = new Phrase("  - Tlf. Celular Contacto:  " , fontCampo2);
            ct.setSimpleColumn(campo, 320, 90, 600, 100, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getCelRep(), fontCampo);
            ct.setSimpleColumn(campo, 320, 90, 600, 100, 10, Element.ALIGN_LEFT);
            ct.go();
            
            campo = new Phrase("  - Relación con el estudiante:  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 70, 300, 80, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getRelacion(), fontCampo);
            ct.setSimpleColumn(campo, 70, 70, 300, 80, 10, Element.ALIGN_LEFT);
            ct.go();
            
            campo = new Phrase("  - Email Contacto:  " , fontCampo2);
            ct.setSimpleColumn(campo, 320, 70, 600, 80, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getEmailRep(), fontCampo);
            ct.setSimpleColumn(campo, 320, 70, 600, 80, 10, Element.ALIGN_LEFT);
            ct.go();
            
            campo = new Phrase("  - Domicilio Contacto:  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 50, 600, 60, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getDireccionRep(), fontCampo);
            ct.setSimpleColumn(campo, 70, 50, 600, 60, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Cuadro contenedor
            canvas.saveState();
            canvas.roundRectangle(70, 45, 455, 100,6);
            canvas.stroke();
            canvas.restoreState();
            
            
            //NUEVA PAGINA
            
            document.newPage();

            //Estampado de numero de planilla, fecha y hora de creacion
            campo = new Phrase("Fecha Creacion:  "  + creacion, fontCampo);
            ct.setSimpleColumn(campo, 200, 20, 580, 30, 10, Element.ALIGN_RIGHT);
            ct.go();
			
			
            // CUADRITO 
            canvas.saveState();
            canvas.roundRectangle(60, 590, 470, 120,7);
            canvas.stroke();
            canvas.restoreState();
            
            //Línea
	    canvas.saveState();
            canvas.rectangle(170, 670, 100, 0);
            canvas.stroke();
            canvas.restoreState();

            
            /* ################################
             * #  Firma y Fecha de Solicitud  # 
             * ################################*/
            // Firma Solicitante
            campo = new Phrase("Firma del Solicitante:  ", fontCampo);
            ct.setSimpleColumn(campo, 70, 670, 200, 690, 15, Element.ALIGN_CENTER);
            ct.go();

            dateFormat = new SimpleDateFormat("MM/dd/yyyy");
            cal = Calendar.getInstance();
            creacion = dateFormat.format(cal.getTime());

            //FECHA SOLICITUD
            campo = new Phrase("Fecha de Solicitud:  " + creacion, fontCampo);
            ct.setSimpleColumn(campo, 320, 670, 500, 690, 10, Element.ALIGN_LEFT);
            ct.go();

            //Declaracion de veracidad
            campo = new Phrase("El estudiante firmante declara que los datos y documentos suministrados son verídicos"
                    + " y asume cumplir cabalmente con las normas del programa de intercambio estudiantil.", fontPequena);
            ct.setSimpleColumn(campo, 120, 620, 500, 640, 10, Element.ALIGN_CENTER);
            ct.go();

            /* ##########################
             * #  Campos Coordinacion   #
             * ##########################*/

            //Cuadro del area
            canvas.saveState();
            canvas.roundRectangle(60, 410, 470, 130,7);
            canvas.stroke();
            canvas.restoreState();

            //Titulo del area.
            titulo = new Phrase("**Esta sección debe ser llenada exclusivamente por la Coordinación Docente**", fontTitulos);
            ct.setSimpleColumn(titulo, 60, 550, 530, 560, 10, Element.ALIGN_CENTER);
            ct.go();
			
             //Opinion 
            campo = new Phrase("Opinión de la Coordinación Docente sobre esta solicitud (explicación breve):  ", fontCampo2);
            ct.setSimpleColumn(campo, 90, 520, 500, 530, 10, Element.ALIGN_CENTER);
            ct.go();
            campo = new Phrase(p.getComentarioRecomendacion(), fontCampo);
            ct.setSimpleColumn(campo, 90, 500, 500, 510, 10, Element.ALIGN_CENTER);
            ct.go();
            
            campo = new Phrase("Muy favorable:  ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 440, 440, 510, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("Favorable:  ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 420, 420, 490, 10, Element.ALIGN_LEFT);
            ct.go();
            
            campo = new Phrase("Con Reservas:  ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 400, 400, 470, 10, Element.ALIGN_LEFT);
            ct.go();
            
            campo = new Phrase("Indice Normalizado:  ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 380, 380, 450, 10, Element.ALIGN_LEFT);
            ct.go();

            
            document.close();

        } catch (Exception ex) {
            Logger.getLogger(GeneradorPlanillas.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

        return true;
    }
    
    public Boolean generarPlanillaExt(PlanillaExt p, String path, PlanExtranjero plane, Idiomas idim,String filepath ) throws BadElementException, DocumentException {
        Document document = new Document(PageSize.LETTER); // Pdf de tamano carta
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        String creacion = dateFormat.format(cal.getTime());

        try {
            int n = 1;
            PdfWriter salida = PdfWriter.getInstance(document,
                    new FileOutputStream(path+"/PlanillaIntercambio_Ext.pdf"));
        //Titulo del PDF.
        document.addTitle("Planilla Postulacion Intercambio Extranjeros."); 
        // Fecha de cracion del PDF.
        document.addCreationDate(); 
        // Crador del PDF.
        document.addCreator("dycicle Systems"); 
        document.setMargins(36, 72, 108, 180);
        //FUENTES
            //Fuentes Titulo
            Font fontTitulos1 = new Font(FontFamily.HELVETICA, 11, Font.BOLD, BaseColor.BLACK);
            //Titulos bloques
            Font fontTitulos = new Font(FontFamily.HELVETICA, 10, Font.BOLD, BaseColor.BLACK);
            //PAra Subtitulos de bloque
            Font fontTitulos2 = new Font(FontFamily.HELVETICA, 7, Font.BOLD, BaseColor.BLACK);
            //PAra Opciones
            Font fontTitulos3 = new Font(FontFamily.HELVETICA, 9, Font.BOLD,BaseColor.DARK_GRAY);
            BaseColor color = WebColors.getRGBColor("B0C2CB"); //gris clarito
            //Para inputs
            Font fontCampo = new Font(FontFamily.HELVETICA, 8, Font.NORMAL, BaseColor.BLACK);
            //Para Labels
            Font fontCampo2 = new Font(FontFamily.HELVETICA, 8, Font.BOLDITALIC, BaseColor.BLACK);
            //Para textos pequeños
            Font fontPequena = new Font(FontFamily.HELVETICA, 6, Font.NORMAL, BaseColor.BLACK);

            // step 4
            document.open();
            PdfContentByte canvas = salida.getDirectContent();


            /* ###########################################################
             * #  Header del pdf, titulo, foto del aplicante y logo USB. #
             * ###########################################################*/
            ColumnText ct = new ColumnText(canvas);
            //Estampado de fecha y hora de creacion
            Phrase campo = new Phrase("Fecha Creacion:   "+ creacion, fontCampo);
            ct.setSimpleColumn(campo, 200, 70, 580, 80, 10, Element.ALIGN_RIGHT);
            ct.go();

            Phrase titulo = new Phrase("FORMULARIO DE POSTULACIÓN - ESTUDIANTES EXTRANJEROS", fontTitulos1);
            ct.setSimpleColumn(titulo, 30, 650, 600, 680, 25, Element.ALIGN_CENTER);
            ct.go();

            campo = new Phrase(" APPLICATION FORM - INTERNATIONAL STUDENT", fontPequena);
            ct.setSimpleColumn(campo, 30, 640, 600, 670, 25, Element.ALIGN_CENTER);
            ct.go();

            //FOTO APLICANTE
            Image imagen = Image.getInstance(path+"/Foto.png");
            // define la posicion de la imagen del aplicante
            imagen.setAbsolutePosition(500f, 680f); 
            // define el tamano de la imagen del aplicante
            imagen.scaleAbsolute(75f, 75f); 
            // agrega la imagen al pdf
            document.add(imagen); 

            //CEBOLLA USB
            imagen = Image.getInstance(filepath+"cebollaUSB.jpg");
            imagen.setAbsolutePosition(125f, 730f);
            // define el tamano de la imagen
            imagen.scalePercent(20f);
            campo = new Phrase("                                             \n"
                        +	"Coordinación de Apoyo a los Programas de Intercambio\n"
                        + "Programa de Intercambio de Estudiantes", fontTitulos2);
            ct.setSimpleColumn(campo, 200, 625, 480, 730, 10, Element.ALIGN_RIGHT);
            ct.go();

            // agrega la imagen al pdf
            document.add(imagen);


            campo = new Phrase("                UNIVERSIDAD SIMÓN BOLÍVAR\n"
                        + "                                RECTORADO\n"
                        + "Dirección de Relaciones Internacionales y de Cooperación", fontTitulos2);
            ct.setSimpleColumn(campo, 60, 625, 340, 730, 10, Element.ALIGN_LEFT);
            ct.go();
			



            /* #################################
             * #  Seccion de Datos Personales. #
             * #################################*/
            // Background area
            canvas.saveState();
            canvas.roundRectangle(70, 610, 455, 23,6);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();
            
            // Titulo del area
            campo = new Phrase("  DATOS PERSONALES", fontTitulos);
            ct.setSimpleColumn(campo, 70, 620, 560, 630, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("  STUDENT'S PERSONAL DATA", fontPequena);
            ct.setSimpleColumn(campo, 75, 613, 560, 623, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Nombres y Apellidos
            campo = new Phrase("   - Nombre Completo: ",  fontCampo2);
            ct.setSimpleColumn(campo, 70, 590, 600, 600, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNombre1()+ " " + p.getNombre2()+ " "+ p.getApellido1()+ " "+p.getApellido2(),  fontCampo);
            ct.setSimpleColumn(campo, 70, 590, 600, 600, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Full Name",  fontPequena);
            ct.setSimpleColumn(campo, 85, 583, 600, 593, 10, Element.ALIGN_LEFT);
            ct.go();

            
            // Fecha de Nacimiento
            campo = new Phrase("  - Fecha de Nacimiento: ",  fontCampo2);
            ct.setSimpleColumn(campo, 70, 570, 330, 580, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getFechaNacimiento(),  fontCampo);
            ct.setSimpleColumn(campo, 70, 570, 330, 580, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Birthday",  fontPequena);
            ct.setSimpleColumn(campo, 85, 563, 330, 573, 10, Element.ALIGN_LEFT);
            ct.go();
	    
            //Pasaporte
            campo = new Phrase("  - Número de Pasaporte: ",  fontCampo2);
            ct.setSimpleColumn(campo, 70, 550, 330, 560, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getPasaporte(),  fontCampo);
            ct.setSimpleColumn(campo, 70, 550, 330, 560, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Passport Number",  fontPequena);
            ct.setSimpleColumn(campo, 85, 543, 330, 553, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Género
            campo = new Phrase("  - Género: ", fontCampo2);
            ct.setSimpleColumn(campo, 320, 570, 600, 580, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getSexo(), fontCampo);
            ct.setSimpleColumn(campo, 320, 570, 600, 580, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Gender", fontPequena);
            ct.setSimpleColumn(campo, 335, 563, 600, 573, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Nacionalidad
            campo = new Phrase("  - Nacionalidad: ", fontCampo2);
            ct.setSimpleColumn(campo, 320, 550, 600, 560, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNacionalidad(), fontCampo);
            ct.setSimpleColumn(campo, 320, 550, 600, 560, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Nacionality  ", fontPequena);
            ct.setSimpleColumn(campo, 335, 543, 600, 553, 10, Element.ALIGN_LEFT);
            ct.go();

            
            //Teléfono Habitación
            campo = new Phrase("  - Tlf. Habitación:  ",fontCampo2);
            ct.setSimpleColumn(campo, 70, 530, 300, 540, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getTelefonoCasa() ,fontCampo);
            ct.setSimpleColumn(campo, 70, 530, 300, 540, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Home Phone " ,fontPequena);
            ct.setSimpleColumn(campo, 85, 523, 300, 533, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Domicilio 
            campo = new Phrase("  - Domicilio Actual:  ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 510, 300, 520, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Permanent address", fontPequena);
            ct.setSimpleColumn(campo, 85, 503, 300, 513, 10, Element.ALIGN_LEFT);
            ct.go();

            // Tlf. Celular
            campo = new Phrase("  - Tlf. Celular:  ",fontCampo2);
            ct.setSimpleColumn(campo, 320, 530, 600, 540, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getTelefonoCelular() ,fontCampo);
            ct.setSimpleColumn(campo, 320, 530, 600, 540, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Cellphone" ,fontPequena);
            ct.setSimpleColumn(campo, 335, 523, 600, 533, 10, Element.ALIGN_LEFT);
            ct.go();
			
            // calle
            campo = new Phrase("  * Calle:  ",fontCampo2);
            ct.setSimpleColumn(campo, 90, 490, 300, 500, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getCalle() ,fontCampo);
            ct.setSimpleColumn(campo, 90, 490, 300, 500, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Street" ,fontPequena);
            ct.setSimpleColumn(campo, 110, 483, 300, 493, 10, Element.ALIGN_LEFT);
            ct.go();
			
           // Codigo Postal
            campo = new Phrase("  * Código Postal: "  ,fontCampo2);            
            ct.setSimpleColumn(campo, 90, 470, 300, 480, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getCodPostal()  ,fontCampo);            
            ct.setSimpleColumn(campo, 90, 470, 300, 480, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("PostCode "  ,fontPequena);            
            ct.setSimpleColumn(campo, 110, 463, 300, 473, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Edificio
            campo = new Phrase("  * Nombre del Edificio/Nombre de la Casa: ",fontCampo2);
            ct.setSimpleColumn(campo, 90, 450, 600, 460, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getEdificio() ,fontCampo);
            ct.setSimpleColumn(campo, 90, 450, 600, 460, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Name of Building/Name of House " ,fontPequena);
            ct.setSimpleColumn(campo, 110, 443, 600, 453, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Apartamento/Nro.Casa
            campo = new Phrase("  * Apartamento/Nro. de Casa: ",fontCampo2);
            ct.setSimpleColumn(campo, 90, 430, 600, 440, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getApartamento() ,fontCampo);
            ct.setSimpleColumn(campo, 90, 430, 600, 440, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Number of Apartment/ Number of House" ,fontPequena);
            ct.setSimpleColumn(campo, 110, 423, 600, 433, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Ciudad
            campo = new Phrase("  * Ciudad: " ,fontCampo2);            
            ct.setSimpleColumn(campo, 320, 470, 600, 480, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getCiudad()  ,fontCampo);            
            ct.setSimpleColumn(campo, 320, 470, 600, 480, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("City "  ,fontPequena);
            ct.setSimpleColumn(campo, 340, 463, 600, 473, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Estado
            campo = new Phrase("  * Estado: ", fontCampo2);
            ct.setSimpleColumn(campo, 320, 490, 600, 500, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getEstado() , fontCampo);
            ct.setSimpleColumn(campo, 320, 490, 600, 500, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("State" , fontPequena);
            ct.setSimpleColumn(campo, 340, 483, 600, 493, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Cuadro contenedor
            canvas.saveState();
            canvas.roundRectangle(70, 415, 455, 219,6);
            canvas.stroke();
            canvas.restoreState();
            
            
            /* #################################################
             * #  Identificacion del Programa y Lapso de tiempo #
             * ##################################################*/
            
            //Background Subtitulos
            canvas.saveState();
            canvas.roundRectangle(70, 380, 455, 23,6);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();
            
            // Titulo del area.
            titulo = new Phrase("  INFORMACIÓN DE LA UNIVERSIDAD DE ORIGEN  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 390, 500, 400, 10, Element.ALIGN_LEFT);
            ct.go();
            titulo = new Phrase("  HOME INSTITUTION INFORMATION  ", fontPequena);
            ct.setSimpleColumn(titulo, 75, 383, 500, 393, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //País de Origen
            campo = new Phrase("  - País de Origen: ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 370, 455, 380, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getPaisOrigen() , fontCampo);
            ct.setSimpleColumn(campo, 70, 370, 455, 380, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Origin Country  " , fontPequena);
            ct.setSimpleColumn(campo, 85, 363, 455, 373, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Universidad
            campo = new Phrase("  - Nombre de la Universidad de Origen: ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 350, 455, 360, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNombreUniOrigen(), fontCampo);
            ct.setSimpleColumn(campo, 70, 350, 455, 360, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Name of Home Institution", fontPequena);
            ct.setSimpleColumn(campo, 90, 343, 455, 353, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Nombre Programa
            campo = new Phrase("  - Nombre de Programa:  ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 330, 455, 340, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNombrePrograma() , fontCampo);
            ct.setSimpleColumn(campo, 70, 330, 455, 340, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Program Name  " , fontPequena);
            ct.setSimpleColumn(campo, 90, 323, 455, 333, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Tipo Programa
            campo = new Phrase("  - Tipo del Programa: ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 310, 455, 320, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getPrograma(), fontCampo);
            ct.setSimpleColumn(campo, 70, 310, 455, 320, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Program Type", fontPequena);
            ct.setSimpleColumn(campo, 90, 303, 455, 313, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Duracion
            campo = new Phrase("  - Duración del Programa:  ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 290, 455, 300, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getDuracionPrograma() , fontCampo);
            ct.setSimpleColumn(campo, 70, 290, 455, 300, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Duration of the Program  " , fontPequena);
            ct.setSimpleColumn(campo, 90, 283, 455, 293, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Año de Ingreso
            campo = new Phrase("  - Año de Ingreso:  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 270, 455, 280, 10, Element.ALIGN_LEFT);
            campo = new Phrase(""+p.getAnioIngreso() , fontCampo);
            ct.setSimpleColumn(campo, 70, 270, 455, 280, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Year of Admission" , fontPequena);
            ct.setSimpleColumn(campo, 90, 263, 455, 273, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Años de Estudio
            campo = new Phrase("  - Años de Estudios Aprobados: ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 250, 455, 260, 10, Element.ALIGN_LEFT);
            campo = new Phrase(""+p.getAniosAprobados(), fontCampo);
            ct.setSimpleColumn(campo, 70, 250, 455, 260, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Study Years Approved", fontPequena);
            ct.setSimpleColumn(campo, 90, 243, 455, 253, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //area de estudio
            campo = new Phrase("  - Área de Estudio: ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 230, 455, 240, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getAreaEstud() , fontCampo);
            ct.setSimpleColumn(campo, 70, 230, 455, 240, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Study Area  " , fontPequena);
            ct.setSimpleColumn(campo, 90, 223, 455, 233, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Facultad/Escuela/carrera
            campo = new Phrase("  - Facultad/Escuela/Carrera: ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 210, 455, 220, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getCarrera(), fontCampo);
            ct.setSimpleColumn(campo, 70, 210, 455, 220, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase(" Faculty/School/Career", fontPequena);
            ct.setSimpleColumn(campo, 90, 203, 455, 213, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Coordinador Movilidad
            campo = new Phrase("  - Nombre de Coordinador de Movilidad:  ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 190, 455, 200, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNombreCoordMovilidad(), fontCampo);
            ct.setSimpleColumn(campo, 70, 190, 455, 200, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Name of Mobility Coordenator", fontPequena);
            ct.setSimpleColumn(campo, 90, 183, 310, 193, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //coordinador academico
            campo = new Phrase("  - Nombre de Coordinador Académico:  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 170, 455, 180, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNombreCoordAcademico() , fontCampo);
            ct.setSimpleColumn(campo, 70, 170, 455, 180, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Name of Academic Coordenator " , fontPequena);
            ct.setSimpleColumn(campo, 90, 163, 310, 173, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Cuadro Contenedor area
            canvas.saveState();
            canvas.roundRectangle(70, 143, 455, 260,6);
            canvas.stroke();
            canvas.restoreState();

			
            /* ###########################
             * #  Informacion Academica  #
             * ###########################*/

            document.newPage();

            //Estampado de numero de planilla, fecha y hora de creacion
            campo = new Phrase("Fecha Creación:  "  + creacion, fontCampo);
            ct.setSimpleColumn(campo, 200, 20, 580, 30, 10, Element.ALIGN_RIGHT);
            ct.go();


            // Background Subtitulos
            canvas.saveState();
            canvas.roundRectangle(70, 710, 455, 23,6);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();

            // Titulo del area.
            titulo = new Phrase("  INFORMACIÓN ACADÉMICA  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 720, 450, 740, 20, Element.ALIGN_LEFT);
            ct.go();
            titulo = new Phrase("  ACADEMIC INFORMATION  ", fontPequena);
            ct.setSimpleColumn(titulo, 75, 713, 450, 723, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Plan de Estudio
            campo = new Phrase("  - Asignaturas a cursar en la USB", fontCampo2);
            ct.setSimpleColumn(campo, 70, 690, 350, 700, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Study Plan in the USB", fontPequena);
            ct.setSimpleColumn(campo, 85, 683, 350, 693, 10, Element.ALIGN_LEFT);
            ct.go();

            

            // Tabla de materias.
            canvas.saveState();
            //Rectangulo grande, cubre los títulos
            canvas.rectangle(215, 480, 210, 200);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();

            //Línea de los títulos
            canvas.saveState();			
            canvas.rectangle(215, 660, 210, 0);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            //Llenado titulos cuadro
            canvas.saveState();			
            canvas.rectangle(215, 660, 210, 20);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();

            // lineas verticales
            canvas.saveState();
            canvas.rectangle(265, 480, 0, 200);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
  
            canvas.saveState();
            canvas.rectangle(385, 480, 0, 200);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();

            campo = new Phrase("Código", fontCampo);
            ct.setSimpleColumn(campo, 220, 670, 260, 680, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("  Code", fontPequena);
            ct.setSimpleColumn(campo, 220, 663, 260, 673, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("  Denominación", fontCampo);
            ct.setSimpleColumn(campo, 270, 670, 386, 680, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("      Name", fontPequena);
            ct.setSimpleColumn(campo, 270, 663, 390, 673, 10, Element.ALIGN_LEFT);
            ct.go();

            campo = new Phrase("# Créditos", fontCampo);
            ct.setSimpleColumn(campo, 386, 670, 425, 680, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("# Credits USB", fontPequena);
            ct.setSimpleColumn(campo, 385, 663, 500, 673, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Vaceado Materias
            int vacea=0;
            int topeAr= plane.getListCodigoUSB().size();
            int valorH= 650;       
            while (vacea!=topeAr && valorH!=430){
            System.out.println("Aqui esta vacea "+ vacea);
            //System.out.println("Aqui esta topeAr "+ topeAr);
            //Lleno por fila
            // Codigo USB    
            System.out.println("Aqui esta codUSB "+ plane.getCodigoUSB(vacea));
            System.out.println("Aqui esta codUSB "+ plane.getCodigoUSB(0));
            campo = new Phrase(plane.getCodigoUSB(vacea), fontCampo);
            ct.setSimpleColumn(campo, 220, valorH, 260, (valorH+10), 10, Element.ALIGN_LEFT);
            //ct.setSimpleColumn(campo, 220, 670, 260, 680, 10, Element.ALIGN_LEFT);
            ct.go();
            //Nombre USB
            campo = new Phrase(plane.getMateriaUSB(vacea), fontCampo);
            ct.setSimpleColumn(campo, 270, valorH, 386, (valorH+10), 10, Element.ALIGN_LEFT);
            //ct.setSimpleColumn(campo, 270, 670, 386, 680, 10, Element.ALIGN_LEFT);
            ct.go();
            // Creditos USB
            campo = new Phrase(String.valueOf(plane.getCreditosUSB(vacea)), fontCampo);
            ct.setSimpleColumn(campo, 386, valorH, 425, (valorH+10), 10, Element.ALIGN_CENTER);
            //ct.setSimpleColumn(campo, 386, 670, 425, 680, 10, Element.ALIGN_LEFT);
            ct.go();
            
            valorH=valorH-20;
            vacea=vacea+1;
                           
            }
            
            //Cuadro de Aprobación de la Coordinación
			
            canvas.saveState();
            canvas.rectangle(215, 430, 210, 50);
            canvas.setLineWidth(0.9f);
	    canvas.stroke();
            canvas.restoreState();
            
            // Mensaje Aprobación
            campo = new Phrase("Aprobación Coordinación de la Carrera  " , fontCampo);
            ct.setSimpleColumn(campo, 224, 440, 416, 450, 10, Element.ALIGN_CENTER);
            ct.go();
            campo = new Phrase("Approval of the Coordination of the Career  " , fontPequena);
            ct.setSimpleColumn(campo, 224, 433, 416, 443, 10, Element.ALIGN_CENTER);
            ct.go();

            // línea firma
            canvas.saveState();
            canvas.rectangle(260, 455, 120, 0);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            /* Cuadro Contenedor area*/
            canvas.saveState();
            canvas.roundRectangle(70, 420, 455, 312,6);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            
            
            /* ##############################
             * #  CONOCIMIENTO DE IDIOMAS   #
             * ##############################*/
            
            /*Background subtitulos*/
            canvas.saveState();
            canvas.roundRectangle(70, 385, 455, 23,6);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();		
            
            // Titulo del area.
            titulo = new Phrase("  CONOCIMIENTO DE IDIOMAS  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 395, 450, 405, 10, Element.ALIGN_LEFT);
            ct.go();
            titulo = new Phrase("  KNOWLEDGE OF LANGUAGES  ", fontPequena);
            ct.setSimpleColumn(titulo, 75, 388, 450, 398, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Idioma de destino
            campo = new Phrase("  - Lengua Materna: ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 370, 300, 380, 10, Element.ALIGN_LEFT);
            campo = new Phrase(idim.getLenguaMaterna() , fontCampo);
            ct.setSimpleColumn(campo, 70, 370, 300, 380, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Native Language" , fontPequena);
            ct.setSimpleColumn(campo, 90, 363, 300, 373, 10, Element.ALIGN_LEFT);
            ct.go();
            
            campo = new Phrase("  - ¿Desea tomar algún curso de español?: " , fontCampo2);
            ct.setSimpleColumn(campo, 300, 370, 550, 380, 10, Element.ALIGN_LEFT);
            campo = new Phrase(idim.getTomarCursoDeEspaniol() , fontCampo);
            ct.setSimpleColumn(campo, 300, 370, 550, 380, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Do you wish to take an spanish course? " , fontPequena);
            ct.setSimpleColumn(campo, 320, 363, 550, 373, 10, Element.ALIGN_LEFT);
            ct.go();
            
            
            //Relleno Nombres
            canvas.saveState();
            canvas.rectangle(70, 335, 455, 15);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();
            
            
            // Lineas verticales
            
            canvas.saveState();
            canvas.rectangle(161, 233, 0, 127);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            canvas.saveState();
            canvas.rectangle(252, 233, 0, 117);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            canvas.saveState();
            canvas.rectangle(343, 233, 0, 117);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            canvas.saveState();
            canvas.rectangle(434, 233, 0, 117);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
               
            /* Primera línea horizontal del cuadro*/
            canvas.saveState();
            canvas.rectangle(161, 360, 364, 0);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            /* Segunda línea horizontal del cuadro*/
            canvas.saveState();
            canvas.rectangle(70, 350, 455, 0);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            campo = new Phrase("Nivel de Suficiencia" , fontCampo2);
            ct.setSimpleColumn(campo, 160, 351, 520, 361, 10, Element.ALIGN_CENTER);
            ct.go();
            
            /*Tercera linea horizontal*/
            canvas.saveState();
            canvas.rectangle(70, 335, 455, 0);
            canvas.setLineWidth(0.9f);
            canvas.stroke();
            canvas.restoreState();
            
            
            
            
            //Iterar hasta que llegue a 240
            //Nivel de Suficiencia
            campo = new Phrase("Idioma a emplear ", fontCampo2);
            ct.setSimpleColumn(campo, 70, 340, 160, 350, 10, Element.ALIGN_CENTER);
            ct.go();
            
            campo = new Phrase("Verbal ", fontCampo2);
            ct.setSimpleColumn(campo, 160, 340, 250, 350, 10, Element.ALIGN_CENTER);
            ct.go();
            
            campo = new Phrase("Oral ", fontCampo2);
            ct.setSimpleColumn(campo, 250, 340, 340, 350, 10, Element.ALIGN_CENTER);
            ct.go();
            
            campo = new Phrase("Auditivo ", fontCampo2);
            ct.setSimpleColumn(campo, 340, 340, 430, 350, 10, Element.ALIGN_CENTER);
            ct.go();
            
            campo = new Phrase("Escrito ", fontCampo2);
            ct.setSimpleColumn(campo, 430, 340, 520, 350, 10, Element.ALIGN_CENTER);
            ct.go();
            
            

            //////////////////////////////PRUEBA IDIOMAS
            
            int vacea2=0;
            int topeAr2= idim.getListIdioma().size();
            int valorH2= 320; //Este es el valor para ir bajando
            while (vacea2!=topeAr2 && valorH2!=240){
            System.out.println("Aqui esta vacea "+ vacea2);
            
            //Lleno por fila
            // Nombre Idioma    
            //System.out.println("Aqui esta idioma "+ idim.getIdiomaDest(vacea2));
            campo = new Phrase(idim.getIdiomaDest(vacea2), fontCampo);
            ct.setSimpleColumn(campo, 70, valorH2, 160, (valorH2+10), 10, Element.ALIGN_CENTER);
            ct.go();
            //Nivel verbal
            campo = new Phrase(idim.getNivelVerbal(vacea2), fontCampo);
            ct.setSimpleColumn(campo, 160, valorH2, 250, (valorH2+10), 10, Element.ALIGN_CENTER);
            ct.go();
            // Nivel oral
            campo = new Phrase(idim.getNivelConversacional(vacea2), fontCampo);
            ct.setSimpleColumn(campo, 250, valorH2, 340, (valorH2+10), 10, Element.ALIGN_CENTER);
            ct.go();
            // Nivel Auditivo
            campo = new Phrase(idim.getNivelAuditivo(vacea2), fontCampo);
            ct.setSimpleColumn(campo, 340, valorH2, 430, (valorH2+10), 10, Element.ALIGN_CENTER);
            ct.go();
            // Nivel Escrito
            campo = new Phrase(idim.getNivelEscrito(vacea2), fontCampo);
            ct.setSimpleColumn(campo, 430, valorH2, 520, (valorH2+10), 10, Element.ALIGN_CENTER);
            ct.go();
            
            valorH2=valorH2-20;
            vacea2=vacea2+1;
            }
            
            
            /* cuadro contenedor area*/
            canvas.saveState();
            canvas.roundRectangle(70, 233, 455, 175,6);
            canvas.stroke();
            canvas.restoreState();
            
            
            /* ##############################
             * #        INFO CONTACTO       #
             * ##############################*/
            // Background Area
            canvas.saveState();
            canvas.roundRectangle(70, 197, 455, 23,6);
            canvas.setColorFill(color);
            canvas.fill();
            canvas.stroke();
            canvas.restoreState();
            
            //Titulo del area.
            titulo = new Phrase("  DATOS DE CONTACTO EN CASO DE EMERGENCIA  ", fontTitulos);
            ct.setSimpleColumn(titulo, 70, 207, 450, 217, 10, Element.ALIGN_LEFT);
            ct.go();
            titulo = new Phrase("  INFORMATION OF CONTACT IN CASE OF EMERGENCY  ", fontPequena);
            ct.setSimpleColumn(titulo, 75, 200, 450, 210, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Nombre Contacto
            campo = new Phrase("  - Nombre Contacto:  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 180, 300, 190, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getNombresRep() + " "+ p.getApellidosRep(), fontCampo);
            ct.setSimpleColumn(campo, 70, 180, 300, 190, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Contact Name" , fontPequena);
            ct.setSimpleColumn(campo, 90, 173, 300, 183, 10, Element.ALIGN_LEFT);
            ct.go();

            //Tlf. Habitación Contacto
            campo = new Phrase("  - Tlf. Habitación Contacto:  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 160, 300, 170, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getTlfRepCasa() , fontCampo);
            ct.setSimpleColumn(campo, 70, 160, 300, 170, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Contact Phone Number:  " , fontPequena);
            ct.setSimpleColumn(campo, 90, 153, 300, 163, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Tlf. Celular Contacto
            campo = new Phrase("  - Tlf. Celular Contacto:  " , fontCampo2);
            ct.setSimpleColumn(campo, 320, 160, 600, 170, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getCelRep(), fontCampo);
            ct.setSimpleColumn(campo, 320, 160, 600, 170, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Contact Cellphone  " , fontPequena);
            ct.setSimpleColumn(campo, 340, 153, 600, 163, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Relación con el Estudiante
            campo = new Phrase("  - Relación con el Estudiante:  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 140, 300, 150, 10, Element.ALIGN_LEFT);
            campo = new Phrase(p.getRelacion(), fontCampo);
            ct.setSimpleColumn(campo, 70, 140, 300, 150, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Relationship with the student " , fontPequena);
            ct.setSimpleColumn(campo, 90, 133, 300, 143, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Email Contacto
            campo = new Phrase("  - Email Contacto:  " , fontCampo2);
            ct.setSimpleColumn(campo, 320, 140, 600, 150, 10, Element.ALIGN_LEFT);
            campo = new Phrase( p.getEmailRep(), fontCampo);
            ct.setSimpleColumn(campo, 320, 140, 600, 150, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Contact Email" , fontPequena);
            ct.setSimpleColumn(campo, 340, 133, 600, 143, 10, Element.ALIGN_LEFT);
            ct.go();
            
            //Domicilio Contacto
            campo = new Phrase("  - Domicilio Contacto:  " , fontCampo2);
            ct.setSimpleColumn(campo, 70, 120, 600, 130, 10, Element.ALIGN_LEFT);
            campo = new Phrase( p.getDireccionRep(), fontCampo);
            ct.setSimpleColumn(campo, 70, 120, 600, 130, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Contact Address:  " , fontPequena);
            ct.setSimpleColumn(campo, 90, 113, 600, 123, 10, Element.ALIGN_LEFT);
            ct.go();
            
            // Contenedor area
            canvas.saveState();
            canvas.roundRectangle(70, 103, 455, 116,6);
            canvas.stroke();
            canvas.restoreState();
            
            
            //NUEVA PAGINA 3
            document.newPage();

            //Estampado de numero de planilla, fecha y hora de creacion
            campo = new Phrase("Fecha Creacion:  "  + creacion, fontCampo);
            ct.setSimpleColumn(campo, 200, 20, 580, 30, 10, Element.ALIGN_RIGHT);
            ct.go();
			
			
            // CUADRITO 
            canvas.saveState();
            canvas.roundRectangle(60, 590, 470, 120,6);
            canvas.stroke();
            canvas.restoreState();
            
            //Linea
            canvas.saveState();
            canvas.rectangle(170, 670, 100, 0);
            canvas.stroke();
            canvas.restoreState();

            
            /* ################################
             * #  Firma y Fecha de Solicitud  # 
             * ################################*/
            // Firma Solicitante
            campo = new Phrase("Firma del Solicitante:  ", fontCampo);
            ct.setSimpleColumn(campo, 90, 670, 300, 690, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Signature of the applicant  ", fontPequena);
            ct.setSimpleColumn(campo, 90, 663, 300, 683, 10, Element.ALIGN_LEFT);
            ct.go();


            dateFormat = new SimpleDateFormat("MM/dd/yyyy");
            cal = Calendar.getInstance();
            creacion = dateFormat.format(cal.getTime());

            //FECHA SOLICITUD
            campo = new Phrase("Fecha de Solicitud:  " + creacion, fontCampo);
            ct.setSimpleColumn(campo, 320, 670, 500, 690, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("Date of application  ", fontPequena);
            ct.setSimpleColumn(campo, 320, 663, 500, 683, 10, Element.ALIGN_LEFT);
            ct.go();

            //Declaracion de veracidad
            campo = new Phrase("El estudiante firmante declara que los datos y documentos suministrados son verídicos"
                    + " y asume cumplir cabalmente con las normas del programa de intercambio estudiantil.", fontTitulos2);
            ct.setSimpleColumn(campo, 120, 620, 500, 640, 10, Element.ALIGN_CENTER);
			//ct.setSimpleColumn(campo, 70, 190, 1000, 230, 10, Element.ALIGN_LEFT);
            ct.go();
            campo = new Phrase("The signing student declares that the information provided and the documents submitted are real"
                    + " and compromised himself to follow the rules of the student exchange program.", fontPequena);
            ct.setSimpleColumn(campo, 120, 600, 500, 620, 10, Element.ALIGN_CENTER);
			//ct.setSimpleColumn(campo, 70, 190, 1000, 230, 10, Element.ALIGN_LEFT);
            ct.go();
            
            /* ##########################
             * #  Campos Coordinacion   #
             * ##########################*/

            //Cuadro del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.roundRectangle(60, 410, 470, 130,6);
            canvas.stroke();
            canvas.restoreState();

            //Titulo del area.
            titulo = new Phrase("**Esta sección debe ser llenada exclusivamente por la Coordinación Docente**", fontTitulos);
            ct.setSimpleColumn(titulo, 60, 550, 530, 560, 10, Element.ALIGN_CENTER);
            ct.go();
            titulo = new Phrase("**This seccion is for use of the home institution**", fontPequena);
            ct.setSimpleColumn(titulo, 60, 543, 530, 553, 10, Element.ALIGN_CENTER);

            ct.go();
			
             //Idioma de destino y 
            campo = new Phrase("Opinión de la Coordinación Docente sobre esta solicitud (explicación breve):  ", fontCampo);
            ct.setSimpleColumn(campo, 90, 520, 500, 530, 10, Element.ALIGN_CENTER);
            ct.go();
            campo = new Phrase("Opinion of the home institution about this application (brief explanation)", fontPequena);
            ct.setSimpleColumn(campo, 90, 513, 500, 523, 10, Element.ALIGN_CENTER);
            ct.go();

            
            
            /* ##########################
             * #      Campos DRIC       #
             * ##########################*/

            //Cuadro del area  ( margen izq, borde inferior, margen der, borde superior)
            canvas.saveState();
            canvas.roundRectangle(60, 230, 470, 130,7);
            canvas.stroke();
            canvas.restoreState();

            //Titulo del area.
            titulo = new Phrase("**Esta sección debe ser llenada exclusivamente por la DRIC**", fontTitulos);
            ct.setSimpleColumn(titulo, 60, 370, 530, 380, 10, Element.ALIGN_CENTER);
            ct.go();
            titulo = new Phrase("**This seccion is for use of the DRIC**", fontPequena);
            ct.setSimpleColumn(titulo, 60, 363, 530, 373, 10, Element.ALIGN_CENTER);
            ct.go();
			
             //opinion
            campo = new Phrase("Opinión de la DRIC sobre esta solicitud (explicación breve):  ", fontCampo2);
            ct.setSimpleColumn(campo, 90, 340, 500, 350, 10, Element.ALIGN_CENTER);
            ct.go();
            campo = new Phrase("Opinion of the DRIC about this application (brief explanation)", fontPequena);
            ct.setSimpleColumn(campo, 90, 333, 500, 343, 10, Element.ALIGN_CENTER);
            ct.go();

        // step 5
        document.close();

        } catch (Exception ex) {
            System.out.println("LLego al error");
            ex.printStackTrace();
            Logger.getLogger(GeneradorPlanillas.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

        return true;
    }    

}
