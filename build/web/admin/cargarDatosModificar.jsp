<%-- 
    Document   : cargarDatosModificar
    Created on : Oct 25, 2012, 7:20:44 AM
    Author     : dreabalbas
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>

    <title>SGI - Modificar Usuario</title>

    <h4>Modificaci&oacute;n de Datos de Usuarios</h4>
    <h5>Por favor escriba el nombre de usuario y los datos que desea modificar.</h5>

    <html:form action="/ModificarUsuario" acceptCharset="ISO-8859-1" onsubmit="return(this)">
        <table border="0">
            <tbody>
                <tr>
                    <td>Usuario </td>
                    <td><html:text disabled="true" name="usuario" property="nombreusuario" />   
                    </td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td><html:text name="usuario" property="email" /></td>
                </tr>
                <tr>
                    <td>Nombre Completo</td>
                    <td><html:text name="usuario" property="nombre" /></td>
                </tr>
                <tr>
                    <td>Privilegios
                    </td>
                    <td><html:select name="usuario" property="privilegio">
                            <html:option value="2">DRIC</html:option>
                            <html:option value="1">Decanato</html:option>
                            <html:option value="3">Coordinación</html:option>
                            <html:option value="3">Universidad Extranjera</html:option>
                            <html:option value="5">Estudiante USB</html:option>
                            <html:option value="6">Estudiante Extranjero</html:option>
                        </html:select>
                    </td>
                </tr>
            </tbody>
        </table>
        <p style="text-align: center">
            <html:submit onclick="javascript: return confirm('¿Seguro que desea modificar este usuario?')">
                Modificar Usuario
            </html:submit>
        </p>
    </html:form>

</html>

