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
    <title>공지사항 글수정</title>
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
        <p style="color: white; font-weight: bold; font-size:30px;">공지사항</p>
    </div>
</section>
<!-- 브레드크럼 끝 -->
<section class="album-catagory section-padding-100-0">
    <div class="course_details_area mb-5 mt-5">
        <div class="container">
            <!-- 테이블 영역 시작 -->
            <form action="${path}/notice/edit" method="post">
                <div class="col-12">
                    <div class="card w-100">
                        <div class="card-body">
                            <div class="table-responsive project-list">
                                <table class="table project-table table-centered table-nowrap">
                                    <tbody>
                                    <tr>
                                        <input type="hidden" value="${detail.seq}" name="seq" id="seq">
                                        <th class="text-center" style="vertical-align: middle; width: 15%;">제목</th>
                                        <td><input type="text" id="title" name="title" required value="${detail.title}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" style="font-size: 15px;">
                                            <textarea name="content" id="content" cols="100" rows="8" maxlength="800" class="single-textarea" style="height: 400px; border: 1px solid #cbcbcb">${detail.content}</textarea>
                                            <script>
                                                $(document).ready(function () { $("#content").cleditor(); });
                                            </script>
                                        </td>
                                    </tr>
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
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
