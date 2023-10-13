<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
<jsp:include page="../setting/head.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-4" style="height: 950px;">
            <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px;height: 100%" >
                <h1 class="fs-4">관리자페이지</h1>
                <hr class="my-4">
                <ul class="nav flex-column mb-auto">
                    <li class="nav-item">
                        <a id="admin-member-nav" href="${path}/MemberListAdmin.do" class="nav-link text-white">
                            회원 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a id="admin-notice-nav" href="${path}/NoticeListAdmin.do" class="nav-link text-white">
                            공지사항 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a id="admin-book-nav" href="${path}/BookListAdmin.do" class="nav-link text-white">
                            교재 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a id="admin-cate-nav" href "${path}/CategoryList.do" class="nav-link text-white">
                        카테고리 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a id="admin-file-nav" href="${path}/admin/insert.do" class="nav-link text-white">
                            강의 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${path}/admin/adminFileList.do"class="nav-link text-white">자료실</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-8">
            <section class="section">
                <form action="${path}/community/insert.do" method="post" class="container">
                    <div class="row mb-3">
                        <label for="cate" class="col-md-2 col-form-label">카테고리</label>
                        <div class="col-md-4">
                            <select name="cate" id="cate" class="form-select">
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.cate}">${category.cateName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <label for="title" class="col-md-2 col-form-label">제목</label>
                        <div class="col-md-4">
                            <input type="text" id="title" name="title" class="form-control">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="content" class="form-label">내용</label>
                        <textarea name="content" id="content" class="form-control" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required></textarea>
                        <script>
                            CKEDITOR.replace('content', { filebrowserUploadUrl: '${path}/community/imageUpload.do' });
                        </script>
                    </div>
                    <div class="mb-3">
                        <input type="submit" class="btn btn-primary btn-block" value="등록하기">
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
