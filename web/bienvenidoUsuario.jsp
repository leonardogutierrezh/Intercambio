<%-- 
    Document   : bienvenidoUsuario
    Created on : Oct 26, 2012, 12:44:10 AM
    Author     : caponte
--%>


<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/estilo.css">
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

            <h4>Usuario</h4>
            <h5>Actualemente esta página está en construcción.</h5>
            
            <div align="center" > 
                <img src="images/Under-construction.png" width="128" height="128" alt="Under-construction"/>
                <br /> <br />
                <a href="contactoAdministrador.jsp">
                    Si desea contactar al administrador<br />
                    Haga Click Aquí.
                </a>
            </div>

            <div class="espacio" style="height:30px">

            </div>

            <tiles:insert definition="footer"/>
        </div>

    </body>


</html:html>
