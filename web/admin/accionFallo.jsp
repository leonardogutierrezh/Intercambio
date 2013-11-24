<%-- 
    Document   : bien.jsp
    Created on : Oct 2, 2012, 9:05:36 AM
    Author     : caponte
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>

    <title>Fallo</title>


    <div style="text-align: center;">
        <h1>Operación Fallida</h1>
        <h3>Inténtelo de Nuevo</h3>
        
        <html:image src="images/error.png" /> 
        <br />
        
        <html:link action="agregUsuario">
            Continuar
        </html:link>
    </div>

</html>
