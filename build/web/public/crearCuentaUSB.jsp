<%-- 
    Document   : crearCuentaUSB
    Created on : 29/11/2013, 04:13:34 AM
    Author     : andel
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Crear Cuenta Estudiante USB!</h1>
        <html:form action="/FormEstudianteUSBAgregar" method="POST" enctype="multipart/form-data" acceptCharset="ISO-8859-1" onsubmit="return(this)">
            <table border="0" >
                <tbody>
                    <tr>

                        <td style="color: black">Nombre de usuario</td>
                        <td>
                            <html:text name="EstUSB" property="nombreusuario" value="" maxlength="20" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="nombreusuario" />
                        </td>
                    </tr>
                    <tr>

                        <td style="color: black">Contrasena</td>
                        <td>
                            <html:password name="EstUSB" property="contrasena" value="" maxlength="20" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:password>
                        </td>
                    </tr>
                    <tr>

                    <tr>
                        <td style="color: black">Email</td>
                        <td>
                            <html:text name="EstUSB" property="email" maxlength="30" errorStyleClass="error" value=""
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
                            <html:text name="EstUSB" property="pNombre" maxlength="30" value="" errorStyleClass="error"
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
                        <td><html:text name="EstUSB" property="pApellido" maxlength="100" value="" errorStyleClass="error"
                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="pApellido" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Carnet</td>       
                        <td><html:text name="EstUSB" property="carnet" maxlength="100" value="" errorStyleClass="error"
                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="carnet" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Carrera</td>

                        <td><html:select  property="carrera">
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

                    <tr>
                        <td style="color: black">Código de la carrera</td>       
                        <td><html:text name="EstUSB" property="codCarrera" maxlength="100" errorStyleClass="error"
                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="codCarrera" />
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
