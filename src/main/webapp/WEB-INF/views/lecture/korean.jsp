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
                    <li class="list-group-item">
                        <div class="row">
                            <c:forEach items="${lectureList}" var="lecture" varStatus="status">
                            <div class="col-md-2 img">
                                <img src="" alt="사진"/>
                            </div>

                                <div class="col-md-10 cont_wrap">
                                    <div class="txt_area">
                                        <h6 class="tit"><a href="${path}/lecture/detail.do?lecno=${lecture.lecno}">${lecture.lectitle}</a></h6>
                                        <!-- 제작완료일 때 complt 클래스 -->
                                    </div>
                                    <div class="btn_wrap">
                                        <a href="${path}/register/insert.do?lecno=${lecture.lecno}" class="btn btn-primary btn_L_col2"><span>수강신청</span></a>
                                    </div>
                                </div>
                                <hr>
                            </c:forEach>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>



<jsp:include page="../layout/footer.jsp"/>
</body>
</html>