<%-- 
    Document   : formularioSolicitudUSB
    Created on : Nov 13, 2012, 10:13:53 AM
    Last Modif : Feb 21, 2013
    Author     : Katy
--%>

<%Object var = session.getAttribute("nombreusuario");%>

<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script  src="/Intercambio/css/jquery.js"></script>
<!DOCTYPE HTML>
<html:html lang="true">

    <script  src="/Intercambio/css/formularioUSB.js"></script>
    <title>Sistema de Gestión de Intercambios</title>

    <h4 align ="center">Formulario de solicitud</h4>
    <h5 align ="center"> Por favor complete los datos que son requeridos a continuación</h5>
    <h5 align ="center"> Recuerde no dejar en blanco los campos obligatorios</h5>

    <!-- LLENAR EL FORMULARIO DE DATOS -->
    <div id="error">
    </div>
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

    <div id="datosplanilla" style="display: none; width:92%; margin-left: 8%">

        <h5>El siguiente formulario consta de 7 pasos, todos los campos son obligatorios</h5>
        <div>
            <div align ="center">

                <html:form action="/LlenarPlanilla_EstUSB"  method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
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
                                        <html:text name="PlanillaUSB" property="apellido1" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" disabled="True" ></html:text>
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
                                        <html:text name="PlanillaUSB" property="apellido2" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
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
                                        <html:text name="PlanillaUSB" property="nombre1" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" disabled="True"></html:text>
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
                                        <html:text name="PlanillaUSB" property="nombre2" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
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
                                        <html:text name="PlanillaUSB" property="carnet" maxlength="10" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" disabled="True">
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
                            <span style="float: right"><a class="button" href='javascript:seleccion(2);'> Siguiente </a></span>
                        </div>
                        <br><br>

                    </div>

                    <div id="opci2" class="divformulario" style="display: none">


                        <br>

                        <span><a>Paso 1.2: </a><b><a style="text-decoration: underline">INFORMACIÓN DE DOMICILIO</a></b></span>

                        <br>
                        <br>
                        <table border="0"  align="center">
                            <tbody>                
                                <tr>
                                    <td style="font-weight: bold">Urb / Sector / Barrio</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="urbanizacion" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="urbanizacion" />
                                    </td>
                                </tr>                                

                                <tr>
                                    <td style="font-weight: bold">Calle</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="calle" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="calle" />
                                    </td>
                                </tr>    
                                <tr>
                                    <td style="font-weight: bold">Edificio / Casa </td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="edificio" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="edificio" />
                                    </td>
                                </tr>                                    
                                <tr>
                                    <td style="font-weight: bold">Apartamento / Núm. Casa</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="apartamento" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="apartamento" />
                                    </td>
                                </tr>                                    

                                <tr>

                                    <td style="font-weight: bold">Ciudad</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="ciudad"  maxlength="30" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="ciudad" />
                                    </td>
                                </tr>

                                <tr>

                                    <td style="font-weight: bold">Estado</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="estado" maxlength="30" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="estado" />
                                    </td>
                                </tr>

                                <tr>

                                    <td style="font-weight: bold">Código Postal</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="codPostal"  maxlength="30" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="codPostal" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                        <br>
                        <div>      
                            <span style="float: left"><a class="button"  href='javascript:seleccion(1);'> Anterior </a></span>
                            <span style="float: right"><a class="button" href='javascript:seleccion(3);'> Siguiente </a></span>
                        </div>
                        <br><br>
                    </div>

                    <div id="opci3" class="divformulario" style="display: none">

                        <br>

                        <span><a>Paso 1.3: </a><b><a style="text-decoration: underline">DATOS DE CONTACTO</a></b></span>
                        <br>
                        <br>
                        <table border="0"  align="center">
                            <tbody>

                                <tr>

                                    <td style="font-weight: bold"> Teléfono celular:</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="telefonoCelular" maxlength="15" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="telefonoCelular" />
                                    </td>
                                </tr>

                                <tr>

                                    <td style="font-weight: bold"> Teléfono fijo:</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="telefonoCasa" maxlength="15" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="telefonoCasa" />
                                    </td>
                                </tr>


                                <tr>

                                    <td style="font-weight: bold"> E-mail:</td>

                                    <td>
                                        <html:text name="PlanillaUSB" property="email" maxlength="45"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="email" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                        <br> 
                        <div>
                            <span style="float: left"><a class="button"  href='javascript:seleccion(2);'> Anterior </a></span>
                            <span style="float: right"><a class="button" href='javascript:seleccion(4);'> Siguiente </a></span>
                        </div>
                        <br><br>
                    </div>                    

                    <div id="opci4" class="divformulario" style="display: none; width: 500px">

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
                                        <html:select name="PlanillaUSB" styleId="prog_princ" onclick="cambia_pais();cambiar_link1()" property="nombreProgramaOpcion1"> 
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
                                        <html:select styleId="pais_princ" onclick="cambia_universidad()" property="paisOpcion1"> 
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
                                        <html:select styleId="prog_princ2" onclick="cambia_pais2();cambiar_link2()" property="nombreProgramaOpcion2" name="PlanillaUSB"> 
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
                                        <html:select styleId="pais_princ2" onclick="cambia_universidad2()" property="paisOpcion2"> 
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
                            <span style="float: left"><a class="button"  href='javascript:seleccion(3);'> Anterior </a></span>
                            <span style="float: right"><a class="button" href='javascript:seleccion(5);'> Siguiente </a></span>
                        </div>
                        <br><br>
                    </div>

                    <div id="opci5" class="divformulario" style="display: none">
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

                            <span style="float: left"><a class="button"  href='javascript:seleccion(4);'> Anterior </a></span>
                            <span style="float: right"><a class="button" href='javascript:seleccion(6);'> Siguiente </a></span>
                        </div>
                        <br><br>
                    </div>

                    <div id="opci6" class="divformulario" style="display: none">
                        <br>

                        <span><a>Paso 1.6: </a><b><a style="text-decoration: underline">DATOS DE FINANCIAMIENTO</a></b></span>
                        <br>
                        <br>
                        <table border="0"  align="center">
                            <tbody>
                                <tr>
                                    <td style="font-weight: bold"> Principal Fuente de Ingresos: </td>
                                    <td><html:select name="PlanillaUSB" property="fuenteFinanciamiento">
                                            <html:option value="Seleccione"></html:option>
                                            <html:option value="Personal"></html:option>
                                            <html:option value="Familiar"></html:option>
                                            <html:option value="Otro"></html:option>
                                        </html:select>  
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="fuenteFinanciamiento"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Especifique:
                                        <html:text name="PlanillaUSB" property="descripcion1" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>     
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="descripcion1"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> ¿Recibe algún tipo de ayuda económica?: </td>
                                    <td><html:select name="PlanillaUSB" property="ayudaEc">
                                            <html:option value="Seleccione"></html:option>
                                            <html:option value="Si"></html:option>
                                            <html:option value="No"></html:option>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="ayudaEc"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Especifique:
                                        <html:text name="PlanillaUSB" property="descripcion2" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text> 
                                    </td>                    
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="descripcion2"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <br>
                        <div>

                            <span style="float: left"><a class="button"  href='javascript:seleccion(5);'> Anterior </a></span>
                            <span style="float: right"><a class="button" href='javascript:seleccion(7);'> Siguiente </a></span>
                        </div>
                        <br>
                        <br>
                    </div>

                    <div id="opci7" class="divformulario" style="display: none">
                        <br>

                        <span><a>Paso 1.7: </a><b><a style="text-decoration: underline">CONTACTO EN CASO DE EMERGENCIA</a></b></span>
                        <br>
                        <br>
                        <table border="0"  align="center">
                            <tbody>

                                <tr>
                                    <td style="font-weight: bold"> Apellidos: </td>
                                    <td>
                                        <html:text name="PlanillaUSB" property="apellidosRep" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr> 
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="apellidosRep" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> Nombres: </td>
                                    <td>
                                        <html:text name="PlanillaUSB" property="nombresRep" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="nombresRep" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> Teléfono Celular: </td>
                                    <td>
                                        <html:text name="PlanillaUSB" property="celRep" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="celRep" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> Teléfono Casa: </td>
                                    <td>
                                        <html:text name="PlanillaUSB" property="tlfRepCasa" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>                      
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="tlfRepCasa" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> E-mail: </td>
                                    <td>
                                        <html:text name="PlanillaUSB" property="emailRep" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="emailRep" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> Relación con el Estudiante: </td>
                                    <td>
                                        <html:text name="PlanillaUSB" property="relacion" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="relacion" />
                                    </td>
                                </tr>

                                <tr>

                                    <td style="font-weight: bold">Dirección: </td>

                                    <td>
                                        <html:textarea name="PlanillaUSB" property="direccionRep" cols="20" rows="7"  errorStyleClass="error"
                                                       errorKey="org.apache.struts.action.ERROR">
                                        </html:textarea >
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="direccionRep" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <br>
                        <span style="float: left"><a class="button"  href='javascript:seleccion(6);'> Anterior </a></span>
                        <br>
                        <p  align=center>
                            <html:submit> GUARDAR  </html:submit>
                        </p> 
                    </div>                



                </html:form>
            </div>
        </div>
    </div>
    <br>

    <!-- CARGA DE DOCUMENTOS -->

    <div class="nav" style="text-align: center;">
        <a href="#" onclick=" if (true) hide('datosplanilla'), show('archivos'),hide('plan'),hide('idio')"> 2. Documentos requeridos </a>
    </div>
    <div id="archivos" style="display: none; width: 80%;margin-left: 15%">
        <h5>Los archivos permitidos a cargar son aquellos con formato
            PDF JPG o PNG, sin excepción</h5>
        <h5>El tamaño maximo de la carga de archivos es de 3Mb</h5>

        <h5 id="parra"></h5>
        <div style="width:99%;height:auto;border:3px solid #126598; border-radius: 10px;background: #dcebe8">
            <div align=center>
                <html:form action="/FileUploadAction" method="post" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="FileUploadForm" property="nombreusuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>
                    <div style="width:auto;height:auto;">
                        <table id="dataTable" width="350px" cellspacing="14px">
                            <tbody id="dataBody">
                                <tr>
                                    <td></td>
                                    <td>Foto</td>
                                    <td valign="left">
                                        <div id="archivos" >
                                            <div id="elarchi" class="feed">  
                                                <html:file value="hola" onchange="Sumar()" property="theFile[0]"></html:file>
                                                <br />
                                            </div>
                                        </div>

                                    </td> 
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Informe Académico</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  
                                                <html:file value="chao" onchange="Sumar()" property="theFile[1]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Carta de Motivación</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  
                                                <html:file value="hello" onchange="Sumar()" property="theFile[2]" />
                                                <br />
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><a style="color: red; font-size: 14px; font-weight: bold">*</a>Planilla CINDA/SMILE</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  
                                                <html:file value="bye" onchange="Sumar()" property="theFile[3]" />
                                                <br />
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><a style="color: red; font-size: 14px; font-weight: bold">**</a>Certificado de idiomas</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  
                                                <html:file value="bye" onchange="Sumar()" property="theFile[4]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                            </tbody>
                        </table>  
                    </div>
                    <p style="color: red; font-size: 12px; font-weight: bold">*Sólo para quienes apliquen a uno de estos programas</p>  
                    <p style="color: red; font-size: 12px; font-weight: bold">**Sólo para quienes apliquen a países que NO sean de habla hispana</p>  
                    <input type="button" value="Seleccionar Otro Documento" style="font-size:12px; padding:4px 6px" onclick="addRow('dataBody')">
                    <input type="button" value="Eliminar Documentos Seleccionados" style="font-size:12px; padding:4px 6px" onclick="deleteRow('dataTable')"/>

                </div>
            </div>
            <p  align=center>
                <html:submit>Cargar Documentos </html:submit>
            </p>
        </html:form>
    </div>
    <br />

    <!--Carga Materias-->

    <div class="nav" style="text-align: center;">
        <a href="#" onclick=" if (true) hide('datosplanilla'), hide('archivos'),show('plan'),hide('idio')"> 3. Plan de Estudio </a>
    </div>

    <div id="plan" style="display: none; width: 75%;margin-left: 20%">

        <div style="width:auto;height:auto;border:3px solid #126598; border-radius: 10px;background: #dcebe8">
            <div align=center>
                <html:form action="/AccionPlanDeEstudio" acceptCharset="ISO-8859-1" method="post" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="PlanDeEstudio" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>

                    <table border="0"  align="center" style="margin-left: auto;margin-right: auto">


                        <tbody id ="MateBody">
                            <tr>
                                <td></td>
                                <td> Código-USB</td>

                                <td> Nombre-USB</td>

                                <td> Créditos-USB</td>

                                <td> Codigo-Univ. Destino</td>

                                <td> Nombre-Univ. Destino</td>                                

                                <td> Créditos-Univ. Destino</td>

                            </tr>
                            <logic:iterate name="plan" id="planid">
                                <tr>
                                    <td></td>
                                    <td style="width: 150px; font-weight: bold;border-bottom: 1pt solid black">
                                        <bean:write name="planid" property="camp1" />
                                    </td>
                                    <td style="width: 200px; font-weight: bold;border-bottom: 1pt solid black">
                                        <bean:write name="planid" property="camp2" />
                                    </td>
                                    <td style="width: 220px; font-weight: bold;border-bottom: 1pt solid black">
                                        <bean:write name="planid" property="camp3" />
                                    </td>
                                    <td style="width: 220px; font-weight: bold;border-bottom: 1pt solid black">
                                        <bean:write name="planid" property="camp4" />
                                    </td>
                                    <td style="width: 220px; font-weight: bold;border-bottom: 1pt solid black">
                                        <bean:write name="planid" property="camp5" />
                                    </td>
                                    <td style="width: 220px; font-weight: bold;border-bottom: 1pt solid black">
                                        <bean:write name="planid" property="camp6" />
                                    </td>
                                </tr>
                            </logic:iterate>
                                <tr>
                                    <td>Marque para Eliminar</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            <tr>
                                <td> <input type="checkbox" name="c[]" style="align-center"></td>
                                <td>
                                    <html:text name="PlanDeEstudio" property="codigoUSB[0]" maxlength="45" errorStyleClass="error" value="" style="width:80%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:text name="PlanDeEstudio" property="materiaUSB[0]" maxlength="45" errorStyleClass="error" value="" style="width:80%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:text name="PlanDeEstudio" property="creditosUSB[0]" maxlength="45" errorStyleClass="error" value="" style="width:80%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:text name="PlanDeEstudio" property="codigoUniv[0]" maxlength="45" errorStyleClass="error" value="" style="width:60%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:text name="PlanDeEstudio" property="materiaUniv[0]" maxlength="45" errorStyleClass="error" value="" style="width:60%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:text name="PlanDeEstudio" property="creditosUniv[0]" maxlength="45" errorStyleClass="error" value="" style="width:60%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                            </tr>

                        </tbody>
                    </table>
                    <input type="button"  value="Agregar Materia" style="font-size:16px; padding:4px 6px;" onclick="addMate('MateBody')"/>
                    <input type="button" value="Eliminar Materia" style="font-size:16px; padding:4px 6px" onclick="deletePlan('MateBody')"/>

                </div>
            </div>
            <p  align=center>
                <html:submit>Cargar Plan </html:submit>
            </p>
        </html:form>
    </div>

    <br>
