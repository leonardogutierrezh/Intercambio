<%-- 
    Document   : datoserrados
    Created on : 25-oct-2012, 18:41:52
    Author     : gustavo
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ page import="nl.captcha.Captcha" %>

<html:html lang="true">

    <script  src="/Intercambio/css/jquery.js"></script>
    <script>
        $(document).ready(function(){
            if (!$('#captmal').is(':empty')){
                $('#capt').addClass("error")
            }
        })
    </script>
    <title>Sistema de Gesti&oacute;n de Intercambio</title>
    <h4></h4>
    <h6>Usuario/contraseña inválidos, por favor inténtelo nuevamente</h6>
    <div id="login-form">
        <html:form action="Login">
            <table style="border: none;">
                <tr style="border: none;">
                    <td style="border: none;"> Login </td>
                    <td style="border: none;"><html:text name="Usuario" property="nombreusuario" size="14"
                               errorStyleClass="error" errorKey="org.apache.struts.action.ERROR"></html:text>
                    </td>
                </tr>
                <tr style="border: none;">
                    <td style="border: none;color:fireBrick;" colspan="2"><html:errors property="nombreusuario"/></td>
                </tr>
                <tr style="border: none;">
                    <td style="border: none;"> Password </td>
                    <td style="border: none;"><html:password name="Usuario" property="contrasena" value="" size="14"
                                   errorStyleClass="error" errorKey="org.apache.struts.action.ERROR" ></html:password>
                    </td>
                </tr>
                <tr style="border: none;">
                    <td style="border: none;color:fireBrick;" colspan="2"><html:errors property="contrasena"/></td>
                </tr>
            </table>

            <div  style="position: relative; height: 120px; bottom: -10px;">
                <div id="Imagencita" style="height: 75px;">
                    <img src="/Intercambio/stickyImg"/>
                    <br/>
                    <a href="javascript:history.go(0)">Click para cambiar captcha</a>
                </div>
                <br><br>
                <table style="border: none;">
                    <tr style="border: none;">
                        <td style="border: none;" >Captcha</td> 
                        <td style="border: none;" ><input id="capt" name="answer" /></td>
                    </tr>
                    <tr style="border: none;" >
                        <td id="captmal" style="border: none;color:fireBrick;" colspan="2">
                            <html:errors property="captcha" />
                        </td>
                    </tr>
                </table>

            </div>
            <br><br><br><br/>
            <div>
                <html:submit value = "Login"> Login</html:submit>   
            </div>
        </html:form>
        <html:link action="reccontra">¿Olvid&oacute; su contraseña?</html:link><br />
    </div>

    <div class="espacio" style="height:90px">

    </div>

</html:html>