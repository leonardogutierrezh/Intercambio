<%-- 
    Document   : listarDocumentos
    Created on : Nov 29, 2012, 5:38:45 PM
    Author     : caponte
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>

<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SGI - Listar Documentos</title>

    <script language="JavaScript">
        function submitForm() { document.ObtenerDatos.submit(); }
    </script>

    <h4>Lista de Documentos:</h4>
    <table>
        <tr>
            <td align="center"width="210px">
                Nombre Archivo
            </td>
            <td width="210px" align="center">
                Descargar
            </td>
            <td width="210px" align="center">
                Eliminar
            </td>
        </tr>
    </table>

    <logic:iterate name="usuarios" id="usuario">
        <table border="0" style="margin: auto">
            <tbody>
                <tr>
                    <td align="center"  width="210px">
                        <bean:write name="usuario" property="nombre" />
                    </td>
                    <td align="center"  width="210px">
                        <a href="<bean:write name="usuario" property="confirmar" />">
                            <html:img src="images/descarga.png" styleClass="button"/>
                        </a>
                    </td>
                    <td align="center" width="210px">
                        <a onclick="javascript: return confirm('Seguro Que Deses Elmininar Este Usuario?')">
                            <html:image src="images/trashcan-delete.png" styleClass="button"/> 
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </logic:iterate>
</html>