<!--Carga Idiomas-->

    <div class="nav" style="text-align: center; width: 100%">
        <a href="#" onclick=" if (true) hide('datosplanilla'), hide('archivos'),hide('plan'),show('idio')"> 4. Dominio de idiomas</a>
    </div>

    <div id="idio" style="display: none; width: 88%; margin-left: 12%">
        <div style="width:auto;height:auto;border:3px solid #126598; border-radius: 10px;background: #dcebe8">
            <div align=center>
                <html:form action="/CargarIdioma" method="post" acceptCharset="ISO-8859-1" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="Idiomas" property="nombreusuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>


                    <table border="0"  align="center" style="margin-left: auto;margin-right: auto;width: 100%">
                        <tbody id ="IdioBody">

                            <tr>
                                <td></td>
                                <td> Idioma que maneja:</td>
                                <td>Nivel Verbal</td>
                                <td>Nivel Escrito</td>
                                
                                <td>Nivel Auditivo</td>
                            </tr>
                            <logic:iterate name="lang" id="langid">
                                <tr>
                                    <td></td>
                                    <td style="width: 150px; font-weight: bold;border-bottom: 1pt solid black">
                                        <bean:write name="langid" property="camp1" />
                                    </td>
                                    <td style="width: 200px; font-weight: bold;border-bottom: 1pt solid black">
                                        <bean:write name="langid" property="camp2" />
                                    </td>
                                    <td style="width: 220px; font-weight: bold;border-bottom: 1pt solid black">
                                        <bean:write name="langid" property="camp3" />
                                    </td>
                                    <td style="width: 220px; font-weight: bold;border-bottom: 1pt solid black">
                                        <bean:write name="langid" property="camp4" />
                                    </td>
                                    <td style="width: 220px; font-weight: bold;border-bottom: 1pt solid black">
                                        <bean:write name="langid" property="camp5" />
                                    </td>
                                </tr>
                            </logic:iterate>
                            <tr>
                                <td><input type="checkbox" name="ch"/></td>


                                <td>
                                    <html:text name="Idiomas" property="idiomaDest[0]" maxlength="45" style="width:80%;" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>
                                <td>

                                    <html:select property="nivelVerbal[0]" style="width:80%;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <!--html:select property="nivelVerbal[0]" style="width:50px;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR"-->
                                        <html:option value=""></html:option>
                                        <html:option value="Basico">Basico</html:option>
                                        <html:option value="Intermedio">Intermedio</html:option>
                                        <html:option value="Avanzado">Avanzado</html:option>
                                    </html:select>
                                </td>
                                <td>
                                    <html:select property="nivelEscrito[0]" style="width:80%;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <!--html:select property="nivelEscrito[0]" style="width:50px;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR"-->
                                        <html:option value=""></html:option>
                                        <html:option value="Basico">Basico</html:option>
                                        <html:option value="Intermedio">Intermedio</html:option>
                                        <html:option value="Avanzado">Avanzado</html:option>
                                    </html:select>
                                </td>
                                <td>
                                    <html:select property="nivelConversacional[0]" style="width:80%;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <!--html:select property="nivelConversacional[0]" style="width:50px;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR"-->
                                        <html:option value=""></html:option>
                                        <html:option value="Basico">Basico</html:option>
                                        <html:option value="Intermedio">Intermedio</html:option>
                                        <html:option value="Avanzado">Avanzado</html:option>
                                    </html:select>
                                </td>
                                <td>
                                    <html:select property="nivelAuditivo[0]" style="width:80%;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <!--html:select property="nivelAuditivo[0]" style="width:50px;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR"-->
                                        <html:option value=""></html:option>
                                        <html:option value="Basico">Basico</html:option>
                                        <html:option value="Intermedio">Intermedio</html:option>
                                        <html:option value="Avanzado">Avanzado</html:option>
                                    </html:select>
                                </td>

                            </tr>

                        </tbody>
                    </table>
                    <input type="button"  value="Especificar Otro Idioma" style="font-size:16px; padding:4px 6px;" onclick="addIdi('IdioBody')"/>
                    <input type="button" value="Eliminar Seleccionados" style="font-size:16px; padding:4px 6px" onclick="deleteRow2('IdioBody')"/>

                    <p  align=center>
                        <html:submit> GUARDAR </html:submit>
                    </p>
                </html:form>
            </div>
        </div>
    </div>
</html:html>
