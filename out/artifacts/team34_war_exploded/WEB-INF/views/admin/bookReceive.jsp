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
    <title> 교재관리 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <!-- 관리자 페이지 스타일 적용 -->
    <link href="${path}/resources/css/sb-admin-2.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

</head>
<body>
<div id="wrapper">
    <jsp:include page="../layout/adminSidebar.jsp" />

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
                <ul class="navbar-nav ml-auto">
                    <div class="topbar-divider d-none d-sm-block"></div>

                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small"> 안녕하세요, 관리자님 </span>
                            <img class="img-profile rounded-circle" src="${path}/resources/img/adminProfile.svg">
                        </a>
                    </li>
                </ul>
            </nav>
            <div class="container mt-100 mb-100">
                <h2> 교재 입고 <i class="fa-solid fa-book"></i> </h2>
                <form action="${path}/admin/bookReceive" method="post" enctype="multipart/form-data">
                    <div class="form-group mt-3">
                        <label for="bcode"> 교재코드 </label>
                        <input type="text" name="bcode" id="bcode"  value="${book.bcode}" class="form-control" autocomplete="off" readonly>
                    </div>
                    <div class="form-group mt-3">
                        <label for="bname"> 교재명 </label>
                        <input type="text" name="bname" id="bname" value="${book.bname}" class="form-control" autocomplete="off" readonly>
                    </div>
                    <div class="form-group mt-3">
                        <label for="author"> 저자 </label>
                        <input type="text" name="author" id="author" value="${book.author}"class="form-control" autocomplete="off" readonly>
                    </div>
                    <div class="form-group mt-3">
                        <label for="bprice"> 가격 </label>
                        <input type="number" name="bprice" id="bprice" value="${book.bprice }"class="form-control" autocomplete="off" readonly>
                    </div>
                    <div class="form-group mt-3">
                        <label for="bprice"> 입고가격 </label>
                        <input class="form-control" type="number" name="rprice" id="rprice" min="1" value="${book.bprice}" required>
                    </div>
                    <div class="form-group mt-3">
                        <label for="bprice"> 수량 </label>
                        <input type="number" name="amount" id="amount" value="1" min="1" max="100" class="form-control" autocomplete="off" required>
                    </div>
                    <div class="text-right mt-3">
                        <button type="submit" class="btn btn-dark"> 등록하기 </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(() => {
        // 파일 선택 시 파일 이름이 나오도록 처리
        $("#customFile").on("change", () => {
            let fileName = '';
            let fileLength = $("#customFile")[0].files.length;
            if(fileLength > 1) {
                fileName = fileLength + "개의 파일";
            } else {
                fileName = $("#customFile").val().split("\\").pop();
            }
            $("#file-label").text("선택한 파일 : " + fileName);
        });
    });
</script>

<jsp:include page="../layout/footer.jsp"/>

<script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${path}/resources/js/sb-admin-2.min.js"></script>
</body>
</html>