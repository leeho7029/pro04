<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<style>
    @keyframes click-wave{0%{height: 40px;width: 40px;opacity: 0.15;position: relative}100%{height: 200px;width: 200px;margin-left: -80px;margin-top: -80px;opacity: 0}}
    .option-input{-webkit-appearance: none;-moz-appearance: none;-ms-appearance: none;-o-appearance: none;appearance: none;position: relative;top: 10.3px;right: 0;bottom: 0;left: 0;height: 30px;width: 30px;transition: all 0.15s ease-out 0s;background: #CBD1D8;border: none;color: #fff;cursor: pointer;display: inline-block;margin-right: 0.5rem;outline: none;position: relative;z-index: 999}
    .option-input:hover{background: #9FAAB7}
    .option-input:checked{background: #3D3D3D}
    .option-input:checked::before{height: 30px;width: 30px;position: absolute;content: "\f111";font-family: "Font Awesome 5 Free";display: inline-block;font-size: 16.7px;text-align: center;line-height: 30px}
    .option-input:checked::after{-webkit-animation: click-wave 0.25s;-moz-animation: click-wave 0.25s;animation: click-wave 0.25s;background: #3D3D3D;content: '';display: block;position: relative;z-index: 100}
    .option-input.radio{border-radius: 50%}
    .option-input.radio::after{border-radius: 50%}
    .line-text span{background: #fff;padding: 0 10px;color: #212529}
    .user-images img{margin-left: -5px}
    .todo-shadow {box-shadow: 4px 4px 12px;}
    .input {width: 94%; height: 40px; border-top: none; border-left: none; border-right: none; border-bottom: 3px solid #3D3D3D;}
    .input:focus {outline: none;}
</style>
<!-- TodoList 영역 -->
<section class="todo-area bg-gray">
    <div class="d-flex justify-content-between row bg-white">
        <div class="col-md-12 col-md-6 todo-shadow pt-3 pb-3">
            <div class="bg-white notes">
                <div class="flex-row align-items-center notes-title p-3">
                    <h4>TodoList<i class="fa-solid fa-feather"></i></h4>
                </div>
                <div class="form-group d-flex p-3 mb-0">
                    <input type="text" id="tdtitle" name="tdtitle" class="input" placeholder="내용을 입력하세요.">
                    <button id="insert" type="button" class="btn" style="border: none; background: none;"><i class="fa-solid fa-square-plus fa-2xl"></i></button>
                </div>
            </div>
            <div class="p-3 bg-white2 pb-4" id="todoInsert">
                <c:forEach var="list" items="${todoList}" varStatus="status">
                    <div class="align-items-center d-flex justify-content-between" id="complete">
                        <input type="hidden" id="tdno${list.tdno }" name="tdno" value="${list.tdno}">
                        <input type="hidden" id="status" name="status" value="${list.status}">
                        <c:if test="${list.status eq 0}">
                            <label><input type="checkbox" class="option-input radio" id="edit${list.tdno }" onclick="updateState(${list.tdno })"><span class="label-text" id="label">${list.tdtitle}</span></label>
                        </c:if>
                        <c:if test="${list.status eq 1}">
                            <label><input type="checkbox" class="option-input radio" id="edit${list.tdno }" onclick="updateState(${list.tdno })" checked><span class="label-text" style="text-decoration-line: line-through;">${list.tdtitle}</span></label>
                        </c:if>
                        <button class="deleteBtn btn" type="button" style="border: none; background: none;" value="${list.tdno}"><i class="fa-solid fa-trash-can fa-xl"></i></button>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<script>
$(document).ready(function(){
    <!--insert ajax-->
    $("#insert").on('click', function(){
        var test = {"tdtitle":$("#tdtitle").val()}
        var txt = "";
        $.ajax({
            type: "post",
            url : "${path}/todo/insert",
            data : JSON.stringify(test),
            dataType : "json",
            contentType : "application/json",
            success : function (res){
                for (let i in res) {
                    if (res[i].status == 0) {
                        txt = txt + "<div class='align-items-center d-flex justify-content-between' id='complete'><input type='hidden' id='tdno"+res[i].tdno+"' name='tdno' value='"+res[i].tdno+"'><input type='hidden' id='status' name='status' value='"+res[i].status+"'><label><input type='checkbox' class='option-input radio' id='edit"+res[i].tdno+"' onclick='updateState("+res[i].tdno+")'><span class='label-text' id='label'>"+res[i].tdtitle+"</span></label><button class='deleteBtn btn' type='button' style='border: none; background: none;' value='"+res[i].tdno+"'><i class='fa-solid fa-trash-can fa-xl'></i></button></div>"
                    } else {
                        txt = txt + "<div class='align-items-center d-flex justify-content-between' id='complete'><input type='hidden' id='tdno"+res[i].tdno+"' name='tdno' value='"+res[i].tdno+"'><input type='hidden' id='status' name='status' value='"+res[i].status+"'><label><input type='checkbox' class='option-input radio' id='edit"+res[i].tdno+"' onclick='updateState("+res[i].tdno+")' checked><span class='label-text' style='text-decoration-line: line-through;'>"+res[i].tdtitle+"</span></label><button class='deleteBtn btn' type='button' style='border: none; background: none;' value='"+res[i].tdno+"'><i class='fa-solid fa-trash-can fa-xl'></i></button></div>"
                    }
                }
                $("#todoInsert").html(txt);
                $("#tdtitle").val("");
            },
            error: function(err){
                console.log("실패", err)
            }
        });
    });
});
</script>
<!--delete ajax-->
<script>
    $(document).on('click', '.deleteBtn', function(){
        var txt = "";
        $.ajax({
            type: "post",
            url : "${path}/todo/delete",
            data : {"tdno": $(this).attr("value")},
            dataType: "json",
            success : function (res){
                console.log("성공", res);
                for (let i in res) {
                    if (res[i].status == 0) {
                        txt = txt + "<div class='align-items-center d-flex justify-content-between' id='complete'><input type='hidden' id='tdno"+res[i].tdno+"' name='tdno' value='"+res[i].tdno+"'><input type='hidden' id='status' name='status' value='"+res[i].status+"'><label><input type='checkbox' class='option-input radio' id='edit"+res[i].tdno+"' onclick='updateState("+res[i].tdno+")'><span class='label-text' id='label'>"+res[i].tdtitle+"</span></label><button class='deleteBtn btn' type='button' style='border: none; background: none;' value='"+res[i].tdno+"'><i class='fa-solid fa-trash-can fa-xl'></i></button></div>"
                    } else {
                        txt = txt + "<div class='align-items-center d-flex justify-content-between' id='complete'><input type='hidden' id='tdno"+res[i].tdno+"' name='tdno' value='"+res[i].tdno+"'><input type='hidden' id='status' name='status' value='"+res[i].status+"'><label><input type='checkbox' class='option-input radio' id='edit"+res[i].tdno+"' onclick='updateState("+res[i].tdno+")' checked><span class='label-text' style='text-decoration-line: line-through;'>"+res[i].tdtitle+"</span></label><button class='deleteBtn btn' type='button' style='border: none; background: none;' value='"+res[i].tdno+"'><i class='fa-solid fa-trash-can fa-xl'></i></button></div>"
                    }
                }
                $("#todoInsert").html(txt);
                $("#tdtitle").val("");
            },
            error: function(err){
                console.log("실패", err)
            }
        });
    });
</script>
<!-- update ajax -->
<script>
    function updateState(num) {
        var tdno = parseInt($("#tdno" + num).val());
        var test = { "tdno": tdno}
        $.ajax({
            type: "post",
            url : "${path}/todo/edit",
            data : test,
            success : function (res){
                if (res.status == 0) {
                    $("#edit" + num).next().css("text-decoration-line", "none");
                } else {
                    $("#edit" + num).next().css("text-decoration-line", "line-through");
                }
            },
            error: function(err){
                console.log("실패", err)
            }
        })
    }
</script>