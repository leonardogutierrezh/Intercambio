<%-- 
    Document   : recuperacionEnviada
    Created on : Oct 26, 2012, 1:11:35 PM
    Author     : caponte
--%>


<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html:html lang="true">

    <title>Sistema de Gesti&oacute;n de Intercambio</title>



    <div style="text-align: center;">
        <h4>Se ha enviado un email de recuperación a su correo.</h4>
        
        <html:image src="images/correct.png" /> 
        <br />
        
        <html:link action="Welcome">
            Continuar
        </html:link>
    </div>

</html:html>
