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
    <title> 강사관리 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <!-- 관리자 페이지 스타일 적용 -->
    <link href="${path}/resources/css/sb-admin-2.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- ckEditor 적용 -->
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
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
                            <img class="img-profile rounded-circle"
                                 src="${path}/resources/img/adminProfile.svg">
                        </a>
                    </li>
                </ul>
            </nav>
            <div class="container mt-100 mb-100">
                <h2> 새로운 강사 등록 <i class="fa-solid fa-feather"></i> </h2>
                <form action="${path}/admin/teacherInsert" method="post" enctype="multipart/form-data">
                    <div class="form-group mt-3">
                        <label for="searchID"> 강사 아이디 </label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="searchID" placeholder="검색할 아이디를 입력해주세요"
                                   autocomplete="off" aria-label="검색할 아이디를 입력해주세요" aria-describedby="button-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-dark" type="button" id="button-addon2"
                                        onclick="findID()"> 검색
                                </button>
                            </div>
                        </div>
                        <select class="custom-select" id="tid" name="tid" size="8" required>
                            <c:forEach var="id" items="${idList}">
                                <option value="${id}" class="p-2"> ${id} </option>
                            </c:forEach>
                        </select>
                        <script>
                            function findID() {
                                let data = {"tid": $("#searchID").val()}
                                $.ajax({
                                    url: "${path}/admin/findTeacherID",
                                    data: data,
                                    type: "post",
                                    dataType: "json",
                                    success: function (result) {
                                        $("#tid option").remove();
                                        for (idx in result) {
                                            $("#tid").append("<option value='" + result[idx].id + "' class='p-2'>" + result[idx].id + "</option>");
                                        }
                                    },
                                    error: function (res, text) {
                                        alert("문제가 발생하였습니다. 잠시 후 다시 시도해주세요.")
                                    }
                                });
                            }
                        </script>
                    </div>
                    <div class="form-group mt-3">
                        <label for="tname"> 강사명 </label>
                        <input type="text" name="tname" id="tname" class="form-control" autocomplete="off" required>
                    </div>
                    <div class="form-group mt-3">
                        <label for="ttel"> 강사 연락처 </label>
                        <input type="text" name="ttel" id="ttel" class="form-control" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" autocomplete="off" required>
                    </div>
                    <div class="form-group mt-3">
                        <label for="temail"> 강사 이메일 </label>
                        <input type="email" name="temail" id="temail" class="form-control" autocomplete="off" required>
                    </div>
                    <div class="form-group mt-3">
                        <label for="tcontent"> 강사 소개 </label>
                        <textarea name="tcontent" id="tcontent" class="form-control" cols="30" rows="10" maxlength="1400" required></textarea>
                    </div>
                    <div class="custom-file mt-3">
                        <input type="file" name="upfile" class="custom-file-input" id="customFile" onchange="chk_file_type(this)" required>
                        <label class="custom-file-label" id="file-label" for="customFile">Choose file</label>
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