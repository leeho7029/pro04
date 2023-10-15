<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center">
         <a class="logo me-auto" href="${path}"> <img src="${path}/resources/img/logo.png" style="max-height: none;"></a>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar">
            <ul>
                <li><a href="${path}" class="active">Home</a></li>
                <li><a href="${path}/intro/list.do">회사소개</a></li>
                <li><a href="${path}/notice/list.do">공지사항</a></li>
                <li class="dropdown"><a href="#"><span>게시판</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="${path}/fileboard/list.do">자료실</a></li>
                        <li><a href="${path}/community/list.do">커뮤니티</a></li>
                        <li class="dropdown"><a href="#"><span>질문</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">QnA</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="${path}/lecture/home">강의</a></li>
<%--                <li class="dropdown"><a href="#"><span>강의</span> <i class="bi bi-chevron-down"></i></a>--%>
<%--                    <ul>--%>
<%--                        <li><a href="#">국어</a></li>--%>
<%--                        <li><a href="#">영어</a></li>--%>
<%--                        <li><a href="#">수학</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
                <li><a href="${path}/book/home">교재</a></li>

            <c:if test="${sid eq null}">
                <li><a href="${path}/user/login.do" class="getstarted">로그인</a></li>
                <li><a href="${path}/user/term.do" class="btn-get-started">회원가입</a></li>
            </c:if>
                <c:if test="${sid ne null and sid ne 'admin'}">
                    <li style="margin-left: 40px">${sid}님 환영합니다</li>
                    <li><a href="${path}/user/logout.do" class="getstarted">로그아웃</a></li>
                    <li><a href="${path}/user/login2.do" class="btn-get-started">마이페이지</a></li>
                </c:if>
                <c:if test="${sid ne null and sid eq 'admin'}">
                    <li><a href="${path}/admin/adminList.do" class="getstarted">관리자페이지</a></li>
                    <li><a href="${path}/user/logout.do" class="btn-get-started">로그아웃</a></li>
                </c:if>

            </ul>
        </nav><!-- .navbar -->

    </div>
</header><!-- End Header -->
