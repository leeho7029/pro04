<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>강의</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>강의</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->



<div class="container mt-5">
    <div class="row">
        <div class="col-md-3">
            <aside class="menu is-hidden-mobile">
                <ul class="list-group" style="text-align: center; height: 400px; color: orange; font-weight: bold;">
                    <li class="list-group-item " style="background-color: black; color: white">모든강좌</li>
                    <li class="list-group-item "><a href="${path}/lecture/home">메인</a></li>
                    <li class="list-group-item"><a href="${path}/lecture/korean">국어</a></li>
                    <li class="list-group-item"><a href="${path}/lecture/english">영어</a></li>
                    <li class="list-group-item"><a href="${path}/lecture/math">수학</a></li>
                </ul>
            </aside>
        </div>
        <div class="col-md-9">
            <div class="container mt-5">
                <ul class="list-group thumb_list_wrap">
            <c:forEach items="${noticeList}" var="notice" varStatus="status">
        <li>
            <div class="img">
                <img src="" alt="교재사진">
            </div>
            <div class="cont_wrap">
                <div class="txt_area">
                    <div>
                        <span class="flag_ro_col1">고1</span>
                        <span class="flag_ro_col4">${notice.id}</span></div>
                    <p class="tit">
                        <a href="">${notice.title}</a>
                    </p>
                    <div class="detail_info">
                        <span>발행일 <em>${notice.regdate}</em></span>
                        <span >종이책 정가 <em>${notice.seq}</em>원</span>
                        <span>종이책
                            <button type="button" class="btn_buy" onclick="fn_aiSendParam();">
                            <span>구매하기</span></button>
						</span>
                        <span class="font_darkgray theView">
						<button type="button" class="btn_zoom" title="미리보기" onclick="previewPop('')">
                            <span>교재</span>
                        </button>
						</span>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button type="button" class="btn_L_col1" onclick="window.location.href=''"><span>교재 정답지</span></button>
                    <button type="button" class="btn_L_col2" onclick="window.location.href=''"><span>교재 정오표</span></button>
                </div>
            </div>
        </li>
    <hr>
</c:forEach>
    </ul>
            </div>
</div>
</body>
</html>
