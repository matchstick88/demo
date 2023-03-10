<%@ page language="java" contentType="text/html; ISO-8859-1" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content = "width=device-width, initial-scale=1">
    <link rel="stylesheet" href="">
    <title>JSP AJAX</title>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script type="text/javascript">
        let searchRequest = new XMLHttpRequest();
        let registerRequest = new XMLHttpRequest();
        function searchFunction() {
            searchRequest.open("Post", "./UserSearchServlet?userName="+encodeURIComponent(document.getElementById("userName").value),true);
            searchRequest.onreadystatechange = searchProcess;
            searchRequest.send(null);

        }
        function searchProcess() {
            let table = document.getElementById("ajaxTable");
            table.innerHTML = "";
            if(searchRequest.readyState == 4 && searchRequest.status == 200) {
                let object = eval('(' + searchRequest.responseText + ')');
                let result = object.result;
                for(let i = 0; i< result.length; i++){
                    let row = table.insertRow(0);
                    for(let j=0; j<result[i].length; j++) {
                        let cell = row.insertCell(j);
                        cell.innerHTML = result[i][j].value;
                    }
                }
            }
        }
        function registerFunction() {
            registerRequest.open("Post", "./UserRegisterServlet?userName="+encodeURIComponent(document.getElementById("registerName").value)
                                +"&userAge="+encodeURIComponent(document.getElementById("registerAge").value)
                                +"&userGender="+encodeURIComponent($('input[name=registerGender]:checked').val())
                                +"&userAddress="+encodeURIComponent(document.getElementById("registerAddress").value),true);
            registerRequest.onreadystatechange = registerProcess;
            registerRequest.send(null);
        }
        function registerProcess() {
            if(registerRequest.readyState == 4 && registerRequest.status == 200) {
                let result = registerRequest.responseText;
                if(result != 1) {
                    alert("????????? ??????????????????.");
                } else {
                    let userName = document.getElementById("userName");
                    let registerName = document.getElementById("registerName");
                    let registerAge = document.getElementById("registerAge");
                    let registerAddress = document.getElementById("registerAddress");
                    userName.value = "";
                    registerName.value = "";
                    registerAge.value = "";
                    registerAddress.value = "";
                    searchFunction();
                }

            }
        }
        window.onload = function() {
            searchFunction();
        }
    </script>
</head>
<body>

<div class="container">
    <div class="form-group">
        <div class="col-xs-8">
            <input class="form-control" id="userName" onkeyup="searchFunction();" type="text" size="20">
        </div>
        <div class="col-xs-2">
            <button class="btn btn-primary" onclick="searchFunction();" type="button">??????</button>
        </div>
    </div>
    <table class="table" style="text-align: center; border: 1px solid #dddddd">
        <thead>
        <tr>
            <th style="background-color: #fafafa; text-align: center">??????</th>
            <th style="background-color: #fafafa; text-align: center">??????</th>
            <th style="background-color: #fafafa; text-align: center">??????</th>
            <th style="background-color: #fafafa; text-align: center">??????</th>
        </tr>
        </thead>
        <tbody id="ajaxTable">
        <tr>
            <td>?????????</td>
            <td>34</td>
            <td>???</td>
            <td>?????????</td>
        </tr>
        </tbody>
    </table>
</div>
<div class="container">
    <table class="table" style="text-align: center; border: 1px solid #dddddd">
        <thead>
        <tr>
            <th colspan="2" style="background-color: #fafafa; text-align: center;">?????? ?????? ??????</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td style="background-color: #fafafa; text-align:center;"><h5>??????</h5></td>
            <td><input class="form-control" type="text" id="registerName" size="20"></td>
        </tr>
        <tr>
            <td style="background-color: #fafafa; text-align:center;"><h5>??????</h5></td>
            <td><input class="form-control" type="text" id="registerAge" size="20"></td>
        </tr>
        <tr>
            <td style="background-color: #fafafa; text-align:center;"><h5>??????</h5></td>
            <td>
                <div class="form-group" style="text-align:center; margin: 0 auto;">
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-primary active">
                            <input type="radio" name="registerGender" autocomplete="off" value="??????", checked>??????
                        </label>
                        <label class="btn btn-primary active">
                            <input type="radio" name="registerGender" autocomplete="off" value="??????">??????
                        </label>
                    </div>
                </div>
        </tr>
        <tr>
            <td style="background-color: #fafafa; text-align: center"><h5>??????</h5></td>
            <td><input class="form-control" type="text" id="registerAddress" size="20"></td>
        </tr>
        <tr>
            <td colspan="2">
                <button class="btn btn-primary pull-right" onclick="registerFunction();" type="button">??????</button>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>