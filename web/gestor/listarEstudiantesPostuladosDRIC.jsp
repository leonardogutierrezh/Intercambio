<%-- 
    Document   : listarEstudiantesPostuladosDRIC
    Created on : Jan 8, 2014, 4:50:39 PM
    Author     : leonardo
--%>
<%@page import="javax.swing.text.html.HTML"%>
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

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SGI - Listar estudiantes postulados</title>

    <script language="JavaScript">
        function submitForm() { document.ObtenerDatos.submit(); }
    </script>

    <h4>Lista de estudiantes postulados:</h4>
    <div id="testTable">
        <table style="margin: auto" class="altrowstable" id="alternatecolor">
            <thead>
                <tr>
                    <th width="150px">
                        Nombre
                    </th>
                    <th width="110px" align="center">
                        Ver usuario
                    </th>
                    <th width="100px" align="center">
                        Consultar solicitud
                    </th>
                    <th width="150px" align="center">
                        Estado actual
                    </th>
                    <th width="150px" align="center">
                        Cambiar estado de la solicitud
                    </th>
                </tr>
            </thead>

            <logic:iterate name="usuarios" id="usuarios">
                <tr>
                    <td align="center" width="150px">
                        <bean:write name="usuarios" property="nombreusuario" />
                    </td>
                    <td align="center" width="110px">
                        <html:form action="/ConsultarUsuario2" onsubmit="return(this)">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <html:hidden name = "usuarios" property="confirmar" value="gestor"/>
                            <html:image src="images/verDatos.png" value="" property="" style=""/> 
                        </html:form>
                    </td>

                    <td align="center" width="100px">
                        <html:form action="/GenerarCarpeta" onsubmit="return(this)">
                            <html:hidden name = "usuarios" property="nombreusuario"/>
                            <input type="hidden" name="nuevacontra" value="<%=session.getAttribute("nombreusuario").toString()%>"/>
                            <html:hidden name = "usuarios" property="confirmar" ></html:hidden>
                            <html:image src="images/archivador.png" style="width:32px;height:32px" value="" property="" /> 
                        </html:form>
                    </td>

                    <td align="center" width="150px">

                        <bean:write name="usuarios" property="confirmar" format="UTF-8"/>
                    </td>

                    <td align="center" width="150px">
                        <html:form action="/CambiarEstadoPostulacion"  method="POST" enctype="multipart/form-data" onsubmit="return(this)">

                            <html:hidden name = "usuarios" property="nombreusuario"/>

                            <html:select name="Usuario" property="confirmar">
                                <html:option value="">Nvo Estado</html:option>
                                <html:option value="En Evaluación">En Evaluación</html:option>
                                <html:option value="Retenido">Retenido</html:option>
                                <html:option value="Aceptado">Aceptado</html:option>
                                <html:option value="Rechazado">Rechazado</html:option>
                            </html:select>
                            <html:image src="images/postulacion.png" value="" property="" style=""/> 
                        </html:form>
                    </td>

                </tr>
            </logic:iterate>       
        </table>
    </div>
</html>

