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
    <title> 배달정보수정 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>

</head>
<body>
<div id="content">
    <div class="container-md p-5 mt-5">
        <h4 class="mb-2"> 주문 정보 </h4>
        <div class="border p-4">
            <div class="row">
                <div class="form-outline mb-4 col col-3">
                    <input type="text" name="dno" class="form-control form-control"value="${delivery.dno}" readonly />
                    <label class="form-label" for="title"> 배송번호 </label>
                </div>

                <div class="form-outline mb-4 col col-9">
                    <input type="text" id="title" name="title" class="form-control form-control" value="${delivery.title}" readonly />
                    <label class="form-label" for="title"> 상품명 </label>
                </div>
            </div>
            <div class="row">
                <div class="form-outline mb-4 col col-6">
                    <input type="text" class="form-control" id="cus_id" name="cus_id" value="${delivery.id}" readonly>
                    <label for="cus_id" class="form-label"> 주문자 ID </label>
                </div>
                <div class="form-outline mb-4 col col-6">
                    <input type="text" class="form-control" id="cus_tel" name="cus_tel" value="${delivery.tel}" readonly>
                    <label for="cus_tel" class="form-label"> 주문자 전화번호 </label>
                </div>
            </div>
            <div class="form-outline">
                <input class="form-control form-control" type="text" name="cus_addr" id="cus_addr" value="${delivery.addr}" readonly>
                <label for="cus_addr" class="form-label"> 배송지주소 </label>
            </div>
        </div>
    </div>

    <div class="container-md p-5 mt-5">
        <h4 class="mb-2"> 송장번호 입력 </h4>
        <form name="frm1" id="frm1" class="border p-4">
            <div class="row">
                <div class="form-outline mb-4 col col-8" style="display: flex;">
                    <input class="form-control-lg col-12" type="text" name="dcode" id="dcode" value="${delivery.dcode}" required>
                    <input type="hidden" name="dno" id="dno" value="${delivery.dno}">
                    <c:if test="${empty delivery.dcode}">
                    <button type="button" class="btn btn-dark btn-lg col-6" onclick="dcCheck();" style="margin-left: 20px;"> 추가 </button>
                    </c:if>
                    <c:if test="${!empty delivery.dcode}">
                    <button type="button" class="btn btn-dark btn-lg col-6" onclick="dcCheck();" style="margin-left: 20px;"> 수정 </button>
                    </c:if>
                </div>
            </div>
        </form>
        <script>
            function dcCheck() {
                var dno = $("#dno").val();
                var dcode = $("#dcode").val();

                $.ajax({
                    type: "POST",
                    url: "${path}/admin/dcodeUpdatePro",
                    data: { dno: dno,  dcode: dcode },
                    success: function(data) {
                        alert("수정이 완료되었습니다.");
                        window.close();
                        window.opener.location.reload();
                    },
                    error: function(error) {
                        alert("수정이 완료되었습니다.");
                        window.close();
                        console.log(error.responseText);
                    }
                });
            }
        </script>
    </div>
</div>
</body>
</html>