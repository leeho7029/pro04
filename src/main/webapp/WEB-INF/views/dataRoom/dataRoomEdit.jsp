<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실 글수정</title>
    <jsp:include page="../layout/head.jsp"/>

    <style>
        input {
            border-radius: 5px;
            height: 35px;
            border: 1px solid #cbcbcb;
            width: 100%;
        }
        textarea {
            resize: none;
            width: 100%;
            height: 400px;
            border: 1px solid #cbcbcb;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p style="color: white; font-weight: bold; font-size:30px;">자료실</p>
    </div>
</section>
<!-- 브레드크럼 끝 -->
<section class="album-catagory section-padding-100-0">
    <div class="course_dataRooms_area mb-5 mt-5">
        <div class="container">
            <!-- 테이블 영역 시작 -->
            <form action="${path}/dataRoom/edit" method="post" enctype="multipart/form-data">
                <div class="col-12">
                    <div class="card w-100">
                        <div class="card-body">
                            <div class="table-responsive project-list">
                                <table class="table project-table table-centered table-nowrap">
                                    <tbody>
                                    <tr>
                                        <input type="hidden" value="${dataRoom.articleNo}" name="articleNo" id="articleNo">
                                        <th class="text-center" style="vertical-align: middle; width: 15%;">제목</th>
                                        <td><input type="text" id="title" name="title" required value="${dataRoom.title}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" style="font-size: 15px;">
                                            <textarea name="content" id="content" cols="100" rows="8" maxlength="800" class="single-textarea" style="height: 400px; border: 1px solid #cbcbcb">${dataRoom.content}</textarea>
                                            <script>
                                                $(document).ready(function () { $("#content").cleditor(); });
                                            </script>
                                        </td>
                                    </tr>
                                    <!-- 파일 선택 부분 시작 -->
                                    <tr>
                                        <th class="text-center">파일 첨부</th>
                                        <td>
                                            <input type="file" class="file-input" name="upfile" multiple="multiple" style="height: 100%">
                                            <span class="file-cta">
                                            <span class="file-icon mb-0">
                                                <i class="fas fa-upload mb-0"></i>
                                            </span>
                                            <span class="file-label mb-0">
                                                파일 선택
                                            </span>
                                        </span>
                                            <span class="file-name">선택된 파일이 없습니다.</span>
                                        </td>
                                    </tr>
                                    <!-- 파일 선택 부분 끝 -->
                                    </tbody>
                                </table>
                                <div class="btn-group float-right mr-3">
                                    <input type="submit" class="btn btn-dark" style="height: 100%" value="수정">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- 테이블 영역 끝 -->
    </div>
</section>
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
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
