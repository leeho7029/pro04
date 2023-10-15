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
            <div class="button-group" style="float:right;">
                <a class="bi-menu-button" style="font-size: 19px" href="${path }/subject/insert.do">등록하기</a>
            </div>
            <div class="col-md-9">
                <table class="table" id="subject-table">
                    <thead>
                    <tr>
                        <th width="200">코드</th>
                        <th width="120">제목</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${subjectList}" var="subject" varStatus="status">
                        <tr>
                            <td>${subject.subcode}</td>
                            <td> ${subject.title}</td>
                            <td>
                                <div class="button-group" style="align-items: center">
                                    <a class="button is-danger"
                                       href="${path}/subject/delete.do?subno=${subject.subno}">삭제</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty subjectList}">
                        <tr>
                            <td colspan="5" class="has-text-centered"> 등록된 과목이 없습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>