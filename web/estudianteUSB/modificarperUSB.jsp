<%-- 
    Document   : modificarperUSB
    Created on : 15-nov-2012, 15:45:27
    Author     : gustavo
--%>

<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/Intercambio/css/estilo.css">
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>



<script  src="/Intercambio/css/jquery.js"></script>
<script>
    function Marcar(id){
        jQuery.each($(id).children(),function(a,b){
            if (b.disabled==true){
                b.disabled=false
            }else{
                b.disabled=true
            }
        })
    }
</script>
<script type="text/javascript">
    
    $(document).ready(function(){
        jQuery.each($("input"),function(key,value){
            if(value.type=="text" || value.type=="password"){
                if(value.name!="nombreusuario"){
                    value.disabled=true
                }
            }
        })   
    })
</script>
<title>SGI - Modificar Perfil</title>

<h4>Modificaci&oacute;n de Datos de Usuario</h4>
<h5>Actualice sus datos.</h5>
<h5><strong>Seleccione el campo que desea actualizar</strong></h5>

<html:form action="/ModificarPerfil" acceptCharset="ISO-8859-1" onsubmit="return(this)">
    <table border="0">
        <tbody>
            <tr>
                <td>Usuario </td>
                <td><html:text disabled="true" name="Usuario" property="nombreusuario"  errorStyleClass="error"
                           errorKey="org.apache.struts.action.ERROR"></html:text></td>
            </tr>
            <tr>
                <td colspan="2" style="color:firebrick">
                    <html:errors property="nombreusuario" />
                </td>
            </tr>
            <tr>
                <td>
                    <div align="center"><input type="checkbox" onclick="Marcar('.mail')"/> Actualizar el E-mail</div>
                </td>
            </tr>
            <tr>
                <td>E-mail</td>

                <td class="mail"><html:text name="Usuario" property="email" errorStyleClass="error"
                           errorKey="org.apache.struts.action.ERROR"></html:text></td>
            </tr>
            <tr>
                <td colspan="2" style="color:firebrick">
                    <html:errors property="email" />
                </td>

            </tr>
            <tr>
                <td>
                    <div align="center"><input type="checkbox" onclick="Marcar('.nom')"/> Cambiar Nombre</div>
                </td>
            </tr>
            <tr>
                <td>Nombre completo</td>
                <td class="nom"><html:text name="Usuario" property="nombre" maxlength="100" errorStyleClass="error"
                           errorKey="org.apache.struts.action.ERROR"></html:text></td>
            </tr>
            <tr>
                <td colspan="2" style="color:firebrick">
                    <html:errors property="nombre" />
                </td>
            </tr>
            <tr>
                <td>
                    <div><input type="checkbox" onclick="Marcar('.contra')" />Cambiar la contraseña</div>
                </td>
            </tr>
            <tr>
                <td>Contraseña actual</td>
                <td class="contra"><html:password property="contrasena" maxlength="100" errorStyleClass="error"
                               errorKey="org.apache.struts.action.ERROR" value=""></html:password></td>
            </tr>
            <tr>
                <td style="width: 100px;color:firebrick" colspan="2">
                    <html:errors property="contrasena" />
                </td>
            </tr>
            <tr>
                <td>Contraseña nueva</td>
                <td class="contra"><html:password name="Usuario" property="nuevacontra" maxlength="100" errorStyleClass="error"
                               errorKey="org.apache.struts.action.ERROR" value=""></html:password></td>
            </tr>
            <tr>
                <td style="width: 100px;color:firebrick" colspan="2">
                    <html:errors property="nuevacontra" />
                </td>
            </tr>
            <tr>
                <td>Confirmar nueva contraseña</td>
                <td class="contra"><html:password name="Usuario" property="confirmar2" maxlength="100" errorStyleClass="error"
                               errorKey="org.apache.struts.action.ERROR" value=""></html:password></td>
            </tr>
            <tr>
                <td style="width: 100px;color:firebrick" colspan="2">
                    <html:errors property="confirmar2" />
                </td>
            </tr>
        </tbody>
    </table>
    <p style="text-align: center"><html:submit onclick="javascript: return confirm('¿Está seguro que los datos son correctos?')">
            Modificar usuario
        </html:submit></p>
    </html:form>
</body>
</html>
