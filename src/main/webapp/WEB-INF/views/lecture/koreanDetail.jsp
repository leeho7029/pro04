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


    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
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
                                aria-controls="myreview" aria-selected="false">맛보기 강의</button>
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
                         aria-labelledby="userinfo-tab">

                    </div>



                    <div class="tab-pane fade" id="myreview" role="tabpanel"
                         aria-labelledby="myreview-tab">
                        <div class="has-background-white card-content shadow-down p-6">
                            <h3 class="has-text-centered"> 강사 정보 </h3>
                            <hr>
                            <div class="columns is-multiline is-centered">
                                    <label class="label"> 비디오 </label>
                                    <c:forEach var="item" items="${fileboard}">
                                        <video controls width="400">
                                            <source src="${pageContext.request.contextPath}/resources/upload/lecture/${item.saveFolder}/${item.saveFile}" type="video/mp4">
                                        </video>
                                    </c:forEach>
                            </div>
                        </div>
                    </div>



                    <div class="tab-pane fade" id="wishlist" role="tabpanel"
                         aria-labelledby="wishlist-tab">
                        <div class="button-group" style="float:right;">
                            <a class="bi-menu-button" style="font-size: 19px" href="${path }/lecBoardKor/insert.do">글쓰기</a>
                        </div>
                        <table class="table" id="lecBoardKor-table">
                            <thead>
                            <tr>
                                <th width="80">번호</th>
                                <th width="200">제목</th>
                                <th width="80">작성자</th>
                                <th width="120">작성일</th>
                            </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td>${lecBoardKorList.seq}</td>
                                    <td><a href="${path}/lecBoardKor/detail.do?seq=${lecBoardKorList.seq}" style="color: #000000;">${lecBoardKorList.title}</a></td>
                                    <td>${lecBoardKorList.id}</td>
                                    <td>
                                        <fmt:parseDate value="${lecBoardKorList.regdate}" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        <fmt:formatDate value="${resdate}" pattern="yyyy-MM-dd"/>
                                    </td>
                                </tr>

                            <c:if test="${empty lecBoardKorList}">
                                <tr>
                                    <td >등록된 자료가 없습니다.</td>
                                    <td>.</td>
                                    <td>.</td>
                                    <td>.</td>

                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp"/>
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

<script>
    $(document).ready( function () {
        $('#lecBoardKor-table').DataTable({
            responsive : true,
            ordering: false,
            language: {
                url: '/js/user/dataTables.ko.json'
            },
            lengthChange: false
        });
    } );
</script>
</html>
