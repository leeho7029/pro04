<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>
</head>
<body>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<!-- 헤더 영역 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 영역 끝 -->

<!-- 배너 영역 시작 -->
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>자료실</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>자료실</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->
<!-- 배너 영역 끝 -->

<!-- 공지사항 영역 시작 -->
<div class="content" id="content" style="margin-top: 20px;">
    <div class="row column text-center">
        <br>
        <div class="container" style="width: 80%">
            <%--자료실 --%>
            <%--                    <c:if test='${sid eq "admin"}'>--%>
            <div class="button-group" style="float:right;">
                <a class="btn btn-danger" style="font-size: 19px" href="${path }/fileboard/insert.do">글쓰기</a>
            </div>
            <%--                    </c:if>--%>
            <table class="table" id="fileboard-table">
                <thead>
                <tr>
                    <th width="80">번호</th>
                    <th width="200">제목</th>
                    <th width="80">작성자</th>
                    <th width="120">작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${fileboardList}" var="fileboard" varStatus="status">
                    <tr>
                        <td>${fileboard.articleno}</td>
                        <td><a href="${path}/fileboard/detail.do?articleno=${fileboard.articleno}"
                               style="color: #000000;">${fileboard.title}</a></td>
                        <td>${fileboard.id}</td>
                        <td>
                            <fmt:parseDate value="${fileboard.regdate}" var="resdate"
                                           pattern="yyyy-MM-dd HH:mm:ss"/>
                            <fmt:formatDate value="${resdate}" pattern="yyyy-MM-dd"/>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty fileboardList}">
                    <tr>
                        <td colspan="5" class="has-text-centered"> 등록된 자료가 없습니다.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- 공지사항 영역 끝-->

<!-- 푸터 영영 시작 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.4/r-2.2.9/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.4/r-2.2.9/datatables.min.js"></script>
<script>
    $(document).ready( function () {
        $('#fileboard-table').DataTable({
            responsive : true,
            ordering: false,
            language: {
                url: '/js/user/dataTables.ko.json'
            },
            lengthChange: false
        });
    } );
</script>
<br><br>
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>