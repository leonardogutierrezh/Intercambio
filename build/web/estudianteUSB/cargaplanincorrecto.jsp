<%-- 
    Document   : cargaplanincorrecto
    Created on : 22-may-2013, 21:54:19
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Object tmp = session.getAttribute("nombreusuario");%>
<%Object var = session.getAttribute("nombre");%>
<%@page import="javax.swing.text.html.HTML"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<title>Sistema de Gesti&oacute;n de Intercambio</title>
<html:html lang="true">

    <p hidden="true"><bean:write name="Usuario" property="nombre"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="email"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="nombreusuario"></bean:write></p>



    <h4 align ="center">Estudiante USB</h4>
    <div align="center">
        <html:image src="images/error.png" /> 
    </div>
    <br />

    <font color="red">
    <h3 align ="center">
        Carga del Plan de Estudio incorrecta
        </br>
        Por favor, haga click en "Completar Planilla"
    </h3>
    </font>

    <html:form  action="/CargarLlenarPlanillaUSB" method="POST" enctype="multipart/form-data" onsubmit="return(this)">
        <p hidden="true"><html:text name="PlanillaUSB" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=tmp.toString()%>"
                   errorKey="org.apache.struts.action.ERROR"></html:text></p>
            <p style="text-align: center">
            <html:submit >
                Completar Planilla
            </html:submit>
        </p>
    </html:form>

</html:html>