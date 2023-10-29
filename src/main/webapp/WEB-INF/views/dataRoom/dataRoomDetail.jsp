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
    <title>자료실 상세보기</title>
    <jsp:include page="../layout/head.jsp"/>
    <style>
        table th {width: 12%;}
    </style>
</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p style="color: white; font-weight: bold; font-size:30px;">자료실</p>
    </div>
</section>
<!-- 브레드크럼 끝 -->
<section class="album-catagory section-padding-100-0">
    <div class="course_details_area mb-5 mt-5">
        <div class="container">
            <!-- 테이블 영역 시작 -->
            <div class="col-12">
                <div class="card w-100">
                    <div class="card-body">
                        <div class="table-responsive project-list">
                            <c:if test="${sid eq 'admin'}">
                                <div class="btn-group float-right mb-3">
                                    <a href="${path}/dataRoom/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                    <a href="${path}/dataRoom/edit?articleNo=${detail.articleNo}" class="btn btn-outline-dark">수정</a>
                                    <a href="${path}/dataRoom/delete?articleNo=${detail.articleNo}" class="btn btn-outline-dark">삭제</a>
                                </div>
                            </c:if>
                            <c:if test="${sid ne 'admin'}">
                                <div class="btn-group float-right mb-3">
                                    <a href="${path}/dataRoom/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                </div>
                            </c:if>
                            <table class="table project-table table-centered table-nowrap">
                                <tbody>
                                <tr>
                                    <th class="text-center">제목</th>
                                    <td colspan="3">${detail.title}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">작성일</th>
                                    <td>
                                        <fmt:parseDate value="${detail.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="font-size: 15px;" class="p-4">${detail.content}</td>
                                </tr>
                                <tr>
                                    <th colspan="6" style="font-size: 15px;" class="pb-2 pl-4">학습자료(클릭하여 다운로드)</th>
                                </tr>
                                <tr>
                                    <td colspan="6" style="border: none;font-size: 15px;padding: 0;" class="pb-1 pl-4">
                                        <c:forEach var="item" items="${fileList}">
                                            <a href="${path}/resources/upload/dataRoom/${item.saveFolder}/${item.saveFile}" download="${item.originFile }" style="font-weight: 500;font-size: 15px;"><i class="fa-solid fa-file"></i> ${item.originFile } </a>
                                        </c:forEach>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <div class="d-flex justify-content-between">
                                            <c:if test="${!empty prev}">
                                                <div class="text-left">
                                                    <a href="${path}/dataRoom/detail?articleNo=${prev.articleNo}&page=${curPage}"><i class="fa-solid fa-angles-left fa-xl"></i>&nbsp;${prev.title}</a>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty prev}">
                                                <div class="text-left">
                                                    <h6> 첫 번째 글입니다. </h6>
                                                </div>
                                            </c:if>
                                            <c:if test="${!empty next}">
                                                <div class="text-right">
                                                    <a href="${path}/dataRoom/detail?articleNo=${next.articleNo}&page=${curPage}">${next.title}&nbsp;<i class="fa-solid fa-angles-right fa-xl"></i></a>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty next}">
                                                <div class="text-right">
                                                    <h6> 마지막 글입니다. </h6>
                                                </div>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 테이블 영역 끝 -->
    </div>
</section>
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
