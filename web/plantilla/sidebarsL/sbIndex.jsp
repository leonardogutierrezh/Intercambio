<%-- 
    Document   : sbIndex
    Created on : Nov 14, 2012, 11:53:40 PM
    Author     : kosmos
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript">
     function unhide(divID) {
       var item = document.getElementById(divID);
       var otros = document.getElementsByTagName('div');
       if(otros){
           for(var i=0;i<otros.length;i++){
               if(otros[i].className=="unhidden"){
                   otros[i].className = 'hidden'
               }
           }
       }
       if (item) {
           item.className='unhidden';
       }
    }
 </script>

<html:html>
    
     <div class="glossymenu" style="width: 190px">
         <a style="border-bottom: none;" ><html:link styleClass="menuitem" action="inicSesion">Login</html:link></a>
         <a style="border-bottom: none;" ><html:link styleClass="menuitem" href="javascript:unhide('fechaPostulaciones');">Fecha Límite para Postulaciones</html:link></a>
         <a style="border-bottom: none;"> <html:link styleClass="menuitem" href="javascript:unhide('estudianteInter');">Recaudos de Estudiantes Internacionales</html:link></a>
         <a style="border-bottom: none;"> <html:link styleClass="menuitem" href="javascript:unhide('estudianteNac');">Recaudos de Estudiantes Nacionales</html:link></a>
         <a style="border-bottom: none;"> <html:link styleClass="menuitem" href="javascript:unhide('recaudosAdic');">Recaudos Adicionales</html:link></a>
    </div>
    
    <div id="twitterInt" style="width: 100%"> 
        <br><br>
        <a class="twitter-timeline" height="300" href="https://twitter.com/IntercambioUSB" data-widget-id="317086117033811968"> </a>
        <script>!function(d,s,id){
            var js,fjs=d.getElementsByTagName(s)[0];
            if(!d.getElementById(id)){js=d.createElement(s);
                js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}
        }(document,"script","twitter-wjs");
        </script>

    </div> 
</html:html>
