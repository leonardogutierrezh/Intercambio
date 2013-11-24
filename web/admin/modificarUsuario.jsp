<%-- 
    Document   : modificarUsuario
    Created on : Oct 18, 2012, 12:54:07 AM
    Author     : caponte
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>

    <title>SGI - Modificar usuario</title>

    <h4>Modificaci&oacute;n de datos de usuarios</h4>
    <h5>Por favor modifique los campos que desee.</h5>

    <html:form action="/ModificarUsuario" onsubmit="return(this)">
        <table border="0">
            <tbody>
                <tr>
                    <td>Usuario </td>
                    <td><html:text disabled="true" name="Usuario" property="nombreusuario"  errorStyleClass="error"
                               errorKey="org.apache.struts.action.ERROR"></html:text></td>
                </tr>
                <tr>
                    <td colspan="2" style="color:firebrick">
                        <html:errors property="nombreusuario" />
                    </td>
                </tr>
                <tr>
                    <td>E-mail</td>

                    <td><html:text name="Usuario" property="email"  errorStyleClass="error"
                               errorKey="org.apache.struts.action.ERROR"></html:text></td>
                </tr>
                <tr>
                    <td colspan="2" style="color:firebrick">
                        <html:errors property="email" />
                    </td>

                </tr>
                <tr>
                    <td>Nombre Completo</td>
                    <td><html:text name="Usuario" property="nombre" maxlength="100"  errorStyleClass="error"
                               errorKey="org.apache.struts.action.ERROR"></html:text></td>
                </tr>
                <tr>
                    <td colspan="2" style="color:firebrick">
                        <html:errors property="nombre" />
                    </td>
                </tr>
                <tr>
                    <td>Privilegios</td>
                    <td><html:select name="usuario" property="confirmar">
                            <html:option value="2">Decanato</html:option>
                            <html:option value="1">DRIC</html:option>
                            <html:option value="3">Coordinacion</html:option>
                            <html:option value="3">Universidad Extranjera</html:option>
                            <html:option value="5">Estudiante USB</html:option>
                            <html:option value="6">Estudiante Extranjero</html:option>
                        </html:select>
                    </td>
                </tr>
            </tbody>
        </table>
        <p style="text-align: center"><html:submit>Modificar Usuario</html:submit></p>
    </html:form>

</html>
