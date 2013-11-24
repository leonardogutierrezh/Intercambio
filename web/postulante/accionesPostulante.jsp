<%-- 
    Document   : accionesPostulante
    Created on : Nov 13, 2012, 3:48:59 PM
    Author     : dreabalbas
--%>
<%Object var = session.getAttribute("nombre");
    Object var2 = session.getAttribute("nombreusuario");%>
<%@page import="javax.swing.text.html.HTML"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<html:html lang="true">
    <title>Sistema de Gesti&oacute;n de Intercambio</title>
    <br>
    <div id="Bienve">
        <h1>Bienvenido: <a><%=var.toString()%></a></h1>
    </div>
    <div id="NombreUser">
        <a hidden="true"> <%=var2.toString()%> </a>
    </div>
    <p hidden="true"><bean:write name="Usuario" property="nombre"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="email"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="nombreusuario"></bean:write></p>

    <br>
    
        <h4 align ="center">Postulante</h4>
        <h5 align ="center">¿Qu&eacute; desea hacer?</h5>

    <html:link action="/AgregarEstudiantes">
        <p align ="center">Agregar estudiante</p>
    </html:link>
    <html:link action="/ListarEstudiantes">
        <p align ="center">Consultar estudiantes</p>
    </html:link>
</html:html>