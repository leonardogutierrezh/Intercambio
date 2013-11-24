<%-- 
    Document   : recuperarContrasena
    Created on : Oct 25, 2012, 7:16:30 PM
    Author     : caponte
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html:html lang="true">
    <script  src="/Intercambio/css/jquery.js"></script>
    <script>
        $(document).ready(function(){
            if (!$('#captmal').is(':empty')){
                $('#capt').addClass("error")
            }
        })
    </script>

    <title>Sistema de Gesti&oacute;n de Intercambio</title>

    <div id="loginDiv" class="unhidden">
        <h4>Recuperación de contraseña</h4>
        <h5>Para recuperar su contraseña por favor indique</h5>
        <h5>su nombre de usuario y/o e-mail:</h5>
        <div align="center">
            <html:form action="/recContrasena" onsubmit= "return(this)">
                <table>
                    <tr>
                        <td> Usuario </td>
                        <td><html:text name="Usuario" property="nombreusuario" size="14"
                                   errorStyleClass="error" errorKey="org.apache.struts.action.ERROR"></html:text>
                            </td>
                        </tr>
                        <tr>
                            <td style="color:firebrick" colspan="2"><html:errors property="nombreusuario"/></td>
                    </tr>

                    <tr>
                        <td> E-mail</td>
                        <td><html:text name="Usuario" property="email" value="" size="14"
                                   errorStyleClass="error" errorKey="org.apache.struts.action.ERROR" ></html:text>
                            </td>
                        </tr>
                        <tr>
                            <td style="color:firebrick" colspan="2"><html:errors property="email"/></td>
                    </tr>
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

                <html:submit value="Recuperar">Recuperar contraseña</html:submit>
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

</html:html>
