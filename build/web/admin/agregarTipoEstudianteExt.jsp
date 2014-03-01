<%-- 
    Document   : agregarTipoEstudianteExtranjero
    Created on : 13-feb-2013, 21:59:29
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%Object var = session.getAttribute("nombre");%>
<%@page contentType="text/html"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>
    <title>SGI - Agregar estudiante extranjero</title>

    <body onload ="clearForms()" onunload="clearForms()">

        <h4>Creaci&oacute;n de nuevo estudiante</h4>
        <h5>Por favor introduzca los datos del nuevo usuario.</h5>

        <html:form action="/AccionAgregarEstudianteInter" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
            <table border="0" >
                <tbody>
                    <tr>

                        <td style="color: black">Nombre de usuario</td>
                        <td>
                            <html:text name="EstInter" property="nombreusuario" value="" maxlength="20" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="nombreusuario" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Email</td>
                        <td>
                            <html:text name="EstInter" property="email" maxlength="30" value="" errorStyleClass="error" 
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="email" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Primer nombre</td>
                        <td>
                            <html:text name="EstInter" property="pNombre" value="" maxlength="30" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="pNombre" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Primer apellido</td>       
                        <td><html:text name="EstInter" property="pApellido" value="" maxlength="100" errorStyleClass="error"
                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="pApellido" />
                        </td>
                    </tr>
                    <tr>
                        <td style="color: black">Pasaporte</td>
                        <td>
                            <html:text name="EstInter" property="pasaporte" value="" maxlength="30" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    
                </tbody>
            </table>

            <p style="text-align: center">
                <html:submit onclick="javascript: return confirm('¿Está seguro de que los datos son correctos?')">
                    Agregar estudiante
                </html:submit>
            </p>
        </html:form>

    </body>
</html>
