<%-- 
    Document   : redactarmensaje
    Created on : 28-mar-2013, 14:37:52
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script  src="/Intercambio/css/jquery.js"></script>
    <script  src="/Intercambio/css/jquery.tablePagination.0.5.js"></script>
    <title>Redactar mensaje</title>
    <script language="JavaScript">
        function Seleccionar() {
            var table = document.getElementById('alternatecolor');
            var checkboxes = table.getElementsByTagName('input');

            for (i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked == true)
                {
                    checkboxes[i].checked = false;
                } else {
                    checkboxes[i].checked = true;
                }
            }
        }

        function submitForm() {
            document.ObtenerDatos.submit();
        }
        function altRows(id) {
            if (document.getElementsByTagName) {

                var table = document.getElementById(id);
                var rows = table.getElementsByTagName("tr");

                for (i = 0; i < rows.length; i++) {
                    if (i % 2 == 0) {
                        rows[i].className = "evenrowcolor";
                    } else {
                        rows[i].className = "oddrowcolor";
                    }
                }
            }
        }
        $(document).ready(function() {
            $('#alternatecolor').tablePagination({});
        });
        window.onload = function() {
            altRows('alternatecolor');
        }
    </script>
</head>
<br><br><br>

<div align="center"><html:form action="/BuscarDestinatarios">
        <html:submit >Volver</html:submit></div>        
    </html:form>

<div>
    <html:form action="/RedactarMensaje" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data">
        <table style=" margin-left: 4.8em;alignment-baseline: central; border:none; vertical-align: middle;width: 80%; background: #dcebe8; border: 2px solid; border-color: #96d1f8;border-radius: 5px;">
            <tr>
                <td></td>
                <td><h1 align="left">Envío de Anuncios</h1></td>
            </tr>
            <tr>
                <td>
                    <b>Asunto: </b>
                </td>
                <td>
                    <html:text name="Anuncio" property="titulo" value=""/>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="color:firebrick">
                    <html:errors property="titulo" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Mensaje:</b>
                </td>
                <td>
                    <html:textarea name="Anuncio" property="mensaje" rows="10" cols="45"/>
                    <%Object mensaje;%>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="color:firebrick">
                    <html:errors property="mensaje" />
                </td>
            <c:set var="hola" value="hello" scope="session"/>
            </tr>
        </table>
        <br>
        <div align="center" style="font-family: sans-serif;color: black;">
            <input type="checkbox" onclick="Seleccionar()"/>Marcar/Desmarcar Todos
        </div>
        <div id="testTable">
            <table  style="margin: auto" class="altrowstable" id="alternatecolor" >
                <thead>
                    <tr>
                        <th width="150px" align="center">
                            <b>Nombre</b>
                        </th>
                        <th width="220px" align="center">
                            <b>Email</b>
                        </th>
                        <th width="150px" align="center">
                            <b>Destinatario</b>
                        </th>
                    </tr>
                </thead>
                <logic:iterate name="usuarios" id="usuarios">
                    <tr>
                        <td align="center" width="150px">
                            <input type="hidden" type="text" name="backup" value="<bean:write name="usuarios" property="nombreusuario" />" />
                                       <bean:write name="usuarios" property="nombre" />
                            </td>
                            <td align="center" width="220px">
                                <bean:write name="usuarios" property="email" />
                            </td>
                            <td id="seleccion" align="center" width="150px">
                                <html:multibox property="emails"><bean:write name="usuarios" property="email" /></html:multibox>


                                </td>
                            </tr>
                </logic:iterate>
            </table>
            <table style="position: relative">
                <tr>
                    <td><html:submit>Enviar mensaje</html:submit></td>
                    </tr>
                </table>
            </div>
        </div>
</html:form>

