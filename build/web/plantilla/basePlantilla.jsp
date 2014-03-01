<%-- 
    Document   : basePlantilla
    Created on : Nov 13, 2012, 11:19:16 AM
    Author     : dreabalbas
--%>

<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html:html lang="true">
    <head>
        
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/estilo.css" type="text/css"> 
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/cebolla.ico" >     

    </head>
    <body>  
        <div id="body-content">

            <div>
                <tiles:insert attribute="banner"/>
            </div>
            

            <div id="sidebarL">
                <tiles:insert attribute="sidebarL"/>
            </div>
            
            <tiles:insert attribute="sidebarR"/>
            
            <tiles:insert attribute="contacto"/>
            
            <div style="width:760px;margin-left:auto;margin-right:auto;">
                <tiles:insert attribute="body"/>
            </div>
          
            <div>
                <tiles:insert attribute="footer"/>
            </div>

        </div>
    </body>

</html:html>

