<%-- 
    Document   : crearCuentaEstud
    Created on : 28/11/2013, 10:56:50 PM
    Author     : andel
--%>

<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Cuenta</title>
    </head>
    <body>
        <h1>Crear Cuenta</h1>
        
        <div id="login-form">
            <html:form action="/elegirTipoEstudiante"  method="POST" enctype="multipart/form-data" onsubmit="return(this)">             
                <table border="0" >
                <tbody>
                    <tr>
                        <td style="color: black">Tipo de usuario</td>
                        <td><html:select  property="privilegio">
                                <html:option value="5">Estudiante USB</html:option>
                                <html:option value="6">Estudiante extranjero</html:option>
                            </html:select>
                        </td>
                    </tr>
                </tbody>
            </table>
            <p style="text-align: center">
                <html:submit>
                    Continuar
                </html:submit>
            </p>
            </html:form>
        </div>
   </body>
</html>
