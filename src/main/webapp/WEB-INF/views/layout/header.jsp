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
                <li><a href="about.html">회사소개</a></li>
                <li><a href="${path}/notice/list.do">공지사항</a></li>
                <li class="dropdown"><a href="#"><span>게시판</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="#">자료실</a></li>
                        <li><a href="#">커뮤니티</a></li>
                        <li class="dropdown"><a href="#"><span>질문</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">QnA</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#"><span>강의</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="#">강의</a></li>
                        <li><a href="#">교재</a></li>
                        <li><a href="#">강사소개</a></li>
                    </ul>
                </li>

                <li><a href="${path}/user/login.do" class="getstarted">로그인</a></li>
                <li><a href="${path}/user/term.do" class="btn-get-started">회원가입</a></li>
            </ul>
        </nav><!-- .navbar -->

    </div>
</header><!-- End Header -->
