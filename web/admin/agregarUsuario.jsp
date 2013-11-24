<%-- 
    Document   : acciones
    Created on : Oct 17, 2012, 8:03:13 PM
    Author     : dycicle Systems
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>
    <title>SGI - Agregar usuario</title>

    <body onload ="clearForms()" onunload="clearForms()">

        <h4>Creaci&oacute;n de nuevo usuario</h4>
        <h5>Por favor seleccione el tipo de usuario que desea crear</h5>

        <html:form action="/AccionAgregarUsuario" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
            <table border="0" >
                <tbody>
                    <tr>
                        <td style="color: black">Tipo de usuario</td>
                        <td><html:select  property="privilegio">
                                <html:option value="2">Decanato</html:option>
                                <html:option value="2">DRIC</html:option>
                                <html:option value="3">Coordinación</html:option>
                                <html:option value="4">Universidad extranjera</html:option>
                                <html:option value="5">Estudiante USB</html:option>
                                <html:option value="6">Estudiante extranjero</html:option>
                            </html:select>
                        </td>
                    </tr>
                </tbody>
            </table>

            <p style="text-align: center">
                <html:submit>
                    Agregar usuario
                </html:submit>
            </p>
        </html:form>

    </body>
</html>