<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<footer class="footer-area">
    <div class="container">
        <div class="row d-flex flex-wrap align-items-center">
            <div class="col-12 col-md-6">
                <a href="${path}/"><img src="${path}/resources/img/logo2.png" alt="해법 로고 이미지" class="w-25"></a>
                <p class="copywrite-text">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> KimLeeho, KimHyungyeong, KimBogyeong, ShinYeeun <br>
                    This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
            <div class="col-12 col-md-6">
                <div class="footer-nav">
                    <ul>
                        <li><a href="${path}/lecture/list">강의</a></li>
                        <li><a href="${path}/board/list">커뮤니티</a></li>
                        <li><a href="${path}/news/list">교육뉴스</a></li>
                        <li><a href="${path}/event/list">이벤트</a></li>
                        <li><a href="${path}/dataRoom/list">자료실</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Popper js -->
<script src="${path}/resources/js/bootstrap/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="${path}/resources/js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="${path}/resources/js/plugins/plugins.js"></script>
<!-- Active js -->
<script src="${path}/resources/js/active.js"></script>