<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 회원관리 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <!-- 관리자 페이지 스타일 적용 -->
    <link href="${path}/resources/css/sb-admin-2.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <c:if test="${not empty msg}">
        <script>
            alert("${msg} 회원을 강제 탈퇴시켰습니다.");
        </script>
    </c:if>
</head>
<body>
<div id="wrapper">
    <jsp:include page="../layout/adminSidebar.jsp" />

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <div class="container-fluid" style="padding: 100px">

                <table class="table table-hover text-center" id="user-table">
                    <thead>
                    <tr>
                        <th> 아이디 </th>
                        <th width="150"> 이름 </th>
                        <th width="180"> 연락처 </th>
                        <th width="180"> 이메일 </th>
                        <th width="210"> 가입일 </th>
                        <th width="150"> 접속횟수 </th>
                        <th width="100"> 보유포인트 </th>
                        <th width="150"> 비고 </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td class="align-middle"> ${user.id} </td>
                            <td class="align-middle"> ${user.name} </td>
                            <td class="align-middle"> ${user.tel} </td>
                            <td class="align-middle"> ${user.email} </td>
                            <td class="align-middle"> ${user.regdate} </td>
                            <td class="align-middle"> ${user.visited} 회 </td>
                            <td class="align-middle"> ${user.pt} pt </td>
                            <td class="align-middle">
                                <a href="${path}/admin/userDelete?id=${user.id}" class="btn btn-danger"> 강제탈퇴 </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty userList}">
                        <tr class="text-center">
                            <td colspan="8"> 가입된 회원이 없습니다. </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>

                <!-- pagination -->
            </div>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"/>

<script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${path}/resources/js/sb-admin-2.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<script>
    $(document).ready(function() {
        $('#user-table').DataTable({
            pageLength: 20,
            "scrollY": 400,
            "scrollCollapse": true
        });
    });
</script>
</body>
</html>