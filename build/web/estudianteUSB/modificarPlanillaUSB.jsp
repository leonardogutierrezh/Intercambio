<%-- 
    Document   : llenarPlanilaUSB
    Created on : 26/12/2013, 08:11:36 AM
    Author     : andel
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
        <!-- <a href="#" onclick=" if (true) show('datosplanilla'), hide('archivos'),hide('plan'),hide('idio')"> 1. Formulario de Datos </a> -->
        <p><h2>1. Formulario de Datos</h2></p>
    </div>
    
    
    <html:form action="/ModificarPlanilla_EstUSB"  method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
            <fieldset>
                    <p hidden="true"><html:text name="PlanillaUSB" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>
                    <br>

                    
                        <br>
                        <legend>
                        <span><a> Paso 1.1: </a><b><a style="text-decoration: underline">DATOS PERSONALES</a></b></span>
                        </legend>
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
                                        <bean:define id="pla_nacionalidad" name="pla_USB" property="nacionalidad"/>
                                        <html:text name="PlanillaUSB" property="nacionalidad" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_nacionalidad.toString()%>">
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
                                        <bean:define id="pla_cedula" name="pla_USB" property="cedula"/>
                                        <html:text name="PlanillaUSB" property="cedula" maxlength="10" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_cedula.toString()%>">
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
                        </fieldset>
                        <fieldset>
                        <legend>
                        <span><a>Paso 1.2: </a><b><a style="text-decoration: underline">INFORMACIÓN DE DOMICILIO</a></b></span>
                        </legend>
                        <br>
                        <br>
                        <table border="0"  align="center">
                            <tbody>                
                                <tr>
                                    <td style="font-weight: bold">Urb / Sector / Barrio</td>

                                    <td>
                                        <bean:define id="pla_urbanizacion" name="pla_USB" property="urbanizacion"/>
                                        <html:text name="PlanillaUSB" property="urbanizacion" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_urbanizacion.toString()%>"></html:text>
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
                                        <bean:define id="pla_calle" name="pla_USB" property="calle"/>
                                        <html:text name="PlanillaUSB" property="calle" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_calle.toString()%>"></html:text>
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
                                        <bean:define id="pla_edificio" name="pla_USB" property="edificio"/>
                                        <html:text name="PlanillaUSB" property="edificio" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_edificio.toString()%>"></html:text>
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
                                        <bean:define id="pla_apartamento" name="pla_USB" property="apartamento"/>
                                        <html:text name="PlanillaUSB" property="apartamento" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_apartamento.toString()%>"></html:text>
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
                                        <bean:define id="pla_ciudad" name="pla_USB" property="ciudad"/>
                                        <html:text name="PlanillaUSB" property="ciudad"  maxlength="30" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_ciudad.toString()%>">
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
                                        <bean:define id="pla_estado" name="pla_USB" property="estado"/>
                                        <html:text name="PlanillaUSB" property="estado" maxlength="30" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_estado.toString()%>">
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
                                        <bean:define id="pla_codPostal" name="pla_USB" property="codPostal"/>
                                        <html:text name="PlanillaUSB" property="codPostal"  maxlength="30" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_codPostal.toString()%>">
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
                        </fieldset>
                        <fieldset>
                        <legend>
                        <span><a>Paso 1.3: </a><b><a style="text-decoration: underline">DATOS DE CONTACTO</a></b></span>
                        </legend>
                        <br>
                        <br>
                        <table border="0"  align="center">
                            <tbody>

                                <tr>

                                    <td style="font-weight: bold"> Teléfono celular:</td>

                                    <td>
                                        <bean:define id="pla_telefonoCelular" name="pla_USB" property="telefonoCelular"/>
                                        <html:text name="PlanillaUSB" property="telefonoCelular" maxlength="15" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_telefonoCelular.toString()%>">
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
                                        <bean:define id="pla_telefonoCasa" name="pla_USB" property="telefonoCasa"/>
                                        <html:text name="PlanillaUSB" property="telefonoCasa" maxlength="15" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_telefonoCasa.toString()%>">
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
                                        <bean:define id="pla_email" name="pla_USB" property="email"/>
                                        <html:text name="PlanillaUSB" property="email" maxlength="45"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_email.toString()%>">
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
                        </fieldset>
                        <fieldset>
                        <legend>

                        <span><a>Paso 1.4: </a><b><a style="text-decoration: underline">PROGRAMAS</a></b></span>
                        </legend>
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
                        </fieldset>
                        <fieldset>
                        <legend>
                        <span><a>Paso 1.5: </a><b><a style="text-decoration: underline">INFORMACIÓN ACADÉMICA</a></b></span>
                        </legend>
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
                                        <bean:define id="pla_creditosApro" name="pla_USB" property="creditosApro"/>
                                        <html:text name="PlanillaUSB" property="creditosApro" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_creditosApro.toString()%>">
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
                                        <bean:define id="pla_indice" name="pla_USB" property="indice"/>
                                        <html:text name="PlanillaUSB" property="indice" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_indice.toString()%>">
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
                        </fieldset>
                        <fieldset>
                        <legend>
                        <span><a>Paso 1.6: </a><b><a style="text-decoration: underline">DATOS DE FINANCIAMIENTO</a></b></span></legend>
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
                                        <bean:define id="pla_descripcion1" name="pla_USB" property="descripcion1"/>
                                        <html:text name="PlanillaUSB" property="descripcion1" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_descripcion1.toString()%>">
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
                                        <bean:define id="pla_descripcion2" name="pla_USB" property="descripcion2"/>
                                        <html:text name="PlanillaUSB" property="descripcion2" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_descripcion2.toString()%>">
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
                        </fieldset>
                        <fieldset>
                        <legend><span><a>Paso 1.7: </a><b><a style="text-decoration: underline">CONTACTO EN CASO DE EMERGENCIA</a></b></span></legend>
                        <br>
                        <br>
                        <table border="0"  align="center">
                            <tbody>

                                <tr>
                                    <td style="font-weight: bold"> Apellidos: </td>
                                    <td>
                                        <bean:define id="pla_apellidosRep" name="pla_USB" property="apellidosRep"/>
                                        <html:text name="PlanillaUSB" property="apellidosRep" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_apellidosRep.toString()%>">
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
                                        <bean:define id="pla_nombresRep" name="pla_USB" property="nombresRep"/>
                                        <html:text name="PlanillaUSB" property="nombresRep" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_nombresRep.toString()%>">
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
                                        <bean:define id="pla_celRep" name="pla_USB" property="celRep"/>
                                        <html:text name="PlanillaUSB" property="celRep" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_celRep.toString()%>">
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
                                        <bean:define id="pla_tlfRepCasa" name="pla_USB" property="tlfRepCasa"/>
                                        <html:text name="PlanillaUSB" property="tlfRepCasa" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_tlfRepCasa.toString()%>">
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
                                        <bean:define id="pla_emailRep" name="pla_USB" property="emailRep"/>
                                        <html:text name="PlanillaUSB" property="emailRep" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_emailRep.toString()%>">
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
                                        <bean:define id="pla_relacion" name="pla_USB" property="relacion"/>
                                        <html:text name="PlanillaUSB" property="relacion" maxlength="80"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR" value="<%=pla_relacion.toString()%>">
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
                                        <bean:define id="pla_direccionRep" name="pla_USB" property="direccionRep"/>
                                        <html:textarea name="PlanillaUSB" property="direccionRep" cols="20" rows="7"  errorStyleClass="error"
                                                       errorKey="org.apache.struts.action.ERROR" value="<%=pla_direccionRep.toString()%>">
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
                       
                        
            </fieldset>
                <p style="text-align: center">
                        <input type="submit" id="botonLogin" value="Guardar">  <br>  
                    </p>
                </html:form>
    

</html:html>
