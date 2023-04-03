<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/css/mypage.css"/>
<div class="row">
<%@ include file="mypageLeftNav.jsp" %>
	<div class="col-8">
		<div class="jumbotron"></div>
		<h2>마이페이지</h2>
		<hr/>
		<div class="row">
			<div class="col-4">
				<div style="margin-left: 30px;
							margin-top : 30px;">
				<img src="/img/test.png" width=100>
				</div>
			</div>
			<div class="col-8">
				<dl>
					<dt>닉네임</dt>
					<dd>${user.nickname }</dd>
				</dl>
				<dl>
					<dt>주소</dt>
					<dd>${user.address }</dd>
				</dl>
				<dl>
					<dt>전화번호</dt>
					<dd>${user.tel }</dd>
				</dl>
				<dl>
					<dt>가입날짜</dt>
					<dd><fmt:formatDate value="${user.regdate }" pattern="yyyy-MM-dd"/></dd>
				</dl>
			</div>
		</div>
		<div>
		<hr/>
		<h4>현재 예약 현황</h4>
			<table class="table table-hover">
				<thead align="center">
					<tr>
						<th>음식점</th>
						<th>이름</th>
						<th>예약날짜</th>
						<th>예약시간</th>
						<th>예약변경</th>
						<th>예약확인</th>
					</tr>
				</thead>
				<tbody align="center">
				<c:if test="${rsv.id eq null }">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				</c:if>
				<c:if test="${rsv.id ne null }">
				<tr>
					<td><img src="${rsv.restaurant.thumImage}" width=100></td>
					<td>${rsv.restaurant.name}</td>
					<td><fmt:formatDate value="${rsv.rsvDateTime}" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${rsv.rsvDateTime}" pattern="HH:mm"/></td>
					<td><a href="/user/reservationUpdate/${rsv.id}"><button type="button" class="btn btn-primary" id="updateRsv"><i class="fa-solid fa-pen"></i></button></a></td>
					<td><button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo${rsv.id }"><i class="fa-solid fa-magnifying-glass"></i></button></td>
				</tr>
				<tr>
				<td colspan="6">  
  				<div id="demo${rsv.id }" class="collapse">
    				<div id="card" class="card" style="width:100%">	<!-- 예약정보 -->
  						<div class="row" align="center">
  						<div class="col-lg-7">
							<div class="card-body" align="left">
									<div class="row">
								<div class="col-lg-7">
									<table class="table table-borderless">
										<tr><td><h1>Reservation</h1></td></tr>
										<tr><td><h3>${rsv.restaurant.name }</h3></td></tr>
										<tr><td><h6>${rsv.restaurant.tel }</h6></td></tr>
      								</table>
      							</div>
      							<div class="col-lg-5">
      								<table class="table table-borderless">
      									<tr>
      										<td>예약자</td>
      										<td>${rsv.user.nickname }</td>
      									</tr>
      									<tr>
      										<td>예약자수</td>
      										<td>${rsv.peopleCnt }</td>
      									</tr>
      									<tr>
      										<td>예약날짜</td>
      										<td><fmt:formatDate value="${rsv.rsvDateTime}" pattern="yyyy-MM-dd"/></td>
      									</tr>
      									<tr>
      										<td>예약시간</td>
      										<td><fmt:formatDate value="${rsv.rsvDateTime}" pattern="HH:mm"/></td>
      									</tr>
      								</table>
								</div>
      							</div>
    						</div>
  						</div>
  						<div class="col-lg-5">
  							<div class="card-body" align="left">
  								<table class="table table-borderless">
  									<tr>
  										<td width="30%">요구사항</td>
  										<td rowspan="7">${rsv.msg }</td>
  									</tr>
									<tr><td></td></tr>
									<tr><td></td></tr>
									<tr><td></td></tr>
									<tr><td></td></tr>
									<tr><td></td></tr>
									<tr><td></td></tr>
     							</table>
     						</div>
     					</div>
     					</div>
     				</div>
    			</div>
    			</td>
  				</tr>
				</c:if>
		</tbody>
			</table>
		</div>
	</div>
	<div class="col-2"></div>
</div>
<%@ include file="../include/footer.jsp"%>