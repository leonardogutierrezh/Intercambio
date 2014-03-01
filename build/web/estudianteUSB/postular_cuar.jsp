<%-- 
    Document   : postular_cuar
    Created on : Jan 22, 2014, 12:19:18 AM
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
                        <html:form action="/guardar_sig_Postulacion_cuar"  method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
                    <p hidden="true"><html:text name="PlanillaUSB" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>
                    <br>
                    
                    <div id="opci4" class="divformulario" style="display: block; width: 500px">

                        <br>

                        <span><a>Paso 1.4: </a><b><a style="text-decoration: underline">PROGRAMAS</a></b></span>

                        <br>
                        <br>
                        <table border="0"  align="center">
                            <tbody>

                                <tr>
                                    <td> <b>Opción 1</b> </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> Nombre de Programa: </td>
                                    <td>
                                        <html:select name="PlanillaUSB" styleId="prog_princ" onclick="cambia_pais();cambiar_link1()" onchange="cambia_pais();cambiar_link1()" property="nombreProgramaOpcion1"> 
                                            <html:option value="0">Seleccione </html:option>
                                            <html:option value="Bilaterales">Convenios Bilaterales </html:option>
                                            <html:option value="SMILE">Programa SMILE </html:option>
                                            <html:option value="CINDA">Programa de Movilidad Estudiantil CINDA </html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="nombreProgramaOpcion1"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="#" id="planilla1-1" title="Debe llenar este formulario y luego adjuntarlo en el área de documentos requeridos"> </a>
                                    </td>
                                    <td>
                                        <a href="#" id="planilla1-2" title="Debe llenar este formulario y luego adjuntarlo en el área de documentos requeridos"> </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> País Destino: </td>
                                    <td>
                                        <html:select styleId="pais_princ" onclick="cambia_universidad()" onchange="cambia_universidad()" property="paisOpcion1"> 
                                            <html:option value="-">- </html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="paisOpcion1"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> Universidad Destino: </td>
                                    <td>
                                        <html:select styleId="uni_princ" property="nombreOpcion1"> 
                                            <html:option value="-">- </html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="nombreOpcion1"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> Tipo de Programa: </td>
                                    <td>
                                        <html:select name="PlanillaUSB" property="programaOpcion1">
                                            <html:option value="Seleccione"></html:option>
                                            <html:option value="Intercambio Académico (sólo Asignaturas)"></html:option>
                                            <html:option value="Intercambio Académico + Pasantía Internacional"></html:option>
                                            <html:option value="Intercambio Académico + Trabajo de Grado"></html:option>
                                            <html:option value="Trabajo de Grado"></html:option>
                                            <html:option value="Doble Titulación"></html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="programaOpcion1" />
                                    </td>
                                </tr>                            
                                <tr>
                                    <td style="font-weight: bold"> Fecha Tentativa Inicio: </td>
                                    <td>
                                        <html:select name="PlanillaUSB"  property="mesFechaIni1">
                                            <html:option value="Mes"></html:option>
                                            <html:option value="Enero"></html:option>
                                            <html:option value="Febrero"></html:option>
                                            <html:option value="Marzo"></html:option>
                                            <html:option value="Abril"></html:option>
                                            <html:option value="Mayo"></html:option>
                                            <html:option value="Junio"></html:option>
                                            <html:option value="Julio"></html:option>
                                            <html:option value="Agosto"></html:option>
                                            <html:option value="Septiembre"></html:option>
                                            <html:option value="Octubre"></html:option>
                                            <html:option value="Noviembre"></html:option>
                                            <html:option value="Diciembre"></html:option>
                                        </html:select>
                                        <html:select  name="PlanillaUSB" property="anoFechaIni1">
                                            <html:option value="Año"></html:option>
                                            <html:option value="2014"></html:option>
                                            <html:option value="2015"></html:option>
                                            <html:option value="2016"></html:option>
                                        </html:select>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="mesFechaIni1" />
                                        <html:errors property="anoFechaIni1" />
                                    </td>
                                </tr>                        
                                <tr>
                                    <td style="font-weight: bold"> Fecha Tentativa Fin: </td>
                                    <td>
                                        <html:select name="PlanillaUSB" property="mesFechaFin1">
                                            <html:option value="Mes"></html:option>
                                            <html:option value="Enero"></html:option>
                                            <html:option value="Febrero"></html:option>
                                            <html:option value="Marzo"></html:option>
                                            <html:option value="Abril"></html:option>
                                            <html:option value="Mayo"></html:option>
                                            <html:option value="Junio"></html:option>
                                            <html:option value="Julio"></html:option>
                                            <html:option value="Agosto"></html:option>
                                            <html:option value="Septiembre"></html:option>
                                            <html:option value="Octubre"></html:option>
                                            <html:option value="Noviembre"></html:option>
                                            <html:option value="Diciembre"></html:option>
                                        </html:select>
                                        <html:select name="PlanillaUSB" property="anoFechaFin1">
                                            <html:option value="Año"></html:option>
                                            <html:option value="2014"></html:option>
                                            <html:option value="2015"></html:option>
                                            <html:option value="2016"></html:option>
                                        </html:select>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="mesFechaFin1" />
                                        <html:errors property="anoFechaFin1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> Duración: </td>
                                    <td>
                                        <html:select name="PlanillaUSB" property="duracionProgramaOpcion1">
                                            <html:option value="Seleccione"></html:option>
                                            <html:option value="Un Trimestre"></html:option>
                                            <html:option value="Dos Trimestres"></html:option>
                                            <html:option value="Año Académico"></html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="duracionProgramaOpcion1" />
                                    </td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td> <b>Opción 2</b> </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> Nombre de Programa: </td>
                                    <td>
                                        <html:select styleId="prog_princ2" onclick="cambia_pais2();cambiar_link2()" onchange="cambia_pais2();cambiar_link2()" property="nombreProgramaOpcion2" name="PlanillaUSB"> 
                                            <html:option value="0">Seleccione </html:option>
                                            <html:option value="Bilaterales">Convenios Bilaterales </html:option>
                                            <html:option value="SMILE">Programa SMILE </html:option>
                                            <html:option value="CINDA">Programa de Movilidad Estudiantil CINDA </html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="nombreProgramaOpcion2"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="#" id="planilla2-1" title="Debe llenar este formulario y luego adjuntarlo en el área de documentos requeridos"> </a>
                                    </td>
                                    <td>
                                        <a href="#" id="planilla2-2" title="Debe llenar este formulario y luego adjuntarlo en el área de documentos requeridos"> </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> País Destino: </td>
                                    <td>
                                        <html:select styleId="pais_princ2" onclick="cambia_universidad2()" onchange="cambia_universidad2()" property="paisOpcion2"> 
                                            <html:option value="-">-</html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="paisOpcion2"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> Universidad Destino: </td>
                                    <td>
                                        <html:select styleId="uni_princ2" property="nombreOpcion2"> 
                                            <html:option value="-">- </html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="nombreOpcion2"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> Tipo de Programa: </td>
                                    <td>
                                        <html:select  property="programaOpcion2" name="PlanillaUSB">
                                            <html:option value="Seleccione"></html:option>
                                            <html:option value="Intercambio Académico (sólo Asignaturas)"></html:option>
                                            <html:option value="Intercambio Académico + Pasantía Internacional"></html:option>
                                            <html:option value="Intercambio Académico + Trabajo de Grado"></html:option>
                                            <html:option value="Trabajo de Grado"></html:option>
                                            <html:option value="Doble Titulación"></html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="programaOpcion2"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> Fecha Tentativa Inicio: </td>
                                    <td>
                                        <html:select  property="mesFechaIni2" name="PlanillaUSB">
                                            <html:option value="Mes"></html:option>
                                            <html:option value="Enero"></html:option>
                                            <html:option value="Febrero"></html:option>
                                            <html:option value="Marzo"></html:option>
                                            <html:option value="Abril"></html:option>
                                            <html:option value="Mayo"></html:option>
                                            <html:option value="Junio"></html:option>
                                            <html:option value="Julio"></html:option>
                                            <html:option value="Agosto"></html:option>
                                            <html:option value="Septiembre"></html:option>
                                            <html:option value="Octubre"></html:option>
                                            <html:option value="Noviembre"></html:option>
                                            <html:option value="Diciembre"></html:option>
                                        </html:select>
                                        <html:select  property="anoFechaIni2" name="PlanillaUSB">
                                            <html:option value="Año"></html:option>
                                            <html:option value="2014"></html:option>
                                            <html:option value="2015"></html:option>
                                            <html:option value="2016"></html:option>
                                        </html:select>
                                </tr>  
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="mesFechaIni2"/>
                                        <html:errors property="anoFechaIni2"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> Fecha Tentativa Fin: </td>
                                    <td>
                                        <html:select  property="mesFechaFin2" name="PlanillaUSB">
                                            <html:option value="Mes"></html:option>
                                            <html:option value="Enero"></html:option>
                                            <html:option value="Febrero"></html:option>
                                            <html:option value="Marzo"></html:option>
                                            <html:option value="Abril"></html:option>
                                            <html:option value="Mayo"></html:option>
                                            <html:option value="Junio"></html:option>
                                            <html:option value="Julio"></html:option>
                                            <html:option value="Agosto"></html:option>
                                            <html:option value="Septiembre"></html:option>
                                            <html:option value="Octubre"></html:option>
                                            <html:option value="Noviembre"></html:option>
                                            <html:option value="Diciembre"></html:option>
                                        </html:select>
                                        <html:select  property="anoFechaFin2" name="PlanillaUSB">
                                            <html:option value="Año"></html:option>
                                            <html:option value="2014"></html:option>
                                            <html:option value="2015"></html:option>
                                            <html:option value="2016"></html:option>
                                        </html:select>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="mesFechaFin2"/>
                                        <html:errors property="anoFechaFin2"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> Duración: </td>
                                    <td>
                                        <html:select  property="duracionProgramaOpcion2" name="PlanillaUSB">
                                            <html:option value="Seleccione"></html:option>
                                            <html:option value="Un Trimestre"></html:option>
                                            <html:option value="Dos Trimestres"></html:option>
                                            <html:option value="Año Académico"></html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="duracionProgramaOpcion2" />
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
