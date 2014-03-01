<%-- 
    Document   : postular_quinta
    Created on : Jan 22, 2014, 1:09:08 AM
    Author     : andelnunez
--%>

<%Object var = session.getAttribute("nombreusuario");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script  src="/Intercambio/css/jquery.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script  src="/Intercambio/css/formularioUSB.js"></script>
        <title>Sistema de Gestión de Intercambios</title>
    </head>
    <body>
        <h4 align ="center">Formulario de solicitud</h4>
        <h5 align ="center"> Por favor complete los datos que son requeridos a continuación</h5>

        <div id="error"></div>
        
        <script>
            var a= '<bean:write name="Usuario" property="nombre"></bean:write>'</script>
        <script>
            function select(){
                if(a != ""){
                    var z = a.split(",")
                    var pal=""
                    for(i=1;i<z.length-1;i++){
                        pal = pal + z[i]+"\n"
                    }
                    if (pal != ""){
                        document.getElementById('error').innerHTML='<div align="center" style="width:100%"><pre align="center" style="color: #B22222;font-family:san-serif">Contiene error en los pasos:\n '+pal+'</pre></div>'
                    }
                }
            }

            function Sumar(){
                var lo = 0;   
                jQuery.each($(".feed"), function(key,value){
                    var pri = value.children[0]
                    if(pri.files.length != 0){
                        lo = lo + pri.files[0].size
                    }

                })
                var va=0;
                if(lo/1024 >= 1024){
                    va = (lo/1048576).toFixed(2);
                    if(va >= 3){
                        $("#parra").css("color", "red");                    
                    }else{
                        $("#parra").css("color", "#555");                    
                    }
                    va = va +" Mb";
                }else{
                    va = (lo/1024).toFixed(2) +" Kb";
                    $("#parra").css("color", "#555");                    
                }

                $("#parra").text("El tamaño de la carga es de:"+va+"");
            }

            window.onload=function(){
                select();
                Sumar()
            } 
        </script>     
        
        <div class="nav" style="text-align: center;">
            <a href="#" onclick=" if (true) show('datosplanilla'), hide('archivos'),hide('plan'),hide('idio')"> 1. Formulario de Datos </a>
        </div>
        
            <div align ="center">
                        <html:form action="/guardar_sig_Postulacion_quinta"  method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
                    <p hidden="true"><html:text name="PlanillaUSB" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>
                    <br>
                    
                    <div id="opci5" class="divformulario" style="display: block">
                        <br>
                        <span><a>Paso 1.5: </a><b><a style="text-decoration: underline">INFORMACIÓN ACADÉMICA</a></b></span>

                        <br>
                        <br>
                        <table border="0" align="center">
                            <tbody>

                                <tr>
                                    <td style="font-weight: bold"> Decanato: </td>
                                    <td>
                                        <html:select styleId="dec" onclick="cambia_area()" property="decanato" name="PlanillaUSB"> 
                                            <html:option value="0">Seleccione</html:option>
                                            <html:option value="1"> Decanato de Estudios Profesionales</html:option>
                                            <html:option value="2"> Decanato de Estudios Tecnológicos </html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="decanato"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> Área de Estudio: </td>
                                    <td>
                                        <html:select styleId="area" onclick="cambia_carrera()" property="areaEstud"> 
                                            <html:option value="-">- </html:option>
                                        </html:select>
                                    </td>
                                </tr>                        
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="areaEstud"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> Carrera: </td>
                                    <td>
                                        <html:select styleId="carr" property="carrera"> 
                                            <html:option value="-">- </html:option>
                                        </html:select>
                                    </td>
                                </tr>                                       

                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="carrera"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> Número de Créditos Aprobados Hasta la Fecha</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="creditosApro" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="creditosApro" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> Índice Académico: </td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="indice" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="indice" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                        <br>
                        <div>      
                            <span style="float: right"><html:submit>Siguiente </html:submit></span>
                        </div>
                        <br><br>
                </html:form>   
             </div>
            </div>
    </body>
</html>
