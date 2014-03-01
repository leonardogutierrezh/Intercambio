<%-- 
    Document   : eliminarUsuario
    Created on : Oct 18, 2012, 12:46:30 AM
    Author     : caponte
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>
    <title>SGI - Eliminar Usuario</title>
    <script>
        function clearForms(){
            var i;
            for (i = 0; (i < document.forms.length); i++) {
                document.forms[i].reset();
            }  
        }
    </script>

    <body onload ="clearForms()" onUnload="clearForms()">

        <h4>Eliminaci&oacute;n de Usuario</h4>
        <h5>Por favor introduzca el nombre del usuario a eliminar.</h5>
        <html:form action="/EliminarUsuario" onsubmit="return(this)">
            <table border="1">
                <tbody>
                    <tr>
                        <td>Usuario</td>
                        <td><html:text name="Usuario" property="nombreusuario" value=""></html:text></td>
                    </tr>
                    <tr>
                        <html:image src="trashcan-delete.png" styleClass="button" value="" property="" /> 
                    </tr>
                </tbody>
            </table>
            <html:submit 
                onclick="javascript: return confirm('¿Está seguro que desea eliminar este usuario?')">
                Eliminar Usuario
            </html:submit>           
        </html:form>

    </body>
</html>
