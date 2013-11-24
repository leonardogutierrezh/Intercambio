<%-- 
    Document   : accActualizacion
    Created on : 13-may-2013, 18:40:16
    Author     : gustavo
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
        <h1>Perfil actualizado correctamente</h1>
        
        <html:image src="images/correct.png" /> 
        <br />
        
        <html:link action="accionesEstExt">
            Continuar
        </html:link>
    </div>


</html>

