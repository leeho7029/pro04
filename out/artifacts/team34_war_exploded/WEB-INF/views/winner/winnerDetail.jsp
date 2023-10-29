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
    <title>당첨자 발표 상세보기</title>
    <jsp:include page="../layout/head.jsp"/>
    <link rel="stylesheet" href="${path}/resources/css/firework.css">
    <style>
        table th {width: 12%;}
        body{
            -ms-overflow-style: none;
        }

        ::-webkit-scrollbar {
            display: none;
        }
    </style>
</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p>행운의 주인공을 확인해요</p>
        <h2>이벤트 당첨자 발표</h2>
    </div>
</section>
<!-- 브레드크럼 끝 -->
<section class="album-catagory section-padding-100-0" style="min-height: 532px;">
    <div class="course_details_area mb-5 mt-5">
        <div class="container">
            <!-- 테이블 영역 시작 -->
            <div class="col-12">
                <div class="card w-100">
                    <div class="card-body">
                        <div class="table-responsive project-list">
                            <c:if test="${sid eq 'admin'}">
                                <div class="btn-group float-right mb-3">
                                    <a href="${path}/winner/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                    <a href="${path}/winner/delete?wno=${detail.wno}" class="btn btn-outline-dark">삭제</a>
                                </div>
                            </c:if>
                            <c:if test="${sid ne 'admin'}">
                                <div class="btn-group float-right mb-3">
                                    <a href="${path}/winner/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                </div>
                            </c:if>
                            <table class="table project-table table-centered table-nowrap">
                                <tbody>
                                <tr>
                                    <th class="text-center">제목</th>
                                    <td>${detail.title}</td>
                                    <th class="text-center">작성일</th>
                                    <td>
                                        <fmt:parseDate value="${detail.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="font-size: 15px;" class="p-4">${detail.content}</td>
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
<script src="${path}/resources/js/firework.js"></script>
</html>
