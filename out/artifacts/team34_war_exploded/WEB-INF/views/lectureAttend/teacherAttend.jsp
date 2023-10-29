<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 현재 날짜 구하기 -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 출결 관리 </title>
    <jsp:include page="../layout/head.jsp" />
</head>
<style>
    #attendPopup {
        display: none;
        top: 50%;
        left: 50%;
        width: 500px;
        height: 400px;
        margin-left: -250px;
        margin-top: -200px;
        z-index: 100;
    }
</style>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p>${lecture.lname}</p>
        <h2>출결 관리</h2>
    </div>
</section>
<!-- 브레드크럼 끝 -->

<div class="container mt-100">
    <div class="d-flex justify-content-between">
        <h4> 오프라인 강의 출결 </h4>
        <button class="btn btn-dark" id="insertBtn" disabled> 출결 기록 저장 </button>
    </div>
    <hr>
    <p> 강의명 : ${lecture.lname} &nbsp; | &nbsp; 진행 일자 : <c:out value="${today}"/> &nbsp; | &nbsp; 시작 시간 : ${lecture.stime} &nbsp; | &nbsp; 장소 : ${lecture.classroom} </p>
    <hr>
    <div class="d-flex justify-content-between align-items-baseline">
        <div>
            <span class="mr-2 text-secondary"> 자동 출결 </span>
            <button class="btn btn-outline-primary" id="attendCodeBtn"> 출결코드 생성 </button>
        </div>
        <div>
            <span class="mr-2 text-secondary"> 일괄변경 </span>
            <button class="btn btn-primary" id="changeAttend"> 전체 출석 </button>
            <button class="btn btn-danger" id="changeAbsent"> 전체 결석 </button>
        </div>
    </div>
    <table class="table table-hover text-center mt-15 mb-100">
        <thead>
        <tr>
            <td> 회원 아이디 </td>
            <td> 이름 </td>
            <td> 출석체크 일자 </td>
            <td> 출석체크 시간 </td>
            <td> 출결 현황 </td>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="attend" items="${attendList}" varStatus="status">
            <tr>
                <td class="align-middle"> ${attend.id} </td>
                <td class="align-middle"> ${attend.name} </td>
                <c:if test="${(empty attend.adate) or (attend.atype eq '코드오류')}">
                    <td class="align-middle attendDate">-</td>
                    <td class="align-middle test${status.count } attendTime">-</td>
                    <td class="align-middle attendType">
                        <div class="form-check d-inline-block mr-3">
                            <input type="radio" id="attend_${status.index}" name="${attend.id}_atype" value="${attend.id}" class="form-check-input">
                            <label for="attend_${status.index}" class="form-check-label" data-value="출석"> 출석 </label>
                        </div>
                        <div class="form-check d-inline-block mr-3">
                            <input type="radio" id="absent_${status.index}" name="${attend.id}_atype" value="${attend.id}" class="form-check-input">
                            <label for="absent_${status.index}" class="form-check-label" data-value="결석"> 결석 </label>
                        </div>
                        <div class="form-check d-inline-block mr-3">
                            <input type="radio" id="tardy_${status.index}" name="${attend.id}_atype" value="${attend.id}" class="form-check-input">
                            <label for="tardy_${status.index}" class="form-check-label" data-value="지각"> 지각 </label>
                        </div>
                    </td>
                </c:if>
                <c:if test="${(not empty attend.adate) and (attend.atype ne '코드오류')}">
                    <td class="align-middle"> ${attend.adate} </td>
                    <td class="align-middle test${status.count} attendTime"><c:if test="${attend.atime eq '00:00:00'}">-</c:if><c:if test="${attend.atime ne '00:00:00'}">${attend.atime}</c:if></td>
                    <td class="align-middle attendType">
                        <c:if test="${attend.atype eq '출석'}">
                            <div class="form-check d-inline-block mr-3">
                                <input type="radio" id="attend_${status.index}" name="${attend.id}_atype" value="${attend.id}" class="form-check-input" checked>
                                <label for="attend_${status.index}" class="form-check-label" data-value="출석"> 출석 </label>
                            </div>
                            <div class="form-check d-inline-block mr-3">
                                <input type="radio" id="absent_${status.index}" name="${attend.id}_atype" value="${attend.id}" class="form-check-input">
                                <label for="absent_${status.index}" class="form-check-label" data-value="결석"> 결석 </label>
                            </div>
                            <div class="form-check d-inline-block mr-3">
                                <input type="radio" id="tardy_${status.index}" name="${attend.id}_atype" value="${attend.id}" class="form-check-input">
                                <label for="tardy_${status.index}" class="form-check-label" data-value="지각"> 지각 </label>
                            </div>
                        </c:if>
                        <c:if test="${attend.atype eq '결석'}">
                            <div class="form-check d-inline-block mr-3">
                                <input type="radio" id="attend_${status.index}" name="${attend.id}_atype" value="${attend.id}" class="form-check-input">
                                <label for="attend_${status.index}" class="form-check-label" data-value="출석"> 출석 </label>
                            </div>
                            <div class="form-check d-inline-block mr-3">
                                <input type="radio" id="absent_${status.index}" name="${attend.id}_atype" value="${attend.id}" class="form-check-input" checked>
                                <label for="absent_${status.index}" class="form-check-label" data-value="결석"> 결석 </label>
                            </div>
                            <div class="form-check d-inline-block mr-3">
                                <input type="radio" id="tardy_${status.index}" name="${attend.id}_atype" value="${attend.id}" class="form-check-input">
                                <label for="tardy_${status.index}" class="form-check-label" data-value="지각"> 지각 </label>
                            </div>
                        </c:if>
                        <c:if test="${attend.atype eq '지각'}">
                            <div class="form-check d-inline-block mr-3">
                                <input type="radio" id="attend_${status.index}" name="${attend.id}_atype" value="${attend.id}" class="form-check-input">
                                <label for="attend_${status.index}" class="form-check-label" data-value="출석"> 출석 </label>
                            </div>
                            <div class="form-check d-inline-block mr-3">
                                <input type="radio" id="absent_${status.index}" name="${attend.id}_atype" value="${attend.id}" class="form-check-input">
                                <label for="absent_${status.index}" class="form-check-label" data-value="결석"> 결석 </label>
                            </div>
                            <div class="form-check d-inline-block mr-3">
                                <input type="radio" id="tardy_${status.index}" name="${attend.id}_atype" value="${attend.id}" class="form-check-input" checked>
                                <label for="tardy_${status.index}" class="form-check-label" data-value="지각"> 지각 </label>
                            </div>
                        </c:if>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!-- 출석코드 팝업창 -->
    <div class="bg-gray p-5 position-fixed rounded shadow-lg text-center" id="attendPopup">
        <h3> ${attend.lname} 출석코드 </h3>
        <h1 id="attendCode" class="mt-5"></h1>
        <p id="remainTime"> 남은 시간 | 10:00 </p>
        <button class="btn btn-primary btn-lg mt-4" id="closePopup"> 출석체크 종료 </button>
    </div>
