<%-- 
    Document   : planillacredaexitosamente
    Created on : 02-dic-2012, 22:15:39
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <title>Exito</title>
    
    <div style="text-align: center;">
        <h1>Planilla creada exitosamente</h1>
        
        <html:image src="images/correct.png" /> 
        <br />
        
        <html:link action="accionesEstUSB">
            Continuar
        </html:link>
    </div>

</html>
