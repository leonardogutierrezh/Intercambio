<%-- 
    Document   : sbGestUsuarios
    Created on : Nov 15, 2012, 12:16:02 AM
    Author     : kosmos
    Modified by: dreabalbas
--%>

<%Object var = session.getAttribute("nombre");%>
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
        <a style="border-bottom: none;" ><html:link styleClass="menuitem" action="/accionesEstUSB">Inicio</html:link></a>
        
        <a class="menuitem submenuheader">Gestión de solicitudes </a>
        <div class="submenu">
            <ul>
                <!-- <li><a> <html:link action="/CargarLlenarPlanillaUSB" >Formulario de solicitud</html:link></a></li> -->
                <li><a> <html:link action="/CargarPostulacion" >Postularse</html:link></a></li> 
                <li><a> <html:link action="/ModificarPostulacionUSB" >Modificar Postulacion</html:link></a></li> 
                <li><a> <html:link action="/VerificarPlanillaUSB">Descargar planilla</html:link></a></li>
                <li><a> <html:link action="/GenerarCarpeta">Descargar carpeta</html:link></a></li>
                <li><a> <html:link action="/EstadoPostulacionUSB" >Ver estado de solicitud</html:link></a></li>
            </ul>
        </div>
        
        <a style="border-bottom: none;"> <html:link styleClass="menuitem" action="/modificarperUSB" >Ver/Modificar perfil</html:link></a>
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