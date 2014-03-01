<%-- 
    Document   : postular_documentos
    Created on : Jan 22, 2014, 5:18:25 PM
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
        <h4 align ="center">Documentos Requeridos</h4>

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
        <div id="archivos" style="display: block; width: 80%;margin-left: 15%">
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

    </body>
</html>
