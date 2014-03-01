<%-- 
    Document   : llenadoplanillaincorrecto
    Created on : 02-dic-2012, 11:45:01
    Author     : dreabalbas
--%>
<%Object tmp = session.getAttribute("nombreusuario");%>
<%Object var = session.getAttribute("nombre");%>
<%@page import="javax.swing.text.html.HTML"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>



<title>Sistema de Gesti&oacute;n de Intercambio</title>
<html:html lang="true">

    <div id="Bienve">
        <h1>Bienvenido:</h1>
    </div>
    <div id="NombreUser">
        <h1><%=var.toString()%></h1>
    </div>

    <p hidden="true"><bean:write name="Usuario" property="nombre"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="email"></bean:write></p>
    <p hidden="true"><bean:write name="Usuario" property="nombreusuario"></bean:write></p>



    <h4 align ="center">Estudiante Extranjero</h4>
    <div align="center">
        <html:image src="images/error.png" /> 
    </div>
    <br />

    <font color="red">
    <h3 align ="center">
        Su planilla de solicitud todavia no tiene toda la informacion necesaria,
        </br>
        por favor presione el boton de completar planilla para llenar los datos faltantes.
    </h3>
    </font>

    <html:form  action="/CargarLlenarPlanillaExt" method="POST" enctype="multipart/form-data" onsubmit="return(this)">
        <p hidden="true"><html:text name="PlanillaExt" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=tmp.toString()%>"
                   errorKey="org.apache.struts.action.ERROR"></html:text></p>
            <p style="text-align: center">
            <html:submit >
                Completar Planilla
            </html:submit>
        </p>
    </html:form>

</html:html>
