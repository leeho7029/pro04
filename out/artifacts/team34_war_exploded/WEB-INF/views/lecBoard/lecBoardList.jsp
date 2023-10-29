<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<br>
<br>
<div class="col-xl-4 col-md-6 float-right mb-20"  style="z-index: 10">
    <form action="${path}/lecBoard/list" method="get" >
        <div class="form-group ">
            <div class="input-group-append">
                <div class="panel single-accordion" style="border: 1px solid #ced4da; border-radius: 0.25rem;">
                    <select id="type" name="type" class="collapseOne" style="border: none;padding: 8px;">
                        <option value="T" > 제목 </option>
                        <option value="C"> 내용 </option>
                        <option value="W"> 작성자 </option>
                    </select>
                </div>
                <input type="text" name="keyword" class="form-control" placeholder="검색하기" aria-describedby="project-search-addon" />
                <input class="btn btn-dark" type="submit" id="project-search-addon" value="검색"/>
            </div>
        </div>
    </form>
</div>
<div class="container">
    <!-- 테이블 영역 시작 -->
    <div class="col-12 mb-5">
        <div class="card w-100">
            <div class="card-body">
                <div class="table-responsive project-list">
                    <table class="table project-table table-centered table-nowrap">
                        <thead>
                        <tr>
                            <th scope="col" class="text-center" style="width: 10%">#</th>
                            <th scope="col">제목</th>
                            <th scope="col" class="text-center" style="width: 15%">작성자</th>
                            <th scope="col" class="text-center" style="width: 15%">작성일</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${lecBoardList}" var="list" varStatus="status">
                            <c:if test="${list.lcode eq lecture.lcode}">
                            <tr class="table-hover">
                                <input type="hidden" value="${list.qno}">
                                <th class="text-center">${status.count}</th>
                                <th>
                                    <!-- 로그인 하지 않았을 때 -->
                                    <c:if test="${empty sid}">
                                        <!-- 질문 글 -->
                                        <c:if test="${list.lev eq 0}">
                                            ${list.title}
                                        </c:if>
                                        <!-- 답변 글 -->
                                        <c:if test="${list.lev eq 1}">
                                            &nbsp;&nbsp;&nbsp;&nbsp;⌞${list.title}
                                        </c:if>
                                    </c:if>
                                    <!-- 로그인 했을 때 -->
                                    <c:if test="${!empty sid}">
                                        <c:if test="${list.lev eq 0}">
                                            <input value="${list.qno}" id="qno" hidden="hidden">
                                            <input value="${curPage}" id="curPage" hidden="hidden">
                                            <a href="javascript:void(0);" class="ajax-link" data-qno="${list.qno}" data-page="${curPage}">${list.title}</a>
                                        </c:if>
                                        <c:if test="${list.lev eq 1}">
                                            <input value="${list.qno}" id="qno" hidden="hidden">
                                            <input value="${curPage}" id="curPage" hidden="hidden">
                                            <a href="javascript:void(0);" class="ajax-link" data-qno="${list.qno}" data-page="${curPage}">&nbsp;&nbsp;&nbsp;&nbsp;⌞${list.title}</a>
                                        </c:if>
                                    </c:if>
                                </th>
                                <th class="text-center">${list.author}</th>
                                <th class="text-center">
                                    <fmt:parseDate value="${list.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                                </th>
                            </tr>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty lecBoardList}">
                            <tr>
                                <td colspan="6" class="text-center"> 질문 및 답변이 없습니다.</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                    <!-- 페이지 시작 -->
                    <div class="oneMusic-pagination-area wow">
                        <ul class="pagination justify-content-center mb-0">
                            <c:if test="${curPage > 5}">
                                <li class="page-item">
                                    <a href="${path}/lecBoard/list?page=${page.blockStartNum - 1}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                       class="page-item"><i class="fa-solid fa-arrow-left"></i></a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                <c:choose>
                                    <c:when test="${i == curPage}">
                                        <li class="page-item active">
                                            <a href="${path}/lecBoard/list?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                               class="page-link" aria-label="Page ${i}"
                                               aria-current="page">${i}</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li  class="page-item">
                                            <a href="javascript:void(0);" class="page-link paging" aria-label="Page ${i}" aria-current="page">${i}</a>
                                            <input value="${i}" id="curPage1" hidden="hidden">
                                            <input value="${page.keyword}" id="keyword" hidden="hidden">
                                            <input value="${page.type}" id="type2" hidden="hidden">
                                            <input value="${lecture.lcode}" id="lcode2" hidden="hidden">
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${page.blockLastNum < page.totalPageCount}">
                                <li class="page-item">

                                    <a <%--href="${path}/lecBoard/list?page=${page.blockLastNum + 1}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" --%>class="page-link"><i class="fa-solid fa-arrow-right"></i></a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                    <!-- 페이지 끝 -->
                    <c:if test="${!empty sid && sid != 'admin'}">
                        <div class="btn float-right mt-10">
                            <input class="btn btn-dark" type="button" onclick="openWritePage()" value="글쓰기"/>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function openWritePage() {
        // AJAX 요청을 사용하여 글쓰기 페이지를 로드합니다.
        $.ajax({
            url: "${path}/lecBoard/questionInsert?lcode=${lecture.lcode}", // 글쓰기 페이지의 URL을 여기에 넣어주세요.
            type: "GET", // GET 요청 사용
            success: function (data) {
                console.log("성공")
                // 성공적으로 글쓰기 페이지를 불러왔을 때 실행되는 콜백 함수
                // data는 글쓰기 페이지의 HTML 내용을 포함하고 있습니다.
                $("#board").html(data); // 모달의 내용으로 페이지 내용을 삽입
            },
            error: function (error) {
                console.log("에러다에러"+error.responseText)
            }
        });
    }
</script>

<script>
        $('.ajax-link').click(function (e) {
            e.preventDefault(); // 기본 클릭 이벤트 방지

            var qno = document.getElementById("qno").value;
            var page = document.getElementById("curPage").value;

            // Ajax 요청 보내기
            $.ajax({
                type: 'GET',
                url: '${path}/lecBoard/detail',
                data: {
                    qno : qno,
                    page : page
                },
                success: function (data) {
                    // Ajax 요청이 성공했을 때 수행할 작업
                    // data 변수에 서버에서 반환한 데이터가 포함됩니다.
                    $("#board").html(data);
                    originalContent = $("#board").html();
                },
                error: function () {
                    // Ajax 요청이 실패했을 때 수행할 작업
                    console.log("에러다에러"+error.responseText)
                }
            });
        });
</script>

<script>
    $('.paging').click(function (e) {
        e.preventDefault(); // 기본 클릭 이벤트 방지

        var keyword = document.getElementById("keyword").value;
        var type = document.getElementById("type2").value;
        var page = parseInt(document.getElementById("curPage1").value);
        var lcode = $("#lcode2").val();
        let params = {"keyword" : keyword, "page" : page, "type" : type, "lcode" : lcode};
        // Ajax 요청 보내기
        $.ajax({
            type: 'GET',
            url: '${path}/lecBoard/list',
            data: params,
            success: function (data) {
                // Ajax 요청이 성공했을 때 수행할 작업
                // data 변수에 서버에서 반환한 데이터가 포함됩니다.
                $("#board").html(data);
                //originalContent = $("#board").html();
                console.log(data);
            },
            error: function (error) {
                // Ajax 요청이 실패했을 때 수행할 작업
                console.log("에러다에러"+error.responseText)
                console.log(params)
            }
        });
    });
</script>
