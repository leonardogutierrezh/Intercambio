<%-- 
    Document   : LogAuditoria
    Created on : 01-may-2013, 19:11:59
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>


<!DOCTYPE html>
<html>

    <script  src="/Intercambio/css/jquery.js"></script>
    <script  src="/Intercambio/css/jquery.tablePagination.0.5.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SGI - Log Auditoría</title>

    <script type="text/javascript">
  
         
        $(document).ready(function() {
            $('table').tablePagination({});
        } );
        
    
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
        window.onload=function(){
            altRows('alternatecolor');
        }
    
    </script>
    
        
    <h4>Log de Auditoria</h4>

    <div id="testTable">
        <table cellpadding="0" cellspacing="0" border="0" class="altrowstable" id="alternatecolor">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Fecha</th>
                    <th>Accion</th>

                </tr>
            </thead>
            <logic:iterate name="usuario" id="usuarioid">

                <tr>
                    <td style="width: 150px">
                        <bean:write name="usuarioid" property="nombreusuario" />
                    </td>
                    <td style="width: 200px">
                        <bean:write name="usuarioid" property="nombre" />
                    </td>
                    <td style="width: 220px">
                        <bean:write name="usuarioid" property="confirmar" />
                    </td>
                </tr>
            </logic:iterate>
        </table>
        <br/><br/><br/><br/><br/><br/>
    </div>

</html>
