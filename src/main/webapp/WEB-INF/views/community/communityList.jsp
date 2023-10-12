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
    <style>
        h1 { font-size: 40pt; }
        h3 { font-size: 20pt; }
    </style>
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
        <div class="d-flex justify-content-center mb-5">
            <c:if test="${empty curCategory}">
            <label class="btn btn-primary active">
                </c:if>
                <c:if test="${!empty curCategory}">
                <label class="btn btn-primary">
                    </c:if>
                    <input type="radio" checked="checked" onclick="javascript:location.href='${path}/community/list.do'"/> 전체
                </label>
                <c:forEach var="cate" items="${categories}">
                <c:if test="${cate.cate eq curCategory}">
                <label class="btn btn-primary active">
                    </c:if>
                    <c:if test="${cate.cate ne curCategory}">
                    <label class="btn btn-primary">
                        </c:if>
                        <input type="radio" checked="checked" onclick="javascript:location.href='${path}/community/list.do?cate=${cate.cate}'"/> ${cate.cateName}
                    </label>
                    </c:forEach>
        </div>

        <div class="container">
            <form action="${path}/community/list.do" method="get" class="row g-3">
                <div class="col-auto">
                    <select id="type" name="type" class="form-select">
                        <option value="T">제목</option>
                        <option value="C">내용</option>
                        <option value="W">작성자</option>
                    </select>
                </div>
                <c:if test="${!empty curCategory}">
                    <input type="hidden" id="cate" name="cate" value="${curCategory}">
                </c:if>
                <div class="col-auto">
                    <input class="form-control" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off" value="${page.keyword}">
                </div>
                <div class="col-auto">
                    <input type="submit" class="btn btn-primary" value="검색" />
                </div>
            </form>

            <table class="table table-hover table-fullwidth">
                <thead>
                <tr>
                    <th class="text-center" width="100">#</th>
                    <th class="text-center" width="130">카테고리</th>
                    <th class="text-center">제목</th>
                    <th class="text-center" width="150">작성자</th>
                    <th class="text-center" width="150">작성일</th>
                    <th class="text-center" width="80">조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${list}">
                    <tr onclick="location.href='${path}/community/getCommunity.do?cno=${item.cno}&page=${curPage}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>'" style="cursor: pointer">
                        <td class="text-center">${item.cno}</td>
                        <td class="text-center">${item.cateName}</td>
                        <td style="max-width: 300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${item.title}</td>
                        <td class="text-center">${item.author}</td>
                        <td class="text-center">${item.resdate}</td>
                        <td class="text-center" width="80">${item.cnt}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list}">
                    <tr>
                        <td colspan="6" class="text-center">게시글이 없습니다.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>

            <!-- pagination -->
            <nav class="pagination justify-content-center mb-6" aria-label="pagination">
                <c:if test="${curPage > 5}">
                    <a href="${path}/community/list.do?page=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="btn btn-primary">Previous</a>
                </c:if>
                <c:if test="${page.blockLastNum < page.totalPageCount}">
                    <a href="${path}/community/list.do?page=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="btn btn-primary">Next page</a>
                </c:if>
                <ul class="pagination">
                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                        <c:choose>
                            <c:when test="${i == curPage}">
                                <li class="page-item active">
                                    <span class="page-link" aria-label="Page ${i}">${i}</span>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a href="${path}/community/list.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link" aria-label="Page ${i}">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </nav>

            <c:if test="${sid ne null}">
                <div class="text-end">
                    <a href="${path}/community/insert.do" class="btn btn-primary">글 작성하기</a>
                </div>
            </c:if>
        </div>
    </div>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>

<form action="#">
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

