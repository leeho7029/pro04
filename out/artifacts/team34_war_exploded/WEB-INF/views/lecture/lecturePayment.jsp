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
    <title>강의 결제</title>
    <jsp:include page="../layout/head.jsp"/>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <style>
        .card { border: none; margin-bottom: 24px; -webkit-box-shadow: 0 0 13px 0 rgba(236,236,241,.44);box-shadow: 0 0 13px 0 rgba(236,236,241,.44);}
        .form-label {font-weight: bold; color:#000000!important;}
        #bprice { font-weight: bold; font-size: 18px;}
    </style>
</head>
<body>
<!-- header Start -->
<jsp:include page="../layout/header.jsp" />
<!-- header End -->

<!-- banner Start -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p>해법과 함께 학습 여정을 시작해요</p>
        <h2>강의 결제</h2>
    </div>
</section>
<!-- banner End -->


<!-- userPaymentDetail Start -->

<!-- section1(payList table) Start -->
<div class="row" style="width: 85%; margin: 100px auto; padding-bottom: 50px;">
    <div class="row" style="padding-left: 50px;">
        <h4><i class="fa-solid fa-wallet" style="color: #343537; padding-right: 15px;"></i>주문상품</h4>
    </div>
    <div class="col-lg-12" style="width: 100%;">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive project-list">
                    <table class="table project-table table-centered table-nowrap">
                        <thead>
                        <tr>
                            <th scope="col">상품명</th>
                            <th scope="col">가격</th>
                            <th scope="col">할인</th>
                            <th scope="col">결제금액</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">${lecture.lname}</th>
                            <td>${lecture.lprice}</td>
                            <td><strong> - </strong>${lecture.lprice}</td>
                            <td>0</td>
                        </tr>
                            <tr>
                                <th scope="row">${book.bname}</th>
                                <td>${book.bprice}</td>
                                <td>0</td>
                                <td>${book.bprice}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- section1(payList table) End -->

<!-- section2(payment & payInfo) Start -->
<div class="col" style="width: 85%; margin: 0 auto; padding-bottom: 50px;">
    <div class="row" style="padding-left: 50px; margin-bottom: 30px;">
        <h4><i class="fa-solid fa-file-pen" style="color: #3d3d3e;"></i>결제정보</h4>
    </div>
    <form action="${path}/payment/paymentPro" method="post" onsubmit="return payCheck(this)">
        <div class="row" style="margin-bottom: 50px;">
        <div class="col mb-3">
            <div class="accordion" id="accordionPayment" style="width: 90%; margin: 0 auto;">
                <div class="accordion-item mb-3">
                    <div id="collapseCC" class="accordion-collapse collapse show" data-bs-parent="#accordionPayment" style="">
                        <div class="accordion-body">
                            <div class="mb-3">
                                <label class="form-label">받는 사람 연락처</label>
                                <input type="tel" name="tel" id="tel" class="form-control" required>
                                <input type="hidden" name="name" id="name" value="${user.name }">
                                <input type="hidden" name="email" id="email" value="${user.email }">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">배송지 주소</label>
                                <input type="text" name="addr1" id="addr1" placeholder="기본 주소 입력" autocomplete="off" readonly class="form-control" required /><br>
                                <input type="text" name="addr2" id="addr2" placeholder="상세 주소 입력" autocomplete="off" required class="form-control" required /><br>
                            </div>
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="mb-3">
                                        <input type="text" id="postcode" name="postcode" class="form-control" placeholder="우편번호" autocomplete="off" readonly >
                                    </div>
                                </div>
                                <div class="col-lg-3" style="padding-left: 0;">
                                    <div class="mb-3">
                                        <button type="button" class="btn btn-dark"  onclick="findAddr()" style="width:100%;"> 우편번호 </button>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input" >
                                        <p class="form-label">결제수단</p>
                                        <select class="form-control"  aria-label="Default select example" name="method" id="method" style="width: 100%;">
                                            <option value="신용카드">신용카드</option>
                                            <option value="체크카드">체크카드</option>
                                            <option value="계좌이체">계좌이체</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input" style="width: 100%">
                                        <p class="form-label">결제사</p>
                                        <select class="form-control" name="com" id="com" >
                                            <option value="선택안함">선택안함</option>
                                        </select>
                                        <input type="hidden" name="com2" id="com2" value="">
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3" style="margin-top: 20px;">
                                <label class="form-label">결제 번호</label>
                                <input type="text" name="account" id="account" class="form-control" required>
                                <input type="hidden" name="payAmount" id="payAmount">
                                <input type="hidden" name="payCk" id="payCk" value="no">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-3 mb-3">
            <div class="card position-sticky top-0">
                <div class="p-3 " id="paypay">
                    <h5 class="card-title mb-3">결제금액</h5>
                    <div style="display: flex; justify-content:space-between;">
                        <span>상품금액</span>
                        <span id="bprice">${book.bprice}</span>
                    </div>
                    <div style="display: flex; justify-content:space-between;">
                        <span>포인트 </span>
                        <div class="d-flex small">
                             <input type="number" class="form-control" name="point" id="point" max="${user.pt}" min="0" style="width: 80px;" >
                             <input type="button" id="pointApply" class="btn btn-secondary btn-sm" value ="적용" >
                            <input type="hidden" name="pt" id="pt" value="" >
                            <input type="hidden" name="title" id="title" value="${lecture.lname}외1" >
                        </div>
                    </div>
                    <hr>
                    <div>
                        <div>
                            <p style="display: flex; justify-content:space-between;">
                                <span>총금액</span> <strong class="text-dark" id="subprice"></strong>
                            </p>
                            <p style="display: flex; justify-content:space-between;">
                                <span></span> <strong class="text-dark" id="totalprice" ></strong>
                            </p>
                        </div>
                    </div>
                    <input type="button" id="pay" value="결제하기" class="btn btn-dark w-100" style="height: 80px;">
                    <c:if test="${!empty sid }">
                        <input type="hidden" id="lcode" name="lcode" value="${lecture.lcode }">
                        <input type="hidden" id="lname" name="lname" value="${lecture.lname}">
                        <input type="hidden" name="bcode" id="bcode" value="${lecture.bcode }">
                        <input type="hidden" name="tcode" id="tcode" value="${lecture.tcode}">
                        <input type="hidden" id="sprice" name="sprice" value="${book.bprice}">
                        <input type="hidden" id="amount" name="amount" value="1">
                        <input type="submit" class="btn btn-primary w-100 mt-2" value="구매" style="background-color: #4f5665;display: none;">
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    </form>
    <script>
        $(document).ready(function(){
            var cardArr1 = ["현대카드","농협카드","BC카드","KB카드","신한카드"];
            var cardArr2 = ["하나카드","농협카드","BC카드","신한카드"];
            var bankArr = ["카카오뱅크","농협은행","신한은행","기업은행","국민은행"];
            $("#method").change(function(){
                var th = $(this).val();
                if(th==="신용카드"){
                    $("#com").children("option:not(:first)").remove();
                    for(var i=0;i<cardArr1.length;i++) {
                        $("#com").append("<option value='" + cardArr1[i] + "'>" + cardArr1[i] + "</option>");
                    }
                } else if(th==="체크카드"){
                    $("#com").children("option:not(:first)").remove();
                    for(var i=0;i<cardArr2.length;i++) {
                        $("#com").append("<option value='"+cardArr2[i]+"'>"+cardArr2[i]+"</option>");
                    }
                } else {
                    $("#com").children("option:not(:first)").remove();
                    for(var i=0;i<bankArr.length;i++) {
                        $("#com").append("<option value='"+bankArr[i]+"'>"+bankArr[i]+"</option>");
                    }
                }
            }).change();
            $("#com").change(function(){
                $("#com2").val($(this).val());
            });
        });
    </script>
    <script>
        //주소 연동 API
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
    <script>
        //결제모듈 API 연동
            $(document).ready(function() {
            var totalPay = 0;
            var paytitle;
            var userPt = parseInt(${user.pt});

            console.log($("#bprice").text());

            totalPay = totalPay + parseInt($("#bprice").text());

            $("#subprice").text(totalPay);
            $("#totalprice").html("<input type='hidden' id='price' name='price' value='" + totalPay + "'>");


            $("#point").val(0);

            $("#point").on("input", function() {
                var pointInput = $("#point");
                var ptInput = $("#pt");
                var pointValue = parseInt(pointInput.val());
                if (!isNaN(pointValue) && pointValue >= 0 && pointValue <= userPt) {
                    ptInput.val(userPt - pointValue);
                } else {
                    ptInput.val("");
                    alert("잘못된 포인트 입력입니다. 0 이상 " + userPt + " 이하의 값을 입력해주세요.");
                }
            });

                $("#pointApply").click(function() {
                    var pointValue = $("#point").val();
                    pointValue = pointValue.trim();
                    if (pointValue === "") {
                        pointValue = "0";
                    }
                    pointValue = parseInt(pointValue);

                    if (!isNaN(pointValue) && pointValue >= 0) {
                        var orPrice = parseInt($("#bprice").text());
                        var dcPrice = Math.min(pointValue, orPrice);

                        totalPay = orPrice - dcPrice;

                        $("#subprice").text(totalPay);
                        $("#totalprice").html("<input type='hidden' id='price' name='price' value='" + totalPay + "'>");
                    } else {
                        alert(" 0 이상의 숫자를 입력해주세요.");
                    }
                });

            $("#pay").click(function(){
                var email = $("#email").val();
                var cname = $("#name").val();
                var tel = $("#tel").val();
                var addr = $("#addr").val();
                var postcode = $("#postcode").val();
                paytitle = $("#title").val();
                if ($("#price").val() == "") {
                    alert("구매할 수량을 입력하지 않으셨습니다.");
                    $("#totalprice").focus();
                    return;
                }
                alert("결제할 금액 : " + totalPay);
                //상품명_현재시간
                var d = new Date();
                var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
                var IMP = window.IMP; // 생략가능
                IMP.init('imp11164187'); // 결제 API를 사용하기 위한 코드 입력!
                IMP.request_pay({		//결제 요청
                    pg: "T5102001",
                    merchant_uid : '상품명_' + date, //상점 거래 ID
                    name :paytitle,				// 결제 명
                    amount : totalPay,					// 결제금액
                    buyer_email : email, // 구매자 email
                    buyer_name : cname,				// 구매자 이름
                    buyer_tel : tel,		// 구매자 전화번호
                    buyer_addr : addr,		// 구매자 주소
                    buyer_postcode : postcode			// 구매자 우편번호
                }, function(rsp){
                    if(rsp.success){
                        console.log(rsp);
                        var msg = '결제가 완료 되었습니다.';
                        var r1 = '고유 아이디 : ' +rsp.imp_uid;
                        var r2 = '상점 거래 아이디 : ' +rsp.merchant_uid;
                        var r3 = '결제 금액 : ' +rsp.paid_amount;
                        var r4 = '카드 승인 번호 : '+rsp.apply_num;

                        document.forms[0].submit();

                        // 실제 결제 창
                        // $("#payCk").val("yes");
                        // $("#payAmount").val(rsp.paid_amount);
                        // $("#pmethod").val(rsp.pay_method);
                        // $("#pcom").val(rsp.pg_provider);
                        // $("#cnum").val(rsp.apply_num);
                        // alert(msg);
                        // $("#paymentResult").html(r1+"<br>"+r2+"<br>"+r3+"<br>"+r4);
                    } else{
                        alert('결제에 실패했습니다. 에러 내용: ' + rsp.error_msg);
                    }

                    //테스트용이므로 실패시에도 그냥 통과시킴
                    $("#payCk").val("yes");
                    $("#payAmount").val(totalPay);
                    // $("#pmethod").val("신용카드");
                    // $("#pcom").val("삼성카드");
                    // $("#cnum").val("123-1234-1234-1278");
                    $("#paymentResult").text("결제 완료 : "+totalPay);
                });
            });
            });
    </script>
</div>
<!-- section2(payment & payInfo) End -->

<jsp:include page="../layout/footer.jsp" />
<!-- userPaymentDetail End -->
</body>
</html>