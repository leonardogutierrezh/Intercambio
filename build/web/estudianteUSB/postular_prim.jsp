<%-- 
    Document   : postular_prim
    Created on : Jan 21, 2014, 7:22:18 PM
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
                        <html:form action="/guardar_sig_Postulacion_prim"  method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
                    <p hidden="true"><html:text name="PlanillaUSB" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>
                    <br>

                    <div id="opci1" class="divformulario" style="display: block">
                        <br>
                        <span><a> Paso 1.1: </a><b><a style="text-decoration: underline">DATOS PERSONALES</a></b></span>
                        <br>
                        <br>
                        <table border="0"  align="center">
                            <tbody>
                                <tr>
                                    <td style="font-weight: bold">Primer Apellido</td>

                                    <td>
                                        <bean:define id="primerApellido" name="Estudiante" property="pApellido"/>
                                        <html:text name="PlanillaUSB" property="apellido1" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" disabled="True" value="<%=primerApellido.toString()%>" ></html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="apellido1" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold">Segundo Apellido</td>

                                    <td>
                                        <bean:define id="segundoApellido" name="Estudiante" property="sApellido"/>
                                        <html:text name="PlanillaUSB" property="apellido2" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" disabled="True" value="<%=segundoApellido.toString()%>"></html:text>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="apellido2" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold">Primer Nombre</td>

                                    <td>
                                        <bean:define id="primerNombre" name="Estudiante" property="pNombre"/>
                                        <html:text name="PlanillaUSB" property="nombre1" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" disabled="True" value="<%=primerNombre.toString()%>"></html:text>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="nombre1" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold">Segundo Nombre</td>

                                    <td>
                                        <bean:define id="segundoNombre" name="Estudiante" property="sNombre"/>
                                        <html:text name="PlanillaUSB" property="nombre2" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" disabled="True" value="<%=segundoNombre.toString()%>"></html:text>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="nombre2" />
                                    </td>

                                </tr>                                

                                <tr>
                                    <td style="font-weight: bold">Fecha de Nacimiento</td>

                                    <td>
                                        <input type="date" min="1980-01-01" name="PlanillaUSB" property="fechaNacimiento"/>

                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="fechaNacimiento" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold">Género</td>

                                    <td>
                                        <html:select name="PlanillaUSB" property="sexo" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                            <html:option value="">Seleccione</html:option>
                                            <html:option value="Femenino">Femenino</html:option>
                                            <html:option value="Masculino">Masculino</html:option>
                                        </html:select>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="sexo" />
                                    </td>

                                </tr>

                                <tr>
                                    <td style="font-weight: bold">Nacionalidad</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="nacionalidad" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="nacionalidad" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold">Cédula de Identidad</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="cedula" maxlength="10" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="cedula" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold">Nro Carnet Estudiantil</td>
                                    <td>
                                        <bean:define id="carnetUSB" name="EstudianteUSB" property="carnet"/>
                                        <html:text name="PlanillaUSB" property="carnet" maxlength="10" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" disabled="True" value="<%=carnetUSB.toString()%>">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="carnet" />
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
    </body>
</html>
