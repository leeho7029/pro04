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
    <title>이벤트 수정하기</title>
    <jsp:include page="../layout/head.jsp"/>

    <style>
        input {
            border-radius: 5px;
            height: 35px;
            border: 1px solid #cbcbcb;
            width: 100%;
        }
        textarea {
            resize: none;
            width: 100%;
            height: 400px;
            border: 1px solid #cbcbcb;
            border-radius: 5px;
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
        <p>특별한 경험과 혜택을 누려요</p>
        <h2>이벤트</h2>
    </div>
</section>
<!-- 브레드크럼 끝 -->
<section class="album-catagory section-padding-100-0">
    <div class="course_details_area mb-5 mt-5">
        <div class="container">
            <!-- 테이블 영역 시작 -->
            <form action="${path}/event/edit" method="post">
                <div class="col-12">
                    <div class="card w-100">
                        <div class="card-body">
                            <div class="table-responsive project-list" style="overflow-x: hidden">
                                <table class="table project-table table-centered table-nowrap">
                                    <tbody>
                                    <tr>
                                        <input type="hidden" value="${detail.eno}" name="eno" id="eno">
                                        <th class="text-center" style="vertical-align: middle; width: 15%;">제목</th>
                                        <td><input type="text" id="title" name="title" class="pl-2" value="${detail.title}" required autofocus></td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" style="vertical-align: middle; width: 15%;">이벤트 상태</th>
                                        <td>
                                            <div class="panel single-accordion">
                                                <select name="status" id="status" class="collapseOne" style="border: 1px solid #ced4da; border-radius: 5px; padding: 8px;">
                                                <c:if test="${detail.status eq '1'}">
                                                    <option value="1" selected>진행중</option>
                                                    <option value="0">종료</option>
                                                </c:if>
                                                    <c:if test="${detail.status eq '0'}">
                                                        <option value="1">진행중</option>
                                                        <option value="0" selected>종료</option>
                                                    </c:if>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center">시작일</th>
                                        <td><input type="date" name="sdate" id="sdate" class="input" value="${detail.sdate}" autocomplete="off" required></td>
                                    </tr>
                                    <tr>
                                        <th class="text-center">종료일</th>
                                        <td><input type="date" name="edate" id="edate" class="input" value="${detail.edate}" autocomplete="off" required></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" style="font-size: 15px;">
                                            <textarea name="content" id="content" cols="100" rows="8" maxlength="800" class="single-textarea" style="height: 400px; border: 1px solid #cbcbcb">${detail.content}</textarea>
                                            <script>
                                                $(document).ready(function () { $("#content").cleditor(); });
                                            </script>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="btn-group float-right mr-3">
                                    <a href="${path}/event/list" class="btn btn-outline-dark">목록</a>
                                    <input type="submit" class="btn btn-dark" style="height: 100%" value="등록">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- 테이블 영역 끝 -->
    </div>
</section>
<script>
    // 시작일 변경 시 종료일 처리
    $("#sdate").change(() => {
        $("#edate").prop("min", $("#sdate").val());
        // 종료일이 변경한 시작일보다 빠른 경우
        if($("#edate").val() < $("#sdate").val()) {
            $("#edate").val($("#sdate").val());
        }
    });
    // 종료일 변경 시 시작일 처리
    $("#edate").change(() => {
        $("#sdate").prop("max", $("#edate").val());
    })
</script>
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>