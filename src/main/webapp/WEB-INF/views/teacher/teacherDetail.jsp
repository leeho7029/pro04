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
                        <a id="admin-member-nav" href="${path}/admin/adminteacherList.do" class="nav-link text-white">
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
                        <a id="admin-cate-nav" href=${path}/admin/adminteacherList.do" class="nav-link text-white">
                            카테고리 관리
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
            <div class="has-background-white card-content shadow-down p-6">
                <h3 class="has-text-centered"> 강사 정보 </h3>
                <hr>
                <div class="columns is-multiline is-centered">
                    <div class="column is-10-tablet">
                        <label for="tname" class="label"> 사진 </label>
                        <c:forEach var="item" items="${fileboard2}">
                            <img src="${pageContext.request.contextPath}/resources/upload/teacher/${item.saveFolder}/${item.saveFile}" alt="사진"/>
                        </c:forEach>
                    </div>
                    <div class="column is-10-tablet">
                        <label for="tname" class="label"> 이름 </label>
                        <div class="control">
                            <input type="text" class="input" name="tname" id="tname" class="input"  value="${teacher.tname }" readonly>
                        </div>
                    </div>
                    <div class="column is-10-tablet">
                        <label for="tmail" class="label"> 이메일 </label>
                        <div class="control">
                            <input type="tmail" name="tmail" id="tmail" class="input" value="${teacher.tmail }" readonly>
                        </div>
                    </div>
                    <div class="column is-10-tablet">
                        <label for="ttel" class="label"> 전화번호 </label>
                        <div class="control">
                            <input type="tel" class="input" name="ttel" id="ttel" class="input"  value="${teacher.ttel }" readonly>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>