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
            <div class="col-md-9">
                <form name="frm1" id="frm1" action="${path}/user/update.do" class="row" method="post" onsubmit="return updateCheck(this)" data-background="${path}/resources/img/backgrounds/bg-dots.png">
                    <div class="col-md-10">
                        <div class="mb-3">
                            <label for="id" class="form-label">아이디</label>
                            <input type="text" class="form-control" name="id" id="id" value="${user.id}" readonly required>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="mb-3">
                            <label for="pw" class="form-label">비밀번호</label>
                            <input type="password" id="pw" name="pw" class="form-control" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required>
                            <p class="form-text">(최소 8자리에서 최대 16자리까지, 숫자, 영문 대소문자, 특수문자가 각 1 문자 이상 포함되어야 함)</p>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="mb-3">
                            <label for="pw2" class="form-label">비밀번호 확인</label>
                            <input type="password" class="form-control" name="pw2" id="pw2" required>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="mb-3">
                            <label for="name" class="form-label">이름</label>
                            <input type="text" class="form-control" name="name" id="name" value="${user.name}" required>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="mb-3">
                            <label for="email" class="form-label">이메일</label>
                            <input type="email" name="email" id="email" class="form-control" value="${user.email}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="mb-3">
                            <label for="tel" class="form-label">전화번호</label>
                            <input type="tel" class="form-control" name="tel" id="tel" value="${user.tel}" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required>
                            <p class="form-text">(특수기호 포함하여 000-0000-0000 으로 입력해주세요)</p>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="mb-3">
                            <label for="tel" class="form-label">주소</label>
                            <input type="text" name="addr1" id="addr1" class="form-control" value="${user.addr1}">
                            <input type="text" name="addr2" id="addr2" class="form-control mt-3" value="${user.addr2}">
                            <div class="row mt-1">
                                <div class="col-md-9">
                                    <div class="mb-3">
                                        <input type="text" id="postcode" name="postcode" value="${user.postcode}" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-3 pl-0">
                                    <button type="button" class="btn btn-link btn-block" onclick="findAddr()">우편번호 검색</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="mb-3">
                            <label for="tel" class="form-label">생년월일</label>
                            <fmt:parseDate value="${user.birth}" var="birth" pattern="yyyy-MM-dd" />
                            <span style="display:none"><fmt:formatDate var="br" value="${birth}" pattern="yyyy-MM-dd" /></span>
                            <input type="date" name="birth" id="birth" max="${minYear}-12-31" value="${br}" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="text-end">
                            <c:if test="${sid!='admin'}">
                                <a href="${path}/user/myInfo.do" class="btn btn-primary">개인정보 페이지로 이동</a>
                            </c:if>
                            <input type="submit" class="btn btn-primary" value="회원정보수정">
                            <c:if test="${sid!='admin'}">
                                <a href="${path}/user/delete.do?id=${sid}" class="btn btn-danger">회원 탈퇴</a>
                            </c:if>
                            <c:if test="${sid=='admin'}">
                                <a href="${path}/user/list.do" class="btn btn-primary">회원 목록</a>
                            </c:if>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>