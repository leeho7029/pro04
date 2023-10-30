<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의실</title>
    <jsp:include page="../layout/head.jsp"/>
    <style>
        #gotoTab {
            width: 100%; /* 너비를 100%로 설정 */
            /*height: 200px; *//* 원하는 높이로 설정 */
            /* 다른 스타일 속성 추가 가능 */
        }
        .tabmenu {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            position: relative;
            width: calc(100% - 1px);
            margin-top: 2.5rem;
            -ms-flex-wrap: nowrap;
            flex-wrap: nowrap;
        }
        .neon-sign {
            animation: neon 0.5s ease-in-out infinite alternate;
        }

        @keyframes neon {
            from {
                background-color: black;
                color: white;
            }
            to {
                background-color: whitesmoke;
                color: black;
            }
        }
    </style>
    <style>
        .nav-pills .nav-link {
            background-color: #fff; /* 비활성화된 탭의 배경 색상 */
            color: #343a40; /* 비활성화된 탭의 텍스트 색상 */
        }

        tab-pane fade show active {
            padding: 20px; /* 원하는 패딩 크기로 조정 */
        }
    </style>

</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p style="color: white; font-weight: bold; font-size:30px;">강의실</p>
    </div>
</section>
<!-- 브레드크럼 끝 -->
<section class="album-catagory section-padding-100-0">
    <!-- 검색 엔진 시작 -->
    <div class="container">
        <!-- 모든강좌정보  -->

        <section id="menu" class="content-section" style="clear: both;">
            <div class="tabmenu2_wrap" id="gotoTab" style="align-items: center;">
                <ul class="nav nav-pills btn-group" id="cdTabMnuArea" style="display: flex; align-self: center; margin-left: 250px; ">
                    <li class="nav-item"  style="text-align: center;width: 150px;">
                        <a class="nav-link" id="writing-tab" data-bs-toggle="#writing" data-bs-target="#writing" type="button" role="tab" aria-controls="intro"
                           aria-selected="true"  href="#intro"style="width: 150px;font-size: 20px;text-align: center;">논술</a>
                    </li>
                    <li class="nav-item"  style="text-align: center;width: 150px;">
                        <a class="nav-link" id="math-tab" data-bs-toggle="tab" data-bs-target="#math" type="button" role="tab" aria-controls="intro"
                           aria-selected="true"  href="#intro"style="width: 150px;font-size: 20px;text-align: center;">수학</a>
                    </li>
                    <li class="nav-item"  style="text-align: center;width: 150px;">
                        <a class="nav-link" id="korean-tab" data-bs-toggle="tab" data-bs-target="#korean" type="button" role="tab" aria-controls="intro"
                           aria-selected="true"  href="#intro"style="width: 150px;font-size: 20px;text-align: center;">국어</a>
                    </li>
                    <li class="nav-item"  style="text-align: center;width: 150px;">
                        <a class="nav-link" id="china-tab" data-bs-toggle="tab" data-bs-target="#china" type="button" role="tab" aria-controls="intro"
                           aria-selected="true"  href="#intro"style="width: 150px;font-size: 20px;text-align: center;">중국어</a>
                    </li>
                </ul>
                <!-- 내용 -->
                <div class="container">
                    <div class="tab-content" id="content">
                        <div class="tab-pane fade" id="writing" role="tabpanel" aria-labelledby="writing-tab">
                            <div class="container mt-5">
                                <ul class="list-group thumb_list_wrap">
                                    <li class="list-group-item">
                                        <div class="container">
                                            <form id="searchForm" class="row g-3">
                                                <div class="col-auto">
                                                    <div class="col-auto">
                                                        <input class="form-control" type="text" id="scode" name="scode" autocomplete="off" value="wr" hidden="hidden">
                                                    </div>
                                                    <select style="height: 36px;font-size: 16px" id="type" name="type" class="form-select">
                                                        <option value="T">제목</option>
                                                        <option value="C">내용</option>
                                                        <option value="W">강사이름</option>
                                                    </select>
                                                </div>
                                                <div class="col-auto">
                                                    <input class="form-control" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off" value="${page.keyword}">
                                                </div>
                                                <div class="col-auto">
                                                    <input type="button" class="btn btn-primary" value="검색" onclick="searchByAjax()" />
                                                </div>
                                            </form>
                                            <br>
                                            <div class="row">
                                                <c:forEach items="${lectureList}" var="lecture">
                                                    <c:if test="${lecture.scode eq 'wr'}">
                                                        <div class="col-md-12 row" style="margin-bottom: 20px;">
                                                            <div class="col-md-2 img">
                                                                <img src="${path}/resources/img/teacher/an.png" alt="사진"/>
                                                            </div>
                                                            <div class="col-md-10 cont_wrap">
                                                                <div class="txt_area">
                                                                    <h7 class="tit">강사: ${lecture.tname}</h7>
                                                                    <h6 class="tit"><a href="${path}/lecture/detail?lcode=${lecture.lcode}">${lecture.lname}</a></h6><br>
                                                                    <h8>수강인원 ${lecture.maxStudent}명</h8><br>
                                                                    <h8>교재: 수능특강</h8><br>
                                                                    <h9>다운로드</h9><br>
                                                                    <span>접수기간 - ${lecture.sdate} ~ ${lecture.edate} | 접수상태:${lecture.state}</span>
                                                                    <c:if test="${(lecture.bcode eq null && lecture.state eq 'off') || (lecture.bcode ne null && lecture.state eq 'on') || (lecture.bcode eq null && lecture.state eq 'on') }">
                                                                        <a href="${path}/lecture/register2?lcode=${lecture.lcode}"
                                                                           class="btn btn-primary btn_L_col2 register"><span>수강신청</span></a>
                                                                    </c:if>
                                                                    <c:if test="${lecture.bcode ne null && lecture.state eq 'off'}">
                                                                        <a href="javascript:void(0);"
                                                                           data-lcode="${lecture.lcode}, ${lecture.bcode}"
                                                                           id="pay"
                                                                           class="btn btn-primary btn_L_col2 register pay-button"><span>수강신청</span></a>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <br>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <nav class="pagination justify-content-center mb-6" aria-label="pagination">
                                                <c:if test="${curPage > 5}">
                                                    <a href="${path}/lecture/list.do?page=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="btn btn-primary">Previous</a>
                                                </c:if>
                                                <c:if test="${page.blockLastNum < page.totalPageCount}">
                                                    <a href="${path}/lecture/list.do?page=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="btn btn-primary">Next page</a>
                                                </c:if>
                                                <ul class="pagination">
                                                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                                        <c:choose>
                                                            <c:when test="${i == curPage}">
                                                                <li class="page-item active">
                                                                    <span class="page-link" aria-label="Page ${i}">${i}</span>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="page-item">
                                                                    <a href="${path}/lecture/list.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link" aria-label="Page ${i}">${i}</a>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </ul>
                                            </nav>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="math" role="tabpanel" aria-labelledby="math-tab">
                            <div class="container mt-5">
                                <ul class="list-group thumb_list_wrap">
                                    <li class="list-group-item">
                                        <div class="container">
                                            <form id="searchMath" class="row g-3">
                                                <div class="col-auto">
                                                    <div class="col-auto">
                                                        <input class="form-control" type="text" id="ma" name="ma" autocomplete="off" value="ma" hidden="hidden">
                                                    </div>
                                                    <select style="height: 36px;font-size: 16px" id="mathType" name="mathType" class="form-select">
                                                        <option value="T">제목</option>
                                                        <option value="C">내용</option>
                                                        <option value="W">강사이름</option>
                                                    </select>
                                                </div>
                                                <div class="col-auto">
                                                    <input class="form-control" type="text" id="mathKeyword" name="mathKeyword" placeholder="검색어를 입력하세요" autocomplete="off" value="${page.keyword}">
                                                </div>
                                                <div class="col-auto">
                                                    <input type="button" class="btn btn-primary" value="검색" onclick="searchMath()" />
                                                </div>
                                            </form>
                                            <br>
                                            <div class="row">
                                                <c:forEach items="${lectureList}" var="lecture">
                                                    <c:if test="${lecture.scode eq 'ma'}">
                                                        <div class="col-md-12 row" style="margin-bottom: 20px;">
                                                            <div class="col-md-2 img">
                                                                <img src="${pageContext.request.contextPath}/resources/upload/teacher/${lecture.saveFile}" alt="사진"/>
                                                            </div>
                                                            <div class="col-md-10 cont_wrap">
                                                                <div class="txt_area">
                                                                    <h7 class="tit">강사: ${lecture.tcode}</h7>
                                                                    <h6 class="tit"><a href="${path}/lecture/detail?lcode=${lecture.lcode}">${lecture.lname}</a></h6><br>
                                                                    <h8>수강인원 ${lecture.maxStudent}명</h8><br>
                                                                    <h8>교재: 수능특강</h8><br>
                                                                    <h9>다운로드</h9><br>
                                                                    <span>접수기간 - ${lecture.sdate} ~ ${lecture.edate} | 접수상태:${lecture.state}</span>
                                                                    <c:if test="${(lecture.bcode eq null && lecture.state eq 'off') || (lecture.bcode ne null && lecture.state eq 'on') || (lecture.bcode eq null && lecture.state eq 'on') }">
                                                                        <a href="${path}/lecture/register2?lcode=${lecture.lcode}"
                                                                           class="btn btn-primary btn_L_col2 register"><span>수강신청</span></a>
                                                                    </c:if>
                                                                    <c:if test="${lecture.bcode ne null && lecture.state eq 'off'}">
                                                                        <a href="javascript:void(0);"
                                                                           data-lcode="${lecture.lcode}, ${lecture.bcode}"
                                                                           id="pay"
                                                                           class="btn btn-primary btn_L_col2 register pay-button"><span>수강신청</span></a>
                                                                    </c:if>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <br>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <nav class="pagination justify-content-center mb-6" aria-label="pagination">
                                                <c:if test="${curPage > 5}">
                                                    <a href="${path}/lecture/list.do?page=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="btn btn-primary">Previous</a>
                                                </c:if>
                                                <c:if test="${page.blockLastNum < page.totalPageCount}">
                                                    <a href="${path}/lecture/list.do?page=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="btn btn-primary">Next page</a>
                                                </c:if>
                                                <ul class="pagination">
                                                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                                        <c:choose>
                                                            <c:when test="${i == curPage}">
                                                                <li class="page-item active">
                                                                    <span class="page-link" aria-label="Page ${i}">${i}</span>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="page-item">
                                                                    <a href="${path}/lecture/list.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link" aria-label="Page ${i}">${i}</a>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </ul>
                                            </nav>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>


                        <div class="tab-pane fade" id="korean" role="tabpanel" aria-labelledby="korean-tab">
                            <div class="container mt-5">
                                <ul class="list-group thumb_list_wrap">
                                    <li class="list-group-item">
                                        <div class="container">
                                            <form id="searchKo" class="row g-3">
                                                <div class="col-auto">
                                                    <div class="col-auto">
                                                        <input class="form-control" type="text" id="ko" name="ko" autocomplete="off" value="ko" hidden="hidden">
                                                    </div>
                                                    <select style="height: 36px;font-size: 16px" id="koType" name="koType" class="form-select">
                                                        <option value="T">제목</option>
                                                        <option value="C">내용</option>
                                                        <option value="W">강사이름</option>
                                                    </select>
                                                </div>
                                                <div class="col-auto">
                                                    <input class="form-control" type="text" id="koKeyword" name="koKeyword" placeholder="검색어를 입력하세요" autocomplete="off" value="${page.keyword}">
                                                </div>
                                                <div class="col-auto">
                                                    <input type="button" class="btn btn-primary" value="검색" onclick="searchKorean()" />
                                                </div>
                                            </form>
                                            <br>
                                            <div class="row">
                                                <c:forEach items="${lectureList}" var="lecture">
                                                    <c:if test="${lecture.scode eq 'ko'}">
                                                        <div class="col-md-12 row" style="margin-bottom: 20px;">
                                                            <div class="col-md-2 img">
                                                                <img src="${path}/resources/img/teacher/an.png" alt="사진"/>
                                                            </div>
                                                            <div class="col-md-10 cont_wrap">
                                                                <div class="txt_area">
                                                                    <h7 class="tit">강사: ${lecture.tname}</h7>
                                                                    <h6 class="tit"><a href="${path}/lecture/detail?lcode=${lecture.lcode}">${lecture.lname}</a></h6><br>
                                                                    <h8>수강인원 ${lecture.maxStudent}명</h8><br>
                                                                    <h8>교재: 수능특강</h8><br>
                                                                    <h9>다운로드</h9><br>
                                                                    <span>접수기간 - ${lecture.sdate} ~ ${lecture.edate} | 접수상태:${lecture.state}</span>
                                                                    <c:if test="${(lecture.bcode eq null && lecture.state eq 'off') || (lecture.bcode ne null && lecture.state eq 'on') || (lecture.bcode eq null && lecture.state eq 'on') }">
                                                                        <a href="${path}/lecture/register2?lcode=${lecture.lcode}"
                                                                           class="btn btn-primary btn_L_col2 register"><span>수강신청</span></a>
                                                                    </c:if>
                                                                    <c:if test="${lecture.bcode ne null && lecture.state eq 'off'}">
                                                                        <a href="javascript:void(0);"
                                                                           data-lcode="${lecture.lcode}, ${lecture.bcode}"
                                                                           id="pay"
                                                                           class="btn btn-primary btn_L_col2 register pay-button"><span>수강신청</span></a>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <br>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <nav class="pagination justify-content-center mb-6" aria-label="pagination">
                                                <c:if test="${curPage > 5}">
                                                    <a href="${path}/lecture/list.do?page=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="btn btn-primary">Previous</a>
                                                </c:if>
                                                <c:if test="${page.blockLastNum < page.totalPageCount}">
                                                    <a href="${path}/lecture/list.do?page=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="btn btn-primary">Next page</a>
                                                </c:if>
                                                <ul class="pagination">
                                                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                                        <c:choose>
                                                            <c:when test="${i == curPage}">
                                                                <li class="page-item active">
                                                                    <span class="page-link" aria-label="Page ${i}">${i}</span>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="page-item">
                                                                    <a href="${path}/lecture/list.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link" aria-label="Page ${i}">${i}</a>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </ul>
                                            </nav>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="china" role="tabpanel" aria-labelledby="china-tab">
                            <div class="container mt-5">
                                <ul class="list-group thumb_list_wrap">
                                    <li class="list-group-item">
                                        <div class="container">
                                            <form id="searchChina" class="row g-3">
                                                <div class="col-auto">
                                                    <div class="col-auto">
                                                        <input class="form-control" type="text" id="ch" name="ch" autocomplete="off" value="ch" hidden="hidden">
                                                    </div>
                                                    <select style="height: 36px;font-size: 16px" id="chinaType" name="chinaType" class="form-select">
                                                        <option value="T">제목</option>
                                                        <option value="C">내용</option>
                                                        <option value="W">강사이름</option>
                                                    </select>
                                                </div>
                                                <div class="col-auto">
                                                    <input class="form-control" type="text" id="chinaKeyword" name="chinaKeyword" placeholder="검색어를 입력하세요" autocomplete="off" value="${page.keyword}">
                                                </div>
                                                <div class="col-auto">
                                                    <input type="button" class="btn btn-primary" value="검색" onclick="searchChina()" />
                                                </div>
                                            </form>
                                            <br>
                                            <div class="row">
                                                <c:forEach items="${lectureList}" var="lecture">
                                                    <c:if test="${lecture.scode eq 'ch'}">
                                                        <div class="col-md-12 row">
                                                            <div class="col-md-2 img" style="margin-bottom: 20px;">
                                                                <img src="${path}/resources/img/teacher/an.png" alt="사진"/>
                                                            </div>
                                                            <div class="col-md-10 cont_wrap">
                                                                <div class="txt_area">
                                                                    <h7 class="tit">강사: ${lecture.tcode}</h7>
                                                                    <h6 class="tit"><a href="${path}/lecture/detail?lcode=${lecture.lcode}">${lecture.lname}</a></h6><br>
                                                                    <h8>수강인원 ${lecture.maxStudent}명</h8><br>
                                                                    <h8>교재: 수능특강</h8><br>
                                                                    <h9>다운로드</h9><br>
                                                                    <span>접수기간 - ${lecture.sdate} ~ ${lecture.edate} | 접수상태:${lecture.state}</span>
                                                                    <c:if test="${(lecture.bcode eq null && lecture.state eq 'off') || (lecture.bcode ne null && lecture.state eq 'on') || (lecture.bcode eq null && lecture.state eq 'on') }">
                                                                        <a href="${path}/lecture/register2?lcode=${lecture.lcode}"
                                                                           class="btn btn-primary btn_L_col2 register"><span>수강신청</span></a>
                                                                    </c:if>
                                                                    <c:if test="${lecture.bcode ne null && lecture.state eq 'off'}">
                                                                        <a href="javascript:void(0);"
                                                                           data-lcode="${lecture.lcode}, ${lecture.bcode}"
                                                                           id="pay"
                                                                           class="btn btn-primary btn_L_col2 register pay-button"><span>수강신청</span></a>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <br>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <nav class="pagination justify-content-center mb-6" aria-label="pagination">
                                                <c:if test="${curPage > 5}">
                                                    <a href="${path}/lecture/list.do?page=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="btn btn-primary">Previous</a>
                                                </c:if>
                                                <c:if test="${page.blockLastNum < page.totalPageCount}">
                                                    <a href="${path}/lecture/list.do?page=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="btn btn-primary">Next page</a>
                                                </c:if>
                                                <ul class="pagination">
                                                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                                        <c:choose>
                                                            <c:when test="${i == curPage}">
                                                                <li class="page-item active">
                                                                    <span class="page-link" aria-label="Page ${i}">${i}</span>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="page-item">
                                                                    <a href="${path}/lecture/list.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link" aria-label="Page ${i}">${i}</a>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </ul>
                                            </nav>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="registerPage" role="tabpanel" aria-labelledby="register-tab">

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <br>
        <br>
        <section class="info-tiles" style=" width: 1090px;">
            <div class="row">
                <div class="col-md-6">
                    <h2>마감임박 강의</h2>
                    <table class="table" id="notice-table">
                        <thead>
                        <tr>
                            <th width="200">제목</th>
                            <th>기간</th>
                            <th>접수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- 이 부분은 서버로부터 데이터를 동적으로 생성하는 부분입니다. -->
                        <!-- 예를 들어, 서버로부터 lectureList2 배열이 온다고 가정합니다. -->
                        <c:forEach items="${lectureList2}" var="lecture" varStatus="status">
                            <tr class="table-row" >
                                <td id="row-${status.index}4"><a id="row-${status.index}3" href="${path}/lecture/detail?lcode=${lecture.lcode}">${lecture.lname}</a></td>
                                <td id="row-${status.index}">~${lecture.edate}</td>
                                <td id="row-${status.index}2">${lecture.state}</td>
                            </tr>
                        </c:forEach>
                        <!-- 추가 데이터 행 -->
                        <c:if test="${empty lectureList2}">
                            <tr>
                                <td colspan="3" class="has-text-centered">  <span style=" font-size: 20px;">마감임박 강의가 없습니다.</span></td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6">
                    <h2>오픈예정 강의</h2>
                    <table class="table" id="new-table">
                        <thead>
                        <tr>
                            <th width="200">제목</th>
                            <th>기간</th>
                            <th>접수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- 이 부분은 서버로부터 데이터를 동적으로 생성하는 부분입니다. -->
                        <!-- 예를 들어, 서버로부터 lectureList2 배열이 온다고 가정합니다. -->
                        <c:forEach items="${lectureList3}" var="lecture" varStatus="status">
                            <tr class="table-row" >
                                <td id="row-${status.index}5"><a id="row-${status.index}6" href="${path}/lecture/detail?lcode=${lecture.lcode}">${lecture.lname}</a></td>
                                <td id="row-${status.index}7">${lecture.sdate}~</td>
                                <td id="row-${status.index}8">${lecture.state}</td>
                            </tr>
                        </c:forEach>
                        <!-- 추가 데이터 행 -->
                        <c:if test="${empty lectureList3}">
                            <tr>
                                <td colspan="3" class="has-text-centered"> <span style=" font-size: 20px;">오픈예정 강의가 없습니다.</span></td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>
    <!-- //진행정보 -->
    </div>
    <!-- //모든강좌정보  -->
    <!-- 모든강좌탭 -->

    <!-- 테이블 영역 끝 -->
