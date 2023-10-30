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
    </style>
    <style>
        .nav-pills .nav-link {
            background-color: #fff; /* 비활성화된 탭의 배경 색상 */
            color: #343a40; /* 비활성화된 탭의 텍스트 색상 */
        }

        .tab-pane fade show active {
            padding: 20px; /* 원하는 패딩 크기로 조정 */
        }


        .modal-content { /* 모달의 창 크기조절 */
            max-width: 650px; /* 원하는 최대 가로 크기 */
        }

        .modal { /* 모달의 창 위치조절 */
            display: none;
            position: fixed;
            top: 50%; /* 화면 상단에서 50% 위치로 이동 */
            left: 50%; /* 화면 왼쪽에서 50% 위치로 이동 */
            transform: translate(-50%, -50%); /* 모달을 가운데로 이동 */
        }
    </style>
    <c:if test="${not empty msg}">
        <script> alert("${msg}"); </script>
    </c:if>
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
<section class="album-catagory section-padding-100-0" style="min-height: 70vh">
    <!-- 검색 엔진 시작 -->
    <div class="container">
        <!-- 모든강좌정보  -->
        <section>
            <div class="row">
                <div class="col-md-2 img">
                    <img src="${path}/resources/img/teacher/an.png" alt="사진"/>
                </div>
                <div class="col-md-10 cont_wrap">
                    <div class="txt_area">
                        <h7 class="tit">강사: ${teacher.tname}</h7><br>
                        <h6 class="tit">${lecture.lname}</h6><br>
                        <input value="${lecture.lcode}" hidden="hidden" id="lcode">
                        <h8>수강인원 : ${lecture.maxStudent}</h8><br>
                        <h8>교재: 수능특강</h8>
                        <h9>다운로드</h9><br>
                        <span>신청기간 ${lecture.sdate} ~ 종료기간 ${lecture.edate}</span>
                        <a href="${path}/lecture/register2?lcode=${lecture.lcode}" data-lcode="${lecture.lcode}" style="margin-left: 600px" class="btn btn-primary btn_L_col2 register"><span>수강신청</span></a>
                        <h3>강사 소개</h3>
                        <h8>${teacher.tcontent}</h8><br><br>
                    </div>
                </div>
            </div>
        </section>
        <br>
        <section id="menu" class="content-section" style="clear: both;">
            <div class="tabmenu2_wrap align-items-center" id="gotoTab">
                <ul class="nav nav-pills justify-content-center" id="cdTabMnuArea">
                    <li class="nav-item" style="text-align: center;width: 150px;">
                        <button class="nav-link active" id="intro-tab" data-bs-toggle="tab" data-bs-target="#intro"
                                type="button" role="tab" aria-controls="intro"
                                aria-selected="true" onclick="ReloadPage()"
                                style="width: 150px;font-size: 20px;text-align: center;">강의 소개
                        </button>
                    </li>
                    <li class="nav-item" style="text-align: center;width: 150px;">
                        <button class="nav-link" id="video-tab" data-bs-toggle="tab" data-bs-target="#video"
                                type="button" role="tab" aria-controls="intro"
                                aria-selected="true" onclick="ReloadPage()"
                                style="width: 150px;font-size: 20px;text-align: center;">강의 목차
                        </button>
                    </li>
                    <li class="nav-item" style="text-align: center;width: 150px;">
                        <button class="nav-link" id="board-tab" data-bs-toggle="tab" data-bs-target="#board"
                                type="button" role="tab" aria-controls="intro"
                                aria-selected="true" onclick="ListPage()"
                                style="width: 150px;font-size: 20px;text-align: center;">질문 게시판
                        </button>
                    </li>
                </ul>
                <!-- 내용 -->
                <div class="container">
                    <div class="tab-content" id="content">
                        <div class="tab-pane fade show active" id="intro" role="tabpanel" aria-labelledby="intro-tab">
                            <br>
                            <br>
                            <div class="col-12 mb-5">
                                <div class="card w-100">
                                    <div class="card-body" style="height: 300px;">
                                        ${lecture.lcontent}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="video" role="tabpanel" aria-labelledby="video-tab">
                            <div class="content mt-30 pb-5">
                                <ul class="course_list">
                                    <c:forEach var="curr" items="${curriculumList}">
                                        <li class="justify-content-between d-flex">
                                            <p class="pt-3"> ${curr.cname}
                                                <c:if test="${fn:contains(studyInfoList, curr.ccode)}">
                                                    <span class="badge badge-pill badge-warning ml-2"> 수강 완료 </span>
                                                </c:if>
                                            </p>

                                            <c:if test="${lecture.state eq 'on' and (empty sid or isReg)}">
                                                <button class="btn disable-primary-btn text-uppercase" disabled> 강의 듣기
                                                </button>
                                            </c:if>
                                            <c:if test="${(lecture.state eq 'on') and (not empty sid) and (not isReg)}">
                                                <button onclick="openLecture(${curr.ccode}, '${curr.lcode}')"
                                                        class="btn primary-btn text-uppercase"> 강의 듣기
                                                </button>
                                            </c:if>
                                        </li>
                                        <hr>
                                        <br>
                                    </c:forEach>
                                    <c:if test="${empty curriculumList}">
                                        <p class="text-center"> 등록된 커리큘럼이 없습니다. </p>
                                    </c:if>
                                </ul>
                            </div>
                        </div>


                        <div class="tab-pane fade" id="board" role="tabpanel" aria-labelledby="board-tab">


                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</section>


