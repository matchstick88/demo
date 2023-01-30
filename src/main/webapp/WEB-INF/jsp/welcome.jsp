<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<body>

<div class="container">
    <h2>Welcome page!</h2>
    <input type="button" value="버튼1">
    <button>버튼2</button>
</div>
<script>
    $("button").click(function(){
        $.get("/response", function(data, status){
            alert("Data: " + data + "\nStatus: " + status);
        });
    });
</script>

</body>
</html>