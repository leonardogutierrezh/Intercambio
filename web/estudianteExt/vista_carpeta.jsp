<%-- 
    Document   : vista_carpeta
    Created on : 04-mar-2013, 21:12:27
    Author     : gustavo
--%>
<%Object var = session.getAttribute("carpeta");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <title>Exito</title>
    
    <div style="text-align: center;">
        <h1>Carpeta creada exitosamente</h1>
        
        <html:image src="images/correct.png" /> 
        <br />
        
        <html:link action="accionesEstExt">
            Continuar
        </html:link>
    </div>

</html>
