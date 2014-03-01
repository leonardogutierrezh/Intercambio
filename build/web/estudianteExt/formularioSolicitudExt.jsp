<%-- 
    Document   : formularioSolicitudExt
    Created on : Feb 27, 2013, 8:48:45 AM
    Author     : dreabalbas
--%>

<%Object var = session.getAttribute("nombreusuario");%>

<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html:html lang="true">

    <script  src="/Intercambio/css/formularioExt.js"></script>

    <title>Sistema de Gestión de Intercambios</title>

    <h4 align ="center"> Formulario de solicitud</h4>
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
        window.onload=function(){
            select()
        }
    </script>


    <div class="nav" style="text-align: center;">
        <a href="#" onclick=" if (true) show('datosplanilla'), hide('archivos'),hide('plan'),hide('idio')"> 1. Formulario de Datos </a>
    </div>

    <div id="datosplanilla" style="display: none;width: 92%; margin-left: 8%">
        <div>
            <div align=center>

                <html:form action="/LlenarPlanilla_EstExt" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
                    <p hidden="true"><html:text name="PlanillaExt" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>
                    <br>

                    <h5>El siguiente formulario consta de 7 pasos, todos los campos son obligatorios</h5>
                    <div id="opci1" class="divformulario" style="display: block">
                        <table border="0"  align="center">
                            <br>
                            <span><a> Paso 1.1: </a><b><a style="text-decoration: underline">DATOS PERSONALES</a></b></span>
                            <tbody>
                            <br>
                            <br>
                            <tr>
                                <td style="font-weight: bold">Primer Apellido</td>

                                <td>
                                    <html:text name="PlanillaExt" property="apellido1" maxlength="80" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR"></html:text>
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
                                    <html:text name="PlanillaExt" property="apellido2" maxlength="80" errorStyleClass="error"
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
                                    <html:text name="PlanillaExt" property="nombre1" maxlength="80" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR"></html:text>
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
                                    <html:text name="PlanillaExt" property="nombre2" maxlength="80" errorStyleClass="error"
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
                                    <input type="date" name="fechaNacimiento" maxlength="80" errorStyleClass="error" />
                                    <!--                               errorKey="org.apache.struts.action.ERROR" />-->
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="color:firebrick">
                                    <html:errors name="fechaNacimiento" />
                                </td>
                            </tr>

                            <tr>
                                <td style="font-weight: bold">Género</td>

                                <td>
                                    <html:select property="sexo" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <html:option value="">Seleccione</html:option>
                                        <html:option value="Femenino">Femenino</html:option>
                                        <html:option value="Masculino">Masculino</html:option>
                                    </html:select>
                                </td>
                            </tr>
                            <tr>
                                <td style="color:firebrick">
                                    <html:errors property="sexo" />
                                </td>

                            </tr>

                            <tr>
                                <td style="font-weight: bold">Nacionalidad</td>

                                <td>
                                    <html:select name="PlanillaExt" property="nacionalidad" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                <option value="">Seleccione</option>
                                <option value="afghan">Afghan</option>
                                <option value="albanian">Albanian</option>
                                <option value="algerian">Algerian</option>
                                <option value="american">American</option>
                                <option value="andorran">Andorran</option>
                                <option value="angolan">Angolan</option>
                                <option value="antiguans">Antiguans</option>
                                <option value="argentinean">Argentinean</option>
                                <option value="armenian">Armenian</option>
                                <option value="australian">Australian</option>
                                <option value="austrian">Austrian</option>
                                <option value="azerbaijani">Azerbaijani</option>
                                <option value="bahamian">Bahamian</option>
                                <option value="bahraini">Bahraini</option>
                                <option value="bangladeshi">Bangladeshi</option>
                                <option value="barbadian">Barbadian</option>
                                <option value="barbudans">Barbudans</option>
                                <option value="batswana">Batswana</option>
                                <option value="belarusian">Belarusian</option>
                                <option value="belgian">Belgian</option>
                                <option value="belizean">Belizean</option>
                                <option value="beninese">Beninese</option>
                                <option value="bhutanese">Bhutanese</option>
                                <option value="bolivian">Bolivian</option>
                                <option value="bosnian">Bosnian</option>
                                <option value="brazilian">Brazilian</option>
                                <option value="british">British</option>
                                <option value="bruneian">Bruneian</option>
                                <option value="bulgarian">Bulgarian</option>
                                <option value="burkinabe">Burkinabe</option>
                                <option value="burmese">Burmese</option>
                                <option value="burundian">Burundian</option>
                                <option value="cambodian">Cambodian</option>
                                <option value="cameroonian">Cameroonian</option>
                                <option value="canadian">Canadian</option>
                                <option value="cape verdean">Cape Verdean</option>
                                <option value="central african">Central African</option>
                                <option value="chadian">Chadian</option>
                                <option value="chilean">Chilean</option>
                                <option value="chinese">Chinese</option>
                                <option value="colombian">Colombian</option>
                                <option value="comoran">Comoran</option>
                                <option value="congolese">Congolese</option>
                                <option value="costa rican">Costa Rican</option>
                                <option value="croatian">Croatian</option>
                                <option value="cuban">Cuban</option>
                                <option value="cypriot">Cypriot</option>
                                <option value="czech">Czech</option>
                                <option value="danish">Danish</option>
                                <option value="djibouti">Djibouti</option>
                                <option value="dominican">Dominican</option>
                                <option value="dutch">Dutch</option>
                                <option value="east timorese">East Timorese</option>
                                <option value="ecuadorean">Ecuadorean</option>
                                <option value="egyptian">Egyptian</option>
                                <option value="emirian">Emirian</option>
                                <option value="equatorial guinean">Equatorial Guinean</option>
                                <option value="eritrean">Eritrean</option>
                                <option value="estonian">Estonian</option>
                                <option value="ethiopian">Ethiopian</option>
                                <option value="fijian">Fijian</option>
                                <option value="filipino">Filipino</option>
                                <option value="finnish">Finnish</option>
                                <option value="french">French</option>
                                <option value="gabonese">Gabonese</option>
                                <option value="gambian">Gambian</option>
                                <option value="georgian">Georgian</option>
                                <option value="german">German</option>
                                <option value="ghanaian">Ghanaian</option>
                                <option value="greek">Greek</option>
                                <option value="grenadian">Grenadian</option>
                                <option value="guatemalan">Guatemalan</option>
                                <option value="guinea-bissauan">Guinea-Bissauan</option>
                                <option value="guinean">Guinean</option>
                                <option value="guyanese">Guyanese</option>
                                <option value="haitian">Haitian</option>
                                <option value="herzegovinian">Herzegovinian</option>
                                <option value="honduran">Honduran</option>
                                <option value="hungarian">Hungarian</option>
                                <option value="icelander">Icelander</option>
                                <option value="indian">Indian</option>
                                <option value="indonesian">Indonesian</option>
                                <option value="iranian">Iranian</option>
                                <option value="iraqi">Iraqi</option>
                                <option value="irish">Irish</option>
                                <option value="israeli">Israeli</option>
                                <option value="italian">Italian</option>
                                <option value="ivorian">Ivorian</option>
                                <option value="jamaican">Jamaican</option>
                                <option value="japanese">Japanese</option>
                                <option value="jordanian">Jordanian</option>
                                <option value="kazakhstani">Kazakhstani</option>
                                <option value="kenyan">Kenyan</option>
                                <option value="kittian and nevisian">Kittian and Nevisian</option>
                                <option value="kuwaiti">Kuwaiti</option>
                                <option value="kyrgyz">Kyrgyz</option>
                                <option value="laotian">Laotian</option>
                                <option value="latvian">Latvian</option>
                                <option value="lebanese">Lebanese</option>
                                <option value="liberian">Liberian</option>
                                <option value="libyan">Libyan</option>
                                <option value="liechtensteiner">Liechtensteiner</option>
                                <option value="lithuanian">Lithuanian</option>
                                <option value="luxembourger">Luxembourger</option>
                                <option value="macedonian">Macedonian</option>
                                <option value="malagasy">Malagasy</option>
                                <option value="malawian">Malawian</option>
                                <option value="malaysian">Malaysian</option>
                                <option value="maldivan">Maldivan</option>
                                <option value="malian">Malian</option>
                                <option value="maltese">Maltese</option>
                                <option value="marshallese">Marshallese</option>
                                <option value="mauritanian">Mauritanian</option>
                                <option value="mauritian">Mauritian</option>
                                <option value="mexican">Mexican</option>
                                <option value="micronesian">Micronesian</option>
                                <option value="moldovan">Moldovan</option>
                                <option value="monacan">Monacan</option>
                                <option value="mongolian">Mongolian</option>
                                <option value="moroccan">Moroccan</option>
                                <option value="mosotho">Mosotho</option>
                                <option value="motswana">Motswana</option>
                                <option value="mozambican">Mozambican</option>
                                <option value="namibian">Namibian</option>
                                <option value="nauruan">Nauruan</option>
                                <option value="nepalese">Nepalese</option>
                                <option value="new zealander">New Zealander</option>
                                <option value="ni-vanuatu">Ni-Vanuatu</option>
                                <option value="nicaraguan">Nicaraguan</option>
                                <option value="nigerien">Nigerien</option>
                                <option value="north korean">North Korean</option>
                                <option value="northern irish">Northern Irish</option>
                                <option value="norwegian">Norwegian</option>
                                <option value="omani">Omani</option>
                                <option value="pakistani">Pakistani</option>
                                <option value="palauan">Palauan</option>
                                <option value="panamanian">Panamanian</option>
                                <option value="papua new guinean">Papua New Guinean</option>
                                <option value="paraguayan">Paraguayan</option>
                                <option value="peruvian">Peruvian</option>
                                <option value="polish">Polish</option>
                                <option value="portuguese">Portuguese</option>
                                <option value="qatari">Qatari</option>
                                <option value="romanian">Romanian</option>
                                <option value="russian">Russian</option>
                                <option value="rwandan">Rwandan</option>
                                <option value="saint lucian">Saint Lucian</option>
                                <option value="salvadoran">Salvadoran</option>
                                <option value="samoan">Samoan</option>
                                <option value="san marinese">San Marinese</option>
                                <option value="sao tomean">Sao Tomean</option>
                                <option value="saudi">Saudi</option>
                                <option value="scottish">Scottish</option>
                                <option value="senegalese">Senegalese</option>
                                <option value="serbian">Serbian</option>
                                <option value="seychellois">Seychellois</option>
                                <option value="sierra leonean">Sierra Leonean</option>
                                <option value="singaporean">Singaporean</option>
                                <option value="slovakian">Slovakian</option>
                                <option value="slovenian">Slovenian</option>
                                <option value="solomon islander">Solomon Islander</option>
                                <option value="somali">Somali</option>
                                <option value="south african">South African</option>
                                <option value="south korean">South Korean</option>
                                <option value="spanish">Spanish</option>
                                <option value="sri lankan">Sri Lankan</option>
                                <option value="sudanese">Sudanese</option>
                                <option value="surinamer">Surinamer</option>
                                <option value="swazi">Swazi</option>
                                <option value="swedish">Swedish</option>
                                <option value="swiss">Swiss</option>
                                <option value="syrian">Syrian</option>
                                <option value="taiwanese">Taiwanese</option>
                                <option value="tajik">Tajik</option>
                                <option value="tanzanian">Tanzanian</option>
                                <option value="thai">Thai</option>
                                <option value="togolese">Togolese</option>
                                <option value="tongan">Tongan</option>
                                <option value="trinidadian or tobagonian">Trinidadian or Tobagonian</option>
                                <option value="tunisian">Tunisian</option>
                                <option value="turkish">Turkish</option>
                                <option value="tuvaluan">Tuvaluan</option>
                                <option value="ugandan">Ugandan</option>
                                <option value="ukrainian">Ukrainian</option>
                                <option value="uruguayan">Uruguayan</option>
                                <option value="uzbekistani">Uzbekistani</option>
                                <option value="venezuelan">Venezuelan</option>
                                <option value="vietnamese">Vietnamese</option>
                                <option value="welsh">Welsh</option>
                                <option value="yemenite">Yemenite</option>
                                <option value="zambian">Zambian</option>
                                <option value="zimbabwean">Zimbabwean</option>
                            </html:select>
                            </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="color:firebrick">
                                    <html:errors property="nacionalidad" />
                                </td>
                            </tr>

                            <tr>
                                <td style="font-weight: bold">Número de pasaporte</td>

                                <td>
                                    <html:text name="PlanillaExt" property="pasaporte" maxlength="10" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>
                            </tr>
                            <tr>
                                <td style="color:firebrick">
                                    <html:errors property="pasaporte" />
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

                    <div id="opci2" class="divformulario" style="display: none" >
                        <br>
                        <span><a>Paso 1.2: </a><b><a style="text-decoration: underline">INFORMACIÓN DE DOMICILIO</a></b></span>
                        <br>
                        <br>
                        <table border="0"  align="center">
                            <tbody>

                                <tr>
                                    <td style="font-weight: bold">Calle</td>

                                    <td colspan="2">
                                        <html:text name="PlanillaExt" property="calle" maxlength="80" errorStyleClass="error"
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

                                    <td colspan="2">
                                        <html:text name="PlanillaExt" property="edificio" maxlength="80" errorStyleClass="error"
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

                                    <td colspan="2">
                                        <html:text name="PlanillaExt" property="apartamento" maxlength="80" errorStyleClass="error"
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

                                    <td colspan="2">
                                        <html:text name="PlanillaExt" property="ciudad"  maxlength="30" errorStyleClass="error"
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
                                        <html:text name="PlanillaExt" property="estado" maxlength="30" errorStyleClass="error"
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
                                        <html:text name="PlanillaExt" property="codPostal"  maxlength="30" errorStyleClass="error"
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

                                    <td style="font-weight: bold"> Teléfono Celular:</td>

                                    <td>
                                        <html:text name="PlanillaExt" property="telefonoCelular" maxlength="15" errorStyleClass="error"
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

                                    <td style="font-weight: bold"> Teléfono de casa:</td>

                                    <td>
                                        <html:text name="PlanillaExt" property="telefonoCasa" maxlength="15" errorStyleClass="error"
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
                                        <html:text name="PlanillaExt" property="email" maxlength="45"  errorStyleClass="error"
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

                    <div id="opci4" class="divformulario" style="display: none">
                        <br>
                        <span><a>Paso 1.4: </a><b><a style="text-decoration: underline">PROGRAMAS</a></b></span>
                        <br>
                        <br>
                        <table border="0"  align="center">
                            <tbody>

                                <tr>
                                    <td style="font-weight: bold"> Nombre de Programa: </td>
                                    <td>
                                        <html:select styleId="prog_princ" onchange="cambia_pais();cambiar_link1()" property="nombrePrograma"> 
                                            <html:option value="0">Seleccione </html:option>
                                            <html:option value="Bilaterales">Convenios Bilaterales </html:option>
                                            <html:option value="SMILE">Programa SMILE </html:option>
                                            <html:option value="CINDA">Programa de Movilidad Estudiantil CINDA </html:option>
                                        </html:select>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="nombrePrograma"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <a href="#" id="planillaExt1"> </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <a href="#" id="planillaExt2"> </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> País de origen: </td>
                                    <td>
                                        <html:select styleId="pais_princ" onchange="cambia_universidad()" property="paisOrigen"> 
                                            <html:option value="-">-</html:option>
                                        </html:select>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="paisOrigen"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> Universidad de origen: </td>
                                    <td>
                                        <html:select styleId="uni_princ" property="nombreUniOrigen"> 
                                            <html:option value="-">- </html:option>
                                        </html:select>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="nombreUniOrigen"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold">Nombre del coordinador de movilidad: </td>

                                    <td>
                                        <html:text name="PlanillaExt" property="nombreCoordMovilidad" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="nombreCoordMovilidad" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold">Nombre del coordinador académico: </td>

                                    <td>
                                        <html:text name="PlanillaExt" property="nombreCoordAcademico" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="nombreCoordAcademico" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> Tipo de Programa: </td>
                                    <td>
                                        <html:select  property="programa">
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
                                        <html:errors property="programa" />
                                    </td>
                                </tr>                            
                                <tr>
                                    <td style="font-weight: bold"> Duración del intercambio: </td>
                                    <td>
                                        <html:select property="duracionPrograma" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                            <html:option value="Septiembre - Diciembre"></html:option>
                                            <html:option value="Enero - Marzo"></html:option>
                                            <html:option value="Abril - Julio"></html:option>
                                            <html:option value="Septiembre - Marzo"></html:option>
                                            <html:option value="Enero - Julio"></html:option>
                                            <html:option value="Septiembre - Julio"></html:option>

                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="duracionPrograma" />
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
                        <table border="0"  align="center">
                            <tbody>


                                <tr>
                                    <td style="font-weight: bold"> Área de Estudio: </td>
                                    <td>
                                        <html:select property="areaEstud"> 
                                            <html:option value="Seleccione"></html:option>                                                                
                                            <html:option value="Áreas de Arquitectura y Urbanismo"></html:option>                                
                                            <html:option value="Áreas de Ciencias Administrativas"></html:option>                                
                                            <html:option value="Áreas de Ciencias Básicas"></html:option>
                                            <html:option value="Áreas de Ciencias Sociales"></html:option>
                                            <html:option value="Áreas de Ingeniería"></html:option>
                                            <html:option value="Áreas de Tecnología"></html:option>
                                        </html:select>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="areaEstud"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold">Carrera: </td>

                                    <td>
                                        <html:text name="PlanillaExt" property="carrera" maxlength="80" errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="carrera" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> Año de ingreso a la carrera: </td>

                                    <td>
                                        <html:text name="PlanillaExt" property="anioIngreso" maxlength="4"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="anioIngreso" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="font-weight: bold"> Cantidad de años aprobados hasta la fecha: </td>

                                    <td>
                                        <html:text name="PlanillaExt" property="aniosAprobados" maxlength="60"  errorStyleClass="error"
                                                   errorKey="org.apache.struts.action.ERROR">
                                        </html:text>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:firebrick">
                                        <html:errors property="aniosAprobados" />
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
                        <span><a>Paso 1.6: </a><b><a style="text-decoration: underline">CONTACTO EN CASO DE EMERGENCIA</a></b></span>
                        <br>
                        <br>
                        <table border="0"  align="center">
                            <tbody>

                                <tr>
                                    <td style="font-weight: bold"> Apellidos: </td>
                                    <td>
                                        <html:text name="PlanillaExt" property="apellidosRep" maxlength="80"  errorStyleClass="error"
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
                                        <html:text name="PlanillaExt" property="nombresRep" maxlength="80"  errorStyleClass="error"
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
                                        <html:text name="PlanillaExt" property="celRep" maxlength="80"  errorStyleClass="error"
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
                                        <html:text name="PlanillaExt" property="tlfRepCasa" maxlength="80"  errorStyleClass="error"
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
                                        <html:text name="PlanillaExt" property="emailRep" maxlength="80"  errorStyleClass="error"
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
                                        <html:text name="PlanillaExt" property="relacion" maxlength="80"  errorStyleClass="error"
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
                                        <html:textarea name="PlanillaExt" property="direccionRep" cols="20" rows="7"  errorStyleClass="error"
                                                       errorKey="org.apache.struts.action.ERROR">
                                        </html:textarea >
                                    </td>

                                    <td style="color:firebrick">
                                        <html:errors property="direccionRep" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>   
                        <br>
                        <span style="float: left"><a class="button"  href='javascript:seleccion(5);'> Anterior </a></span>
                        <br>
                        <p  align=center>
                            <html:submit> GUARDAR </html:submit>
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
    <div id="archivos" style="display: none; width: 75%;margin-left: 20%">
        <div style="width:auto;height:auto; border:3px solid #126598; border-radius: 10px;background: #dcebe8">

            <div align=center>
                <html:form action="/FileUploadAction" method="post" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="FileUploadForm" property="nombreusuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>
                    <div style="width:auto;height:auto;">
                        <table id="dataTable" width="350px" cellspacing="14px">
                            <tbody id="dataBody">
                                <tr>
                                    <td><INPUT type="checkbox" name="chk[]"/></td>
                                    <td>Foto</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed" >  
                                                <html:file property="theFile[0]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td> 
                                </tr>
                                <tr>
                                    <td><INPUT type="checkbox" name="chk[]"/></td>
                                    <td>Informe Académico</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  
                                                <html:file property="theFile[1]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td><INPUT type="checkbox" name="chk[]"/></td>
                                    <td>Currículum</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  
                                                <html:file property="theFile[2]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td><INPUT type="checkbox" name="chk[]"/></td>
                                    <td>Carta de Motivación</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  
                                                <html:file property="theFile[3]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td><INPUT type="checkbox" name="chk[]"/></td>
                                    <td>Pasaporte</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  
                                                <html:file property="theFile[4]" />
                                                <br />
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td><INPUT type="checkbox" name="chk[]"/></td>
                                    <td><a style="color: red; font-size: 14px; font-weight: bold">*</a>Planilla CINDA/SMILE</td>
                                    <td valign="middle">
                                        <div id="archivos" >
                                            <div class="feed">  
                                                <html:file property="theFile[5]" />
                                                <br>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>  
                    </div>
                    <p style="color: red; font-size: 12px; font-weight: bold">*Sólo para quienes apliquen a uno de estos programas</p> 
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
                <html:form action="/AccionPlanEstudioExt" method="post" acceptCharset="ISO-8859-1" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="PlanExtranjero" property="nombreUsuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>

                    <table border="0"  align="center" style="margin-left: auto;margin-right: auto">
                        <tbody id ="MateBody">
                            <tr>
                                <td></td>
                                <td> Código-USB</td>

                                <td> Nombre-USB</td>

                                <td> Créditos-USB</td>
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
                                </tr>
                            </logic:iterate>

                            <tr>
                                <td> <input type="checkbox" name="c[]"></td>
                                <td>
                                    <html:text name="PlanExtranjero" property="codigoUSB[0]" maxlength="45" errorStyleClass="error" value="" style="width:80%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:text name="PlanExtranjero" property="materiaUSB[0]" maxlength="45" errorStyleClass="error" value="" style="width:80%;"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>

                                <td>
                                    <html:text name="PlanExtranjero" property="creditosUSB[0]" maxlength="45" errorStyleClass="error" value="" style="width:80%;"
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


    <div class="nav" style="text-align: center;">
        <a href="#" onclick=" if (true) hide('datosplanilla'), hide('archivos'),hide('plan'),show('idio')"> 4. Dominio de idiomas </a>
    </div>

    <div id="idio" style="display: none; width: 100%; margin-left: 13%">
        <div style="width:80%;height:auto;border:3px solid #126598; border-radius: 10px; background: #dcebe8">
            <div align=center>
                <html:form action="/CargarIdioma" method="post" acceptCharset="ISO-8859-1" enctype="multipart/form-data">
                    <br />
                    <p hidden="true"><html:text name="Idiomas" property="nombreusuario" maxlength="20" errorStyleClass="error" value ="<%=var.toString()%>"
                               errorKey="org.apache.struts.action.ERROR"></html:text></p>

                    <table border="0"  align="center">
                        <tbody>
                            <tr>
                                <td> </td>
                                <td>Lengua materna: </td>

                                <td>
                                    <html:text name="Idiomas" property="lenguaMaterna" maxlength="80" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR"></html:text>
                                </td>

                                <td style="color:firebrick">
                                    <html:errors property="lenguaMaterna" />
                                </td>
                            </tr>

                            <tr>
                                <td> </td>
                                <td>¿Le gustaría tomar un curso de español? </td>

                                <td>
                                    <html:radio name="Idiomas" property="tomarCursoDeEspaniol" value="Sí" errorStyleClass="error"
                                                errorKey="org.apache.struts.action.ERROR">Sí</html:radio>
                                    <html:radio name="Idiomas" property="tomarCursoDeEspaniol" value="No" errorStyleClass="error"
                                                errorKey="org.apache.struts.action.ERROR">No</html:radio>
                                </td>


                                <td style="color:firebrick">
                                    <html:errors property="tomarCursoDeEspaniol" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table table border="0"  align="center">
                        <tbody id ="IdioBody">
                            <tr>
                                <td></td>
                                <td> Idioma que maneja: </td>
                                <td>Nivel Verbal</td>
                                <td>Nivel Escrito</td>
                                <td>Nivel Oral</td>
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
                                <td><INPUT type="checkbox" name="ch[]"/></td>
                                <td style="width: 150px">
                                    <html:text name="Idiomas" property="idiomaDest[0]" maxlength="45" style="width:80%;" errorStyleClass="error"
                                               errorKey="org.apache.struts.action.ERROR">
                                    </html:text>
                                </td>
                                <td>

                                    <html:select name="Idiomas" property="nivelVerbal[0]" style="width:80%;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <!--html:select name="Idiomas" property="nivelVerbal[0]" style="width:50px;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR"-->
                                        <html:option value=""></html:option>
                                        <html:option value="Basico">Basico</html:option>
                                        <html:option value="Intermedio">Intermedio</html:option>
                                        <html:option value="Avanzado">Avanzado</html:option>
                                    </html:select>
                                </td>
                                <td>
                                    <html:select name="Idiomas" property="nivelEscrito[0]" style="width:80%;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR">
                                        <!--html:select name="Idiomas" property="nivelEscrito[0]" style="width:50px;" errorStyleClass="error" errorKey="org.apache.struts.action.ERROR"-->
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
                    <input type="button" value="Eliminar Seleccionados" style="font-size:16px; padding:4px 6px;" onclick="deleteRow2('IdioBody')"/>

                    <p  align=center>
                        <html:submit> GUARDAR </html:submit>
                    </p>
                </html:form>
            </div>
        </div>
    </div>

</html:html>
