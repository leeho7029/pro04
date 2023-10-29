<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
    /* 리뷰 작성 시 별점 CSS */
    .my-star {
        display: inline-block;
        width: 30px;
        height: 30px;
        color: transparent;
        text-shadow: 0 0 0 #f0f0f0;
        font-size: 1.8em;
        box-sizing: border-box;
        cursor: pointer;
    }

    .my-star:hover {
        text-shadow: 0 0 0 #ccc;
    }

    .my-star.on {
        text-shadow: 0 0 0 #ffbc00;
    }
</style>

<div class="content mt-3 mb-100 pb-3">
    <div class="review-top row pt-40">
        <div class="col-lg-12">
            <div class="d-flex flex-row reviews justify-content-between">
                <span> 강의 총점 </span>
                <div class="star">
                    <c:forEach begin="1" end="${starAvg}">
                        <i class="fa-solid fa-star" style="color: #FFDD85;"></i>
                    </c:forEach>
                    <c:forEach begin="1" end="${5 - starAvg}">
                        <i class="fa-regular fa-star" style="color: #FFDD85;"></i>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <c:if test="${(not empty sid) and (not isReg)}">
        <div class="mt-2">
            <h6> Your Feedback </h6>
            <div class="star-wrap">
                <span class="my-star on" value="1">⭐</span>
                <span class="my-star" value="2">⭐</span>
                <span class="my-star" value="3">⭐</span>
                <span class="my-star" value="4">⭐</span>
                <span class="my-star" value="5">⭐</span>
                <input type="hidden" id="star2" name="star" value="1">
            </div>
            <div class="row">
                <div class="col-lg-10 col-md-12">
                    <textarea name="content" id="content3" class="form-control" cols="10" rows="3" maxlength="900"></textarea>
                    <input type="hidden" name="lcode" id="lcode3" value="${lecture.lcode}">
                </div>
                <div class="col">
                    <button type="submit" class="btn btn-dark w-100 h-100" onclick="insertReview()"> 등록하기</button>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${not empty reviewList}">
        <div class="form-group mt-3 p-1">
            <select name="type" id="type" class="form-control">
                <option value="new" selected> 최신 순</option>
                <option value="desc"> 별점 높은 순</option>
                <option value="asc"> 별점 낮은 순</option>
            </select>
        </div>
    </c:if>
    <c:if test="${empty reviewList}">
        <div class="container-fluid mt-5 text-center">
            <p> 등록된 리뷰가 없습니다. </p>
        </div>
    </c:if>
    <div class="comments-area mb-30">
        <c:forEach var="review" items="${reviewList}">
            <c:set var="random" value="<%= (int) (java.lang.Math.random() * 4) + 1 %>"/>
            <div class="comment-list">
                <div class="single-comment single-reviews justify-content-between d-flex">
                    <div class="user justify-content-between d-flex">
                        <div class="desc">
                            <h5>${review.id}
                                <div class="star">
                                    <c:forEach begin="1" end="${review.star}">
                                        <i class="fa-solid fa-star" style="color: #FFDD85;"></i>
                                    </c:forEach>
                                    <c:forEach begin="1" end="${5 - review.star}">
                                        <i class="fa-regular fa-star" style="color: #FFDD85;"></i>
                                    </c:forEach>
                                </div>
                            </h5>
                            <p class="comment">
                                    ${review.content}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script>
    $(document).ready(() => {
        // Ajax를 사용하여 리뷰 목록 정렬
        $(document).on("change", "#type", () => {
            let data = {"type": $("#type").val(), "lcode": "${lecture.lcode}"};
            $.ajax({
                url: "${path}/lecture/changeReview",
                data: data,
                type: "post",
                dataType: "json",
                success: function (result) {
                    $(".comments-area .comment-list").remove();
                    for (let idx in result) {
                        let random = parseInt(Math.random() * 4) + 1;
                        let star = result[idx].star;
                        let tag = '<div class="comment-list"><div class="single-comment single-reviews justify-content-between d-flex"><div class="user justify-content-between d-flex">' +
                            '<div class="desc"><h5>' + result[idx].id + '<div class="star">';
                        for (let idx = 0; idx < star; idx++) {
                            tag += '<i class="fa-solid fa-star ml-1" style="color: #FFDD85;"></i>';
                        }
                        for (let idx = 0; idx < (5 - star); idx++) {
                            tag += '<i class="fa-regular fa-star ml-1" style="color: #FFDD85;"></i>';
                        }
                        tag += '</div></h5><p class="comment">' + result[idx].content + '</p></div></div></div></div>';

                        $(".comments-area").append(tag);
                    }
                },
                error: function (err) {
                    console.log(err);
                }
            })
        });

        // 리뷰 별점 작성
        $(".my-star").click(function () {
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
            $("#star2").attr("value", $(this).attr("value"));
            return false;
        });
    });
</script>

<script>
    function insertReview() {
        // 사용자 입력을 가져옵니다.
        var content = $("#content3").val();
        var star = $("#star2").val();
        var lcode = $("#lcode3").val();

        $.ajax({
            url: "${path}/lecture/reviewInsert", // URL을 고정 경로로 지정
            type: "POST",
            data: {
                lcode: lcode,
                star: star,
                content: content
            },
            success: function (data) {
                console.log("성공");
                reviewPage();
                // 성공적으로 요청을 처리한 후 할 작업을 여기에 추가하세요.

                // $("#intro").addClass("show active");
                // $("#board").removeClass("show active");
                // $("#intro-tab").addClass("active");
                // $("#board-tab").removeClass("active");
            },
            error: function (error) {
                console.log("에러다에러", error.responseText);
            }
        });
    }
</script>
<script>
    function reviewPage() {
        var lcode = $("#lcode3").val();
        $.ajax({
            type: "GET",  // GET 요청 또는 POST 요청을 선택할 수 있습니다.
            url: "${path}/lecture/review",  // 실제 API 엔드포인트로 변경해야 합니다.
            data: {
                lcode: lcode
            },
            success: function (data) {
                $("#stars").html(data);
            },
            error: function (error) {
                console.log("에러다에러" + error.responseText)
            }
        });
    }
</script>