<%-- 
    Document   : verEstado
    Created on : Oct 18, 2012, 12:58:41 AM
    Author     : caponte
--%>

<%Object var = session.getAttribute("nombre");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SGI - Estado Solicitud</title>

    <script language="JavaScript">
        function submitForm() { document.ObtenerDatos().submit(); }
    </script>

    <h4>Estado de la Solicitud:</h4>

    <div text-align="center">
        <table border="0" style="margin: auto">
            <tbody>
                <tr>
                    <td width="220px">
                        <bean:write name="usuarios" property="confirmar" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</html>
