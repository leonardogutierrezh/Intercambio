<%-- 
    Document   : estadoSolicitudUSB.jsp
    Created on : 27/11/2013, 12:26:57 PM
    Author     : andel
--%>
<%Object tmp = session.getAttribute("nombreusuario");%>
<%Object var = session.getAttribute("nombre");%>
<%Object confirm = session.getAttribute("confirmar");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estado de solicitud de Intercambio</title>
    </head>
    <body>
        <br><br><br><br>
    <center>
        <h1>Hola, <%=var.toString()%> </h1>
        El estado actual de su postulación es: <strong> <%=confirm.toString()%> </strong>
    </center>    
    </body>
</html>