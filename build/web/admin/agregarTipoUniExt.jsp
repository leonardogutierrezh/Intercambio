<%-- 
    Document   : agregarTipoCoordinacion
    Created on : Feb 13, 2013, 10:42:44 PM
    Author     : dreabalbas
--%>

<%Object var = session.getAttribute("nombre");%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar nueva universidad extranjera</title>
    </head>

    <body onload ="clearForms()" onunload="clearForms()">

        <h4>Creaci&oacute;n de nueva universidad extranjera</h4>
        <h5>Por favor introduzca los datos del nuevo usuario</h5>
        <html:form action="/AccionAgregarUniExt" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
            <table border="0" >
                <tbody>

                    <tr>
                        <td style="color: black">Nombre de usuario</td>
                        <td>
                            <html:text name="Postulante" property="nombreusuario" value="" maxlength="30" errorStyleClass="error"
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
                            <html:text name="Postulante" property="email" value="" maxlength="30" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="email" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Nombre de la universidad</td>
                        <td>
                            <html:text name="Postulante" property="nombreUniExt" value="" maxlength="30" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="nombreUniExt" />
                        </td>
                    </tr>

                </tbody>
            </table>

            <p style="text-align: center">
                <html:submit onclick="javascript: return confirm('¿Está seguro de que los datos son correctos?')">
                    Agregar universidad extranjera
                </html:submit>
            </p>
        </html:form>

    </body>
</html>
