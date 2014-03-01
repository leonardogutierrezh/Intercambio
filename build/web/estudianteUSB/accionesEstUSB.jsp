<%-- 
    Document   : accionesEstUSB
    Created on : Nov 13, 2012, 3:48:59 PM
    Author     : dreabalbas
--%>
<%Object tmp = session.getAttribute("nombreusuario");%>
<%Object var = session.getAttribute("nombre");%>
<%Object confirm = session.getAttribute("confirmar");%>
<%@page import="javax.swing.text.html.HTML"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<title>Sistema de Gesti&oacute;n de Intercambio</title>
<html:html lang="true">

   <div id="Bienve">
        <h1>Bienvenido, <a ><%=var.toString()%></a> </h1>
        <h1>El estado actual de su postulaci&oacute;n es: <%=confirm.toString()%></h1>
   </div>
    
    <p hidden="true"><bean:write name="Usuario" property="nombre"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="email"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="nombreusuario"></bean:write></p>

    <br>
    <br>
    <h4 align ="center">Estudiante USB</h4>
    <h5 align ="center">¿Qu&eacute; desea hacer?</h5>


    
    <html:link action="/CargarLlenarPlanillaUSB">
        <p align ="center">Gestionar Formulario de Solicitud</p>
    </html:link>
    <html:link action="/VerificarPlanillaUSB">
        <p align ="center">Descargar Planilla USB</p>
    </html:link>
    <html:link action="/GenerarCarpeta">
        <p align ="center">Descargar Carpeta</p>
    </html:link>
    <html:link action="/EstadoPostulacionUSB">
        <p align ="center">Ver estado de solicitud</p>
    </html:link>


</html:html>