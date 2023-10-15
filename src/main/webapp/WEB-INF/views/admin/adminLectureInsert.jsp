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
                        <a id="admin-member-nav" href="${path}/admin/adminuserList.do" class="nav-link text-white">
                            회원 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a id="admin-notice-nav" href="${path}/admin/adminNoticeList.do" class="nav-link text-white">
                            공지사항 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a id="admin-book-nav" href="${path}admin/adminBookList.do" class="nav-link text-white">
                            교재 관리
                        </a>
                    </li>
                        <li class="nav-item">
                        <a id="admin-cate-nav" href="${path}/subject/list.do" class="nav-link text-white">
                            과목 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a id="admin-file-nav" href="${path}/admin/adminLectureList.do" class="nav-link text-white">
                            강의 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${path}/admin/adminFileList.do"class="nav-link text-white">자료실</a>
                    </li>
                    <li class="nav-item">
                        <a href="${path}/admin/adminTeacherList.do"class="nav-link text-white">강사 관리</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-8">
            <br>
            <br>
            <br>
            <div class="col-md-9">
                <form action="${path}/lecture/insertpro.do" id="lectureInsert" method="post" enctype="multipart/form-data">
                    <div class="column is-10-tablet">
                        <label for="cate" class="col-md-2 col-form-label">카테고리</label>
                        <div class="col-md-4">
                            <select name="cate" id="cate" class="form-select">
                                <option>국어</option>
                                <option>영어</option>
                                <option>수학</option>
                            </select>
                        </div>
                    </div>
                    <div class="column is-10-tablet">
                        <label for="lectitle" class="label" style="color: white">강의 제목 </label>
                        <div class="control">
                            <input class="form-control" type="text" id="lectitle" name="lectitle" placeholder="제목을 입력해주세요"  autocomplete="off" required>
                        </div>
                    </div>
                    <div class="column is-10-tablet">
                        <label for="stno" class="label" style="color: white">총원 </label>
                        <div class="control">
                            <input class="form-control" type="number" id="stno" name="stno" placeholder="총원을 입력해주세요"  autocomplete="off" required>
                        </div>
                    </div>
                    <div class="column is-10-tablet">
                        <select name="subcode" id="subcode" class="form-select">
<%--                            <c:forEach var="subject" items="${subject}">--%>
<%--                                <option value="${subject.subcode}">${subject.title}</option>--%>
<%--                            </c:forEach>--%>
                                    <option>11</option>
                                    <option>22</option>
                                     <option>33</option>
                        </select>
                    </div>
                    <div class="column is-10-tablet">
                        <select name="bkcode" id="bkcode" class="form-select">
<%--                            <c:forEach var="book" items="${book}">--%>
<%--                                <option value="${book.bkcode}">${book.title}</option>--%>
<%--                            </c:forEach>--%>
    <option>111</option>
    <option>222</option>
    <option>333</option>
                        </select>
                    </div>
                    <div class="column is-10-tablet">
                        <label for="upfile">파일 선택</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="upfile" name="upfile" multiple="multiple">
                            <label class="custom-file-label" for="upfile">파일을 선택하세요</label>
                        </div>
                    </div>
                    <br>
                    <div class="column is-10-tablet is-10">
                        <button type="submit" class="btn btn-danger" style="display: flex; justify-content: right"> 등록하기 </button>
                    </div>
                    <li class="nav-item">
                        <a href="${path}/admin/adminsubjectList.do"class="nav-link text-white">강의 목록</a>
                    </li>
                </form>
            </div>
        </div>
    </div>
</div>

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

