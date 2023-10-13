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
                <h1>국어</h1>
                <img src="" alt="선생님">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
                                data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
                                aria-selected="true">강좌정보</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="myreview-tab" data-bs-toggle="tab"
                                data-bs-target="#myreview" type="button" role="tab"
                                aria-controls="myreview" aria-selected="false">강의</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="wishlist-tab" data-bs-toggle="tab"
                                data-bs-target="#wishlist" type="button" role="tab"
                                aria-controls="wishlist" aria-selected="false">게시판</button>
                    </li>
                </ul>

                <!-- 내용 -->
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="userinfo" role="tabpanel"
                         aria-labelledby="userinfo-tab">${notice.content }</div>
                    <div class="tab-pane fade" id="myreview" role="tabpanel"
                         aria-labelledby="myreview-tab">${notice.title}</div>
                    <div class="tab-pane fade" id="wishlist" role="tabpanel"
                         aria-labelledby="wishlist-tab">${notice.id}
                        <table>
                            <th>eee</th>
                            <td>2222</td>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    let key = "${param.key}";
    console.log(key);
    if(key === "userinfo"){

        $("#myreview-tab").removeClass("active");
        $("#wishlist-tab").removeClass("active");
        $("#userinfo-tab").addClass("active");

        $("#myreview").removeClass("show active");
        $("#wishlist").removeClass("show active");
        $("#userinfo").addClass("show active");

    }else if(key === "myreview"){

        $("#wishlist-tab").removeClass("active");
        $("#userinfo-tab").removeClass("active");
        $("#myreview-tab").addClass("active");

        $("#userinfo").removeClass("show active");
        $("#wishlist").removeClass("show active");
        $("#myreview").addClass("show active");

    }else if(key === "wishlist"){

        $("#userinfo-tab").removeClass("active");
        $("#myreview-tab").removeClass("active");
        $("#wishlist-tab").addClass("active");

        $("#myreview").removeClass("show active");
        $("#userinfo").removeClass("show active");
        $("#wishlist").addClass("show active");

    }
</script>
</html>
