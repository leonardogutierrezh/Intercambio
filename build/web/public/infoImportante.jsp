<%-- 
    Document   : infoImportante
    Created on : Oct 25, 2012, 7:16:30 PM
    Author     : Katy
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<script type="text/javascript" src="/Intercambio/css/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/Intercambio/plantilla/sidebarsL/ddmenu.js"></script>
<script type="text/javascript">


ddmenu.init({
	headerclass: "submenuheader", 
	contentclass: "submenu", 
	collapseprev: true,
	defaultexpanded: [], 
	animatedefault: false, 
	persiststate: true, 
	toggleclass: ["", ""], 
	togglehtml: ["suffix", "<img src='/Intercambio/images/plus.png' class='statusicon' />", "<img src='/Intercambio/images/minus.png' class='statusicon' />"],
	animatespeed: "normal" 
})


</script>


<html:html lang="true">

    <title>Sistema de Gesti&oacute;n de Intercambio</title>

    <div style="position:relative;left:50px;margin-right: 150px;">
        <h2>
            Fecha Límite para Postulaciones:
        </h2>
        <pre>
            Inicio en Septiembre: 15 de mayo. 
            Año Académico: Septiembre-Julio.
            Trimestres: Septiembre-Diciembre y Enero-Marzo.
            Sólo Trimestre: Septiembre-Diciembre.


            Inicio en Enero: 15 de octubre.
            Trimestres: Enero-Marzo y Abril-Julio.
            Sólo Trimestre: Enero-Marzo.


            Inicio en Abril: 30 enero.
            Sólo Trimestre:Abril-Julio


            Una vez registrados en el sistema, los estudiantes
            deberán proporcionar a través de la carga de
            documentos los siguientes recaudos pautados por su
            nacionalidad.
        </pre>

        <h2>
            Recaudos que deben Presentar los Estudiantes Internacionales para su Postulación:
        </h2>
        <p>
        - Formulario de postulación al Programa de Intercambio de Estudiantes de la USB para estudiantes internacionales firmado y sellado por la Oficina de Relaciones Internacionales de la universidad de origen.
        <br>
        - Fotocopia del Pasaporte.
        <br>
        - Informe académico actualizado (Transcript Record) firmado y sellado por la Oficina de Relaciones Internacionales de la universidad de origen.
        <br>
        - Curriculum Vitae.
        <br>
        - Carta de recomendación de un profesor de la universidad de origen.
        </p>

        <h2>
        Recaudos que deben Presentar los Estudiantes Nacionales para su Postulación:
        </h2>
        <p>
        - Formulario de postulación al Programa de Intercambio de Estudiantes de la USB para estudiantes nacionales firmado y sellado por la DRIC.
        <br>
        - Fotocopia de la Cédula de Identidad
        <br>
        - Informe académico actualizado (Transcript Record).
        <br>
        - Curriculum Vitae.
        <br>
        - Carta de motivación para los estudios en el exterior.
        <br>
        - Fotocopia del Carnet    
        </p>


        <h3>
        Requisitos Adicionales:
        </h3>
        <p>
        Programa SMILE:
        <br>
        - Student Application-Form
        <br>
        - Student Learning Agreement
        <br>
        <br>
        Programa de Movilidad Estudiantil CINDA:
        <br>
        - Ficha de Solicitud de Participación
        <br>
        - Ficha de Reconocimiento
        </p>
    </div>

</html:html>
