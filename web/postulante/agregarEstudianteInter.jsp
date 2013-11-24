<%-- 
    Document   : agregarTipoEstudianteExtranjero
    Created on : 13-feb-2013, 21:59:29
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%Object var = session.getAttribute("nombre");%>
<%@page contentType="text/html"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>
    <title>SGI - Agregar estudiante extranjero</title>

    <body onload ="clearForms()" onunload="clearForms()">

        <h4>Creaci&oacute;n de Nuevo Estudiante</h4>
        <h5>Por favor introduzca los datos del nuevo estudiante.</h5>

        <html:form action="/AccionAgregarEstudianteInter" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
            <table border="0" >
                <tbody>
                    <tr>

                        <td style="color: black">Nombre de Usuario</td>
                        <td>
                            <html:text name="EstInter" property="nombreusuario" maxlength="20" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="nombreusuario" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Email</td>
                        <td>
                            <html:text name="EstInter" property="email" maxlength="30" errorStyleClass="error" value=""
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="email" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Primer nombre</td>
                        <td>
                            <html:text name="EstInter" property="pNombre" maxlength="30" errorStyleClass="error"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="nombres" />
                        </td>
                    </tr>

                    <tr>
                        <td style="color: black">Primer apellido</td>       
                        <td><html:text name="EstInter" property="pApellido" maxlength="100" errorStyleClass="error"
                                   errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="apellidos" />
                        </td>
                    </tr>
                    <tr>
                        <td style="color: black">Pasaporte</td>
                        <td>
                            <html:text name="EstInter" property="pasaporte" maxlength="30" errorStyleClass="error" value=""
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="pasaporte" />
                        </td>
                    </tr>


                    <tr>
                        <td style="color: black">Lengua materna</td>
                        <td>
                            <html:text name="EstInter" property="lenguamaterna" maxlength="30" errorStyleClass="error" value=""
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="lenguamaterna" />
                        </td>
                    </tr>
                    <tr>
                        <td style="color: black">Instituci&oacute;n de Origen</td>

                        <td><html:select  property="institucion">
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
                </tbody>
            </table>

            <p style="text-align: center">
                <html:submit onclick="javascript: return confirm('¿Está seguro que los datos son correctos?')">
                    Agregar estudiante
                </html:submit>
            </p>
        </html:form>

    </body>
</html>
