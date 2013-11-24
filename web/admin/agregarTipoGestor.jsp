<%-- 
    Document   : agregarTipoGestor
    Created on : Feb 13, 2013, 9:59:08 PM
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
        <title>Agregar nuevo gestor</title>
    </head>

    <body onload ="clearForms()" onunload="clearForms()">

        <h4>Creaci&oacute;n de nuevo gestor</h4>
        <h5>Por favor introduzca los datos del nuevo usuario.</h5>

        <html:form action="/AccionAgregarGestor" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
            <table border="0" >
                <tbody>
                    <tr>

                        <td style="color: black">Nombre de usuario</td>
                        <td>
                            <html:text name="Usuario" property="nombreusuario" value="" maxlength="20" errorStyleClass="error"
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
                            <html:text name="Usuario" property="email" value="" maxlength="30" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="email" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Nombre</td>
                        <td>
                            <html:text name="Usuario" property="nombre" value="" maxlength="30" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="nombre" />
                        </td>
                    </tr>

                </tbody>
            </table>

            <p style="text-align: center">
                <html:submit onclick="javascript: return confirm('¿Está seguro de que los datos son correctos?')">
                    Agregar gestor
                </html:submit>
            </p>
        </html:form>

    </body>
</html>
