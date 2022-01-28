<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>会員管理システム</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!--
	<link rel="stylesheet" href="resources/styles.css">
 -->
</head>
<body style="padding-top: 100px">
    <div class="container">
        <jsp:include page="header.jsp"></jsp:include>
        <main>
            <form:form modelAttribute="membersModel">
                <div>
                    <label for="name">氏名</label>
                    <form:input path="name" />
                    <form:errors path="name" element="span" cssClass="text-danger" />
                </div>
                <div class="form-row">
                    <label for="email">Email</label>
                    <form:input path="email" />
                    <form:errors path="email" element="span" />
                </div>
                <div>
                    <label for="phoneNumber">
                        電話番号
                        <small>(ハイフンなし・半角数字)</small>
                    </label>
                    <form:input path="phoneNumber" />
                    <form:errors path="phoneNumber" element="span" cssClass="errors" />
                </div>
                <div>
                    <label for="birthday">
                        誕生日
                       <small>(YYYY/MM/DD)</small>
                    </label>
                    <form:input path="birthday" />
                    <form:errors path="birthday" element="span"/>
                </div>
                <div></div>
                <div class="form-row">
                    <input type="submit" value="登録する" class="btn btn-primary">
                </div>
                <div class="form-row errors">
                    <c:out value="${message}" />
                </div>
            </form:form>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>