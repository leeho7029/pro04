<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <jsp:include page="../layout/head.jsp"/>
    <style>
        .chk_box { display: block; position: relative; padding-left: 25px; margin-bottom: 10px; cursor: pointer; font-size: 14px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }

        /* 기본 체크박스 숨기기 */
        .chk_box input[type="checkbox"] { display: none; }

        /* 선택되지 않은 체크박스 스타일 꾸미기 */
        .on { width: 20px; height: 20px; background: #ddd; position: absolute; top: 0; left: 0; border-radius: 5px}

        /* 선택된 체크박스 스타일 꾸미기 */
        .chk_box input[type="checkbox"]:checked + .on { background: #3D3D3D; }
        .on:after { content: ""; position: absolute; display: none; }
        .chk_box input[type="checkbox"]:checked + .on:after { display: block; }
        .on:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }
    </style>
    <c:if test="${not empty msg}">
    <script>
        $(document).ready(() => {
            $("#msg").text("${msg}");
        });
    </script>
    </c:if>
</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p>학습자 맞춤형 학습을 시작해요</p>
        <h2>Login</h2>
    </div>
</section>
<!-- 브레드크럼 끝 -->
<!-- 로그인 시작 -->
<section class="login-area section-padding-100">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">
                <div class="login-content">
                    <h3>어서오세요 <i class="fa-solid fa-face-smile fa-bounce"></i></h3>
                    <!-- Login Form -->
                    <div class="login-form">
                        <form action="${path}/user/login" method="post">
                            <div class="form-group">
                                <label for="id">아이디</label>
                                <input type="text" class="form-control" id="id" name="id" aria-describedby="emailHelp" placeholder="아이디를 입력해주세요" value="${cookie.userID.value}">
                                <label for="saveId" class="chk_box mt-2">
                                    <input type="checkbox" name="saveId" id="saveId" value="save" ${checked} checked="checked" />
                                    <span class="on"></span>
                                    아이디 기억하기
                                </label>
                            </div>
                            <div class="form-group">
                                <label for="pw">비밀번호</label>
                                <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력해 주세요">
                                <p class="text-danger" id="msg"></p>
                            </div>
                            <button type="submit" class="btn oneMusic-btn mt-30">로그인</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 로그인 끝 -->
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>