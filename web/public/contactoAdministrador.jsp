<%-- 
    Document   : contactoAdministrador
    Created on : Oct 25, 2012, 7:01:30 PM
    Author     : caponte
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html:html lang="true">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Gesti&oacute;n de Intercambio</title>
        <html:base/>
    </head>


    <body>  
        <logic:notPresent name="org.apache.struts.action.MESSAGE" scope="application">
            <div  style="color: red">
                logic:notPresent   ERROR:  Application resources not loaded -- check servlet container
                logs for error messages.
            </div>
        </logic:notPresent>
        <div id="body-content">
            <tiles:insert definition="headerIndx"/>

            <h4>Bienvenido</h4>
            <h4>Para registrarse, es necesario que contacte al administrador en la siguiente dirección:</h4>
            <div align ="center">
                <a href="mailto:administrador@sistemaintercambio.usb.ve">administrador@sistemaintercambio.usb.ve</a>.<br> 
            </div>
            <tiles:insert definition="footer"/>
        </div>

    </body>


</html:html>
