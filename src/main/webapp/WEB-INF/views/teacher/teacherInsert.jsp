<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="../setting/head.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-4" style="height: 950px;">
            <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px;height: 100%">
                <br>
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
                </ul>
            </div>
        </div>
        <div class="col-md-8">
            <br>
            <br>
            <br>
            <div class="col-md-9">
                <form action="${path}/teacher/insertpro.do" id="teacherInsert" method="post" enctype="multipart/form-data">
                    <div class="column is-10-tablet">
                        <label for="tname" class="label" style="color: white"> 이름 </label>
                        <div class="control">
                            <input class="form-control" type="text" id="tname" name="tname" placeholder="이름을 입력해주세요"  autocomplete="off" required>
                        </div>
                    </div>
                    <div class="column is-10-tablet">
                        <label for="tmail" class="label" style="color: white"> 이메일 </label>
                        <div class="control">
                            <input class="form-control" type="tmail" id="tmail" name="tmail" placeholder="이메일을 입력해주세요"  autocomplete="off" required>
                        </div>
                    </div>
                    <div class="column is-10-tablet">
                        <label for="ttel" class="label" style="color: white"> 전화번호 </label>
                        <div class="mb-3">
                            <label for="ttel" class="form-label">전화번호</label>
                            <input type="tel" class="form-control" name="ttel" id="ttel"  pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required>
                            <p class="form-text">(특수기호 포함하여 000-0000-0000 으로 입력해주세요)</p>
                        </div>
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
                        <a href="${path}/admin/adminsubjectList.do"class="nav-link text-white">강사 관리</a>
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