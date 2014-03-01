<%-- 
    Document   : mostrarSolicitud
    Created on : 25-oct-2012, 20:22:37
    Author     : gustavo
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<html>

        <title>Mostrar-Usuario</title>

        <h4>Datos personales</h4>

        <table border=1 cellspacing=0 cellpadding=2 style="width:90%;">
            <tr>
                 <td>Apellido: <bean:write name = "estudiante" property="pApellido"/></td>
                 <td>Nombre: <bean:write name = "user" property="nombre"/></td>
            </tr>
            <tr>
                
                <td>Sexo: <bean:write name = "estudiante" property="sexo"/></td>
                <td>Nacionalidad: <bean:write name = "estudiante" property="nacionalidad"/></td>
            </tr>
             <tr>
                <td>Cedula: </td>
                <td>Carnet: </td>
            </tr>
             <tr>
                <td>Telefono: <bean:write name = "estudiante" property="telefonoCasa"/></td>
                <td>Celular: <bean:write name = "estudiante" property="telefonoCelular"/></td>
            </tr>
            <tr>
                <td>Email: <bean:write name = "estudiante" property="email"/></td>
                <td>Urbanizacion: <bean:write name = "estudiante" property="urb"/></td>
            </tr>
            <tr>
                <td>Calle: <bean:write name = "estudiante" property="calle"/></td>
                <td>Edificio/Casa: <bean:write name = "estudiante" property="edificio"/></td>
            </tr>
            <tr>
                <td>Apartamento/Numero Casa: <bean:write name = "estudiante" property="apartamento"/></td>
                <td>Ciudad: <bean:write name = "estudiante" property="ciudad"/></td>
            </tr>
            <tr>
                <td>Estado: <bean:write name = "estudiante" property="estado"/></td>
                <td>Codigo Postal: </td>
            </tr>
        </table>
                
        <h4>Datos de emergencia</h4>

        <table border=1 cellspacing=0 cellpadding=2 style="width:90%;">
            <tr>
                 <td>Apellidos: <bean:write name = "representante" property="apellidos"/></td>
                 <td>Nombres: <bean:write name = "representante" property="nombres"/></td>
            </tr>
            <tr>
                
                <td>Relacion con el estudiante: <bean:write name = "representante" property="tiporelacion"/></td>
                <td>Celular: <bean:write name = "representante" property="telefonocel"/></td>
            </tr>
             <tr>
                <td>Telefono: <bean:write name = "representante" property="telefonohab"/></td>
                <td>Email: <bean:write name = "representante" property="emailrep"/></td>
            </tr>
             <tr>
                <td>Direccion: <bean:write name = "representante" property="direccion"/></td>
          
            </tr>
        </table>
        <h4>Idiomas a emplear</h4>

        <table border=1 cellspacing=0 cellpadding=2 style="width:90%;">
            <tr>
                 <td>Idioma:</td>
                 <td>Nivel Verbal:</td>
                 <td>Nivel Escrito:</td>
            </tr>
              <logic:iterate name="idiomas" id="idioma">
                <tr>                
                    <td><bean:write name = "idioma" property="nombreidioma"/></td>
                    <td><bean:write name = "idioma" property="nivelverbal"/></td>
                    <td><bean:write name = "idioma" property="nivelescrito"/></td>
                </tr>
                                        
              </logic:iterate>
        </table>
        
        <h4>Identificación del programa y lapso de estudio en intercambio</h4>

        <table border=1 cellspacing=0 cellpadding=2 style="width:90%;">
            <tr>
                <td>Nombre de la Universidad de Destino: <bean:write name = "uni1" property="nombreuni"/></td>
            <tr><td>Nombre del programa: <bean:write name = "uni1" property="nombreuni"/></td></tr>
            <tr><td><table border=1 cellspacing=0 cellpadding=2 style="width:100%;">
                        <tr>
                            <td>Fecha de Inicio: <bean:write name = "uni1" property="mesfechaini"/>/<bean:write name = "uni1" property="aniofechaini"/></td>
                            <td>Fecha de finalizacion: <bean:write name = "uni1" property="mesfechafin"/>/<bean:write name = "uni1" property="aniofechaini"/></td>
                        </tr>
                    </table>
                </td></tr>

            </tr>
        </table>
                        
        <h4>Opcional</h4>

        <table border=1 cellspacing=0 cellpadding=2 style="width:90%;">
            <tr>
                <td>Nombre de la Universidad de Destino: <bean:write name = "uni2" property="nombreuni"/></td>
            <tr><td>Nombre del programa: <bean:write name = "uni2" property="nombreuni"/></td></tr>
            <tr><td><table border=1 cellspacing=0 cellpadding=2 style="width:100%;">
                        <tr>
                            <td>Fecha de Inicio: <bean:write name = "uni2" property="mesfechaini"/>/<bean:write name = "uni1" property="aniofechaini"/></td>
                            <td>Fecha de finalizacion: <bean:write name = "uni2" property="mesfechafin"/>/<bean:write name = "uni1" property="aniofechaini"/></td>
                            
                        </tr>
                    </table>
                </td></tr>

            </tr>
        </table>

        <h4>Información Académica</h4>

        <table border=1 cellspacing=0 cellpadding=2 style="width:90%;">
                <tr>                    
                 <td>Carrera: <bean:write name = "antecedentes" property="carrera"/></td>
                 <td>Numero de cr&eacute;ditos: <bean:write name = "antecedentes" property="credAprob"/></td>
                  <td>&Iacute;ndice: <bean:write name = "antecedentes" property="indice"/></td>
            </tr>
        </table>
        <table border=1 cellspacing=0 cellpadding=2 style="width:90%;" >
           <tr>
               <td>Asignaturas del plan de estudio USB</td>
           </tr>
        </table>
        <table border=1 cellspacing=0 cellpadding=2 style="width:90%;" >
             <logic:iterate name="materias" id="materia">
                <tr>                
                    <td><bean:write name = "materia" property="materiausb"/></td>
                    <td><bean:write name = "materia" property="codigousb"/></td>
                    <td><bean:write name = "materia" property="creditousb"/></td>
                </tr>
                                        
             </logic:iterate>
        </table>
        <table border=1 cellspacing=0 cellpadding=2 style="width:90%;" >
           <tr>
               <td> Asignaturas a cursar en la Universidad de Destino:</td>
           </tr>
        </table>
        <table border=1 cellspacing=0 cellpadding=2 style="width:90%;" >
             <logic:iterate name="materias" id="materia">
                <tr>                
                    <td><bean:write name = "materia" property="materiauniv"/></td>
                    <td><bean:write name = "materia" property="codigouniv"/></td>
                    <td><bean:write name = "materia" property="creditouniv"/></td>
                </tr>
                                        
             </logic:iterate>
        </table>

</html>