</section>
<!-- 로그인 끝 -->
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>

<script>
    function searchByAjax() {
        var scode = document.getElementById("scode").value;
        var type = document.getElementById("type").value;
        var keyword = document.getElementById("keyword").value;
        var path = "${path}/lecture/wrPro";
        var url = path + "?type=" + type + "&keyword=" + keyword +"&scode=" + scode;
        $.ajax({
            url: url,
            type: "GET",
            success: function (data) {
                // 성공적으로 데이터를 서버로 전송했을 때 실행되는 콜백 함수
                // 서버로부터 반환된 데이터를 처리할 수 있습니다.
                console.log(data);
                // 여기에서 반환된 데이터를 사용하여 필요한 작업을 수행합니다.
                $("#writing").html(data)
            },
            error: function (error) {
                // 데이터 전송 중에 오류가 발생했을 때 실행되는 콜백 함수
                console.error("에러: " + error.responseText);
            }
        });
    }
</script>
<script>
    function searchMath() {
        var scode = document.getElementById("ma").value;
        var type = document.getElementById("mathType").value;
        var keyword = document.getElementById("mathKeyword").value;
        var path = "${path}/lecture/maPro";

        var url = path + "?type=" + type + "&keyword=" + keyword +"&scode=" + scode;
        $.ajax({
            url: url,
            type: "GET",
            success: function (data) {
                // 성공적으로 데이터를 서버로 전송했을 때 실행되는 콜백 함수
                // 서버로부터 반환된 데이터를 처리할 수 있습니다.
                console.log(data);
                // 여기에서 반환된 데이터를 사용하여 필요한 작업을 수행합니다.
                $("#math").html(data)
            },
            error: function (error) {
                // 데이터 전송 중에 오류가 발생했을 때 실행되는 콜백 함수
                console.error("에러: " + error.responseText);
            }
        });
    }
