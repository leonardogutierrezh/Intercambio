<%-- 
    Document   : exitoContactoEstUSB
    Created on : 28-nov-2012, 0:52:44
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
        <h1>Operación Exitosa</h1>
        
        <html:image src="images/correct.png" /> 
        <br />
        
        <html:link action="accionesEstExt">
            Continuar
        </html:link>
    </div>

</html>
