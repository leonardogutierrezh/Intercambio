<%-- 
    Document   : modUsuarioFallo
    Created on : Nov 16, 2012, 1:21:22 PM
    Author     : dreabalbas
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
        <h1>El usuario no fue modificado</h1>
        <html:link action="ListarUsuarios">
            Continuar
        </html:link>
    </div>


</html>