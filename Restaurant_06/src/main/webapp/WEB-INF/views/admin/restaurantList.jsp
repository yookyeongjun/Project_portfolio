<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>

<div class="container">
	<div class="jumbotron"></div>
	<h2 align="center">음식점 목록 (<span id="cntSpan">${count}</span>)</h2>
	<table class="table table-hover mt-3">
		<thead>
			<tr align="center">
				<th width=12%>음식점이름</th>
				<th width=7%>소유주</th>
				<th width=23%>주소</th>
				<th width=13%>전화번호</th>
				<th width=20%>홈페이지</th>
				<th width=15%>등록날짜</th>
				<th width=10%>게시여부</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${restaurant.content}" var="rst">
			<tr align="center">
				<td><a href = "/admin/restaurantView/${rst.id}">${rst.name}</a></td>
				<td><a href = "/admin/memberView/${rst.owner.id}">${rst.owner.nickname}</a></td>
				<td>${rst.address }</td>
				<td>${rst.tel }</td>
				<td>${rst.url }</td>
				<td><fmt:formatDate value="${rst.regdate}" pattern="yyyy-MM-dd"/></td>
				<c:choose>
					<c:when test="${rst.enabled eq true }">
						<c:set var="str" value="게시 중"/>
					</c:when>
					<c:when test="${rst.enabled eq false }">
						<c:set var="str" value="게시 대기"/>
					</c:when>
				</c:choose>
				<td>${str }</td>
				<td><input type="button" class="btn btn-outline-danger btn-sm" value="Delete" onclick="rdel('${rst.id}')"></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<!-- Page -->
		<c:set value="${restaurant }" var="pageImpl"/>
		<c:url value="/admin/restaurantList" var="url">
		<c:param name="field" value="${param.field }"/>
		<c:param name="word" value="${param.word }"/>
		</c:url>
		<%@include file="../include/pagination.jsp" %>
		 
	<!-- Search -->	 
	<div class="d-flex justify-content-center mt-5 mr-auto">
		<div>
			<form class="form-inline" action="/admin/restaurantList" method="get">
				<select name="field" class="form-control mr-sm-1">
					<option value="name">식당명</option>
				</select>
				<input type="text" name="word" class="form-control" placeholder="search">
				<button class="btn btn-info">검색</button>
			</form>
		</div>
	</div>
</div>

<script>
	function rdel(id) {
		if(!confirm("정말 삭제하겟습니까?")) {
			return false;
		}
		$.ajax({
			type : "delete",
			url : "/admin/restaurantDelete/" + id
		})
		.done(function() {
			alert("삭제 성공")
			location.href = "/admin/restaurantList"
		})
		.fail(function() {
			alert("삭제 실패")
		})
	}
</script>