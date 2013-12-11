<%-- 
    Document   : listarEstudiantes
    Created on : Oct 18, 2012, 12:58:41 AM
    Author     : caponte
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<script  src="/Intercambio/css/jquery.js"></script>
<script  src="/Intercambio/css/jquery.tablePagination.0.5.js"></script>
<script type="text/javascript">
    function altRows(id){
        if(document.getElementsByTagName){  
		
            var table = document.getElementById(id);  
            var rows = table.getElementsByTagName("tr"); 
		 
            for(i = 0; i < rows.length; i++){          
                if(i % 2 == 0){
                    rows[i].className = "evenrowcolor";
                }else{
                    rows[i].className = "oddrowcolor";
                }      
            }
        }
    }
    $(document).ready(function() {
        $('table').tablePagination({});
    } );
    window.onload=function(){
        altRows('alternatecolor');
    }
</script>

<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SGI - Listar Estudiantes</title>

    <script language="JavaScript">
        function submitForm() { document.ObtenerDatos.submit(); }
    </script>

    <h4>Lista de Estudiantes de la Carrera:</h4>
    <div id="testTable">
        <table  style="margin: auto" class="altrowstable" id="alternatecolor">
            <thead>
                <tr>
                    <th width="220px" align="center">
                        Nombre
                    </th>
                    <th width="90px" align="center">
                        Ver estudiante
                    </th>
                    <th width="90px" align="center">
                        Eliminar Postulacion
                    </th>
                    <th width="100px" align="center">
                        Comentario/ Recomendación
                    </th>
                </tr>
            </thead>
            <logic:iterate name="usuario" id="usuarios">

                <tr>
                    <td width="220px" align="center">
                        <bean:write name="usuarios" property="nombreusuario" />
                    </td>
                    <td align="center" width="90px">
                        <html:form action="/ConsultarUsuario2" onsubmit="return(this)">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <html:hidden name = "usuarios" property="confirmar" value="postulante"/>
                            <html:image src="images/verDatos.png" value="" property="" style=""/> 
                        </html:form>
                    </td>
                    <td align="center" width="90px">
                        <html:form action="/EliminarUsuarioCoord" onsubmit="return(this)">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <a onclick="javascript: return confirm('Seguro Que Deses Elmininar Este Usuario?')">
                                <html:image src="images/trashcan-delete.png" value="" property="" /> 
                            </a>
                        </html:form>
                    </td>
                    <td align="center" width="90px">
                        <html:form action="/Comentar" onsubmit="return(this)">
                            <html:hidden name="usuarios" property="nombreusuario"/>
                            <a>
                                <html:image src="images/comentar.png" value="" property="" /> 
                            </a>
                        </html:form>
                    </td>
                </tr>

            </logic:iterate>           
        </table>
    </div>
</html>

