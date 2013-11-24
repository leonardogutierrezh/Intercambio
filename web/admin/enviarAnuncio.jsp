<%-- 
    Document   : enviarAnuncio
    Created on : Nov 11, 2012, 10:51:23 AM
    Author     : caponte
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Publicar Anuncio</title>
    </head>
    <body>
        <html:form action="/PublicarAnuncio" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
            <table border="0" >
                <tbody>
                    <tr>
                        <td style="color: black">Titulo</td>
                        <td>
                            <html:text name="Anuncio" property="titulo" maxlength="100" value="" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="titulo" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Mensaje</td>
                        <td>
                            <html:textarea name="Anuncio" property="mensaje" rows="15" cols="80"> </html:textarea>
                        </td>
                    <tr>
                        <td style="color: black">Destinatarios</td>    
                        <td>
                            <html:checkbox name="Anuncio" property="DRIC" value="DRIC"> DRIC </html:checkbox>
                            <html:checkbox name="Anuncio" property="decanatos" value="Decanatos"> Decanatos </html:checkbox>
                            <html:checkbox name="Anuncio" property="coordinaciones" value="Cordinaciones"> Coordinaciones</html:checkbox>
                            <html:checkbox name="Anuncio" property="uniExt" value="uniExt" > Universidades Extranjeras</html:checkbox>
                            <html:checkbox name="Anuncio" property="estUSB" value="estUSB" > Estudiante USB </html:checkbox>
                            <html:checkbox name="Anuncio" property="estExt" value="estExt"> Estudiante Extranjero</html:checkbox>

                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="mensaje"/>
                        </td>
                    </tr>
                </tbody>
            </table>

            <p style="text-align: center">
                <html:submit onclick="javascript: return confirm('¿Está seguro que el anuncio esta correcto?')">
                    Enviar Notificacion
                </html:submit>
            </p>
        </html:form>
    </body>
</html>

