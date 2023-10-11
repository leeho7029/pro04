<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <title>회원약관</title>
    <jsp:include page="../setting/head.jsp"/>
    <style>
        .text-area {height:300px;overflow-y:auto;}
    </style>
    <script src="assets/js/main.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="${path}/resources/css/join.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //Custom Theme files -->
    <!-- web font -->
    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body id="body">
<jsp:include page="../layout/header.jsp"/>
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>회원약관</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>회원약관</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->
<div class="main-w3layouts wrapper">
    <div class="container">
        <div class="row" style="display: flex;justify-content: center;">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="block text-center">
                    <a class="logo" href="${rootPath}/">725 소개</a>
                    <h1 class="text-center">회원약관</h1>
                    <div>
                        <div class="form-group text-area mt-20">
                            <%@include file="term_util.jsp"%>
                        </div>
                        <div class="form-group"  style="display: flex; text-align: left">
                            <div class="wthree-text">
                                <label class="anim" for="ck_item1">
                                    <input type="checkbox" id="ck_item1" name="ck_item1"><br>
                                    <span>이용약관 동의</span>
                                </label>
                                <div class="clear"> </div>
                            </div>
                        </div>
                        <div class="form-group text-area mt-20">
                            <%@include file="term_person.jsp"%>
                        </div>
                        <div class="form-group"  style="display: flex; text-align: left">
                            <div class="wthree-text">
                                <label class="anim" for="ck_item2">
                                    <input type="checkbox" id="ck_item2" name="ck_item2"><br>
                                    <span>이용약관 동의</span>
                                </label>
                                <div class="clear"> </div>
                            </div>

                        </div>
                        <div class="form-group"  style="display: flex; text-align: left">
                            <div class="wthree-text">
                                <label class="anim" for="ck_item_all">
                                    <input type="checkbox" id="ck_item_all" name="ck_item" onclick="protocol()"><br>
                                    <span>이용약관 전체동의</span>
                                </label>
                                <div class="clear"> </div>
                            </div>

                        </div>
                        <div class="text-center">
                            <button type="button" id="in_btn1" class="btn btn-link">다음 단계</button>
                        </div>
                    </div>
                    <p class="mt-20">계정이 있으신가요?<a href="${rootPath }/user/login.do"> 로그인</a></p>
                    <ul class="colorlib-bubbles">
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                     </ul>
                </div>
                <script>
                    let ck_item1 = document.getElementById("ck_item1");
                    let ck_item2 = document.getElementById("ck_item2");
                    let in_btn1 = document.getElementById("in_btn1");
                    let chk = false;
                    in_btn1.addEventListener("click", () => {
                        if(ck_item1.checked && ck_item2.checked) {
                            location.href = "${path}/user/join.do?#";
                        } else {
                            alert("약관 및 개인정보처리 방침에 동의해주세요 :)");
                            return;
                        }
                    });

                    function protocol() {
                        chk = !chk;
                        ck_item1.checked = chk;
                        ck_item2.checked = chk;
                    }
                </script>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>