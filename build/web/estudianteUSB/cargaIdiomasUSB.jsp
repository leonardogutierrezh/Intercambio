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

    <h4 align ="center">Dominio de Idiomas</h4>

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


<!--Carga Idiomas-->

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
</html:html>
