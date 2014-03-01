<%-- 
    Document   : acciones
    Created on : Oct 25, 2012, 8:03:13 PM
    Author     : dycicle Systems
--%>
<%Object var = session.getAttribute("nombreusuario");%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>
    <title>SGI - Agregar estudiante</title>

    <body onload ="clearForms()" onunload="clearForms()">

        <h4>Creaci&oacute;n de nuevo estudiante</h4>
        <h5>Por favor introduzca los datos del nuevo usuario.</h5>

        <html:form action="/AccionAgregarEstudiante" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
            <div hidden="true">
                <html:text name="EstUSB" property="origen" maxlength="20" errorStyleClass="error"
                value ="<%=var.toString()%>" errorKey="org.apache.struts.action.ERROR" />
            </div>

            <table border="0" >
                <tbody>
                    <tr>
                        <td style="color: black">Usuario</td>
                        <td>
                            <html:text name="EstUSB" property="nombreusuario" maxlength="20" errorStyleClass="error" value=""
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
                        <td style="color: black">Nombres</td>       
                        <td><html:text name="EstUSB" property="nombre" maxlength="100" errorStyleClass="error" value=""
                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="nombre" />
                        </td>
                    </tr>
                    <tr>
                        <td style="color: black">Apellidos</td>       
                        <td><html:text name="EstUSB" property="pApellido" maxlength="100" errorStyleClass="error" value=""
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
                <html:submit onclick="javascript: return confirm('¿Está seguro que los datos son correctos?')">
                    Agregar estudiante
                </html:submit>
            </p>
        </html:form>

    </body>
</html>
