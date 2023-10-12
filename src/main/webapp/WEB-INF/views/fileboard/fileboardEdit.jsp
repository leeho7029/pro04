<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="fileboard" value="${dto}"/>
<c:set var="fileboard2" value="${dto2}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실 글쓰기</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>
</head>
<body>

<!-- 헤더 영역 시작 -->
<jsp:include page="../layout/header.jsp" />
<!-- 헤더 영역 끝 -->

<!-- 배너 영역 시작 -->
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>자료실</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>자료실</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->
<!-- 배너 영역 끝 -->


<!-- 자료실 글쓰기 시작 -->
<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="p-4 bg-white shadow rounded content">
                    <form action="${path}/fileboard/edit.do" id="writeform" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="form-group col-12">
                                <label for="title">제목</label>
                                <input type="hidden" id="articleno" name="articleno" value="${fileboard.articleno}">
                                <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" autocomplete="off" value="${fileboard.title}" autofocus required>
                            </div>
                            <div class="form-group col-12">
                                <label for="content">내용</label>
                                <textarea name="content" id="content" class="form-control" rows="6" placeholder="내용을 입력해주세요" required>${fileboard.content}</textarea>
                            </div>
                            <div class="form-group col-8">
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="upfile" name="upfile" multiple="multiple">
                                    <label class="custom-file-label" for="upfile">파일 선택</label>
                                </div>
                            </div>
                            <div class="col-4 d-flex align-items-end">
                                <button type="reset" class="btn btn-secondary">초기화</button>
                                <button type="submit" class="btn btn-primary">작성하기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 자료실 글쓰기 끝 -->

<!-- 푸터 영영 시작 -->
<br><br>
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->

<form action="#">
    <input type="hidden" id="articleno" name="articleno" value="${fileboard.articleno}">
    <button id="toTop" title="Go to top">
        <i class="fas fa-angle-up"></i>
    </button>
</form>

</body>
<!-- 파일 입력 요소 변경 시 파일 이름 표시 -->
<script>
    $(".file-input").on("change", () => {
        let fileName = '';
        let fileLength = $(".file-input")[0].files.length;
        if(fileLength > 1) {
            fileName = fileLength + "개의 파일";
        } else {
            fileName = $(".file-input").val().split("\\").pop();
        }
        $(".file-name").text("\t 선택한 파일 : " + fileName);
    });
</script>
</html>
