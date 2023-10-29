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
    <title>커뮤니티 상세보기</title>
    <jsp:include page="../layout/head.jsp"/>
    <style>
        table th {width: 10%;}
        textarea {
            padding: 15px;
            height: 100px;
            resize: none;
        }
    </style>
    <c:if test="${!empty msg}">
    <script>
        var msg="비속어가 존재합니다."
        alert(msg);
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
        <p>지식을 공유하며 함께 성장해요</p>
        <h2>커뮤니티</h2>
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
                            <c:if test="${sid eq 'admin' || sid eq detail.nickname}">
                                <div class="btn-group float-right mb-3">
                                    <a href="${path}/board/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                    <a href="${path}/board/edit?seq=${detail.seq}" class="btn btn-outline-dark">수정</a>
                                    <a href="${path}/board/delete?seq=${detail.seq}" class="btn btn-outline-dark">삭제</a>
                                </div>
                            </c:if>
                            <c:if test="${sid ne 'admin' && sid ne detail.nickname}">
                                <div class="btn-group float-right mb-3">
                                    <a href="${path}/board/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                </div>
                            </c:if>
                            <table class="table project-table table-centered table-nowrap">
                                <tbody>
                                <tr>
                                    <th class="text-center">제목</th>
                                    <td colspan="12">${detail.title}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">카테고리</th>
                                    <td colspan="3">${detail.cateName}</td>
                                    <th class="text-center">작성일</th>
                                    <td>
                                        <fmt:parseDate value="${detail.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                                    </td>
                                    <th class="text-center">작성자</th>
                                    <td colspan="3">${detail.nickname}</td>
                                    <th class="text-center">조회수</th>
                                    <td colspan="3">${detail.visited}</td>
                                </tr>
                                <tr>
                                    <td colspan="12" style="font-size: 15px;" class="p-4">${detail.content}</td>
                                </tr>
                                <tr>
                                    <td colspan="12">
                                        <div class="d-flex justify-content-between">
                                            <c:if test="${!empty prev}">
                                                <div class="text-left">
                                                    <a href="${path}/board/detail?seq=${prev.seq}&page=${curPage}"><i class="fa-solid fa-angles-left fa-xl"></i>&nbsp;${prev.title}</a>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty prev}">
                                                <div class="text-left">
                                                    <h6> 첫 번째 글입니다. </h6>
                                                </div>
                                            </c:if>
                                            <c:if test="${!empty next}">
                                                <div class="text-right">
                                                    <a href="${path}/board/detail?seq=${next.seq}&page=${curPage}">${next.title}&nbsp;<i class="fa-solid fa-angles-right fa-xl"></i></a>
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
                            <!-- 댓글 영역 시작 -->
                            <div class="comments-area">
                                <!-- 로그인 한 사람만 댓글 입력창 보이게 -->
                                <c:if test="${!empty sid}">
                                    <div class="comment-form">
                                        <form action="${path}/comment/insert" method="post">
                                            <div class="form-group">
                                                <div class="form-group form-inline">
                                                    <input type="hidden" id="seq" name="seq" value="${detail.seq}">
                                                    <input type="hidden" id="page" name="page" value="${curPage}">
                                                    <c:if test="${!empty cate}">
                                                        <input type="hidden" id="cate" name="cate" value="${cate}">
                                                    </c:if>
                                                    <c:if test="${!empty keyword}">
                                                        <input type="hidden" id="type" name="type" value="${type}">
                                                        <input type="hidden" id="keyword" name="keyword" value="${keyword}">
                                                    </c:if>
                                                    <textarea name="content" id="content" cols="30" rows="100" maxlength="800" class="col-11" placeholder="댓글을 입력해주세요"></textarea>
                                                    <input type="submit" value="등록" class="btn btn-dark col-1" style="height: 100px;">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </c:if>
                                <!-- 댓글 목록 -->
                                <div class="comment-list">
                                    <h5 class="pl-3">댓글</h5>
                                    <c:forEach items="${commentList}" var="comment">
                                        <div class="single-comment justify-content-between pb-4" style="border-top: 0.5px solid rgba(0,0,0,.125);">
                                            <div class="d-flex justify-content-between user">
                                                <div class="col-xl-11">
                                                    <h6 class="mt-2">${comment.nickname}</h6>
                                                    <p class="date" style="font-size: 12px; margin-bottom: 0;">${comment.resdate}</p>
                                                    <p class="comment" style="margin: 0">${comment.content}</p>
                                                </div>
                                                <c:if test="${(sid eq 'admin') or (sid eq comment.nickname)}">
                                                    <div class="btn-group-sm pt-2">
                                                        <a href="${path}/comment/delete?comNo=${comment.comNo}&seq=${detail.seq}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="btn btn-dark"> 삭제 </a>
                                                    </div>
                                                </c:if>
                                                <hr>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <c:if test="${empty commentList}">
                                        <div class="text-center">
                                            <p>등록된 댓글이 없습니다.</p>
                                        </div>
                                    </c:if>
                                </div>
                                <!-- 댓글 페이지 -->
                                <div class="oneMusic-pagination-area wow">
                                    <ul class="pagination justify-content-center mb-0">
                                        <c:if test="${curPage > 5}">
                                            <li class="page-item">
                                                <a href="${path}/board/detail?seq=${detail.seq}&page=${curPage}&commentPage=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                   class="page-item"><i class="fa-solid fa-arrow-left"></i></a>
                                            </li>
                                        </c:if>
                                        <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                            <c:choose>
                                                <c:when test="${i == curPage}">
                                                    <li class="page-item active">
                                                        <a href="${path}/board/detail?seq=${detail.seq}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                           class="page-link" aria-label="Page ${i}"
                                                           aria-current="page">${i}</a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li  class="page-item">
                                                        <a href="${path}/board/detail?seq=${detail.seq}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                           class="page-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${page.blockLastNum < page.totalPageCount}">
                                            <li class="""page-item">
                                                <a href="${path}/board/detail?seq=${detail.seq}&page=${curPage}&commentPage=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                   class="page-link"><i class="fa-solid fa-arrow-right"></i></a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                                <!-- 페이지 끝 -->
                                <!-- 댓글영역 끝 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <!-- 테이블 영역 끝 -->
        </div>
    </div>
</section>
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
