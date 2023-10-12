<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 수정하기</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>
</head>
<body>

<!-- 헤더 영역 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 영역 끝 -->

<!-- 배너 영역 시작 -->
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">

        <div class="d-flex justify-content-between align-items-center">
            <h2>공지사항 수정하기</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>공지사항</li>
            </ol>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 공지사항 수정하기 시작 -->
<div class="content" id="content" style="margin-top: 100px;">
    <div class="row column text-center">
        <div class="container" style="width: 80%">
            <form action="${path }/notice/edit.do" method="post">
                <div class="row column text-center">
                    <div class="container">
                        <form action="${path }/notice/insert.do" method="post">
                            <div class="field is-horizontal" style="height: 60px; margin-bottom:0px;">
                                <div class="field-label is-normal">
                                    <label class="label">제목</label>
                                </div>
                                <div class="field-body">
                                    <div class="field">
                                        <p class="control">
                                            <input type="hidden" name="seq" id="seq" value="${notice.seq }">
                                            <input type="text" name="title" id="title" placeholder="제목 입력"
                                                   value="${notice.title }" maxlength="98" class="input" required>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="field is-horizontal">
                                <div class="field-label is-normal">
                                    <label class="label">내용</label>
                                </div>
                                <div class="field-body">
                                    <div class="field">
                                        <div class="control">
                                            <textarea name="content" id="content" class="textarea is-focused"
                                                      placeholder="내용 입력" rows="8" cols="100" maxlength="800"
                                                      required>${notice.content }</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="buttons is-right mb-100">
                                <a class="button" href="${path }/notice/list.do">글 목록</a>
                                <c:if test='${sid eq "admin"}'>
                                    <input type="submit" class="button is-primary" value="글 등록">
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 공지사항 수정하기 끝 -->
<br><br>
<!-- 푸터 영영 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->

<form action="#">
    <input type="hidden" id="seq" name="seq" value="${notice.seq}">
    <button id="toTop" title="Go to top">
        <i class="fas fa-angle-up"></i>
    </button>
</form>

</body>
</html>