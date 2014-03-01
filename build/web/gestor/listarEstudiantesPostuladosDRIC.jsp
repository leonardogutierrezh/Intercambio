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
<script  src="/Intercambio/css/formularioUSB.js"></script>
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
            <logic:iterate name="usuarios" id="usuarios">
               <logic:equal name="usuarios" property="estado" value="True">
                <tr>
                    <th align="center" width="150px">
                        <bean:write name="usuarios" property="calle" format="UTF-8"/>
                    </th>
                    <th align="center" width="110px">
                        <bean:write name="usuarios" property="apartamento" format="UTF-8"/>
                    </th>

                    <th align="center" width="100px">
                        Numero de plazas ofrecidas: <bean:write name="usuarios" property="page" format="0"/>
                    </th>
                    <th align="center" width="150px">
                        
                    </th>
                    <th></th>
                    <th align="center" width="150px">
                        
                    </th>
                    <th></th>

                </tr>
                   <tr>
                    <th align="center" width="150px">
                        Carrera
                    </th>
                    <th align="center" width="110px">
                        Carnet
                    </th>

                    <th align="center" width="100px">
                        Nombre y Apellido
                    </th>
                    <th align="center" width="150px">
                        Indice
                    </th>
                    <th>Correo y Teléfono</th>
                    <th align="center" width="150px">
                        Observaciones
                    </th>
                    <th>Asignado</th>

                </tr>
               </logic:equal>
               <logic:notEqual name="usuarios" property="estado" value="True">
                <tr>
                    <td align="center" width="150px">
                        <bean:write name="usuarios" property="carrera" />
                    </td>
                    <td align="center" width="110px">
                        <bean:write name="usuarios" property="origen" />
                    </td>

                    <td align="center" width="100px">
                        <bean:write name="usuarios" property="pNombre" /> <bean:write name="usuarios" property="pApellido" />
                        
                    </td>

                    <td align="center" width="150px">
                        <bean:write name="usuarios" property="apartamento" format="UTF-8"/>
                    </td>
                    <td><bean:write name="usuarios" property="email" format="UTF-8"/><br>
                        <bean:write name="usuarios" property="telefonoCelular" format="UTF-8"/>
                    </td>
                    <td align="center" width="150px">
                        <bean:write name="usuarios" property="ciudad" format="UTF-8"/><br>
                        <bean:write name="usuarios" property="calle" format="UTF-8"/>
                    </td>
                    <td></td>
                </tr>
                </logic:notEqual>
            </logic:iterate>       
        </table>
    </div>
</html>
