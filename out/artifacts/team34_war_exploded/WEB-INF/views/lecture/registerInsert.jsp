<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 강의 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <style>
    </style>
</head>
<div class="card shadow-2-strong" style="background-color: #f5f7fa;">
    <div class="card-body p-0">
        <div class="table-responsive table-scroll" data-mdb-perfect-scrollbar="true"
             style="position: relative; height: 350px;">
            <table class="table table-dark mb-0">
                <thead style="background-color: #393939;">
                <tr class="text-uppercase text-success">
                    <th scope="col">강의명</th>
                    <th scope="col">가격</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">${lecture.lname}</th>
                    <td>${lecture.lprice} 포인트</td>
                </tr>
                <tr>
                    <th></th>
                    <td></td>
                </tr>
                <tr>
                    <th></th>
                    <td></td>
                </tr>
                <tr>
                    <th></th>
                    <td></td>
                </tr>
                <tr style="background-color: white;color: black;">
                    <td> 보유한 포인트</td>
                    <td> ${user.pt} 포인트</td>
                </tr>

                <c:if test="${lecture.lprice gt user.pt}">
                    <input hidden="hidden" value="${lecture.lcode}" id="lcode4">
                    <tr class="table-danger">
                        <td class="text-black font-weight-bold"><strong> 총 금액 </strong></td>
                        <td class="text-black font-weight-bold" style="color: red;"><strong> ${lecture.lprice}
                            포인트 </strong></td>
                    </tr>
                </c:if>
                <c:if test="${lecture.lprice lt user.pt}">
                    <tr class="table-primary">
                        <td class="text-black font-weight-bold"><strong> 총 금액 </strong></td>
                        <td class="text-black font-weight-bold"><strong> ${lecture.lprice} 포인트 </strong></td>
                    </tr>
                </c:if>
                </tbody>
            </table>
            <div class="form-group">
                <c:if test="${lecture.lprice lt user.pt}">
                    <button class="btn btn-outline-dark btn-lg py-3 btn-block"
                            onclick="window.location='${path}/lecture/registerInsert?lcode=${lecture.lcode}'"> 수강신청하기
                    </button>
                </c:if>
                <c:if test="${lecture.lprice gt user.pt}">
                    <button class="btn btn-outline-dark btn-lg py-3 btn-block"
                            onclick="alert('보유한 포인트가 부족합니다.')" disabled> 수강신청하기
                    </button>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script>
    function insertPage() {
        // 사용자 입력을 가져옵니다.
        var title = $("#title").val();
        var content = $("#contents").val();
        var lcode = $("#lcode4").val();

        $.ajax({
            url: "${path}/lecture/registerInsert?lcode=" + lcode, // URL을 고정 경로로 지정
            type: "POST",
            data: {
                lcode: lcode
            },
            success: function (data) {
                console.log("성공", data);
                registeredPage();
                // 성공적으로 요청을 처리한 후 할 작업을 여기에 추가하세요.

                // $("#intro").addClass("show active");
                // $("#board").removeClass("show active");
                // $("#intro-tab").addClass("active");
                // $("#board-tab").removeClass("active");
            },
            error: function (error) {
                console.log("에러다에러", error.responseText);
            }
        });
    }
</script>
<script>
    function registeredPage() {
        var lcode = $("#lcode").val();
        $.ajax({
            type: "GET",  // GET 요청 또는 POST 요청을 선택할 수 있습니다.
            url: "${path}/lecture/registered?lcode=" + lcode,  // 실제 API 엔드포인트로 변경해야 합니다.
            success: function (data) {
                $(" #intro,#video, #board, #stars").removeClass("show active");
                $(" #intro-tab ,#video-tab, #board-tab, #stars-tab").removeClass("active");
                $("#registerPage").html(data);
                $("#registerPage").addClass("show active");
            },
            error: function (error) {
                console.log("에러다에러" + error.responseText)
            }
        });
    }
</script>
</html>
