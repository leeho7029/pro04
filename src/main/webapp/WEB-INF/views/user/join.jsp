<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <jsp:include page="../layout/head.jsp"/>
    <style>
        .form-control {border: 1px solid lightgray !important;}
    </style>
</head>
<body>
<!-- header Start -->
<jsp:include page="../layout/header.jsp" />
<!-- header End -->

<!-- banner Start -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p style="color: white; font-weight: bold; font-size:30px;">회원가입</p>
    </div>
</section>
<!-- banner End -->

<!-- join Start -->
<div class="col-xl-6" style="margin:100px auto;">
    <div class="container justify-content-center gx-4">
        <div class="card p-2 p-md-3">
            <section class="section" style="padding-top: 20px; padding-bottom: 30px;">
                <div class="container" style="width:80%;" >
                    <div class="p-6 rounded content">
                            <form name="frm1" id="frm1" action="${path}/user/join" class="columns is-multiline is-centered" method="post" onsubmit="return joinCheck(this)">
                                <div class="column is-10-tablet">
                                    <label for="id" class="label" style="font-weight: bold !important; font-size: 18px;"> 아이디 </label>
                                    <div class="columns" style="margin-bottom: 30px;" >
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="id" name="id" placeholder="영문 소문자로만 아이디 입력" pattern="^[a-z]{4,16}" maxlength="16" autocomplete="off" autofocus required >
                                            <input type="hidden" id="id_chk" name="id_chk" value="no">
                                            <button type="button" class="btn btn-danger" onclick="idCheck()" style="background-color: #000000; border: none;">중복 확인</button>
                                        </div>
                                        <p id="msg" style="color: #807D7DFF; "></p>
                                    </div>
                                </div>
                                <div class="column is-10-tablet">
                                    <label for="pw" class="label" style="font-weight: bold !important; font-size: 18px;"> 비밀번호 </label>
                                    <div class="control">
                                        <input type="password" id="pw" name="pw" placeholder="숫자, 영문, 특수문자 1개 이상 / 8자리 이상 16자리 이하" class="form-control border-0 p-4"
                                               pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required >
                                    </div>
                                </div>
                                <div class="column is-10-tablet">
                                    <label for="pw_chk" class="label" style="font-weight: bold !important; font-size: 18px;"> 비밀번호 확인 </label>
                                    <div class="control">
                                        <input type="password" id="pw_chk" name="pw_chk" placeholder="비밀번호 확인을 입력해주세요" class="form-control border-0 p-4"
                                               pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required >
                                        <p id="pw_msg" style="color:#807D7DFF;"></p>
                                    </div>
                                </div>
                                <div class="column is-10-tablet" style=" margin-top: 30px;">
                                    <label for="name" class="label" style="font-weight: bold !important; font-size: 18px;"> 이름 </label>
                                    <div class="control">
                                        <input type="text" id="name" name="name" placeholder="이름을 입력해주세요" class="form-control border-0 p-4" autocomplete="off" required >
                                    </div>
                                </div>
                                <div class="column is-10-tablet" style=" margin-top: 30px;">
                                    <label for="email" class="label" style="font-weight: bold !important; font-size: 18px;"> 이메일 </label>
                                    <div class="control">
                                        <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요" class="form-control border-0 p-4" autocomplete="off" required >
                                    </div>
                                </div>
                                <div class="column is-10-tablet" style=" margin-top: 30px;">
                                    <label for="tel" class="label" style="font-weight: bold !important; font-size: 18px;"> 전화번호 </label>
                                    <div class="control">
                                        <input type="tel" id="tel" name="tel" placeholder="전화번호를 입력해주세요" class="form-control border-0 p-4" autocomplete="off" required >
                                    </div>
                                </div>
                                <div class="column is-10-tablet" style=" margin-top: 30px;">
                                    <label for="tel" class="label" style="font-weight: bold !important; font-size: 18px;"> 주소 </label>
                                    <div class="control">
                                        <input type="text" id="addr1" name="addr1" placeholder="기본 주소를  입력해주세요" class="form-control border-0 p-4" autocomplete="off" readonly style=" margin-bottom: 20px;">
                                        <input type="text" id="addr2" name="addr2" placeholder="상세 주소를 입력해주세요" class="form-control border-0 p-4" autocomplete="off" required style="margin-bottom: 20px;">
                                        <div class="input-group">
                                            <input type="text" id="postcode" name="postcode" placeholder="우편번호를 입력해주세요" class="form-control border-0 p-4" autocomplete="off" readonly >
                                            <button type="button" class="btn btn-sm btn-outline-primary ml-4" onclick="findAddr()" style="background-color: #000000; border: none; width: 120px;color: #ffffff;font-size: 17px;"> 우편번호  </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="column is-10-tablet"  style=" margin-top: 30px;">
                                    <label for="tel" class="label" style="font-weight: bold !important; font-size: 18px;"> 생년월일 </label>
                                    <div class="control">
                                        <input type="date" id="birth" name="birth" placeholder="생년월일을 입력해주세요" class="form-control border-0 p-4" autocomplete="off" required>
                                    </div>
                                </div>
                                <div class="col-12 text-center wow fadeInUp">
                                    <button type="submit" class="btn oneMusic-btn mt-30" id="in_btn1" style=" background-color: #000000; color:#fff;"> 회원가입 </button>
                                    <p class="has-text-centered mt-4" style="text-align: center;"> 이미 회원이신가요? <a href="${path}/user/login" style="font-weight: bold; color : #000000; "> 로그인하기 </a> </p>
                                </div>
                            </form>
                        </div>
                </div>
            </section>
        </div>
    </div>
</div>
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
            url: "${path}/user/idCheck",
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- join End -->

<!-- Footer Start -->
<jsp:include page="../layout/footer.jsp" />
<!-- Footer End -->

</body>
</html>