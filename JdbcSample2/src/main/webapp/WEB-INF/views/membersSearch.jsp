<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>JDBC Sample</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!--  <link rel="stylesheet" href="/jdbc/resources/styles.css">  -->
</head>
<body>
    <div class="container">
        <jsp:include page="header.jsp"></jsp:include>
        <main>
            <form:form modelAttribute="membersSearchModel">
                <div class="form-row">
                    検索条件を指定する場合は「ID」または「 氏名」のいずれかを入力してください
                </div>
                <div class="row">
                    <label for="id">ID</label>
                    <form:input path="id" />
                    <label for="name">氏名</label>
                    <form:input path="name" />
                    <input type="submit" value="検索する" class="btn btn-success">
                </div>
                <div class="row errors">
                    <c:out value="${message}" />
                </div>
            </form:form>
            <c:if test="${!empty membersList}">
                <table class="table">
                    <tr>
                        <th>ID</th>
                        <th>氏名</th>
                        <th>Email</th>
                        <th>電話番号</th>
                        <th>誕生日</th>
                        <th colspan="2"></th>
                    </tr>
                    <c:forEach var="members" items="${membersList }">
                        <tr>
                            <td><c:out value="${members.id }" /></td>
                            <td><c:out value="${members.name }" /></td>
                            <td><c:out value="${members.email }" /></td>
                            <td><c:out value="${members.phoneNumber }" /></td>
                            <td><c:out value="${members.birthday }" /></td>

                            	<td>
                            		<form:form action="edit" method="get">
	                            		<input type="submit" value="編集" class="btn btn-primary" />
	                            		<input type="hidden" name="id2" value="${members.id}" />
                            		</form:form>
                            	</td>
                            	<td>
                            		<form:form action="delete" method="get">
	                            		<input type="submit" value="削除" class="btn btn-danger" onclick="deleteMember()"/>
	                            		<input type="hidden" name="id2" value="${members.id}" />
                            		</form:form>
                            	</td>


                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>