</script>
<script>
    function searchKorean() {
        var scode = document.getElementById("ko").value;
        var type = document.getElementById("koType").value;
        var keyword = document.getElementById("koKeyword").value;
        var path = "${path}/lecture/koPro";

        var url = path + "?type=" + type + "&keyword=" + keyword +"&scode=" + scode;
        $.ajax({
            url: url,
            type: "GET",
            success: function (data) {
                // 성공적으로 데이터를 서버로 전송했을 때 실행되는 콜백 함수
                // 서버로부터 반환된 데이터를 처리할 수 있습니다.
                console.log(data);
                // 여기에서 반환된 데이터를 사용하여 필요한 작업을 수행합니다.
                $("#korean").html(data)
            },
            error: function (error) {
                // 데이터 전송 중에 오류가 발생했을 때 실행되는 콜백 함수
                console.error("에러: " + error.responseText);
            }
        });
    }
</script>
<script>
    function searchChina() {
        var scode = document.getElementById("ch").value;
        var type = document.getElementById("chinaType").value;
        var keyword = document.getElementById("chinaKeyword").value;
        var path = "${path}/lecture/chPro";

        var url = path + "?type=" + type + "&keyword=" + keyword +"&scode=" + scode;
        $.ajax({
            url: url,
            type: "GET",
            success: function (data) {
                // 성공적으로 데이터를 서버로 전송했을 때 실행되는 콜백 함수
                // 서버로부터 반환된 데이터를 처리할 수 있습니다.
                console.log(data);
                // 여기에서 반환된 데이터를 사용하여 필요한 작업을 수행합니다.
                $("#china").html(data)
            },
            error: function (error) {
                // 데이터 전송 중에 오류가 발생했을 때 실행되는 콜백 함수
                console.error("에러: " + error.responseText);
            }
        });
    }
