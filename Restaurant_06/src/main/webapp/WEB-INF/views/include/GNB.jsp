<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>

</style>
<div class="gnb  fixed-top">
<nav class="navbar navbar-expand-sm mb-3">
<!-- <img src="bird.jpg" alt="Logo" style="width:40px;"> -->
    <a class="navbar-brand mr-auto navHead" href="/">
    <h2>
    <img src="/img/Tree.png" style="height:40px;width:40px;"/>
    Root of Food
    </h2>
    </a>
  <!-- Links -->
  <div id="defNav">
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link btn btn-link" href="/inquiry/writeQna">Q&A</a>
    </li>
    </ul>
   </div>
   <!-- 비회원 -->
   <div id="anonyNav">
   <ul class="navbar-nav">
   <sec:authorize access="isAnonymous()">
    <li class="nav-item">
      <a class="nav-link" href="/user/join">회원가입</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="modal" data-backdrop="static" data-target="#myModal">로그인</a>
    </li>
   </sec:authorize>
   <sec:authorize access="isAuthenticated()">
    <li>
      <div id="userNav" class="dropdown"> <!--  내 정보 -->
    <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
      내 정보
    </button>
    <div class="dropdown-menu">
      <h5 class="dropdown-header">
      <a href="/user/mypage/<sec:authentication property="principal.user.id"/>">마이페이지</a>
      </h5>
      <a class="dropdown-item" href="/user/favorites/<sec:authentication property="principal.user.id"/>">즐겨찾기</a>
      <a class="dropdown-item" href="/user/reservationList/<sec:authentication property="principal.user.id"/>">예약현황</a>
      <a class="dropdown-item" href="/logout">로그아웃</a>
      <sec:authorize access="hasRole('ROLE_OWNER')">
      <h5 class="dropdown-header">식당 관리</h5> <!-- 사업자라면 ROLE 미구현됨. -->
      <a class="dropdown-item" href="/owner/restaurantList/<sec:authentication property="principal.user.id"/>">내 식당 보기</a>
      <a class="dropdown-item" href="/owner/reservationList/<sec:authentication property="principal.user.id"/>">내 식당 예약</a>
      </sec:authorize>
	  <sec:authorize access="hasRole('ROLE_ADMIN')">
      <h5 class="dropdown-header">관리자</h5> <!-- 관리자라면 ROLE 미구현됨. -->
 	  <a class="dropdown-item" href="/admin/memberList">회원 목록</a>
      <a class="dropdown-item" href="/admin/restaurantList">음식점 목록</a>
      <a class="dropdown-item" href="/inquiry/qnaList">Q&A 목록</a>
      </sec:authorize>
    </div>
  </div>
    </li>
    </sec:authorize>
  </ul>
  </div>
</nav>
</div>