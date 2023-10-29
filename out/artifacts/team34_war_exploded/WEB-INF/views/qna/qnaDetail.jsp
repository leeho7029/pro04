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
    <title>Q&A 상세보기</title>
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
        <p>궁금한 내용을 질문해요</p>
        <h2>Q&A</h2>
    </div>
</section>
<!-- 브레드크럼 끝 -->
<section class="album-catagory section-padding-100-0 pb-5">
    <div class="course_details_area mb-100 mt-5">
        <div class="container">
            <!-- 테이블 영역 시작 -->
            <div class="col-12">
                <div class="card w-100">
                    <div class="card-body">
                        <div class="table-responsive project-list">
                            <div class="btn-group float-right mb-3">
                                <c:if test="${sid eq 'admin' && detail.lev eq 0}">
                                    <a href="${path}/qna/answerInsert?qno=${detail.qno}" class="btn btn-outline-dark">답변등록</a>
                                    <a href="${path}/qna/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                    <a href="${path}/qna/edit?qno=${detail.qno}" class="btn btn-outline-dark">수정</a>
                                    <a href="${path}/qna/delete?qno=${detail.qno}" class="btn btn-outline-dark">삭제</a>
                                </c:if>
                                <c:if test="${sid eq 'admin' && detail.lev eq 1}">
                                    <a href="${path}/qna/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                    <a href="${path}/qna/edit?qno=${detail.qno}" class="btn btn-outline-dark">수정</a>
                                    <a href="${path}/qna/delete?qno=${detail.qno}" class="btn btn-outline-dark">삭제</a>
                                </c:if>
                                <c:if test="${sid ne 'admin' && sid ne detail.author}">
                                    <a href="${path}/qna/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                </c:if>
                                <c:if test="${sid eq detail.author && sid ne 'admin'}">
                                    <a href="${path}/qna/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                    <a href="${path}/qna/edit?qno=${detail.qno}" class="btn btn-outline-dark">수정</a>
                                    <a href="${path}/qna/delete?qno=${detail.qno}" class="btn btn-outline-dark">삭제</a>
                                </c:if>
                            </div>
                            <table class="table project-table table-centered table-nowrap">
                                <tbody>
                                <tr>
                                    <th class="text-center">제목</th>
                                    <td colspan="3">${detail.title}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">작성일</th>
                                    <td>
                                        <fmt:parseDate value="${detail.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                                    </td>
                                    <th class="text-center">작성자</th>
                                    <td colspan="3">${detail.author}</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="font-size: 15px;" class="p-4">${detail.content}</td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <div class="d-flex justify-content-between">
                                            <c:if test="${!empty prev}">
                                                <div class="text-left">
                                                    <a href="${path}/qna/detail?qno=${prev.qno}&page=${curPage}"><i class="fa-solid fa-angles-left fa-xl"></i>${prev.title}</a>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty prev}">
                                                <div class="text-left">
                                                    <h6> 첫 번째 글입니다. </h6>
                                                </div>
                                            </c:if>
                                            <c:if test="${!empty next}">
                                                <div class="text-right">
                                                    <a href="${path}/qna/detail?qno=${next.qno}&page=${curPage}">${next.title}<i class="fa-solid fa-angles-right fa-xl"></i></a>
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
