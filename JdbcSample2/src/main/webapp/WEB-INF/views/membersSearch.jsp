<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>会員管理システム</title>

<!-- BootStrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<!--  <link rel="stylesheet" href="/jdbc/resources/styles.css">  -->
</head>
<body style="padding-top: 100px">
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<main>
			<form:form modelAttribute="membersSearchModel">
				<div class="form-group">検索条件を指定する場合は「ID」または「氏名」のいずれかを入力してください</div>
				<div class="form-group">
					<label for="id">ID</label>
					<form:input path="id" cssClass="form-control" />
				</div>
				<div class="form-group">
					<label for="name">氏名</label>
					<form:input path="name" cssClass="form-control" />
				</div>
				<div class="form-group text-danger"">
					<c:out value="${message}" />
				</div>
				<div class="row mt-3 mb-3">
					<input type="submit" value="検索する" class="btn btn-success">
				</div>

			</form:form>
			<c:if test="${!empty membersList}">
				<table class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>氏名</th>
						<th>Email</th>
						<th>電話番号</th>
						<th>誕生日</th>
						<th colspan="2"></th>
					</tr>
					</thead>
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
								</form:form></td>
							<td>

								<!-- Button trigger modal -->
								<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modal">削除</button>
								<!-- Modal -->
								<div class="modal fade" id="modal${members.id }" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
									<div class="modal-dialog">

										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="modalLabel">削除</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>

											<div class="modal-body">本当に「ID：<c:out value="${members.id }" />」を削除しますか？</div>

											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">キャンセル</button>

												<form action="delete" method="get">
													<input type="hidden" name="delid" value="${members.id}" />
													<input type="submit" class="btn btn-danger" value="削除" />
												</form>
											</div>
										</div>

									</div>
								</div>

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