</script>
<script>
    $(document).ready(function() {
        // 초기 상단 여백 값을 저장합니다.
        var initialMarginTop = 0;

        // 탭 클릭 이벤트를 처리
        $(".nav-link").click(function() {
            // 모든 탭 내용을 숨깁니다.
            $(".tab-pane").removeClass("show active");

            // 클릭한 탭의 data-bs-target 속성 값을 가져와 해당 탭 내용을 보이게 합니다.
            var target = $(this).data("bs-target");
            $(target).addClass("show active");

            // 클릭한 버튼을 active로 설정
            $(".nav-link").removeClass("active");
            $(this).addClass("active");

        });
    });
</script>



<script>
    document.addEventListener("DOMContentLoaded", function () {
        const firstRow = document.getElementById('row-05'); // 첫 번째 데이터 행을 선택합니다.
        const firstRow2 = document.getElementById('row-06'); // 첫 번째 데이터 행을 선택합니다.
        const firstRow3 = document.getElementById('row-07'); // 첫 번째 데이터 행을 선택합니다.
        const firstRow4 = document.getElementById('row-08'); // 첫 번째 데이터 행을 선택합니다.

        function toggleNeon() {
            if (firstRow) {
                if (firstRow.classList.contains("neon-sign")) {
                    firstRow.classList.remove("neon-sign");
                } else {
                    firstRow.classList.add("neon-sign");
                }
            }
            if (firstRow2) {
                if (firstRow2.classList.contains("neon-sign")) {
                    firstRow2.classList.remove("neon-sign");
                } else {
                    firstRow2.classList.add("neon-sign");
                }
            }
            if (firstRow3) {
                if (firstRow3.classList.contains("neon-sign")) {
                    firstRow3.classList.remove("neon-sign");
                } else {
                    firstRow3.classList.add("neon-sign");
                }
            }
            if (firstRow4) {
                if (firstRow4.classList.contains("neon-sign")) {
                    firstRow4.classList.remove("neon-sign");
                } else {
                    firstRow4.classList.add("neon-sign");
                }
            }
        }

        setInterval(toggleNeon, 500); // 1초 간격으로 번쩍이기
    });
