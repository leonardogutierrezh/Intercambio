<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
</head>
<body>
    <div id="testTable">
        <table style="margin: auto">
            <thead>
                <tr>
                    <th width="150px">
<h1>Asignar Universidad</h1>
                    </th>
                </tr>
                <tr>
                    <td>
                         <bean:write name="estudiante" property="pNombre" /> <bean:write name="estudiante" property="pApellido" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Opcion 1: <bean:write name="opcion1" property="nombreuni" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        Opcion 2: <bean:write name="opcion2" property="nombreuni" />
                        <bean:write name="usuarios" property="confirmar2" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Indice Normalizado: Null
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <br>Universidad a Asignar
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                    <html:form action="/AsignarUniversidadGuardar"  method="POST" enctype="multipart/form-data" onsubmit="return(this)">
                        <html:hidden name = "usuarios" property="nombreusuario"/>
                        <html:hidden name = "usuarios" property="confirmar2"/>
                         <html:select property="confirmar">
                            <html:optionsCollection name="paises" value="value" label="label"  />
                        </html:select>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <html:image src="images/postulacion.png" value="" property="" style=""/> 
                    </html:form>
                    </td>
                </tr>
 

            </thead>
        </table>
    </div>

</body>
</html>