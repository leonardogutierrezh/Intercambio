<%-- 
    Document   : eliminacionExitosa
    Created on : Nov 16, 2012, 1:04:48 PM
    Author     : dreabalbas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>

    <title>Exito</title>


    <div style="text-align: center;">
        <h1>El usuario fue eliminado</h1>
        
        <html:image src="images/correct.png" /> 
        <br />
        
        <html:link action="ListarUsuarios">
            Continuar
        </html:link>
    </div>


</html>
