<%-- 
    Document   : listarPreregistro
    Created on : Oct 18, 2012, 12:58:41 AM
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
    <title>SGI - Listar Usuarios</title>

    <script language="JavaScript">
        function submitForm() { document.ObtenerDatos.submit(); }
    </script>

    <h4>Lista de Usuarios Preregistrados en el Sistema:</h4>
    <table>
        <tr>
            <td width="120px">
                Nombre
            </td>
            <td width="190px"  align ="center">
                Privilegio
            </td>
            <td width="150px" align="center">
                Aceptar Usuario
            </td>
            <td width="150px" align="center">
                Ver Preregistro
            </td>
            <td width="150px" align="center">
                Eliminar Pre-Registro
            </td>
        </tr>
    </table>
    <logic:iterate name="usuario" id="usuarios">
        <table border="0">
            <tbody>
                <tr>
                    <td width="140px">
                        <bean:write name="usuarios" property="nombreusuario" />
                    </td>
                    <html:form action="/AceptarPreregistro" onsubmit="return(this)">
                     <td width="160px"><html:select  property="privilegio">
                            <html:option value="2">Decanato</html:option>
                            <html:option value="2">DRIC</html:option>
                            <html:option value="3">Coordinación</html:option>
                            <html:option value="4">Universidad Extranjera</html:option>
                            <html:option value="5">Estudiante USB</html:option>
                            <html:option value="6">Estudiante Extranjero</html:option>
                        </html:select>
                    </td>
                    <td align="center" width="150px">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <html:image src="images/user_accept.png" style="width:32px;height:32px" styleClass="button" value="" property="" /> 
                        
                    </td>
                    </html:form>
                    <td align="center" width="150px">
                        <html:form action="/ConsultarPreregistro" onsubmit="return(this)">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <html:image src="images/view_data.png" style="width:32px;height:32px" styleClass="button" value="" property="" /> 
                        </html:form>
                    </td>
                    <td align="center" width="150px">
                        <html:form action="/EliminarPreregistro" onsubmit="return(this)">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <a onclick="javascript: return confirm('Seguro Que Deses Elmininar Este Usuario?')">
                                <html:image src="images/trashcan-delete.png" styleClass="button" value="" property="" /> 
                            </a>
                        </html:form>
                    </td>
                </tr>
            </tbody>
        </table>
    </logic:iterate>
</html>