</script>
<script>
    $(document).ready(function () {
        $(".pay-button").click(function () {
            var lcodeAndBcode = $(this).data("lcode").split(", ");
            var lcode = lcodeAndBcode[0];
            var bcode = lcodeAndBcode[1];

            $.ajax({
                type: "GET",
                url: "${path}/payment/check?lcode=" + lcode,
                success: function (data) {
                    if (data.duplicate === 'false') {
                        // 이미 등록된 경우 알림 메시지를 표시
                        alert("이 강의에 이미 등록되었습니다.");
                    } else if (data.loginRequired) {
                        // 로그인이 필요한 경우 로그인 페이지로 리다이렉트
                        alert("로그인이 필요합니다.");
                        window.location.href = "${path}/user/login";
                    } else {
                        // 중복 신청이 아닌 경우 수강신청 요청을 보냅니다.
                        $.ajax({
                            type: "GET",
                            url: "${path}/payment/pay?lcode=" + lcode + "&bcode=" + bcode,
                            success: function (data) {
                                $.ajax({
                                    type: "GET",
                                    url: "${path}/payment/payment?lcode=" + lcode + "&bcode=" + bcode,
                                    success: function (registerData) {
                                        window.location.href = "${path}/payment/payment?lcode=" + lcode + "&bcode=" + bcode;
                                        console.log("payment 실행 완료");
                                    },
                                    error: function (registerError) {
                                        console.log("에러다에러" + registerError.responseText);
                                    }
                                });
                            },
                            error: function (error) {
                                console.log("에러다에러" + error.responseText);
                            }
                        });
                    }
                },
                error: function (duplicateError) {
                    console.log("중복 신청 확인 중 에러: " + duplicateError.responseText);
                }
            });
        });
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const firstRow = document.getElementById('row-0'); // 첫 번째 데이터 행을 선택합니다.
        const firstRow2 = document.getElementById('row-02'); // 첫 번째 데이터 행을 선택합니다.
        const firstRow3 = document.getElementById('row-03'); // 첫 번째 데이터 행을 선택합니다.
        const firstRow4 = document.getElementById('row-04'); // 첫 번째 데이터 행을 선택합니다.

        function toggleNeon() {
            if (firstRow) {
                if (firstRow.classList.contains("neon-sign")) {
                    firstRow.classList.remove("neon-sign");
                } else {
                    firstRow.classList.add("neon-sign");
                }
            }
            if (firstRow2) {
                if (firstRow2.classList.contains("neon-sign")) {
                    firstRow2.classList.remove("neon-sign");
                } else {
                    firstRow2.classList.add("neon-sign");
                }
            }
            if (firstRow3) {
                if (firstRow3.classList.contains("neon-sign")) {
                    firstRow3.classList.remove("neon-sign");
                } else {
                    firstRow3.classList.add("neon-sign");
                }
            }
            if (firstRow4) {
                if (firstRow4.classList.contains("neon-sign")) {
                    firstRow4.classList.remove("neon-sign");
                } else {
                    firstRow4.classList.add("neon-sign");
                }
            }
        }

        setInterval(toggleNeon, 500); // 1초 간격으로 번쩍이기
    });
</script>

<script>
    function registerPage(){
        var lcode = $("#lcode").val();
        $.ajax({
            type: "GET",  // GET 요청 또는 POST 요청을 선택할 수 있습니다.
            url: "${path}/lecture/register?lcode=" + lcode,  // 실제 API 엔드포인트로 변경해야 합니다.
            success: function (data) {
                $(" #korean,#math, #writing, #china").removeClass("show active");
                $(" #korean-tab ,#math-tab, #writing-tab, #china-tab").removeClass("active");
                $("#registerPage").html(data);
                $("#registerPage").addClass("show active");
            },
            error: function (error) {
                console.log("에러다에러"+error.responseText)
            }
        });
    }
</script>
</body>


</html>
