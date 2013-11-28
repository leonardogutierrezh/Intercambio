<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>

    <script  src="/Intercambio/css/jquery.js"></script>
    <script>
        $(document).ready(function(){
            if (!$('#captmal').is(':empty')){
                $('#capt').addClass("error")
            }
        })
    </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Gestión de Intercambio</title>
        <html:base/>
    </head>


    <body onload ="clearForms()" onUnload="clearForms()">  

        <div id="loginDiv" class="unhidden">

            <h4>Contáctanos</h4>
            <h5>Por favor complete el formulario a continuación.</h5>

            <div id="login-form">
                <html:form action="/EnviarCorreo"  method="POST" enctype="multipart/form-data" onsubmit="return(this)">
                    <table border="0" >
                        <tbody>
                            <tr>
                                <td style="color: black">Nombre completo:</td>
                                <td>
                                    <html:text name="Nombre" property="nombreRemitente" maxlength="20" value="" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="color:firebrick">
                                    <html:errors property="nombreRemitente" />
                                </td>
                            </tr>

                            <tr>
                                <td style="color: black">Email: </td>
                                <td>
                                    <html:text name="MailRemitente" property="correoRemitente" maxlength="30" value="" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="color:firebrick">
                                    <html:errors property="correoRemitente" />
                                </td>
                            </tr>

                            <tr>
                                <td style="color: black">Asunto: </td>       
                                <td><html:text name="Asunto" property="asunto" maxlength="100" value="" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="color:firebrick">
                                    <html:errors property="asunto" />
                                </td>
                            </tr>
                            <tr>
                                <td style="color: black">Mensaje: </td>
                                <td><html:textarea name="Mensaje" property="mensaje"  value="" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR" cols="30" rows="10"></html:textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="color:firebrick">
                                    <html:errors property="mensaje" />
                                </td>
                            </tr>
                            <tr>
                            <td style="color: black">Coordinación: </td>
                            <td><html:select property="email">
                                        <html:optionsCollection name="email" value="value" label="label"  />
                                    </html:select>
                                </td>
                            </tr> 
                            <%--  <tr>
                                <td style="color: black">Coordinación: </td>
                                <td><select name="select">
                                    <logic:iterate name="usuario" id="usuarios">
                                        <option value="<bean:write name="usuarios" property="email" />"><bean:write name="usuarios" property="nombreusuario" /></option>                    
                                    </logic:iterate>
                                      </select>
                                </td>
                            </tr> --%>
                        </tbody>
                    </table>


                                
                    <div  style="position: relative; height: 120px; bottom: -10px;">
                        <div id="Imagencita" style="height: 75px;">
                            <img onloadstart="loadstart" src="/Intercambio/stickyImg"/>
                            <br><br>
                            <div>
                                <a href="javascript:history.go(0)">Click para cambiar captcha</a>
                            </div>
                        </div>
                        <br><br>
                        <table style="border: none;">
                            <tr style="border: none;">
                                <td style="border: none;" >Captcha</td> 
                                <td style="border: none;" ><input id="capt" name="answer" /></td>
                            </tr>
                            <tr style="border: none;" >
                                <td id="captmal" style="border: none;color:firebrick" colspan="2"><html:errors property="captcha" /></td>
                            </tr>
                        </table>
                    </div>

                    <br><br><br><br>
                    <p style="text-align: center">
                        <html:submit onclick="javascript: return confirm('¿Está seguro que los datos son correctos?')">
                            Enviar mensaje
                        </html:submit>
                    </p>
                </html:form>
            </div>            
        </div>
        <div id="fechaPostulaciones" class="hidden" title=" " style="padding-left: 10%">
            <pre>
        <h2>
            Fecha Límite para Postulaciones:</h2>
                            Inicio en Septiembre: 15 de mayo. 
                            Año Académico: Septiembre-Julio.
                            Trimestres: Septiembre-Diciembre y Enero-Marzo.
                            Sólo Trimestre: Septiembre-Diciembre.


                            Inicio en Enero: 15 de octubre.
                            Trimestres: Enero-Marzo y Abril-Julio.
                            Sólo Trimestre: Enero-Marzo.


                            Inicio en Abril: 30 enero.
                            Sólo Trimestre:Abril-Julio


                            Una vez registrados en el sistema, los estudiantes
                            deberán proporcionar a través de la carga de
                            documentos los siguientes recaudos pautados por su
                            nacionalidad.
            </pre>

        </div>

        <div id="estudianteInter" class="hidden" title=" " style="padding-left: 5%">
            <pre>
            <h2>
                Recaudos que deben Presentar los Estudiantes
                Internacionales para su Postulación</h2>
                                        - Formulario de postulación al Programa de Intercambio de
                                          Estudiantes de la USB para estudiantes internacionales 
                                          firmado y sellado por la Oficina de Relaciones Internacionales
                                          de la universidad de origen.

                                        - Fotocopia del Pasaporte.

                                        - Informe académico actualizado (Transcript Record) firmado y 
                                          sellado por la Oficina de Relaciones Internacionales de la 
                                          universidad de origen.

                                        - Curriculum Vitae.

                                        - Carta de recomendación de un profesor de la universidad de origen.
            </pre>
        </div>

        <div id="estudianteNac" class="hidden" title=" " style="padding-left: 10%">
            <pre>
            <h2>
            Recaudos que deben Presentar los Estudiantes
            Nacionales para su Postulación</h2>
                            - Formulario de postulación al Programa de Intercambio
                              de Estudiantes de la USB para estudiantes nacionales
                              firmado y sellado por la DRIC.

                            - Fotocopia de la Cédula de Identidad.

                            - Informe académico actualizado (Transcript Record).

                            - Curriculum Vitae.

                            - Carta de motivación para los estudios en el exterior.

                            - Fotocopia del Carnet.
            </pre>
        </div>

        <div id="recaudosAdic" class="hidden" title=" " style="padding-left: 10%">
            <pre>
            <h2>
            Requisitos Adicionales:</h2>
                                <b>Programa SMILE:</b>

                                - Student Application-Form.

                                - Student Learning Agreement.


                                <b>Programa de Movilidad Estudiantil CINDA:</b>

                                - Ficha de Solicitud de Participación.

                                - Ficha de Reconocimiento.
            </pre>

        </div>
        <div class="espacio" style="height:90px">
        </div>


    </body>


</html>