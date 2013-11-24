<%-- 
    Document   : verAnuncio
    Created on : 29-mar-2013, 21:22:43
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Anuncio</title>
    </head>
    <br>
    <br>
    <div align="center" style="font-family: sans-serif;color: #000000;border-radius: 10px;border: #4684b0 solid;width: 80%;margin-left: 12% ">
        <div>
            <p style="font-weight: bold">Titulo:</p>
            <bean:write name="anuncio" property="titulo"/>
        </div>
        <div>
            <p style="font-weight: bold">Mensaje:</p>
            <bean:write name="anuncio" property="mensaje"/>
        </div>
        <div>
            <p style="font-weight: bold">Fecha:</p>
            <bean:write name="anuncio" property="fecha"/>
            
        </div>
    </div>

