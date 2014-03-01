<%-- 
    Document   : acciones
    Created on : Oct 25, 2012, 8:03:13 PM
    Author     : dycicle Systems
--%>
<%Object var = session.getAttribute("nombre");%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>
    <title>SGI - Agregar Postulante</title>

    <body onload ="clearForms()" onunload="clearForms()">

        <h4>Creaci&oacute;n de Nuevo Postulante</h4>
        <h5>Por favor introduzca los datos del nuevo usuario.</h5>

        <html:form action="/AgregarPostulante" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
            <table border="0" >
                <tbody>
                    <html:hidden  property="codigo" value="2"/>
                    <tr>

                        <td style="color: black">Usuario</td>
                        <td>
                            <html:text name="Postulante" property="nombreusuario" maxlength="20" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="nombreusuario" />
                        </td>
                    </tr>
                    <tr>
                        <td style="color: black">Tipo de Postulante</td>
                        <td><html:select  property="tipo">
                                <html:option value=""></html:option>
                                <html:option value="Coordinacion">Coordinacion</html:option>
                                <html:option value="Universidad Extranjera">Universidad Extranjera</html:option>
                            </html:select>
                        </td>
                    </tr>                   
                    <tr>
                        <td style="color: black">Nombre de la Institucion</td>
                        <td><html:select  property="nombreUniExt">
                                <html:option value="N/A"></html:option>
                                <html:option value="ALE -- Universidad de Karlsruhe"></html:option>
                                <html:option value="ALE -- Universidad de Siegen"></html:option>
                                <html:option value="ALE -- Universidad de Stuttgart:"></html:option>
                                <html:option value="AR -- Universidad Nacional de Cuyo"></html:option>
                                <html:option value="AR -- Universidad Nacional de Quilmes"></html:option>
                                <html:option value="AR -- Universidad Nacional de San Martín"></html:option>
                                <html:option value="AU -- Universidad Tecnológica de Swinburne"></html:option>
                                <html:option value="BE -- Universidad Católica de Lovaina"></html:option>
                                <html:option value="BO -- Universidad Privada Santa Cruz de la Sierra"></html:option>
                                <html:option value="BR -- Universidad Federal de Río de Janeiro"></html:option>
                                <html:option value="BR -- Universidad de Sao Paulo"></html:option>
                                <html:option value="BR -- Universidad Estadual de Campinas"></html:option>
                                <html:option value="CA -- Instituto de Tecnología de Ontario"></html:option>
                                <html:option value="CO -- Universidad Externado"></html:option>
                                <html:option value="CO -- Pontificia Universidad Bolivariana"></html:option>
                                <html:option value="CO -- Pontificia Universidad Javeriana"></html:option>
                                <html:option value="CO -- Universidad de los Andes"></html:option>
                                <html:option value="CO -- Universidad del Norte"></html:option>
                                <html:option value="CO -- Universidad del Valle"></html:option>
                                <html:option value="CL -- Pontifica Universidad Católica de Chile"></html:option>
                                <html:option value="CL -- Pontificia Universidad Católica de Valparaíso"></html:option>
                                <html:option value="CL -- Universidad Austral de Chile"></html:option>
                                <html:option value="CL -- Universidad de Concepción"></html:option>
                                <html:option value="CL -- Universidad de Talca"></html:option>
                                <html:option value="CL -- Universidad de Tarapacá"></html:option>
                                <html:option value="CR -- Universidad de Costa Rica"></html:option>    
                                <html:option value="DO -- Pontificia Universidad Católica Madre y Maestra"></html:option> 
                                <html:option value="DO -- Instituto Tecnológico de Santo Domingo"></html:option> 
                                <html:option value="EC --  Escuela Superior Politécnica del Litoral"></html:option>    
                                <html:option value="ES -- Universidad de las Islas Baleares"></html:option>
                                <html:option value="ES -- UUniversidad de Santiago de Compostela"></html:option>
                                <html:option value="ES -- Universitat Oberta de Catalunya"></html:option>
                                <html:option value="ES -- Universidad de Barcelona"></html:option>
                                <html:option value="ES -- Universidad Carlos III de Madrid"></html:option>
                                <html:option value="ES -- Universidad de Granada"></html:option>
                                <html:option value="ES -- Universidad Politécnica de Madrid"></html:option>
                                <html:option value="ES -- Universidad Politécnica de Cataluña"></html:option>
                                <html:option value="ES -- Universidad Politécnica de Valencia"></html:option>
                                <html:option value="ES -- Universidad de Zaragoza"></html:option>
                                <html:option value="EEUU -- Universidad de Nuevo México"></html:option>
                                <html:option value="EEUU -- Universidad de Oklahoma"></html:option>
                                <html:option value="FI -- Universidad Abo Akademi"></html:option>
                                <html:option value="FR -- Arts et Metiers ParisTech"></html:option>
                                <html:option value="FR -- Escuela de Minas de Nantes"></html:option>
                                <html:option value="FR -- EPF Escuela de Ingenieros"></html:option>
                                <html:option value="FR -- INSA – Lyon"></html:option>
                                <html:option value="FR -- TELECOM – SudParis"></html:option>
                                <html:option value="FR -- Universidad Tecnológica de Compiegne"></html:option>
                                <html:option value="FR -- Universidad Paris Ouest Nanterre"></html:option>
                                <html:option value="FR -- Universidad Paris Est Marne la Valle"></html:option>
                                <html:option value="ITA -- Politécnico de Milano"></html:option>
                                <html:option value="ITA -- Politécnico de Torino"></html:option>
                                <html:option value="ITA -- Universidad Degli Studi Di Genova"></html:option>
                                <html:option value="ITA -- Universidad Degli Studi Di Siena"></html:option>
                                <html:option value="JPN -- Universidad Tecnológica de Nagaoka"></html:option>
                                <html:option value="JPN -- Universidad de Tohoku"></html:option>
                                <html:option value="MX -- ITESM Monterrey"></html:option>
                                <html:option value="MX --  Universidad Autónoma Metropolitana"></html:option>
                                <html:option value="MX -- Instituto Tecnológico Superior de Cajeme(ITESCA)"></html:option>
                                <html:option value="MX -- Universidad Veracruzana"></html:option>
                                <html:option value="NO -- NTNU-Trondheim"></html:option>
                                <html:option value="PE -- Universidad San Martín de Porres"></html:option>
                                <html:option value="PE -- Pontificia Universidad Católica del Perú"></html:option>
                                <html:option value="PE -- Universidad de Lima"></html:option>
                                <html:option value="PE -- Universidad del Pacífico"></html:option>
                                <html:option value="PE --  Universidad Peruana Cayetano Heredia"></html:option>
                                <html:option value="PA -- Universidad de Panamá"></html:option>
                                <html:option value="PY -- Universidad Católica de Nuestra Señora de la Asunción"></html:option>
                                <html:option value="PL -- AGH Universidad de Ciencias y Tecnología"></html:option>
                                <html:option value="PT -- Universidad Técnica de Lisboa"></html:option>
                                <html:option value="PRC -- Universidad de Puerto Rico"></html:option>
                                <html:option value="UK -- Universidad de Ulster"></html:option>
                                <html:option value="RCH -- Universidad Técnica Checa en Praga (CTU)"></html:option>
                                <html:option value="SE -- Real Instituto de Estocolmo KTH"></html:option>
                                <html:option value="SE -- Universidad de Lund"></html:option>
                                <html:option value="SE -- Universidad de Uppsala"></html:option>
                                <html:option value="VE -- Universidad Centroccidental Lisandro Alvarado"></html:option>
                            </html:select>
                        </td>
                    </tr>


                    <tr>
                        <td style="color: black">Nombre de la Carrera</td>
                        <td><html:select  property="nombreCarrera">     
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
                </tbody>
            </table>

            <p style="text-align: center">
                <html:submit onclick="javascript: return confirm('¿Está seguro que los datos son correctos?')">
                    Agregar Postulante
                </html:submit>
            </p>
        </html:form>

    </body>
</html>
