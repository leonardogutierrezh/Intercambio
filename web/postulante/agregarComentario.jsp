<%-- 
    Document   : agregarComentario
    Created on : 27-feb-2013, 17:28:51
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comentar</title>
    </head>
    <div align="center">
        <h1>Agregar Recomendacion:</h1>

        <html:form action="/AgregarComentario"  acceptCharset="ISO-8859-1" onsubmit="return(this)">
            <html:hidden name="usuario" property="nombreusuario"/>
            <p>Comentaios:</p>
            <html:textarea style="width:70%;height:40%;" name="usuario" property="confirmar"/><br>
            <p>Recomendacion:</p>
            <html:select name="usuario" property="confirmar2">
                <html:option value="Muy favorable">Muy favorable</html:option>
                <html:option value="Favorable">Favorable</html:option>
                <html:option value="Con reservas">Con reservas</html:option>
            </html:select>
                <br><br>
            <html:submit value="AgregarComentario"> Comentar </html:submit>
        </html:form>
    </div>




</html>
