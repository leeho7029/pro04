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
    <title> 당첨자 발표 글쓰기 </title>
    <link href="${path}/resources/css/sb-admin-2.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <!-- 관리자 페이지 스타일 적용 -->
</head>
<body>
<section class="album-catagory">
    <div id="wrapper">
        <jsp:include page="../layout/adminSidebar.jsp" />
        <div id="content-wrapper" class="d-flex flex-column">
            <div>
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
                <!-- 헤더 사이드 영역 끝 -->

                <!--등록하기-->

                <div class="container-fluid" style="padding: 100px">
                    <div class="col-12 mb-5">
                        <div class="container">
                            <form action="${path}/winner/insert" method="post">
                                <div class="card w-100">
                                    <div class="card-body">
                                        <div class="table-responsive project-list">
                                            <table class="table project-table table-centered table-nowrap">
                                                <tbody>
                                                <tr>
                                                    <input type="hidden" value="${event.eno}" id="eno" name="eno">
                                                    <th class="text-center" style="vertical-align: middle; width: 15%;">제목</th>
                                                    <td><input type="text" id="title" name="title" value="${event.title} 당첨자 발표" class="form-control pl-2" required autofocus></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6" style="font-size: 15px;">
                                                        <textarea name="content" id="content" cols="100" rows="8" maxlength="800" class="single-textarea" style="height: 400px; border: 1px solid #cbcbcb; resize: none">
<c:forEach var="win" items="${winners}" varStatus="status">
${status.count}. id : ${win.id} / 이름 : ${win.name} <br>
</c:forEach>
당첨자는 개별 연락 드릴 예정입니다.
                                                        </textarea>
                                                        <script>
                                                            $(document).ready(function () { $("#content").cleditor(); });
                                                        </script>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <div class="btn-group float-right mr-3">
                                                <a href="${path}/winner/list?page=${curPage}" class="btn btn-outline-dark">목록</a>
                                                <input type="submit" class="btn btn-dark" style="height: 100%" value="등록">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 푸터 영영 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->
</body>
</html>