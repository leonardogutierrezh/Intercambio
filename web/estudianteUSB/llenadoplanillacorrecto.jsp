<%-- 
    Document   : llenadoplanillacorrecto
    Created on : 02-dic-2012, 11:44:33
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exito</title>
    </head>
    <body>
        <div style="text-align: center;">
        <h1>Datos de la planilla correctos y guardados</h1>
        
        <html:image src="images/correct.png" /> 
        <br />
        
        <html:link action="/CargarLlenarPlanillaUSB">
            Continuar
        </html:link>
        </div>
    </body>
</html>
