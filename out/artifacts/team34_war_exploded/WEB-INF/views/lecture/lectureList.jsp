<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
        }

        .lecture {
            border: 1px solid transparent;
        }

        .lecture:hover {
            border: 1px solid #333;
            border-radius: 5px;
            box-shadow: #ddd 10px 10px 10px;
            transition: 0.5s;
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
    <c:if test="${not empty msg}">
        <script>
            alert("${msg}");
        </script>
    </c:if>
</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<section class="breadcumb-area bg-img bg-overlay"
         style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p>해법과 함께 학습 여정을 시작해요</p>
        <h2>강의실</h2>
    </div>
</section>
<!-- 브레드크럼 끝 -->

<section class="album-catagory section-padding-100-0" style="min-height: 100vh">
    <div class="container">
        <section id="menu" class="content-section" style="clear: both;">
            <div class="tabmenu2_wrap" id="gotoTab" style="align-items: center;">
                <ul class="nav nav-pills btn-group d-flex justify-content-center" id="cbTabMnuArea">
                    <li class="nav-item text-center" style="width: 150px">
                        <a class="nav-link active show" id="" data-bs-toggle="#" data-bs-target="#"
                           type="button" role="tab" aria-controls="intro"
                           aria-selected="true" href="#" style="width: 150px;font-size: 20px;text-align: center;">전체</a>
                    </li>
                    <c:forEach var="subject" items="${subjects}">
                        <li class="nav-item text-center" style="width: 150px">
                            <a class="nav-link" id="${subject.scode}" data-bs-toggle="#${subject.scode}"
                               data-bs-target="#${subject.scode}"
                               type="button" role="tab" aria-controls="intro"
                               aria-selected="true" href="#"
                               style="width: 150px;font-size: 20px;text-align: center;">${subject.sname}</a>
                        </li>
                    </c:forEach>
                </ul>
                <!-- 내용 -->
                <div class="container mb-100" style="min-height: 30vh">
                    <div role="tabpanel">
                        <div class="container mt-5">
                            <form action="#" method="get" onsubmit="return false;">
                                <div class="form-group d-flex justify-content-end">
                                    <div class="input-group-append">
                                        <div class="panel single-accordion"
                                             style="border: 1px solid #ced4da; border-radius: 0.25rem;">
                                            <select id="type" name="type" class="collapseOne"
                                                    style="border: none;padding: 8px;">
                                                <option value="T">제목</option>
                                                <option value="C">내용</option>
                                                <option value="W">강사이름</option>
                                            </select>
                                        </div>
                                        <input class="form-control" type="text" id="keyword" name="keyword"
                                               placeholder="검색어를 입력하세요" autocomplete="off">
                                        <input class="btn btn-dark" type="button" id="project-search-addon" onclick="clickSearch()" value="검색"/>
                                    </div>
                                </div>
                            </form>
                            <div class="row mt-50" id="lectureList">
                                <c:forEach var="lecture" items="${lectureList}">
                                    <div class="col-md-12 row mt-1 p-3 lecture">
                                        <div class="col-md-3 img">
                                            <img src="${path}/resources/upload/lecture/${lecture.saveFile}"
                                                 alt="강의 이미지"/>
                                        </div>
                                        <div class="col cont_wrap">
                                            <div class="txt_area">
                                                <h4 class="tit"><a href="${path}/lecture/detail?lcode=${lecture.lcode}">${lecture.lname}</a></h4>
                                                <p> <i class="fa-solid fa-user"></i> ${lecture.tname} 선생님</p>
                                                <span>수강인원:  ${lecture.maxStudent}명</span><br>
                                                <span>교&nbsp; &nbsp; &nbsp; &nbsp; 재: ${lecture.bname}</span><br>
                                                <span>접수기간: ${lecture.sdate} ~ ${lecture.edate}</span><br>
                                                <c:if test="${lecture.state eq 'on'}">
                                                    <span>수업방식: 온라인 </span>
                                                </c:if>
                                                <c:if test="${lecture.state eq 'off'}">
                                                    <span>수업방식: 오프라인 </span>
                                                </c:if>
                                                <c:if test="${lecture.state eq 'close'}">
                                                    <span style="color: red; font-weight: bold;"> 폐강 </span>
                                                </c:if>
                                                <c:if test="${not empty sid}">
                                                    <div class="d-flex justify-content-end">
                                                        <c:if test="${(lecture.bcode eq null && lecture.state eq 'off') || (lecture.bcode ne null && lecture.state eq 'on') || (lecture.bcode eq null && lecture.state eq 'on') }">
                                                            <a href="${path}/lecture/register2?lcode=${lecture.lcode}"
                                                               class="btn btn-primary btn_L_col2 register"><span>수강신청</span></a>
                                                        </c:if>
                                                        <c:if test="${lecture.bcode ne null && lecture.state eq 'off'}">
                                                            <a href="${path}/payment/payment?lcode=${lecture.lcode}&bcode=${lecture.bcode}"
                                                               class="btn btn-primary btn_L_col2 register pay-button"><span>수강신청</span></a>
                                                        </c:if>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- 페이징 처리 -->
                            <nav class="Page navigation d-flex justify-content-center mt-5 mb-6">
                                <ul class="pagination">
                                    <c:if test="${curPage > 5}">
                                        <li class="page-item"><a href="#" class="page-link paging" id="${page.blockStartNum - 1}" data-value=""> << </a></li>
                                    </c:if>
                                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                        <c:choose>
                                            <c:when test="${i == curPage}">
                                                <li class="page-item active">
                                                    <a href="#" class="page-link paging" id="${i}" data-value="">${i}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a href="#" class="page-link paging" id="${i}" data-value="">${i}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${page.blockLastNum < page.totalPageCount}">
                                        <li class="page-item"><a href="#" class="page-link paging" id="${page.blockLastNum + 1}" data-value=""> >> </a></li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="registerPage" role="tabpanel" aria-labelledby="register-tab"></div>
                </div>
            </div>
        </section>
        <section class="container mb-100">
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <h2>마감임박 강의</h2>
                    <table class="table" id="notice-table">
                        <thead>
                        <tr>
                            <th width="200">제목</th>
                            <th>기간</th>
                            <th>강의유형</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- 이 부분은 서버로부터 데이터를 동적으로 생성하는 부분입니다. -->
                        <!-- 예를 들어, 서버로부터 lectureList2 배열이 온다고 가정합니다. -->
                        <c:forEach items="${lectureList2}" var="lecture" varStatus="status">
                            <tr class="table-row">
                                <td id="row-${status.index}4">
                                    <a id="row-${status.index}3"
                                       href="${path}/lecture/detail?lcode=${lecture.lcode}">${lecture.lname}</a>
                                </td>
                                <td id="row-${status.index}">~${lecture.edate}</td>
                                <td id="row-${status.index}2">
                                    <c:if test="${lecture.state eq 'on'}"> 온라인 </c:if>
                                    <c:if test="${lecture.state eq 'off'}"> 오프라인 </c:if>
                                    <c:if test="${lecture.state eq 'close'}"> 정원미달 </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        <!-- 추가 데이터 행 -->
                        <c:if test="${empty lectureList2}">
                            <tr>
                                <td colspan="3" class="has-text-centered"><span
                                        style=" font-size: 20px;">마감임박 강의가 없습니다.</span></td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-6 col-md-12 mt-lg-0 mt-md-4">
                    <h2>오픈예정 강의</h2>
                    <table class="table" id="new-table">
                        <thead>
                        <tr>
                            <th width="200">제목</th>
                            <th>기간</th>
                            <th>강의유형</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- 이 부분은 서버로부터 데이터를 동적으로 생성하는 부분입니다. -->
                        <!-- 예를 들어, 서버로부터 lectureList2 배열이 온다고 가정합니다. -->
                        <c:forEach items="${lectureList3}" var="lecture" varStatus="status">
                            <tr class="table-row">
                                <td id="row-${status.index}5"><a id="row-${status.index}6"
                                                                 href="${path}/lecture/detail?lcode=${lecture.lcode}">${lecture.lname}</a>
                                </td>
                                <td id="row-${status.index}7">${lecture.sdate}~</td>
                                <td id="row-${status.index}8">
                                    <c:if test="${lecture.state eq 'on'}"> 온라인 </c:if>
                                    <c:if test="${lecture.state eq 'off'}"> 오프라인 </c:if>
                                    <c:if test="${lecture.state eq 'close'}"> 정원미달 </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        <!-- 추가 데이터 행 -->
                        <c:if test="${empty lectureList3}">
                            <tr>
                                <td colspan="3" class="has-text-centered"><span
                                        style=" font-size: 20px;">오픈예정 강의가 없습니다.</span></td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>
</section>

<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>

<script>
    $(document).ready(function () {
        // 탭 클릭 이벤트를 처리
        $(".nav-link").on("click", function () {
            let scode = $(this).attr("id");
            let type = $("#type").val();
            let keyword = $("#keyword").val();
            let data = {"scode": scode, "type": type, "keyword": keyword};
            let html = "";
            $.ajax({
                url: "${path}/lecture/pagingList",
                type: "GET",
                data: data,
                success: function (data) {
                    // 강의 목록 출력하기
                    $("#lectureList .lecture").remove();
                    let lectureList = data.lectureList;
                    let listHtml = '';
                    for (let i = 0; i < lectureList.length; i++) {
                        // 화면에 ajax로 가져온 데이터 출력하기
                        listHtml += '<div class="col-md-12 row mt-1 p-3 lecture">' +
                            '<div class="col-md-3 img"><img src="${path}/resources/upload/lecture/' + lectureList[i].saveFile + '" alt="강의 이미지"/></div>' +
                            '<div class="col cont_wrap"><div class="txt_area"><h4 class="tit"><a href="${path}/lecture/detail?lcode=' + lectureList[i].lcode + '">' + lectureList[i].lname + '</a></h4><p><i class="fa-solid fa-user"></i> ' + lectureList[i].tname + ' 선생님 </p>' +
                            '<span>수강인원:  ' + lectureList[i].maxStudent + '명</span><br><span>교&nbsp; &nbsp; &nbsp; &nbsp; 재: ' + lectureList[i].bname + '</span><br><span>접수기간: ' + lectureList[i].sdate + ' ~ ' + lectureList[i].edate + '</span><br>';
                        if (lectureList[i].state == "on") {
                            listHtml += '<span> 수업방식: 온라인 </span>';
                        } else if (lectureList[i].state == "off") {
                            listHtml += '<span> 수업방식: 오프라인 </span>';
                        } else {
                            listHtml += '<span style="color: red; font-weight: bold"> 폐강 </span>';
                        }

                        if (${not empty sid}) {
                            listHtml += '<div class="d-flex justify-content-end">';
                            if ((lectureList[i].bcode == null && lectureList[i].state == "off") || (lectureList[i].bcode != null && lectureList[i].state == "on") || (lectureList[i].bcode == null && lectureList[i].state == "on")) {
                                listHtml += '<a href="${path}/lecture/register2?lcode=' + lectureList[i].lcode + '" class="btn btn-primary btn_L_col2 register"><span>수강신청</span></a>';
                            }
                            if (lectureList[i].bcode != null && lectureList[i].state == "off") {
                                listHtml += '<a href="${path}/payment/payment?lcode='+ lectureList[i].lcode +'&bcode='+ lectureList[i].bcode +'" class="btn btn-primary btn_L_col2 register pay-button"><span>수강신청</span></a>';
                            }
                        }
                        listHtml += '</div></div></div></div>';
                    }
                    if (lectureList.length == 0) {
                        listHtml = "<div class='col-md-12 pb-5 text-center lecture'><p class='mt-3 text-danger'> 해당하는 강의가 없습니다. </p></div>";
                    }
                    $("#lectureList").append(listHtml);

                    // 기존 페이징 데이터 화면에서 삭제 후 새로운 데이터 출력
                    $(".navigation .pagination").remove();
                    let pageHtml = '<ul class="pagination" id="' + scode + '">';
                    if (data.curPage > 5) {
                        pageHtml += '<li class="page-item"><a class="page-link paging" id="' + (data.blockStartNum - 1) + '" data-value="' + scode + '"> << </a></li>';
                    }
                    for (let i = data.blockStartNum; i < data.blockLastNum + 1; i++) {
                        if (data.curPage == i) {
                            pageHtml += '<li class="page-item active">';
                        } else {
                            pageHtml += '<li class="page-item">';
                        }
                        pageHtml += '<a href="#" class="page-link paging" id="' + i + '" data-value="' + scode + '">' + i + '</a></li>';
                    }
                    if (data.blockLastNum < data.totalPageCount) {
                        pageHtml += '<li class="page-item"><a class="page-link paging" id="' + (data.blockLastNum + 1) + '" data-value="' + scode + '"> >> </a></li>';
                    }
                    pageHtml += '</ul></nav>';

                    $(".navigation").append(pageHtml);
                },
                error: function (err) {
                    console.log(err);
                }
            });

            // 클릭한 탭의 data-bs-target 속성 값을 가져와 해당 탭 내용을 보이게 합니다.
            var target = $(this).data("bs-target");
            $(target).addClass("show active");

            // 클릭한 버튼을 active로 설정
            $(".nav-link").removeClass("active");
            $(this).addClass("active");

            return false;
        });

        // 페이징 이벤트 처리
        $(document).on("click", ".paging", function () {
            let scode = $(this).attr("data-value");
            let type = $("#type").val();
            let keyword = $("#keyword").val();

            let data = {"page": $(this).attr("id"), "scode": scode, "type": type, "keyword": keyword};
            let html = "";
            $.ajax({
                url: "${path}/lecture/pagingList",
                type: "GET",
                data: data,
                success: function (data) {
                    $("#lectureList .lecture").remove();

                    let lectureList = data.lectureList;
                    let listHtml = '';
                    for (let i = 0; i < lectureList.length; i++) {
                        // 화면에 ajax로 가져온 데이터 출력하기
                        listHtml += '<div class="col-md-12 row mt-1 p-3 lecture">' +
                            '<div class="col-md-3 img"><img src="${path}/resources/upload/lecture/' + lectureList[i].saveFile + '" alt="강의 이미지"/></div>' +
                            '<div class="col cont_wrap"><div class="txt_area"><h4 class="tit"><a href="${path}/lecture/detail?lcode=' + lectureList[i].lcode + '">' + lectureList[i].lname + '</a></h4><p><i class="fa-solid fa-user"></i> ' + lectureList[i].tname + '선생님 </p>' +
                            '<span>수강인원:  ' + lectureList[i].maxStudent + '명</span><br><span>교&nbsp; &nbsp; &nbsp; &nbsp; 재: ' + lectureList[i].bname + '</span><br><span>접수기간: ' + lectureList[i].sdate + ' ~ ' + lectureList[i].edate + '</span><br>';
                        if (lectureList[i].state == "on") {
                            listHtml += '<span> 수업방식: 온라인 </span>';
                        } else if (lectureList[i].state == "off") {
                            listHtml += '<span> 수업방식: 오프라인 </span>';
                        } else {
                            listHtml += '<span style="color: red; font-weight: bold"> 폐강 </span>';
                        }

                        if (${not empty sid}) {
                            listHtml += '<div class="d-flex justify-content-end">';
                            if ((lectureList[i].bcode == null && lectureList[i].state == "off") || (lectureList[i].bcode != null && lectureList[i].state == "on") || (lectureList[i].bcode == null && lectureList[i].state == "on")) {
                                listHtml += '<a href="${path}/lecture/register2?lcode=' + lectureList[i].lcode + '" class="btn btn-primary btn_L_col2 register"><span>수강신청</span></a>';
                            }
                            if (lectureList[i].bcode != null && lectureList[i].state == "off") {
                                listHtml += '<a href="${path}/payment/payment?lcode='+ lectureList[i].lcode +'&bcode='+ lectureList[i].bcode +'" class="btn btn-primary btn_L_col2 register pay-button"><span>수강신청</span></a>';
                            }
                        }
                        listHtml += '</div></div></div></div>';
                    }
                    if (lectureList.length == 0) {
                        listHtml = "<div class='col-md-12 pb-5 text-center lecture'><p class='mt-3 text-danger'> 해당하는 강의가 없습니다. </p></div>";
                    }
                    $("#lectureList").append(listHtml);

                    // 기존 페이징 데이터 화면에서 삭제 후 새로운 데이터 출력
                    $(".navigation .pagination").remove();
                    let pageHtml = '<ul class="pagination">';
                    if (data.curPage > 5) {
                        pageHtml += '<li class="page-item"><a class="page-link paging" id="' + (data.blockStartNum - 1) + '" data-value="' + scode + '"> << </a></li>';
                    }
                    for (let i = data.blockStartNum; i < data.blockLastNum + 1; i++) {
                        if (data.curPage == i) {
                            pageHtml += '<li class="page-item active">';
                        } else {
                            pageHtml += '<li class="page-item">';
                        }
                        pageHtml += '<a href="#" class="page-link paging" id="' + i + '" data-value="' + scode + '">' + i + '</a></li>';
                    }
                    if (data.blockLastNum < data.totalPageCount) {
                        pageHtml += '<li class="page-item"><a href="#" class="page-link paging" id="${page.blockLastNum + 1}" data-value="' + scode + '"> >> </a></li>';
                    }
                    pageHtml += '</ul>';

                    $(".navigation").append(pageHtml);
                },
                error: function (err) {
                    console.log(err);
                }
            });
            return false;
        });

        // 검색 버튼 클릭 시 처리
        $("#project-search-addon").on("click", function() {
            let scode = ($(".nav-link.show.active").attr("id") == undefined || $(".nav-link.show.active").attr("id") == "undefined") ? "" : $(".nav-link.show.active").attr("id");
            let type = $("#type").val();
            let keyword = $("#keyword").val();
            let data = {"scode": scode, "type": type, "keyword": keyword};
            let listHtml = "";
            $.ajax({
                url: "${path}/lecture/pagingList",
                type: "GET",
                data: data,
                success: function (data) {
                    $("#lectureList .lecture").remove();
                    let lectureList = data.lectureList;
                    let listHtml = '';
                    for (let i = 0; i < lectureList.length; i++) {
                        // 화면에 ajax로 가져온 데이터 출력하기
                        listHtml += '<div class="col-md-12 row mt-1 p-3 lecture">' +
                            '<div class="col-md-3 img"><img src="${path}/resources/upload/lecture/' + lectureList[i].saveFile + '" alt="강의 이미지"/></div>' +
                            '<div class="col cont_wrap"><div class="txt_area"><h4 class="tit"><a href="${path}/lecture/detail?lcode=' + lectureList[i].lcode + '">' + lectureList[i].lname + '</a></h4><p><i class="fa-solid fa-user"></i> ' + lectureList[i].tname + ' 선생님 <p>' +
                            '<span>수강인원:  ' + lectureList[i].maxStudent + '명</span><br><span>교&nbsp; &nbsp; &nbsp; &nbsp; 재: ' + lectureList[i].bname + '</span><br><span>접수기간: ' + lectureList[i].sdate + ' ~ ' + lectureList[i].edate + '</span><br>';
                        if (lectureList[i].state == "on") {
                            listHtml += '<span> 수업방식: 온라인 </span>';
                        } else if (lectureList[i].state == "off") {
                            listHtml += '<span> 수업방식: 오프라인 </span>';
                        } else {
                            listHtml += '<span style="color: red; font-weight: bold"> 폐강 </span>';
                        }
                        if (${not empty sid}) {
                            listHtml += '<div class="d-flex justify-content-end">';
                            if ((lectureList[i].bcode == null && lectureList[i].state == "off") || (lectureList[i].bcode != null && lectureList[i].state == "on") || (lectureList[i].bcode == null && lectureList[i].state == "on")) {
                                listHtml += '<a href="${path}/lecture/register2?lcode=' + lectureList[i].lcode + '" class="btn btn-primary btn_L_col2 register"><span>수강신청</span></a>';
                            }
                            if (lectureList[i].bcode != null && lectureList[i].state == "off") {
                                listHtml += '<a href="${path}/payment/payment?lcode='+ lectureList[i].lcode +'&bcode='+ lectureList[i].bcode +'" class="btn btn-primary btn_L_col2 register pay-button"><span>수강신청</span></a>';
                            }
                        }
                        listHtml += '</div></div></div></div>';
                    }
                    if (lectureList.length == 0) {
                        listHtml = "<div class='col-md-12 pb-5 text-center lecture'><p class='mt-3 text-danger'> 해당하는 강의가 없습니다. </p></div>";
                    }
                    $("#lectureList").append(listHtml);
                    // 기존 페이징 데이터 화면에서 삭제 후 새로운 데이터 출력
                    $(".navigation .pagination").remove();
                    let pageHtml = '<ul class="pagination">';
                    if (data.curPage > 5) {
                        pageHtml += '<li class="page-item"><a class="page-link paging" id="' + (data.blockStartNum - 1) + '" data-value="' + scode + '"> << </a></li>';
                    }
                    for (let i = data.blockStartNum; i < data.blockLastNum + 1; i++) {
                        if (data.curPage == i) {
                            pageHtml += '<li class="page-item active">';
                        } else {
                            pageHtml += '<li class="page-item">';
                        }
                        pageHtml += '<a href="#" class="page-link paging" id="' + i + '" data-value="' + scode + '">' + i + '</a></li>';
                    }
                    if (data.blockLastNum < data.totalPageCount) {
                        pageHtml += '<li class="page-item"><a href="#" class="page-link paging" id="${page.blockLastNum + 1}" data-value="' + scode + '"> >> </a></li>';
                    }
                    pageHtml += '</ul>';
                    $(".navigation").append(pageHtml);
                },
                error: function (err) {
                    console.log(err);
                }
            });
            return false;
        });
    });
</script>

<!-- 네온사인 적용 -->
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

<!-- 네온사인 적용 -->
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

</body>
</html>