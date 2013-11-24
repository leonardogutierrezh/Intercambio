<%-- 
    Document   : sbLCoord
    Created on : Nov 29, 2012, 12:01:05 AM
    Author     : kosmos
    Modified by: dreabalbas
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript" src="/Intercambio/css/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/Intercambio/plantilla/sidebarsL/ddmenu.js"></script>
<script type="text/javascript">


ddmenu.init({
	headerclass: "submenuheader", 
	contentclass: "submenu", 
	collapseprev: true,
	defaultexpanded: [], 
	animatedefault: false, 
	persiststate: true, 
	toggleclass: ["", ""], 
	togglehtml: ["suffix", "", ""],
	animatespeed: "normal" 
})


</script>

<html:html>

    <div class="glossymenu" style="width: 190px">
        <a style="border-bottom: none;" ><html:link styleClass="menuitem" action="/accionesPostulante">Inicio</html:link></a>
        
        <a class="menuitem submenuheader">Gestión de estudiantes </a>
        <div class="submenu">
            <ul>
                <li><a> <html:link action="/AgregarEstudiantes">Agregar estudiante</html:link></a></li>
                <li><a> <html:link action="/ListarEstudiantes">Consultar estudiantes</html:link></a></li>
            </ul>
        </div>
        
         <a style="border-bottom: none;"> <html:link styleClass="menuitem" action="/modPerfilPos">Ver/Modificar perfil</html:link></a>
         <a style="border-bottom: none;"> <html:link styleClass="menuitem" action="/CerrarSesion">Cerrar sesión</html:link></a>
    </div>
    
    <br>
    <div id="twitterInt" style="width: 100%"> 
         
        <a class="twitter-timeline" height="300" href="https://twitter.com/IntercambioUSB" data-widget-id="317086117033811968"> </a>
        <script>!function(d,s,id){
            var js,fjs=d.getElementsByTagName(s)[0];
            if(!d.getElementById(id)){js=d.createElement(s);
                js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}
        }(document,"script","twitter-wjs");
        </script>

    </div>
</html:html>