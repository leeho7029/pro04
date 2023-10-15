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
                        <a id="admin-book-nav" href="${path}/admin/adminBookList.do" class="nav-link text-white">
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
                        <a href="${path}/admin/adminTeacherList.do"class="nav-link text-white">강사 관리</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-8">
            <br>
            <br>
            <br>
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-3">
                        <div class="card text-center">
                            <div class="card-body">
                                <h5 class="card-title">회원 수</h5>
                                <p class="card-text">${memberCnt}명</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-center">
                            <div class="card-body">
                                <h5 class="card-title">전체 게시글</h5>
                                <p class="card-text">${communityCnt}개</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-center">
                            <div class="card-body">
                                <h5 class="card-title">이벤트 참여자</h5>
                                <p class="card-text">${applyCnt}명</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-center">
                            <div class="card-body">
                                <h5 class="card-title">미완료 질문글</h5>
                                <p class="card-text">${noAnswerCnt}개</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
