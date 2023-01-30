<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content = "width=device-width, initial-scale=1">
    <title>JSP AJAX</title>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>

<div class="container">
    <form id="trans-form">
        <input type="text" id="input1">
        <button type="submit">전송</button>
        <button type="submit">종료</button>
    </form>
    <hr>
    <textarea id="result" placeholder="결과출력" readonly style="width:500px; height:300px;"></textarea>

    <script type="text/javascript"
            src="webjars/jquery/2.2.4/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#trans-form").submit(function (event) {
                event.preventDefault();
                fire_ajax_submit();
                $("#result").append("transfer\n");
            });
        });
        function fire_ajax_submit() {
            let inputText = $("#input1").val();
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/ajaxRequest",
                data: JSON.stringify(inputText),
                dataType: 'json',
                cache: false,
                timeout: 60000,
                success: function(data) {
                    let json = "<h4>Ajax Response</h4>&lt;pre&gt;"
                    + JSON.stringify(data, null, 4) + "&lt;/pre&gt;";
                    $("#result").html(json);

                    console.log("SUCCESS: ", data);
                },
                error: funtion (e) {
                    let json = "<h4>Ajax Response</h4>&lt;pre&gt;"
                        + e.responseText + "&lt;/pre&gt;";
                    $("#result").html(json);

                    console.log("ERROR : ", e);
                }
            });
        }

    </script>

    <table class="table table-hover table table-striped">
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>제목</th>
        </tr>

        <c:forEach items="${list}" var="post">
            <tr>
                <th>${post.getPostId()}</th>
                <th>${post.getNickName()}</th>
                <th>${post.getTitle()}</th>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>