<%-- 
    Document   : anuncios
    Created on : 28-mar-2013, 10:53:32
    Author     : gustavo
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Anuncios</title>
    </head>
    <br>
    <div align="center">
        <html:link style="color:#126598" action="/BuscarDestinatarios">
            Redactar Anuncio
        </html:link>
    </div>
    <br>
    <div id="testTable">
        <table border="0" style="margin: auto" class="altrowstable" id="alternatecolor">
            <thead>
                <tr>
                    <th width="220px">
                        Asunto
                    </th>
                    <th width="150px" align="center">
                        Fecha
                    </th>
                    <th width="150px" align="center">
                        Más información
                    </th>
                </tr>
            </thead>

            <logic:iterate name="anuncios" id="anuncios">

                <tr>
                    <td width="220px" align="center">
                        <bean:write name="anuncios" property="titulo" />
                    </td>
                    <td align="center">
                        <bean:write name="anuncios" property="fecha" />
                    </td>
                    <td align="center" width="150px">
                        <html:form action="/verAnuncio" onsubmit="return(this)">
                            <html:hidden name="anuncios" property="fecha"/>
                            <html:hidden name="anuncios" property="titulo"/>
                            <html:image src="images/view_data.png" styleClass="button" value="" property="" style=""/> 
                        </html:form>
                    </td>
                </tr>

            </logic:iterate>
        </table>
    </div>
</html>
