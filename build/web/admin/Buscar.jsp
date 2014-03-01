<%-- 
    Document   : Buscar
    Created on : 28-mar-2013, 11:41:23
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<% Object var = session.getAttribute("nombreusuario");%>
<!DOCTYPE html>
<html>
    <head>
        <script  src="/Intercambio/css/jquery.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Búsqueda</title>
        <script>
            $(document).ready(function(){
                var cont = 0;
                $("#estudia").click(function(evento){
                    if ($("#estudia").attr("checked")){
                        $("#estu").css("display", "block");
                        $("#filtros").css("display", "block");
                        cont++;
                    }else{
                        $("#estu").css("display", "none");
                        cont--;
                        if (cont === 0){
                           $("#filtros").css("display", "none"); 
                        }
                    }
                });
                $("#corina").click(function(evento){
                    if ($("#corina").attr("checked")){
                        $("#cordi").css("display", "block");
                        $("#filtros").css("display", "block");
                        cont++;
                    }else{
                        $("#cordi").css("display", "none");
                        cont--;
                        if (cont === 0){
                           $("#filtros").css("display", "none"); 
                        }
                    }
                });
                $("#gestia").click(function(evento){
                    if ($("#gestia").attr("checked")){
                        $("#gesto").css("display", "block");
                        $("#filtros").css("display", "block");
                        cont++;
                    }else{
                        $("#gesto").css("display", "none");
                        cont--;
                        if (cont === 0){
                           $("#filtros").css("display", "none"); 
                        }
                    }
                });
            });
            function deselecionar(){
                var filas = document.getElementsByTagName('input');
                for (i=0;i<filas.length;i++){
                    if(filas[i].type == "checkbox"){
                        filas[i].checked=0;
                        
                    }
                        
                }
            }
            window.onload=function(){
                deselecionar();
            }
        </script>
    </head>

        <h4>Búsqueda de Destinatarios</h4>
        <h3 align="center">Para redactar un anuncio primero debe hacer la búsqueda de los destinatarios </h3>
        <h5>Seleccione el/los filtros que desea utilizar.</h5>
        <div align="center" id="seleciones">
            <input type="checkbox" value="1" id="estudia"> Estudiantes
            <input type="checkbox" value="2" id="corina"> Postulante
            <input type="checkbox" value="3" id="gestia"> Gestores

        </div>
        <div id="login-form" style="border: #126598 solid;width: 70%;border-radius: 5px;">
            <div id ="filtros" hidden="true"><h5><strong>Seleccione el/los filtros</strong></h5></div>
            <html:form action="/AccionBusquedaAvanzada" acceptCharset="ISO-8859-1" method="POST" enctype="multipart/form-data" onsubmit="return(this)">
                <%--<html:hidden property="nombreSolicitante" value="<%=var.toString()%>"/>--%>
                <html:hidden property="confirmar" value="anuncios"/>
                <div style="display: none" id="estu">
                    <table border="0" >
                        <tbody>
                            <tr>
                                <td style="color: black">Nombre estudiante:</td>
                                <td style="color: black">Apellido estudiante:</td>
                            </tr>
                            <tr>
                                <td>
                                    <html:text property="nombre" maxlength="30" errorStyleClass="error" value=""
                                               errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                    <td>
                                    <html:text property="apellido" maxlength="30" errorStyleClass="error" value=""
                                               errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color: black">Carnet:</td>
                                    <td style="color: black">Índice:</td>
                                </tr>
                                <tr>
                                    <td>
                                    <html:text property="carnet" maxlength="8" errorStyleClass="error" value=""
                                               errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                    <td>
                                    <html:text property="indice" maxlength="7" errorStyleClass="error" value=""
                                               title="Coloque Simbolo de Comparación >,< o ="
                                               errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="color: black">Carrera: </td>
                                </tr>

                                <tr>

                                    <td>
                                        <html:select  property="carrera" value="N/A">
                                        <html:option value="N/A"></html:option>
                                        <html:option value="Licenciatura en Quimica"></html:option>
                                        <html:option value="Licenciatura en Matematicas"></html:option>
                                        <html:option value="Licenciatura en Fisica"></html:option>
                                        <html:option value="Licenciatura en Biologia"></html:option>
                                        <html:option value="Arquitectura"></html:option>
                                        <html:option value="Urbanismo"></html:option>
                                        <html:option value="Ingenieria Electrica"></html:option>
                                        <html:option value="Ingenieria Mecanica"></html:option>
                                        <html:option value="Ingenieria Quimica"></html:option>
                                        <html:option value="Ingenieria Electrica"></html:option>
                                        <html:option value="Ingenieria Mecanica"></html:option>
                                        <html:option value="Ingenieria Electronica"></html:option>
                                        <html:option value="Ingenieria de Computacion"></html:option>
                                        <html:option value="Ingenieria Geofisica"></html:option>
                                        <html:option value="Ingenieria de Materiales"></html:option>
                                        <html:option value="Ingenieria de Produccion"></html:option>
                                        <html:option value="Ingenieria de Telecomunicaciones"></html:option>
                                        <html:option value="Ingenieria de Mantenimeinto"></html:option>
                                        <html:option value="Licenciatura en Gestion de la Hospitalidad"></html:option>
                                        <html:option value="Licenciatura en Comercio Internacion"></html:option>
                                        <html:option value="Tecnología  Electrica"></html:option>
                                        <html:option value="Tecnología  Electronica"></html:option>
                                        <html:option value="Organizacion Empresarial"></html:option>
                                        <html:option value="Tecnologia Mecanica"></html:option>
                                        <html:option value="Mantenimiento Aeronautico"></html:option>
                                        <html:option value="Administración del Turismo"></html:option>
                                        <html:option value="Administración Hotelera"></html:option>
                                        <html:option value="Administración del Transporte"></html:option>
                                        <html:option value="Administración Aduanera"></html:option>
                                    </html:select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="color:firebrick">
                                    <html:errors property="Carrera" />
                                </td>
                            </tr>

                            <tr>
                                <td style="color: black">País de destino: </td>
                            </tr>

                            <tr>
                                <td>
                                    <html:select  property="pais" value="N/A">
                                        <html:option value="N/A"></html:option>
                                        <html:option value="Alemania"></html:option>
                                        <html:option value="Argentina"></html:option>
                                        <html:option value="Australia"></html:option>
                                        <html:option value="Bélgica"></html:option>
                                        <html:option value="Bolivia"></html:option>
                                        <html:option value="Brasil"></html:option>
                                        <html:option value="Canadá"></html:option>
                                        <html:option value="Chile"></html:option>
                                        <html:option value="Colombia"></html:option>
                                        <html:option value="CostaRica"></html:option>
                                        <html:option value="Ecuador"></html:option>
                                        <html:option value="España"></html:option>
                                        <html:option value="EstadosUnidos"></html:option>
                                        <html:option value="Francia"></html:option>
                                        <html:option value="Italia"></html:option>
                                        <html:option value="Japón"></html:option>
                                        <html:option value="México"></html:option>
                                        <html:option value="Noruega"></html:option>
                                        <html:option value="Paraguay"></html:option>
                                        <html:option value="Perú"></html:option>
                                        <html:option value="Polonia"></html:option>
                                        <html:option value="Portugal"></html:option>
                                        <html:option value="PuertoRico"></html:option>
                                        <html:option value="ReinoUnido"></html:option>
                                        <html:option value="RepúblicaCheca"></html:option>
                                        <html:option value="Suecia"></html:option>
                                        <html:option value="Uruguay"></html:option>
                                        <html:option value="Venezuela"></html:option>
                                    </html:select>
                                </td>


                            </tr>
                            <tr>
                                <td style="color: black">Primera opción: </td>       
                            </tr>


                        </tbody>
                    </table>
                    <html:select  property="opcion1" value="N/A">
                        <html:option value="N/A"></html:option>
                        <html:option value="Universidad de Karlsruhe"></html:option>
                        <html:option value="Universidad de Siegen"></html:option>
                        <html:option value="Universidad de Stuttgart"></html:option>
                        <html:option value="Universidad Nacional de Cuyo"></html:option>
                        <html:option value="Universidad Nacional de Quilmes"></html:option>
                        <html:option value="Universidad Nacional de San Martín"></html:option>
                        <html:option value="Universidad Tecnológica de Swinburne"></html:option>
                        <html:option value="Universidad Católica de Lovaina"></html:option>
                        <html:option value="Universidad Privada Santa Cruz de la Sierra"></html:option>
                        <html:option value="Universidad Federal de Río de Janeiro"></html:option>
                        <html:option value="Universidad de Sao Paulo"></html:option>
                        <html:option value="Universidad Estadual de Campinas"></html:option>
                        <html:option value="Instituto de Tecnología de Ontario"></html:option>
                        <html:option value="Universidad Externado"></html:option>
                        <html:option value="Pontificia Universidad Bolivariana"></html:option>
                        <html:option value="Pontificia Universidad Javeriana"></html:option>
                        <html:option value="Universidad de los Andes"></html:option>
                        <html:option value="Universidad del Norte"></html:option>
                        <html:option value="Universidad del Valle"></html:option>
                        <html:option value="Pontifica Universidad Católica de Chile"></html:option>
                        <html:option value="Pontificia Universidad Católica de Valparaíso"></html:option>
                        <html:option value="Universidad Austral de Chile"></html:option>
                        <html:option value="Universidad de Concepción"></html:option>
                        <html:option value="Universidad de Talca"></html:option>
                        <html:option value="Universidad de Tarapacá"></html:option>
                        <html:option value="Universidad de Costa Rica"></html:option>    
                        <html:option value="Pontificia Universidad Católica Madre y Maestra"></html:option> 
                        <html:option value="Instituto Tecnológico de Santo Domingo"></html:option> 
                        <html:option value="Escuela Superior Politécnica del Litoral"></html:option>    
                        <html:option value="Universidad de las Islas Baleares"></html:option>
                        <html:option value="Universidad de Santiago de Compostela"></html:option>
                        <html:option value="Universitat Oberta de Catalunya"></html:option>
                        <html:option value="Universidad de Barcelona"></html:option>
                        <html:option value="Universidad Carlos III de Madrid"></html:option>
                        <html:option value="Universidad de Granada"></html:option>
                        <html:option value="Universidad Politécnica de Madrid"></html:option>
                        <html:option value="Universidad Politécnica de Cataluña"></html:option>
                        <html:option value="Universidad Politécnica de Valencia"></html:option>
                        <html:option value="Universidad de Zaragoza"></html:option>
                        <html:option value="Universidad de Nuevo México"></html:option>
                        <html:option value="Universidad de Oklahoma"></html:option>
                        <html:option value="Universidad Abo Akademi"></html:option>
                        <html:option value="Arts et Metiers ParisTech"></html:option>
                        <html:option value="Escuela de Minas de Nantes"></html:option>
                        <html:option value="EPF Escuela de Ingenieros"></html:option>
                        <html:option value="INSA – Lyon"></html:option>
                        <html:option value="TELECOM – SudParis"></html:option>
                        <html:option value="Universidad Tecnológica de Compiegne"></html:option>
                        <html:option value="Universidad Paris Ouest Nanterre"></html:option>
                        <html:option value="Universidad Paris Est Marne la Valle"></html:option>
                        <html:option value="Politécnico de Milano"></html:option>
                        <html:option value="Politécnico de Torino"></html:option>
                        <html:option value="Universidad Degli Studi Di Genova"></html:option>
                        <html:option value="Universidad Degli Studi Di Siena"></html:option>
                        <html:option value="Universidad Tecnológica de Nagaoka"></html:option>
                        <html:option value="Universidad de Tohoku"></html:option>
                        <html:option value="ITESM Monterrey"></html:option>
                        <html:option value="Universidad Autónoma Metropolitana"></html:option>
                        <html:option value="Instituto Tecnológico Superior de Cajeme(ITESCA)"></html:option>
                        <html:option value="Universidad Veracruzana"></html:option>
                        <html:option value="NTNU-Trondheim"></html:option>
                        <html:option value="Universidad San Martín de Porres"></html:option>
                        <html:option value="Pontificia Universidad Católica del Perú"></html:option>
                        <html:option value="Universidad de Lima"></html:option>
                        <html:option value="Universidad del Pacífico"></html:option>
                        <html:option value="Universidad Peruana Cayetano Heredia"></html:option>
                        <html:option value="Universidad de Panamá"></html:option>
                        <html:option value="Universidad Católica de Nuestra Señora de la Asunción"></html:option>
                        <html:option value="AGH Universidad de Ciencias y Tecnología"></html:option>
                        <html:option value="Universidad Técnica de Lisboa"></html:option>
                        <html:option value="Universidad de Puerto Rico"></html:option>
                        <html:option value="Universidad de Ulster"></html:option>
                        <html:option value="Universidad Técnica Checa en Praga (CTU)"></html:option>
                        <html:option value="Real Instituto de Estocolmo KTH"></html:option>
                        <html:option value="Universidad de Lund"></html:option>
                        <html:option value="Universidad de Uppsala"></html:option>
                        <html:option value="Universidad Centroccidental Lisandro Alvarado"></html:option>
                    </html:select>
                    </div>

                    <br>
                    <div id="cordi" align="center" style="display: none">
                        <table border="0">
                            <tr>
                                <td>
                                    Nombre postulante:
                                </td>
                                <td>
                                <html:text property="nombrePostu" maxlength="30" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR" value=""></html:text>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Tipo de Postulante
                                </td>
                                <td>
                                <html:text property="tipoPostu" maxlength="30" errorStyleClass="error"
                                           errorKey="org.apache.struts.action.ERROR" value=""></html:text>

                                </td>
                            </tr>
                        </table>
                        <br>
                    </div>
                    <div id="gesto" align="center" style="display: none">
                        <table>
                            <tr>
                                <td>
                                    Gestor:
                                </td>
                                <td>
                                <html:select property="gestor" value="N/A">
                                    <html:option value="Seleccione"></html:option>
                                    <html:option value="Decanato de Estudios Profesionales"></html:option>
                                    <html:option value="Decanato de Estudios Tecnologicos"></html:option>
                                </html:select>
                            </td>
                        </tr>
                    </table>
                    </div>
                    <p style="text-align: center">
                    <html:submit onclick="javascript: return confirm('¿Está seguro que los datos son correctos?')">
                        Realizar búsqueda
                    </html:submit>
                </p>
            </html:form>
        </div>
        <div class="espacio" style="height:90px">
        </div>

    </body>
