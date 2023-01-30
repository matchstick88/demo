<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
</head>
<body>
    <%!
        String user_id;
        String user_pw;
        String[] user_hobby;
    %>

    <%
        user_id = request.getParameter("user_id");
        user_pw = request.getParameter("user_pw");
        user_hobby = request.getParameterValues("user_hobby");
    %>

    user_id :<%= user_id%> <br>
    user_pw :<%= user_pw%> <br>
    user_hobby :
    <%
        for(int i=0; i<user_hobby.length; i++) {
    %>
    <%= user_hobby[i] %>
    <%
        }
    %>    <br>
</body>
</html>