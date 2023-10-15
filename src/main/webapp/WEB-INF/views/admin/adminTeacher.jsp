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
                        <a id="admin-teacher-nav" href="${path}/admin/adminteacherList.do" class="nav-link text-white">
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
                        <a href="${path}/admin/adminFileList.do"class="nav-link text-white">자료실 관리</a>
                    </li>
                    <li class="nav-item">
                        <a href="${path}/admin/adminTeacherList.do"class="nav-link text-white">강사 관리</a>
                    </li>

                </ul>
            </div>
        </div>
        <div class="col-md-8">
            <br>
            <br>
            <br>
            <div class="button-group" style="float:right;">
                <a class="bi-menu-button" style="font-size: 19px" href="${path }/teacher/insert.do">등록하기</a>
            </div>
            <table class="table" id="teacher-table">
                <thead>
                <tr>
                    <th>사진</th>
                    <th width="200">이름</th>
                    <th width="120">작성일</th>
                    <th>이메일</th>
                    <th>전화번호</th>
                    <th width="80">삭제</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${teacherList}" var="teacher" varStatus="status">
                    <tr>
                        <td>

                            <img src="${pageContext.request.contextPath}/resources/upload/teacher/${file.saveFolder}/${file.saveFile}" alt="사진"/>

                        </td>
                        <td><a href="${path}/teacher/detail.do?seq=${teacher.seq}"
                               style="color: #000000;">${teacher.tname}</a></td>
                        <td>
                            <fmt:parseDate value="${teacher.regdate}" var="resdate"
                                           pattern="yyyy-MM-dd HH:mm:ss"/>
                            <fmt:formatDate value="${resdate}" pattern="yyyy-MM-dd"/>
                        </td>
                        <td> ${teacher.tmail}</td>
                        <td>${teacher.ttel}</td>
                        <td>
                            <div class="button-group" style="align-items: center">
                                <a class="button is-danger"
                                   href="${path}/teacher/delete.do?seq=${teacher.seq}">삭제</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty teacherList}">
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
<%--<jsp:include page="../layout/footer.jsp"/>--%>
<!-- 푸터 영역 끝 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.4/r-2.2.9/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.4/r-2.2.9/datatables.min.js"></script>
<script>
    $(document).ready( function () {
        $('#teacher-table').DataTable({
            responsive : true,
            ordering: false,
            language: {
                url: '/js/user/dataTables.ko.json'
            },
            lengthChange: false
        });
    } );
</script>
