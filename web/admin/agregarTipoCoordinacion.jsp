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
        <title>Agregar nueva coordinación</title>
    </head>

    <body onload ="clearForms()" onunload="clearForms()">

        <h4>Creaci&oacute;n de nueva coordinación</h4>
        <h5>Por favor introduzca los datos del nuevo usuario</h5>
        <html:form action="/AccionAgregarCoordinacion" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
            <table border="0" >
                <tbody>

                    <tr>
                        <td style="color: black">Nombre de usuario</td>
                        <td>
                            <html:text name="Postulante" property="nombreusuario" maxlength="100" value="" errorStyleClass="error"
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
                            <html:text name="Postulante" property="email" maxlength="30" value="" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="email" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Código de la carrera</td>
                        <td>
                            <html:text name="Postulante" property="codigo" maxlength="30" value="" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="codigo" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Carrera</td>

                        <td><html:select  property="nombreCarrera">
                                <html:option value="Licenciatura en Quimica"></html:option>
                                <html:option value="Licenciatura en Matematicas"></html:option>
                                <html:option value="Licenciatura en Fisica"></html:option>
                                <html:option value="Licenciatura en Biologia"></html:option>
                                <html:option value="Arquitectura"></html:option>
                                <html:option value="Urbanismo"></html:option>
                                <html:option value="Ingenieria Electrica"></html:option>
                                <html:option value="Ingenieria Mecanica"></html:option>
                                <html:option value="Ingenieria Quimica"></html:option>
                                <html:option value="Ingenieria Electrica"></html:option>
                                <html:option value="Ingenieria Mecanica"></html:option>
                                <html:option value="Ingenieria Electronica"></html:option>
                                <html:option value="Ingenieria de Computacion"></html:option>
                                <html:option value="Ingenieria Geofisica"></html:option>
                                <html:option value="Ingenieria de Materiales"></html:option>
                                <html:option value="Ingenieria de Produccion"></html:option>
                                <html:option value="Ingenieria de Telecomunicaciones"></html:option>
                                <html:option value="Ingenieria de Mantenimeinto"></html:option>
                                <html:option value="Licenciatura en Gestion de la Hospitalidad"></html:option>
                                <html:option value="Licenciatura en Comercio Internacion"></html:option>
                                <html:option value="Tecnología  Electrica"></html:option>
                                <html:option value="Tecnología  Electronica"></html:option>
                                <html:option value="Organizacion Empresarial"></html:option>
                                <html:option value="Tecnologia Mecanica"></html:option>
                                <html:option value="Mantenimiento Aeronautico"></html:option>
                                <html:option value="Administración del Turismo"></html:option>
                                <html:option value="Administración Hotelera"></html:option>
                                <html:option value="Administración del Transporte"></html:option>
                                <html:option value="Administración Aduanera"></html:option>
                            </html:select>
                        </td>
                    </tr>

                </tbody>
            </table>

            <p style="text-align: center">
                <html:submit onclick="javascript: return confirm('¿Está seguro de que los datos son correctos?')">
                    Agregar coordinación
                </html:submit>
            </p>
        </html:form>

    </body>
</html>
