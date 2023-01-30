<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%=request.getAttribute("message")%>--%>

<!DOCTYPE html>
<html lang="ko">
<body>

<div class="container">
<%--    <p>formSign.jsp page</p>--%>
    <form action="signUp.jsp" method ="get">
        id : <input type="text" name="user_id"><br>
        password : <input type="password" name="user_pw"><br>
        hobby : sport<input type="checkbox" name="user_hobby" value="sport">,
        cooking<input type="checkbox" name="user_hobby" value="cooking">,
        travel<input type="checkbox" name="user_hobby" value="travel"><br>
        <input type="submit" value = "signUp">
    </form>
</div>

</body>
</html>