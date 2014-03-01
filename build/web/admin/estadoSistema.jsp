<%-- 
    Document   : estadoSistema
    Created on : 27-abr-2013, 10:19:44
    Author     : gustavo
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html:html>
    <br/>
    <div align="center" id="texto">
        Actualmente el período de postulacion está <bean:write name="usuario" property="confirmar"></bean:write>
    </div>

    <script language="javascript">
        
        text = document.getElementById("texto").innerText;
        if(text.indexOf("Inactivo") != -1){
            document.write('<div align="center"><img src="images/lock.png"/></div>')
              
        }else{
            document.write('<div align="center"><img src="images/unlock.png"/></div>')
        }   
    </script>   
    <br>
    <div align="center">
        <html:link action="accionesAdmin">
            Continuar
        </html:link>
    </div>
</html:html>