</div>

<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp" />
<!-- 푸터 끝 -->

<script>
    // 테이블을 다시 불러오는 함수
    function reloadTable(lcode) {
        $.ajax({
            url: "${path}/lectureAttend/reloadTeacherTable",
            data: {lcode : lcode},
            type: "post",
            dataType: "json",
            success: function(data) {
                for(let i=0; i<data.length; i++) {
                    $(".attendDate:eq("+i+")").text(data[i].adate);
                    $(".attendTime:eq("+i+")").text(data[i].atime);
                    if(data[i].atime == "00:00:00") {
                        $(".attendTime:eq("+i+")").text("-");
                    }
                    let html = "";
                    if(data[i].atype == "출석") {
                        html = '<div class="form-check d-inline-block mr-3"><input type="radio" id="attend_'+i+'" name="'+data[i].id+'_atype" value="'+data[i].id+'" class="form-check-input" checked><label for="attend_'+i+'" class="form-check-label" data-value="출석"> 출석 </label>' +
                            '</div><div class="form-check d-inline-block mr-3"><input type="radio" id="absent_'+i+'" name="'+data[i].id+'_atype" value="'+data[i].id+'" class="form-check-input"><label for="absent_'+i+'" class="form-check-label" data-value="결석"> 결석 </label>' +
                            '</div><div class="form-check d-inline-block mr-3"><input type="radio" id="tardy_'+i+'" name="'+data[i].id+'_atype" value="'+data[i].id+'" class="form-check-input"><label for="tardy_'+i+'" class="form-check-label" data-value="지각"> 지각 </label></div>';
                    } else if(data[i].atype == "결석") {
                        html = '<div class="form-check d-inline-block mr-3"><input type="radio" id="attend_'+i+'" name="'+data[i].id+'_atype" value="'+data[i].id+'" class="form-check-input"><label for="attend_'+i+'" class="form-check-label" data-value="출석"> 출석 </label></div>' +
                            '<div class="form-check d-inline-block mr-3"><input type="radio" id="absent_'+i+'" name="'+data[i].id+'_atype" value="'+data[i].id+'" class="form-check-input" checked><label for="absent_'+i+'" class="form-check-label" data-value="결석"> 결석 </label>' +
                            '</div><div class="form-check d-inline-block mr-3"><input type="radio" id="tardy_'+i+'" name="'+data[i].id+'_atype" value="'+data[i].id+'" class="form-check-input"><label for="tardy_'+i+'" class="form-check-label" data-value="지각"> 지각 </label></div>';
                    } else {
                        html = '<div class="form-check d-inline-block mr-3"><input type="radio" id="attend_'+i+'" name="'+data[i].id+'_atype" value="'+data[i].id+'" class="form-check-input"><label for="attend_'+i+'" class="form-check-label" data-value="출석"> 출석 </label></div>' +
                            '<div class="form-check d-inline-block mr-3"><input type="radio" id="absent_'+i+'" name="'+data[i].id+'_atype" value="'+data[i].id+'" class="form-check-input"><label for="absent_'+i+'" class="form-check-label" data-value="결석"> 결석 </label></div>' +
                            '<div class="form-check d-inline-block mr-3"><input type="radio" id="tardy_'+i+'" name="'+data[i].id+'_atype" value="'+data[i].id+'" class="form-check-input" checked><label for="tardy_'+i+'" class="form-check-label" data-value="지각"> 지각 </label></div>';
                    }
                    $(".attendType:eq("+i+")").html(html);
                }
            },
            error: function(err) {
                console.log(err);
            }
        });
    }

    // 일괄 출석 버튼
    $("#changeAttend").on("click", () => {
        $("[id^=attend]").prop("checked", true);
        $("#insertBtn").prop("disabled", false);
    });
    // 일괄 결석 버튼
    $("#changeAbsent").on("click", () => {
        $("[id^=absent]").prop("checked", true);
        $("#insertBtn").prop("disabled", false);
    });
    $("input").on("change", () => {
        $("#insertBtn").prop("disabled", false);
    });
    // 출결 기록 저장 버튼
    $("#insertBtn").on("click", () => {
        // 회원 아이디 리스트
        let dataArray = [];
        let tiemAt = 1;
        $("input:checked").each(function(idx) {
            let atime = 0;
            if($(".test" + tiemAt).text() != "-"){ atime = $(".test" + tiemAt).text(); }
            else { atime = new Date().getHours() + ":" + new Date().getMinutes() + ":" + new Date().getSeconds(); }
            if($(this).next("label").attr("data-value") == '결석') { atime = 0; }
            let data = {
                "id" : $(this).val(),
                "atime" : atime,
                "atype" : $(this).next("label").attr("data-value"),
                "lcode" : "${lecture.lcode}"
            };
            dataArray.push(data);
            tiemAt++;
        });

        $.ajax({
            url: "${path}/lectureAttend/insertAttend",
            type: "post",
            dataType: "JSON",
            traditional: true,
            data: {dataArray : JSON.stringify(dataArray)},
            success: function(data) {
                reloadTable("${lecture.lcode}");
            },
            error: function(err) {
                console.log(err);
                alert("출결 기록 저장에 실패했습니다. 잠시 후 다시 시도해주세요");
            }
        });
    });

    // 출결코드 생성 버튼
    let remainTime, timer;
    $("#attendCodeBtn").on("click", () => {
        $.ajax({
            url: "${path}/lectureAttend/saveAttendCode",
            data: {"lcode":"${lecture.lcode}"},
            type: "post",
            dataType: "json",
            success: function(data) {
                $("#attendCode").text(data.attendCode);
                $("#attendPopup").show();

                // 연속으로 출결코드 생성 버튼을 누른 경우
                if(timer < 599) { clearInterval(remainTime); }

                timer = 599;
                remainTime = setInterval(() => {
                    let minute = parseInt(timer / 60, 10);
                    let second = parseInt(timer % 60, 10);
                    minute = minute < 10 ? "0" + minute : minute + "";
                    second = second < 10 ? "0" + second : second + "";
                    $("#remainTime").text("남은 시간 | " + minute + ":" + second);
                    timer--;
                    if(timer <= 0) { endAttend(); }
                }, 1000);
            },
            error: function (err) {
                alert("실패");
                console.log(err);
            }
        });
    });

    // 팝업 종료 버튼
    $("#closePopup").on("click", () => {
        endAttend();
    });

    // 출석체크 종료 함수
    function endAttend() {
        timer = 599;
        clearInterval(remainTime);
        $.ajax({
            url: "${path}/lectureAttend/delAttendCode",
            data: {"lcode":"${lecture.lcode}"},
            type: "post",
            dataType: "json",
            success: function(data) {
                $("#attendPopup").hide();
                reloadTable("${lecture.lcode}");
            },
            error: function (err) {
                alert("출석체크 종료에 실패했습니다. 잠시 후 다시 시도해주세요");
                console.log(err);
            }
        });
    }
</script>
</body>
</html>
