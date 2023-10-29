<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<style>
    div, ul, li {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }

    a {
        text-decoration: none;
    }

    .menu {
        position: absolute;
        width: 150px;
        top: 50%;
        margin-top: -165px;
        right: 10px;
        background: #fff;
        border-radius: 20px;
        border: 1px solid #333333;
        z-index: 5;
    }

    .menu ul {
        position: relative;
        float: left;
        width: 100%;
        display: inline-block;
        *display: inline;
    }

    .menu ul li {
        float: left;
        width: 100%;
        border-bottom: 1px solid #ddd;
        text-align: center;
        display: inline-block;
        *display: inline;
    }

    .menu ul li a {
        position: relative;
        float: left;
        width: 100%;
        height: 50px;
        line-height: 50px;
        text-align: center;
        color: #333333;
        padding: 0px 10px;
    }

    .menu ul li a i {
        line-height: 50px;
    }

    .menu ul li a:hover {
        color: #000;
    }

    .menu ul li:last-child {
        border-bottom: 0;
    }

    #slideTel {
        border-start-start-radius: 17px;
        border-start-end-radius: 17px;
    }
</style>

<div class="menu">
    <ul>
        <li class="bg-dark" id="slideTel">
            <p class="mb-0 mt-3 text-white"> 상담 문의 </p>
            <h6 class="mb-3 text-warning"> 02-1234-5678 </h6>
        </li>
        <li>
            <a href="#popular" class="d-flex justify-content-between"> 인기 강의 <i class="fa-solid fa-angle-right"></i> </a>
        </li>
        <li>
            <a href="#offline" class="d-flex justify-content-between"> 오프라인 강의 <i class="fa-solid fa-angle-right"></i> </a>
        </li>
        <li>
            <a href="#online" class="d-flex justify-content-between"> 온라인 강의 <i class="fa-solid fa-angle-right"></i> </a>
        </li>
        <li>
            <a href="#reviews" class="d-flex justify-content-between"> 수강평 <i class="fa-solid fa-angle-right"></i> </a>
        </li>
        <li>
            <a href="#location" class="d-flex justify-content-between"> 오시는 길 <i class="fa-solid fa-angle-right"></i> </a>
        </li>
    </ul>
</div>

<script>
    $(document).ready(function(){
        var currentPosition = parseInt($(".menu").css("top"));
        $(window).scroll(function() {
            var position = $(window).scrollTop();
            $(".menu").stop().animate({"top":position+currentPosition+"px"},500);
        });
    });
</script>