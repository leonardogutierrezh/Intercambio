<%-- 
    Document   : cargarIndicesCarreras
    Created on : 09/01/2014, 11:10:06 AM
    Author     : andel
--%>
<%@page import="javax.swing.text.html.HTML"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cargar Indice</title>
    </head>
    
    <script>
        function enviar (){
           
            forma = document.getElementById("formax");
            forma.submit();
        }
    </script>    
    
    <body>
        <h4>Cargar Indices de Carreras</h4>
<!-- El enctype del form en de vital importancia-->
        <html:form  method="POST" enctype="multipart/form-data" action="/UploadCargaMasiva.do?method=subirExcel" styleId="formax">     
            <table>
                <tr>
                    <td>
                        <html:file property="excel"/>
                    </td>
                    <td>
                        <input type="button" value="Submit" onclick="javaScript:enviar();"/> 
                    </td>
                </tr>
            </table>
        </html:form>
    </body>

    </body>
</html:html>
