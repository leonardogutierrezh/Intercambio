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

    <h4 align ="center">Plan De Estudios</h4>

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

    <!--Carga Materias-->


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
    <br>

</html:html>
