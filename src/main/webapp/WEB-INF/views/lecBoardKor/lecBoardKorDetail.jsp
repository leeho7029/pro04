<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>국어게시판 상세보기</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>
</head>
<body>

<!-- 헤더 영역 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 영역 끝 -->

<!-- 배너 영역 시작 -->
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">

        <div class="d-flex justify-content-between align-items-center">
            <h2>국어게시판 상세보기</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>공지사항</li>
            </ol>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->
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
            <table class="table" id="table" style="max-width: 1350px; margin-left: 275px;">
                <tbody>
                <tr style="border-top: solid grey 1px;">
                    <td style="font-weight: bold; font-size: 30px;">${LecBoardKor.title }</td><br>
                    <td style="min-width:10%; max-width: 15%; text-align: right; padding-top:30px;">
                        작성자 | ${LecBoardKor.id }
                    </td>
                    <td style="width: 170px; padding-right: 0px; padding-top:30px;">
                        작성일 | <fmt:parseDate value="${LecBoardKor.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                    </td>
                    <td style="width: 110px; padding-top:30px;">
                        조회수 | ${LecBoardKor.visited}
                    </td>
                </tr>
                <tr style="border-bottom: solid grey 1px;">
                    <td style="padding-top: 50px; padding-bottom: 50px;"><p>${LecBoardKor.content }</p></td>
                </tr>
                </tbody>
            </table>
            <div class="getstarted">
                <a class="getstarted" href="${path }/lecture/detail.do">목록</a>
                <c:if test='${sid eq "admin"}'>
                    <a class="button" href="${path }/lcBoardKor/delete.do?seq=${LecBoardKor.seq}">삭제</a>
                    <a class="button" href="${path }/lecBoardKor/edit.do?seq=${LecBoardKor.seq}">수정</a>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!-- 공지사항 글 상세보기 끝 -->
<br><br>
<!-- 푸터 영영 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->

</body>
</html>