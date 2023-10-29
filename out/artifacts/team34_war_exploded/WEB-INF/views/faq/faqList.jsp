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
    <title>FAQ</title>
    <jsp:include page="../layout/head.jsp"/>
    <style>

    </style>
</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p>자주 묻는 질문과 답변을 확인해요</p>
        <h2>FAQ</h2>
    </div>
</section>
<!-- 브레드크럼 끝 -->
<section class="album-catagory section-padding-100-0" style="min-height: 60vh">
    <div class="container" id="content" style="margin-top: 20px;">
        <!-- 검색 엔진 시작 -->
        <div class="d-flex justify-content-end">
            <div class="col-xl-4 col-md-6 float-right mb-20"  style="z-index: 10">
                <form action="${path}/faq/list" method="get" >
                    <div class="form-group ">
                        <div class="input-group-append">
                            <div class="panel single-accordion" style="border: 1px solid #ced4da; border-radius: 0.25rem;">
                                <select id="type" name="type" class="collapseOne" style="border: none;padding: 8px;">
                                    <option value="T" > 제목 </option>
                                    <option value="C"> 내용 </option>
                                </select>
                            </div>
                            <input type="text" name="keyword" class="form-control" placeholder="검색하기" aria-describedby="project-search-addon" />
                            <input class="btn btn-dark" type="submit" id="project-search-addon" value="검색"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- 검색 엔진 끝 -->
        <div class="container">
            <div class="accordions mb-100" id="accordion" role="tablist" aria-multiselectable="true">
                <c:forEach items="${faqList }" var="faq" varStatus="status">
                    <div class="panel single-accordion">
                        <h6><a role="button" class="collapsed" aria-expanded="true" aria-controls="collapse${faq.fno}" data-toggle="collapse" data-parent="#accordion" href="#collapse${faq.fno}">
                                ${faq.question }
                            <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                            <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                        </a></h6>
                        <div id="collapse${faq.fno}" class="accordion-content collapse" >
                            <p>${faq.answer }</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
