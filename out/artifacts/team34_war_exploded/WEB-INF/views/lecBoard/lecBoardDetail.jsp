<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<br>
<br>
<div class="has-background-white card-content shadow-down p-6" id="board2">
    <input id="qno" value="${detail.qno}" hidden="hidden">
    <input id="lcode" value="${detail.lcode}" hidden="hidden">
    <input id="qno2" value="${prev.qno}" hidden="hidden">
    <input id="curPage" value="${curPage}" hidden="hidden">
    <input id="qno3" value="${next.qno}" hidden="hidden">
    <div class="d-flex justify-content-end">
        <c:if test="${!empty sid && sid eq tid}">
            <a href="javascript:void(0);"  class="btn btn-outline-dark answer">답변등록</a>
        </c:if>
        <a href="javascript:void(0);" onclick="ListPage()" class="btn btn-outline-dark">목록</a>
        <c:if test="${sid eq 'admin' || sid eq detail.author}">
            <a href="javascript:void(0);" id="edit" data-qno="${list.qno}"  class="btn btn-outline-dark edit">수정</a>
            <a href="javascript:void(0);" id="delete" class="btn btn-outline-dark delete">삭제</a>
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
            <td colspan="6" style="font-size: 15px; height:300px;" class="p-4">${detail.content}</td>
        </tr>
        <tr>
            <td colspan="5">
                <div class="d-flex justify-content-between">
                    <c:if test="${!empty prev}">
                        <div class="text-left">
                            <a href="javascript:void(0);" onclick="prevPage()"><i class="fa-solid fa-angles-left fa-xl"></i>${prev.title}</a>
                        </div>
                    </c:if>
                    <c:if test="${empty prev}">
                        <div class="text-left">
                            <h6> 첫 번째 글입니다. </h6>
                        </div>
                    </c:if>
                    <c:if test="${!empty next}">
                        <div class="text-right">
                            <a href="javascript:void(0);" onclick="nextPage()">${next.title}<i class="fa-solid fa-angles-right fa-xl"></i></a>
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

<script>
    $('.edit').click(function (e) {
        e.preventDefault(); // 기본 클릭 이벤트 방지

        var qno = document.getElementById("qno").value;

        // Ajax 요청 보내기
        $.ajax({
            type: 'GET',
            url: '${path}/lecBoard/edit',
            data: {
                qno: qno,
            },
            success: function (data) {
                // Ajax 요청이 성공했을 때 수행할 작업
                // data 변수에 서버에서 반환한 데이터가 포함됩니다.
                $("#board").html(data);
                originalContent = $("#board").html();
            },
            error: function () {
                // Ajax 요청이 실패했을 때 수행할 작업
                console.log("에러다에러" + error.responseText)
            }
        });
    });
</script>
<script>
    $('.delete').click(function (e) {
        e.preventDefault(); // 기본 클릭 이벤트 방지

        var qno = document.getElementById("qno").value;

        // Ajax 요청 보내기
        $.ajax({
            type: 'GET',
            url: '${path}/lecBoard/delete',
            data: {
                qno: qno,
            },
            success: function (data) {
                // Ajax 요청이 성공했을 때 수행할 작업
                // data 변수에 서버에서 반환한 데이터가 포함됩니다.
                ListPage();
                originalContent = $("#board").html();
            },
            error: function () {
                // Ajax 요청이 실패했을 때 수행할 작업
                console.log("에러다에러" + error.responseText)
            }
        });
    });
</script>
<script>
    function ListPage(){
        var lcode = $("#lcode").val();
        $.ajax({
            type: "GET",  // GET 요청 또는 POST 요청을 선택할 수 있습니다.
            url: "${path}/lecBoard/list",  // 실제 API 엔드포인트로 변경해야 합니다.
            data: {
                lcode : lcode
            },
            success: function (data) {
                $("#board").html(data);
            },
            error: function (error) {
                console.log("에러다에러"+error.responseText)
            }
        });
    }
</script>
<script>
    function prevPage(){
        var qno = $("#qno2").val();
        var curPage = $("curPage").val();
        $.ajax({
            type: "GET",  // GET 요청 또는 POST 요청을 선택할 수 있습니다.
            url: "${path}/lecBoard/detail",  // 실제 API 엔드포인트로 변경해야 합니다.
            data: {
                qno : qno,
                curPage : curPage
            },
            success: function (data) {
                $("#board").html(data);
            },
            error: function (error) {
                console.log("에러다에러"+error.responseText)
            }
        });
    }
</script>
<script>
    function nextPage(){
        var qno = $("#qno3").val();
        var curPage = $("curPage").val();
        $.ajax({
            type: "GET",  // GET 요청 또는 POST 요청을 선택할 수 있습니다.
            url: "${path}/lecBoard/detail",  // 실제 API 엔드포인트로 변경해야 합니다.
            data: {
                qno : qno,
                curPage : curPage
            },
            success: function (data) {
                $("#board").html(data);
            },
            error: function (error) {
                console.log("에러다에러"+error.responseText)
            }
        });
    }
</script>
<script>
    $('.answer').click(function (e) {
        e.preventDefault(); // 기본 클릭 이벤트 방지

        var qno = document.getElementById("qno").value;

        // Ajax 요청 보내기
        $.ajax({
            type: 'GET',
            url: '${path}/lecBoard/answerInsert',
            data: {
                qno: qno,
            },
            success: function (data) {
                // Ajax 요청이 성공했을 때 수행할 작업
                // data 변수에 서버에서 반환한 데이터가 포함됩니다.
                $("#board").html(data);
                originalContent = $("#board").html();
            },
            error: function () {
                // Ajax 요청이 실패했을 때 수행할 작업
                console.log("에러다에러" + error.responseText)
            }
        });
    });
</script>