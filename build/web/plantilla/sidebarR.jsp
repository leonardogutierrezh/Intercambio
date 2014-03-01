<%-- 
    Document   : sidebarR
    Created on : Nov 14, 2012, 9:28:49 PM
    Modified by: dreabalbas
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div id="sidebarR" style="width:150px; height: 250px;">
        
        <div id="google_translate_element">
        </div>
                <script type="text/javascript">
                    function googleTranslateElementInit() {
                        new google.translate.TranslateElement({pageLanguage: 'es', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
                    }
                </script>
                <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">
                </script>  
        
                <br>        
        <div>
            <html:link href="http://www.usb.ve/">
                <img width="150" height="50" src="/Intercambio/images/somosusb.gif">
            </html:link>
        </div>
                <%--<br>
                <div>
                    <html:link action="/informacion">
                        <img width="150" height="150" src="/Intercambio/images/info.jpg">
                    </html:link>
                </div>--%>
                <br>
                
        <div>
            <html:link action="/contacto">
                <img src="/Intercambio/images/Contactenos.jpg">
            </html:link>
        </div>
            
        <br>
        <div>
            <html:link href="http://www.internacionales.dsm.usb.ve/">
                <img width="150" height="50" src="/Intercambio/images/DRIC.jpg">
            </html:link>
        </div>
        <br>
          
    </div>
       
</html>
