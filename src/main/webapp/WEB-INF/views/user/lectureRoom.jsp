<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- date input의 최소값 구하기 -->
<c:set var="minYear" value="<%=new java.util.Date().getYear() + 1881%>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title> 마이페이지 </title>
    <jsp:include page="../setting/head.jsp" />
</head>
<body>
<!-- 헤더 영역 시작-->
<jsp:include page="../layout/header.jsp" />
<!-- 헤더 영역 끝 -->

<!-- 배너 영역 시작 -->
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>로그인</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>로그인</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->
<!-- /page title -->

<section class="section" data-background="${path}/resources/img/backgrounds/bg-dots.png">
    <div class="container" id="content">
        <div class="columns is-centered">
            <div class="column is-8-desktop">
                <div class="has-background-white card-content shadow-down p-6">
                    <h3 class="has-text-centered"> 내 강의실 </h3>
                    <hr>
                    <div class="columns is-multiline is-centered">
                        <div class="column is-10-tablet">
                            <label for="id" class="label"> 강의 목록 </label>
                            <div class="control">
                                <input type="text" class="input" name="id" id="id" size="100" class="input" value="${lecture.lectitle}" readonly>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="name" class="label"> 이름 </label>
                            <div class="control">
                                <input type="text" class="input" name="name" id="name" class="input"  value="1" readonly>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="email" class="label"> 이메일 </label>
                            <div class="control">
                                <input type="email" name="email" id="email" class="input" value="2" readonly>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="tel" class="label"> 전화번호 </label>
                            <div class="control">
                                <input type="tel" class="input" name="tel" id="tel" class="input"  value="3" readonly>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <div class="columns has-text-centered mb-30">
                                <div class="column" style="margin: 20px; border: 1px solid #dbdbdb; border-radius: 10px;">
                                    <h5 class="mb-10"> 방문횟수 <i class="fa-solid fa-heart" style="color: #ff4242;"></i> </h5>
                                    <h4 style="font-family: 'Roboto', sans-serif"> ${user.visited} 번 </h4>
                                </div>
                                <div class="column" style="margin: 20px; border: 1px solid #dbdbdb; border-radius: 10px;">
                                    <h5 class="mb-10"> 포인트 <i class="fa-solid fa-coins" style="color: #e7f070;"></i> </h5>
                                    <h4 style="font-family: 'Roboto', sans-serif"> ${user.pt} pt </h4>
                                </div>
                            </div>
                        </div>
                        <div class="buttons is-right">
                            <c:if test="${sid!='admin' }">
                                <a href="${path }/user/login2.do" class="button is-primary"> 회원 정보 수정 </a>
                            </c:if>
                            <c:if test="${sid=='admin' }">
                                <a href="${path }/user/list.do" class="button is-primary">회원 목록</a>
                            </c:if>
                        </div>
                    </div>
                    <script>
                        function updateCheck(f){
                            if(f.userpw.value!=f.userpw2.value){
                                alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                                return false;
                            }
                        }
                    </script>
                    <script>
                        function findAddr() {
                            new daum.Postcode({
                                oncomplete: function(data) {
                                    console.log(data);
                                    var roadAddr = data.roadAddress;
                                    var jibunAddr = data.jibunAddress;
                                    document.getElementById("postcode").value = data.zonecode;
                                    if(roadAddr !== '') {
                                        document.getElementById("addr1").value = roadAddr;
                                    } else if(jibunAddr !== ''){
                                        document.getElementById("addr1").value = jibunAddr;
                                    }
                                }
                            }).open();
                        }
                    </script>
                    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                </div>
            </div>
        </div>
    </div>
</section>

<form action="#">
    <button id="toTop" title="Go to top">
        <i class="fas fa-angle-up"></i>
    </button>
</form>

<%@ include file="../layout/footer.jsp"%>

<!-- jQuery -->
<script src="${path}/resources/plugins/jQuery/jquery.min.js"></script>
<!-- slick slider -->
<script src="${path}/resources/plugins/slick/slick.min.js"></script>
<!-- filter -->
<script src="${path}/resources/plugins/shuffle/shuffle.min.js"></script>

<!-- Main Script -->
<script src="${path}/resources/js/script.js"></script>
</body>
</html>

