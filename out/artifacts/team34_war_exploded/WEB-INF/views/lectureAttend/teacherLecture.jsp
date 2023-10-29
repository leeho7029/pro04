<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 내 강의실 </title>
    <jsp:include page="../layout/head.jsp" />
</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p>내가 전달하는 지식과 콘텐츠를 확인해요</p>
        <h2>강사 강의실</h2>
    </div>
</section>
<!-- 브레드크럼 끝 -->

<section class="contact-area section-padding-100 mb-100">
    <div class="container text-center">
        <table class="table table-hover">
            <thead>
            <tr>
                <td> 과목명 </td>
                <td> 강좌명 </td>
                <td> 시작일 </td>
                <td> 종료일 </td>
                <td> 시작시간 </td>
                <td> 비고 </td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="lecture" items="${lectureList}">
                <tr>
                    <td class="align-middle"> ${lecture.sname} </td>
                    <td class="align-middle"> ${lecture.lname} </td>
                    <td class="align-middle"> ${lecture.sdate} </td>
                    <td class="align-middle"> ${lecture.edate} </td>
                    <td class="align-middle"> ${lecture.stime} </td>
                    <td><a href="${path}/lectureAttend/teacherAttend?lcode=${lecture.lcode}" class="btn btn-primary"> 출결 관리 </a> </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</section>

<jsp:include page="../layout/footer.jsp" />
</body>
</html>
