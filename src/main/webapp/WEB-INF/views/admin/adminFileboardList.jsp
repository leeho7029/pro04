<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="../setting/head.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-4" style="height: 950px;">
            <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px;height: 100%">
                <br>
                <h1 class="fs-4">관리자페이지</h1>
                <hr class="my-4">
                <ul class="nav flex-column mb-auto">
                    <li class="nav-item">
                        <a id="admin-member-nav" href="${path}/admin/adminuserList.do" class="nav-link text-white">
                            회원 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a id="admin-notice-nav" href="${path}/admin/adminNoticeList.do" class="nav-link text-white">
                            공지사항 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a id="admin-book-nav" href="${path}admin/adminBookList.do" class="nav-link text-white">
                            교재 관리
                        </a>
                    </li>
                        <li class="nav-item">
                        <a id="admin-cate-nav" href="${path}/subject/list.do" class="nav-link text-white">
                            과목 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a id="admin-file-nav" href="${path}/admin/adminLectureList.do" class="nav-link text-white">
                            강의 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${path}/admin/adminFileList.do"class="nav-link text-white">자료실</a>
                    </li>
                    <li class="nav-item">
                        <a href="${path}/admin/adminsubjectList.do"class="nav-link text-white">강사 관리</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-8">
            <br>
            <br>
            <br>
            <table class="table" id="file-table">
                <thead>
                <tr>
                    <th width="80">번호</th>
                    <th width="200">제목</th>
                    <th width="80">작성자</th>
                    <th width="120">작성일</th>
                    <th width="80">삭제</th>
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
                        <td>
                            <div class="button-group" style="align-items: center">
                                <a class="button is-danger"
                                   href="${path}/fileboard/delete.do?articleno=${fileboard.articleno}">삭제</a>
                            </div>
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
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
            jQuery(function ($) {
                $("#file-table").DataTable();
            })
        </script>
    </div>
</div>
