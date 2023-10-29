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
    <title>이벤트 상세보기</title>
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
        <p>특별한 경험과 혜택을 누려요</p>
        <h2>이벤트</h2>
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
                                    <a href="${path}/event/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                    <a href="${path}/event/edit?eno=${detail.eno}" class="btn btn-outline-dark">수정</a>
                                    <a href="${path}/event/delete?eno=${detail.eno}" class="btn btn-outline-dark">삭제</a>
                                </div>
                            </c:if>
                            <c:if test="${sid ne 'admin'}">
                                <div class="btn-group float-right mb-3">
                                    <a href="${path}/event/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                </div>
                            </c:if>
                            <table class="table project-table table-centered table-nowrap">
                                <tbody>
                                <tr>
                                    <th class="text-center">제목</th>
                                    <td colspan="3">${detail.title}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">이벤트 기간</th>
                                    <td colspan="3">${detail.sdate} ~ ${detail.edate}</td>
                                </tr>
                                <tr>
                                    <th class="text-center">작성일</th>
                                    <td>
                                        <fmt:parseDate value="${detail.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                                    </td>
                                    <th class="text-center">조회수</th>
                                    <td>${detail.cnt}</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="font-size: 15px;" class="p-4">${detail.content}</td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <div class="d-flex justify-content-between">
                                            <c:if test="${!empty prev}">
                                                <div class="text-left">
                                                    <a href="${path}/event/detail?eno=${prev.eno}&page=${curPage}"><i class="fa-solid fa-angles-left fa-xl"></i>${prev.title}</a>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty prev}">
                                                <div class="text-left">
                                                    <h6> 첫 번째 글입니다. </h6>
                                                </div>
                                            </c:if>
                                            <c:if test="${!empty next}">
                                                <div class="text-right">
                                                    <a href="${path}/event/detail?eno=${next.eno}&page=${curPage}">${next.title}<i class="fa-solid fa-angles-right fa-xl"></i></a>
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
                            <div class="container mb-100">
                                <c:if test="${sid eq null && detail.status eq '1'}">
                                    <h6 class="text-center">로그인 한 회원만 이벤트 참여가 가능합니다 :)</h6>
                                    <button type="button" class="btn btn-block btn-dark" style="height:72px">신청하기</button>
                                </c:if>
                                <c:if test="${sid ne null && detail.status eq '1'}">
                                <div class="container">
                                    <input type="hidden" name="id" id="id" value="${sid}">
                                    <input type="hidden" id="eno" name="eno" value="${detail.eno}">
                                    <input type="hidden" name="app_chk" id="app_chk" value="no">
                                    <button type="button" id="ck_btn" class="btn btn-block btn-dark" onclick="appCheck()" style="height:72px">신청하기</button>
                                </div>
                                <script>
                                    function appCheck() {
                                        var child;
                                        let params = { id: $("#id").val(), eno: $("#eno").val()};
                                        $.ajax({
                                            url: "${path}/apply/appCheck",
                                            type: "post",
                                            dataType: "json",
                                            data: params,
                                            success:function(data) {
                                                console.log("HI");
                                                let appPass = data.result;
                                                if(!appPass) {
                                                    //$("#app_chk").val("no");
                                                    alert("이미 신청한 회원입니다.");
                                                } else {
                                                    //$("#app_chk").val("yes");
                                                    child = window.open("${path}/apply/insert?eno="+$("#eno").val()+"&id="+$("#id").val(), "child", "width=700, height=500");
                                                }
                                            },
                                            error:function(res) {
                                                alert(" 잠시 후 다시 시도해주세요.");
                                                console.log(res.responseText);
                                            }
                                        })
                                    }
                                </script>
                            </div>
                            </c:if>
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
