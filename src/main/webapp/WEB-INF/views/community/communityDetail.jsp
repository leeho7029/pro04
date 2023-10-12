<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title> 커뮤니티 </title>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <jsp:include page="../setting/head.jsp" />
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>커뮤니티</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>커뮤니티</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->

<section class="section">
    <div class="container">
        <div class="d-flex justify-content-end mt-4">
            <a href="${path}/community/list.do?page=${curPage}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="btn btn-primary">목록</a>
            <c:if test="${(sid eq 'admin') or (sid eq detail.author)}">
                <a href="${path}/community/edit.do?cno=${detail.cno}" class="btn btn-primary">수정</a>
                <a href="${path}/community/delete.do?cno=${detail.cno}" class="btn btn-danger">삭제</a>
            </c:if>
        </div>
        <div class="row mt-4">
            <div class="col-md-6">
                <p class="fw-bold">카테고리</p>
                <input type="text" value="${detail.cateName}" class="form-control" readonly>
            </div>
            <div class="col-md-6">
                <p class="fw-bold">제목</p>
                <input type="text" value="${detail.title}" class="form-control" readonly>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-6">
                <p class="fw-bold">작성자</p>
                <input type="text" value="${detail.author}" class="form-control" readonly>
            </div>
            <div class="col-md-6">
                <p class="fw-bold">작성일</p>
                <input type="text" value="${detail.resdate}" class="form-control" readonly>
            </div>
            <div class="col-md-2">
                <p class="fw-bold">조회수</p>
                <input type="text" value="${detail.cnt}" class="form-control" readonly>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="bg-light p-3 rounded" style="min-height: 500px; border: 1px solid #ddd; border-radius: 5px;">
                    ${detail.content}
                </div>
            </div>
        </div>
    </div>
    <c:if test="${sid ne null}">
        <div class="container mt-5">
            <form action="${path}/comment/insert.do" method="post" class="row">
                <div class="col-md-9">
                    <textarea name="content" id="content" class="form-control" maxlength="990" rows="2" placeholder="댓글을 달아주세요 :)"></textarea>
                </div>
                <div class="col-md-3">
                    <input type="hidden" id="cno" name="cno" value="${detail.cno}">
                    <input type="hidden" id="page" name="page" value="${curPage}">
                    <c:if test="${!empty cate}">
                        <input type="hidden" id="cate" name="cate" value="${cate}">
                    </c:if>
                    <c:if test="${!empty keyword}">
                        <input type="hidden" id="type" name="type" value="${type}">
                        <input type="hidden" id="keyword" name="keyword" value="${keyword}">
                    </c:if>
                    <input type="submit" class="btn btn-primary btn-block mt-2" value="전송">
                </div>
            </form>
        </div>
    </c:if>

    <div class="container">
        <c:forEach var="comment" items="${commentList}">
            <c:if test="${(sid eq 'admin') or (sid eq comment.author)}">
                <div class="d-flex justify-content-end mt-5">
                    <a href="${path}/comment/delete.do?comNo=${comment.comNo}&cno=${detail.cno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="btn btn-sm btn-danger">삭제</a>
                </div>
            </c:if>
            <div class="row mt-3">
                <div class="col-md-6">
                    <p>${comment.author}</p>
                </div>
                <div class="col-md-6 text-end">
                    <p>${comment.resdate}</p>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-12">
                    <textarea class="form-control" readonly>${comment.content}</textarea>
                </div>
            </div>
        </c:forEach>
        <!-- pagination -->
        <nav class="mt-5 mb-5" aria-label="pagination">
            <c:if test="${commentPage > 5}">
                <a href="${path}/community/getCommunity.do?cno=${detail.cno}&page=${curPage}&commentPage=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="btn btn-primary">Previous</a>
            </c:if>
            <c:if test="${page.blockLastNum < page.totalPageCount}">
                <a href="${path}/community/getCommunity.do?cno=${detail.cno}&page=${curPage}&commentPage=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="btn btn-primary">Next page</a>
            </c:if>
        </nav>
    </div>
</section>
<br><br>
<%@ include file="../layout/footer.jsp"%>

<form action="#">
    <input type="hidden" id="cno" name="cno" value="${detail.cno}">
    <button id="toTop" title="Go to top">
        <i class="fas fa-angle-up"></i>
    </button>
</form>

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
