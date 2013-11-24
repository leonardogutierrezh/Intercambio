<%-- 
    Document   : catpchasubmit
    Created on : 07-feb-2013, 23:16:55
    Author     : gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="nl.captcha.Captcha" %>
<!DOCTYPE html>
...
<% // We're doing this in a JSP here, but in your own app you'll want to put
    // this logic in your MVC framework of choice.
    Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
    // Or, for an AudioCaptcha:
    // AudioCaptcha captcha = (AudioCaptcha) session.getAttribute(Captcha.NAME);
    request.setCharacterEncoding("UTF-8"); // Do this so we can capture non-Latin chars
    String answer = request.getParameter("answer");
        if (captcha.isCorrect(answer)) {%>
<b>Correct!</b>
<% }%>

