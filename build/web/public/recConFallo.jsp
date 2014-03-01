<%-- 
    Document   : recConFallo
    Created on : Nov 15, 2012, 8:52:08 PM
    Author     : Kosmos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>

    <title>Fallo</title>


    <div style="text-align: center;">
        <h1>Operación Fallida</h1>
        <h3>Inténtelo de Nuevo</h3>
        
        <html:image src="images/error.png" /> 
        <br />
        
        <html:link action="reccontra">
            Continuar
        </html:link>
    </div>


</html>
