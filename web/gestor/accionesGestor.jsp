
<% Object var = session.getAttribute("nombre");
    if (var != "") {%>
<%@page import="javax.swing.text.html.HTML"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>    
<html:html>
    <title> Sistema de Gesti&oacute;n de Intercambio</title>

    <body  >
        <script language="JavaScript">
        function submitForm() { document.ObtenerDatos.submit(); }
    </script>
        <div id="NombreUser">
            <h1><%=var.toString()%></h1>
        </div>
        
        <div acceptCharset="ISO-8859-1">
            <p hidden="true"><bean:write name="Usuario" property="nombre"></bean:write></p>
            <p hidden="true"><bean:write name="Usuario" property="email"></bean:write></p>
            <p hidden="true"><bean:write name="Usuario" property="nombreusuario"></bean:write></p>
        </div>

        <html:form action="/ListarEstudiantesPostulados" onsubmit="return(this)" >
        </html:form>
            
            
            
    </body>
</html:html>
<%} else {%>
<html>

    <title> hello</title>
</html>
<% }%>

