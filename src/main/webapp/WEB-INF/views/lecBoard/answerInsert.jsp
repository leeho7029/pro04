<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<div class="has-background-white card-content shadow-down p-6" id="board2">
    <div class="col-12">
        <div class="card w-100">
            <div class="card-body">
                <div class="table-responsive project-list">
                                <table class="table project-table table-centered table-nowrap">
                                    <tbody>
                                    <tr>
                                        <input type="hidden" value="${detail.qno}" name="par" id="par">
                                        <input type="hidden" value="${detail.qno}" name="qno" id="qno">
                                        <input type="hidden" value="${detail.lcode}" name="lcode" id="lcode">
                                        <th class="text-center" style="vertical-align: middle; width: 15%;">제목</th>
                                        <td><input type="text" id="title" name="title" placeholder="제목을 입력하세요" class="pl-2" required autofocus></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" style="font-size: 15px;">
                                            <textarea name="content3" id="content3" cols="100" rows="8" maxlength="800" class="single-textarea" style="height: 400px; border: 1px solid #cbcbcb" placeholder="질문에 대한 답변을 입력하세요"></textarea>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="btn-group float-right mr-3">
                                    <a href="javascript:void(0);" onclick="ListPage()" class="btn btn-outline-dark">목록</a>
                                    <input type="submit" id="answerInsert" class="btn btn-dark" style="height: 100%"  value="등록">
                                </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>
    <script>
        $('#answerInsert').click(function (e) {
            e.preventDefault(); // 기본 클릭 이벤트 방지
            var title = document.getElementById("title").value;
            var content = document.getElementById("content3").value;
            var qno = document.getElementById("qno").value;
            var par = document.getElementById("par").value;
            var lcode = document.getElementById("lcode").value;

            // Ajax 요청 보내기
            $.ajax({
                type: 'POST',
                url: '${path}/lecBoard/answerInsert',
                data: {
                    title: title,
                    content: content,
                    lcode: lcode,
                    qno: qno,
                    par: par
                },
                success: function (data) {
                    // Ajax 요청이 성공했을 때 수행할 작업
                    // data 변수에 서버에서 반환한 데이터가 포함됩니다.
                    console.log("성공", data);
                    ListPage();
                    originalContent = $("#board").html();
                },
                error: function () {
                    // Ajax 요청이 실패했을 때 수행할 작업
                    console.log("에러다에러"+error.responseText)
                }
            });
        });
    </script>
<script>
    function ListPage(){
        var lcode = $("#lcode").val();
        $.ajax({
            type: "GET",  // GET 요청 또는 POST 요청을 선택할 수 있습니다.
            url: "${path}/lecBoard/list",  // 실제 API 엔드포인트로 변경해야 합니다.
            data: {
                lcode : lcode
            },
            success: function (data) {
                $("#board").html(data);
            },
            error: function (error) {
                console.log("에러다에러"+error.responseText)
            }
        });
    }
</script>