<div id="myModal" class="modal" style="display: none; height: 365px;">
    <div class="modal-content">
        <span class="close" style="
    margin-left: 628px;
">×</span>
        <iframe id="modal-iframe" src="" style="height: 365px;;
"></iframe>
    </div>
</div>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
<jsp:include page="../layout/footer.jsp"/>
</body>


<script>
    // 모달의 초기 내용을 저장할 변수
    let originalContent = null;


    // 모달의 초기 내용을 저장
</script>
<script>
    let key = "${param.key}";
    console.log(key);

    // 모든 탭 엘리먼트에서 'active' 클래스를 제거합니다.
    $(" #video-tab, #board-tab, #stars-tab , #registerPage").removeClass("active");

    // 모든 탭 내용 엘리먼트에서 'show active' 클래스를 제거합니다.

    if (key === "intro") {
        $("#intro-tab").addClass("active");
        $("#intro").addClass("show active");
    } else if (key === "video") {
        $("#video-tab").addClass("active");
        $("#video").addClass("show active");
    } else if (key === "board") {
        $("#board-tab").addClass("active");
        $("#board").addClass("show active");
    } else if (key === "stars") {
        $("#stars-tab").addClass("active");
        $("#stars").addClass("show active");
    }

</script>
<script>
    function openWritePage() {
        // AJAX 요청을 사용하여 글쓰기 페이지를 로드합니다.
        $.ajax({
            url: "${path}/lecBoard/questionInsert?lcode=${lecture.lcode}", // 글쓰기 페이지의 URL을 여기에 넣어주세요.
            type: "GET", // GET 요청 사용
            success: function (data) {
                console.log("성공")
                // 성공적으로 글쓰기 페이지를 불러왔을 때 실행되는 콜백 함수
                // data는 글쓰기 페이지의 HTML 내용을 포함하고 있습니다.
                $("#board").html(data); // 모달의 내용으로 페이지 내용을 삽입
            },
            error: function (error) {
                console.log("에러다에러" + error.responseText)
            }
        });
    }
</script>

<script>
    function ReloadPage() {
        if (originalContent !== null) {
            $("#board").html(originalContent);
        }
    }
</script>
<script>
    function backback() {
        $("#board").html(originalContent);
    }
</script>
<!-- 테이블 영역 끝 -->
<script>
    function ListPage() {
        var lcode = $("#lcode").val();
        $.ajax({
            type: "GET",  // GET 요청 또는 POST 요청을 선택할 수 있습니다.
            url: "${path}/lecBoard/list",  // 실제 API 엔드포인트로 변경해야 합니다.
            data: {
                lcode: lcode
            },
            success: function (data) {
                $("#board").html(data);
            },
            error: function (error) {
                console.log("에러다에러" + error.responseText)
            }
        });
    }
</script>

<script>
    function reviewPage() {
        var lcode = $("#lcode").val();
        $.ajax({
            type: "GET",  // GET 요청 또는 POST 요청을 선택할 수 있습니다.
            url: "${path}/lecture/review",  // 실제 API 엔드포인트로 변경해야 합니다.
            data: {
                lcode: lcode
            },
            success: function (data) {
                $("#stars").html(data);
            },
            error: function (error) {
                console.log("에러다에러" + error.responseText)
            }
        });
    }
</script>
<script>
    $('.ajax-link').click(function (e) {
        e.preventDefault(); // 기본 클릭 이벤트 방지

        var qno = $(this).data('qno');
        var page = $(this).data('page');

        // Ajax 요청 보내기
        $.ajax({
            type: 'GET',
            url: '${path}/lecBoard/detail?qno=' + qno + '&page=' + page,
            success: function (data) {
                // Ajax 요청이 성공했을 때 수행할 작업
                // data 변수에 서버에서 반환한 데이터가 포함됩니다.
                $("#board").html(data);
            },
            error: function () {
                // Ajax 요청이 실패했을 때 수행할 작업
                console.log("에러다에러" + error.responseText)
            }
        });
    });
</script>

<script>
    function openLecture(ccode, lcode) {
        let screenSizeWidth, screenSizeHeight;
        if (self.screen) {
            screenSizeWidth = screen.width;
            screenSizeHeight = screen.height;
        }
        let documentURL = "${path}/lecture/player?ccode=" + ccode;    //팝업창에 출력될 페이지 URL
        let windowname = "강의 플레이어";
        let intWidth = screenSizeWidth;
        let intHeight = screenSizeHeight;
        let intXOffset = 0;
        let intYOffset = 0;

        let obwindow = window.open(documentURL, windowname, " toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no");
        obwindow.resizeTo(intWidth, intHeight);
        obwindow.moveTo(intXOffset, intYOffset);
    }
</script>
</html>