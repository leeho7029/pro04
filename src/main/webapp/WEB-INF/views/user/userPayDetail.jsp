<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="javasript" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 상세페이지</title>
    <jsp:include page="../layout/head.jsp" />
</head>
<body>
<div class="container" style="margin: 100px auto; width: 100%;">

    <!-- section1(product info) End -->
    <div style=" margin: 30px auto;">
        <div>
            <h4><i class="fa-solid fa-cart-shopping" style="color: #2a2b2c; margin-right: 15px;"></i>구매상품</h4>
        </div>
        <div class="col-md-12" style="display: flex;border-top: 2px solid darkgray; padding-top: 30px; border-bottom: 2px dashed lightgray;">
            <table class="table">
                <thead>
                    <tr>
                        <th >상품명 </th>
                        <th >수량 </th>
                        <th>가격</th>
                    </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${payment.lname} </td>
                    <td>1</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>${payment.bname}</td>
                    <td>1</td>
                    <td>${payment.bprice}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- section2(pay info) End -->
    <div style=" margin: 30px auto;">
        <div>
            <h4><i class="fa-regular fa-credit-card" style="color: #2c2c2d; margin-right: 15px;"></i>결제정보</h4>
        </div>
        <div class="col-md-12" style="display: flex;border-top: 2px solid darkgray; padding-top: 30px; border-bottom: 2px dashed lightgray;">
            <table class="table">
                <thead>
                <tr>
                    <th width="150">결제방법 </th>
                    <th width="250">결제가격 </th>
                    <th>결제일자</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${payment.method}</td>
                        <td>${payment.price}</td>
                        <td>${payment.resdate}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- section3(delivery status) End -->
    <div style=" margin: 30px auto;">
        <div>
            <h4><i class="fa-solid fa-bookmark" style="color: #232424; margin-right: 15px;"></i>배송현황</h4>
        </div>
        <div class="col-md-12" style="display: flex;border-top: 2px solid darkgray; padding-top: 30px; border-bottom: 2px dashed lightgray;">
            <div class="col-md-4 " >
                <div class="card bg-pattern">
                    <div class="card-body" style="height: 200px; border-right: 1px solid darkgray;">
                        <div class="float-left" style="text-align: center;  font-size: 40px; width: 100%;">
                            <c:if test="${payment.dstatus == 0}">
                                <i class="fa-solid fa-box" style="color: #95addd;"></i>
                            </c:if>
                            <c:if test="${payment.dstatus != 0}">
                                <i class="fa-solid fa-box" style="color: #767779;"></i>
                            </c:if>
                        </div>
                        <p class="font-size-30 mt-0 pt-1" style="color: #000;font-weight: 500; font-size: 20px; text-align: center;">결제완료</p>
                        <h5 class="font-size-30 mt-0 pt-1" style="font-size: 15px; text-align: center;" >판매자가 주문을 확인하는 단계</h5>
                    </div>
                </div>
            </div>
            <div class="col-md-4 " >
                <div class="card bg-pattern">
                    <div class="card-body" style="height: 200px; border-right: 1px solid darkgray;">
                        <div class="float-left" style="text-align: center;  font-size: 40px; width: 100%;">
                            <c:if test="${payment.dstatus == 1}">
                                <i class="fa-solid fa-truck" style="color: #95addd;"></i>
                            </c:if>
                            <c:if test="${payment.dstatus != 1}">
                                <i class="fa-solid fa-truck" style="color: #767779;"></i>
                            </c:if>
                        </div>
                        <p class="font-size-30 mt-0 pt-1" style="color: #000;font-weight: 500; font-size: 20px; text-align: center;">배송중</p>
                        <h5 class="font-size-30 mt-0 pt-1" style="font-size: 15px; text-align: center;" > 상품발송이 완료되어
                            배송추적 가능 단계</h5>
                    </div>
                </div>
            </div>
            <div class="col-md-4 " >
                <div class="card bg-pattern">
                    <div class="card-body" style="height: 200px;">
                        <div class="float-left" style="text-align: center;  font-size: 40px; width: 100%;">
                            <c:if test="${payment.dstatus == 2}">
                                <i class="fa-solid fa-square-check" style="color: #95addd;"></i>
                            </c:if>
                            <c:if test="${payment.dstatus != 2}">
                                <i class="fa-solid fa-square-check" style="color: #767779;"></i>
                            </c:if>
                        </div>
                        <p class="font-size-30 mt-0 pt-1" style="color: #000;font-weight: 500; font-size: 20px; text-align: center;">배송완료</p>
                        <h5 class="font-size-30 mt-0 pt-1" style="font-size: 15px; text-align: center;" >
                            주문자에게 배송이 완료된 단계  </h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:choose>
        <c:when test="${payment.dstatus == 0}">
            <div class="row" id="infoTel" style="padding-left: 50px; margin: 0 auto; width: 250px;">
                <a class="btn btn-secondary" href="javascript:void(0);" onclick="delCheck()" style="margin-right: 15px;">구매취소</a>
                <button type="button" class="btn btn-dark" onclick="check()">닫기</button>
            </div>
        </c:when>
    </c:choose>
    <script>
        function delCheck() {
            $.ajax({
                type: "GET",
                url: "${path}/payment/paymentDelete",
                data: {
                    pno: ${payment.pno},
                    lcode: "${payment.lcode}"
                },
                success: function(data) {
                    alert("구매가 취소되었습니다.");
                    window.close();
                    window.opener.location.reload();
                },
                error: function() {
                    alert("구매취소 중 오류가 발생했습니다.");
                }
            });
        }


        function check(){
            window.close();
        }
    </script>
</div>
</body>
</html>