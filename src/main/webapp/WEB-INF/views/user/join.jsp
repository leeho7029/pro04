<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <title>회원약관</title>
    <jsp:include page="../setting/head.jsp"/>
    <style>
        .text-area {height:300px;overflow-y:auto;}
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="${path}/resources/css/join.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //Custom Theme files -->
    <!-- web font -->
    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body id="body">
<jsp:include page="../layout/header.jsp"/>
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>회원약관</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>회원약관</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->
<body>
<!-- main -->
<div class="main-w3layouts wrapper">
    <h1>회원가입</h1>
    <div class="main-agileinfo">
        <div class="agileits-top">
            <form action="#" method="post">
                <div class="column is-10-tablet">
                <label for="id" class="label" style="color: white"> 아이디 </label>
                <div class="columns">
                    <div class="column is-four-fifths">
                        <div class="control" style="width: 100%">
                            <div class="input-group">
                                <input type="text" class="form-control" id="id" name="id" placeholder="영문 소문자로만 아이디 입력"
                                       pattern="^[a-z]{4,16}" maxlength="16" autocomplete="off" autofocus required>
                                <button type="button" class="btn btn-danger" onclick="idCheck()">중복 확인</button>
                            </div>
                            <input type="hidden" name="id_chk" id="id_chk" value="no">
                            <p id="msg" style="color: red"></p>
                        </div>
                    </div>
                </div>
        </div>
        <div class="column is-10-tablet">
            <label for="pw" class="label" style="color: white"> 비밀번호 </label>
            <div class="control">
                <input class="form-control" type="password" id="pw" name="pw" placeholder="숫자, 영문, 특수문자 1개 이상 / 8자리 이상 16자리 이하" class="input"
                       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required>
            </div>
        </div>
        <div class="column is-10-tablet">
            <label for="pw_chk" class="label" style="color: white"> 비밀번호 확인 </label>
            <div class="control">
                <input class="form-control" type="password" id="pw_chk" name="pw_chk" placeholder="비밀번호 확인을 입력해주세요" class="input"
                       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required>
                <p id="pw_msg" style="color:red;"></p>
            </div>
        </div>
                <div class="column is-10-tablet">
                    <label for="name" class="label" style="color: white"> 이름 </label>
                    <div class="control">
                        <input class="form-control" type="text" id="name" name="name" placeholder="이름을 입력해주세요"  autocomplete="off" required>
                    </div>
                </div>
                <div class="column is-10-tablet">
                    <label for="email" class="label" style="color: white"> 이메일 </label>
                    <div class="control">
                        <input class="form-control" type="email" id="email" name="email" placeholder="이메일을 입력해주세요"  autocomplete="off" required>
                    </div>
                </div>
                <div class="column is-10-tablet">
                    <label for="tel" class="label" style="color: white"> 전화번호 </label>
                    <div class="mb-3">
                        <label for="tel" class="form-label">전화번호</label>
                        <input type="tel" class="form-control" name="tel" id="tel"  pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required>
                        <p class="form-text">(특수기호 포함하여 000-0000-0000 으로 입력해주세요)</p>
                    </div>
                </div>
                <div class="column is-10-tablet">
                    <label for="tel" class="label" style="color: white"> 주소 </label>
                    <div class="control">
                        <div class="input-group">
                             <input type="text" id="addr1" name="addr1" placeholder="기본 주소" class="form-control" autocomplete="off" readonly>
                             <input type="text" id="postcode" name="postcode" placeholder="우편번호를 입력해주세요" class="form-control" autocomplete="off" readonly>
                             <button type="button" class="btn btn-danger" onclick="findAddr()"> 우편번호 검색 </button>
                        </div>
                        <div class="columns mt-1">
                            <div class="column is-9-tablet">
                                <div>
                                    <input type="text" id="addr2" name="addr2" placeholder="상세 주소를 입력해주세요" class="form-control" autocomplete="off" required>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="column is-10-tablet">
                    <label for="tel" class="label" style="color: white"> 생년월일 </label>
                    <div class="control">
                        <input type="date" id="birth" name="birth" max="${minYear}-12-31" placeholder="생년월일을 입력해주세요" class="form-control" autocomplete="off" required>
                    </div>
                </div>
                <br>
                <div class="column is-10-tablet is-10">
                    <button type="submit" class="btn btn-danger" style="display: flex; justify-content: right"> 회원가입 </button>
                    <p class="has-text-centered mt-4"> 이미 회원이신가요? <a href="${path}/user/login.do"> 로그인하기 </a> </p>
                </div>
            </form>
        </div>
    </div>
    <!-- copyright -->
    <div class="colorlibcopy-agile">
        <p>© 2018 Colorlib Signup Form. All rights reserved | Design by <a href="https://colorlib.com/" target="_blank">Colorlib</a></p>
    </div>
    <!-- //copyright -->
    <ul class="colorlib-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    $(document).ready(function() {
        $("#id").keyup(function() {
            $("#id_chk").val("no");
            if($(this).val() != "") {
                $("#msg").html("아이디 중복 체크를 진행해주세요");
            }
        });
        $("#pw, #pw_chk").keyup(function() {
            $("#pw_msg").html("");
        });
    });

    // 아이디 중복 체크 함수
    function idCheck() {
        if($("#id").val() == "") {
            $("#msg").html("아이디를 입력한 후 중복 체크를 진행해주세요");
            $("#id").focus();
            return;
        }

        let params = { id:$("#id").val() };
        $.ajax({
            url: "${path}/user/idCheck.do",
            type: "post",
            dataType: "json",
            data: params,
            success:function(data) {
                console.log("HI");
                let idPass = data.result;
                if(!idPass) {
                    $("#id_chk").val("no");
                    $("#msg").text("기존에 사용되고 있는 아이디입니다.");
                    $("#id").focus();
                } else if(idPass) {
                    $("#id_chk").val("yes");
                    $("#msg").text("사용 가능한 아이디입니다.");
                } else if(idPass == "") {
                    $("#msg").text("아이디가 확인되지 않았습니다. 다시 시도해주세요.")
                }
            },
            error:function(res) {
                alert("아이디 중복 확인에 실패했습니다. 잠시 후 다시 시도해주세요.");
                console.log(res.responseText);
            }
        })
    }
</script>
<script>
    function joinCheck(f) {
        if(f.pw.value != f.pw_chk.value) {
            $("#pw_msg").html("비밀번호와 비밀번호 확인이 서로 다릅니다");
            f.pw.focus();
            return false;
        }
        if(f.id_chk.value != "yes") {
            $("#msg").html("아이디 중복 체크를 진행해주세요");
            f.id.focus();
            return false;
        }
    }
    function findAddr(){
        new daum.Postcode({
            oncomplete:function(data){
                console.log(data);
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress;
                document.getElementById("postcode").value = data.zonecode;
                if(roadAddr !== ''){
                    document.getElementById("addr1").value = roadAddr;
                } else if(jibunAddr !== ''){
                    document.getElementById("addr1").value = jibunAddr;
                }
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>

<%@ include file="../layout/footer.jsp"%>
</body>
</html>