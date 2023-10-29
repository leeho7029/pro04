<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<header class="header-area">
    <!-- Navbar Area -->
    <div class="oneMusic-main-menu">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                    <!-- Nav brand -->
                    <a href="${path}/" class="nav-brand"><img src="${path}/resources/img/logo2.png" alt="해법 로고 이미지" style="width: 80%"></a>

                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <!-- Menu -->
                    <div class="classy-menu">

                        <!-- Close Button -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <!-- Nav Start -->
                        <div class="classynav">
                            <ul>
                                <li><a href="${path}/lecture/list"> 강의 </a></li>
                                <li><a href="#"> 서비스 </a>
                                    <ul class="dropdown">
                                        <li><a href="${path}/board/list"> 커뮤니티 </a></li>
                                        <li>
                                            <c:if test="${not empty sid}">
                                                <a href="${path}/attendance/check"> 출석체크 </a>
                                            </c:if>
                                            <c:if test="${empty sid}">
                                                <a href="${path}/user/login" onclick="return alert('로그인 후 접근 가능한 페이지입니다 :)')"> 출석체크 </a>
                                            </c:if>
                                        </li>
                                        <li><a href="${path}/news/list"> 교육뉴스 </a></li>
                                        <li><a href="#"> 이벤트 </a>
                                            <ul class="dropdown">
                                                <li><a href="${path}/event/list"> 이벤트 목록 </a></li>
                                                <li><a href="${path}/winner/list"> 당첨자 목록 </a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="#"> 고객지원 </a>
                                    <ul class="dropdown">
                                        <li><a href="${path}/notice/list"> 공지사항 </a></li>
                                        <li><a href="${path}/qna/list"> Q&A </a></li>
                                        <li><a href="${path}/faq/list"> FAQ </a></li>
                                        <li><a href="${path}/dataRoom/list"> 자료실 </a></li>
                                    </ul>
                                </li>
                            </ul>

                            <!-- Login/Register & Cart Button -->
                            <div class="login-register-cart-button d-flex align-items-center">
                                <c:if test="${isTeacher}">
                                    <a href="${path}/lectureAttend/teacherLecture">
                                        <i class="fa-solid fa-chalkboard fa-xl mr-3" style="color: #fff"></i>
                                    </a>
                                </c:if>
                                <!-- Login/Register -->
                                <c:if test="${sid eq null}">
                                <div class="login-register-btn mr-50" style="margin-right: 10px!important;" >
                                    <a href="${path}/user/term" class="btn btn-primary" style="background-color: #fff; color: #000; border: none;">JOIN</a>
                                </div>
                                <div class="login-register-btn mr-50">
                                    <a href="${path}/user/login" class="btn btn-primary" style="background-color: #625e5e; color: #fff; border: none;">LOGIN</a>
                                </div>
                                </c:if>
                                <c:if test="${sid ne null && sid eq 'admin'}">
                                    <div class="login-register-btn mr-50" style="margin-right: 10px!important;" >
                                        <a href="${path}/admin/dashboard" class="btn btn-primary" style="background-color: #fff; color: #000; border: none;">ADMIN</a>
                                    </div>
                                    <div class="login-register-btn mr-50">
                                        <a href="${path}/user/logout" class="btn btn-primary" style="background-color: #625e5e; color: #fff; border: none;">LOGOUT</a>
                                    </div>
                                </c:if>
                                <c:if test="${sid ne null && sid ne 'admin'}">
                                    <div class="login-register-btn mr-50" style="margin-right: 10px!important;" >
                                        <a href="${path}/user/myPage" class="btn btn-primary" style="background-color: #fff; color: #000; border: none;">MYPAGE</a>
                                    </div>
                                    <div class="login-register-btn mr-50">
                                        <a href="${path}/user/logout" class="btn btn-primary" style="background-color: #625e5e; color: #fff; border: none;">LOGOUT</a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <!-- Nav End -->
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
