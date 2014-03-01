<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html:html lang="true">

    <title>Sistema de Gesti&oacute;n de Intercambio</title>

    <h4>Bienvenido</h4>
    <h5>Para ingresar al sistema introduzca su usuario y contraseña.</h5>
    <div id="login-form">
        <html:form action="Login">
            <table>
                <tr>
                    <td> Login </td>
                    <td><html:text name="Usuario" property="nombreusuario" size="14"
                               errorStyleClass="error" errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><html:errors property="nombreusuario"/></td>
                </tr>
                <tr>
                    <td> Password </td>
                    <td><html:password name="Usuario" property="contrasena" value="" size="14"
                                   errorStyleClass="error" errorKey="org.apache.struts.action.ERROR" ></html:password>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><html:errors property="contrasena"/></td>
                </tr>
            </table>
            <html:submit value = "Login"> Login</html:submit>   
        </html:form>
        <a href="recuperarContrasena.jsp">¿Olvid&oacute; su contraseña?</a><br />
    </div>

    <br /> <br />
    <div align="center" > 
        <a href="contactoAdministrador.jsp">
            ¿No tiene una cuenta?<br />
            Por favor contacte a nuestro administrador.
        </a>
    </div>
    <div class="espacio" style="height:90px">
    </div>


</html:html>
