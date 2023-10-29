<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트 신청</title>
    <jsp:include page="../layout/head.jsp"/>
</head>
<body style="background-image:  url('${path}/resources/img/applySuc.png');">

<div style="margin-top: 130px;">
    <p style="color: #ffffff; font-weight: bold; font-size:24px; text-align: center;" class="mb-4
">이벤트에 성공적으로 접수되었습니다! </p>
    <div>
        <button class="btn btn-block" onclick="check()" style="margin: 0 auto; font-weight: 200; width: 130px">닫기</button>
    </div>
    <script>
        function check(){ window.close(); }
    </script>
</div>
</body>
</html>