<%-- 
    Document   : SubirDocumento
    Created on : 13-nov-2012, 23:50:59
    Author     : gustavo
--%>

<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html:html>
    <head>
        <title>Struts File Upload</title>
        <html:base/>
    </head>
    <body>
        <html:form action="/FileUploadAction" method="post" enctype="multipart/form-data">
            <font size="20">File Upload on Server</font>
            <font color="red"><html:errors/></font>
            
            <html:file property="file"/>
            <center>
                <html:submit>Upload File</html:submit>
                </center>
    </html:form>
</body>
</html:html>
