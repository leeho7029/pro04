<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>강의</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>강의</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->



<div class="container mt-5">
    <div class="row">
        <div class="col-md-3">
            <aside class="menu is-hidden-mobile">
                <ul class="list-group" style="text-align: center; height: 400px; color: orange; font-weight: bold;">
                    <li class="list-group-item " style="background-color: black; color: white">모든강좌</li>
                    <li class="list-group-item "><a href="${path}/lecture/home">메인</a></li>
                    <li class="list-group-item"><a href="${path}/lecture/korean">국어</a></li>
                    <li class="list-group-item"><a href="${path}/lecture/english">영어</a></li>
                    <li class="list-group-item"><a href="${path}/lecture/math">수학</a></li>
                </ul>
            </aside>
        </div>
        <div class="col-md-9">
            <div class="container mt-5">
                <form action="${path}/register/insertpro.do" method="post">

                    <div class="column is-10-tablet">
                        <label for="lectitle" class="label" style="color: white"> 강의명 </label>
                        <div class="control">
                            <input class="form-control" type="text" id="lectitle" name="lectitle" value="${lecture.lectitle}"  readonly >
                        </div>
                    </div>
                    <div class="column is-10-tablet">
                        <label for="price" class="label" style="color: white"> 가격 </label>
                        <div class="control">
                            <input class="form-control" type="text" id="price" name="price" value="${lecture.price}"  readonly  >
                        </div>
                    </div>
                    <div class="column is-10-tablet">
                        <label for="leccode" class="label" style="color: white"> 강의코드 </label>
                        <div class="control">
                            <input class="form-control" type="text" id="leccode" name="leccode" value="${lecture.leccode}"  readonly >
                        </div>
                    </div>
                    <div class="column is-10-tablet">
                        <label for="name" class="label" style="color: white"> 주문하는 사람 </label>
                        <div class="control">
                            <input hidden="hidden" class="form-control" type="text" id="id" name="id" value="${user.id}"  readonly >
                            <input class="form-control" type="text" id="name" name="name" value="${user.name}"  readonly >
                        </div>
                    </div>
                    <br>
                    <div class="column is-10-tablet is-10">
                        <button type="submit" class="btn btn-danger" style="display: flex; justify-content: right"> 결제하기 </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<jsp:include page="../layout/footer.jsp"/>
</body>
</html>
