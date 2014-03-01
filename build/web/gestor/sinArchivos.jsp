<%-- 
    Document   : sinArchivos
    Created on : Feb 15, 2013, 1:32:26 PM
    Author     : dreabalbas
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
        <h1>El estudiante no posee archivos adjuntos</h1>
        
        <html:image src="images/error.png" /> 
        <br />
        
        <html:link action="/ListarEstudiantesPostulados">
            Volver
        </html:link>
    </div>
</html>
