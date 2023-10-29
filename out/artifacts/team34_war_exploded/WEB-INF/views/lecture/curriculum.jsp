
<div class="content">
    <ul class="course_list">
        <c:forEach var="curr" items="${curriculumList}">
            <li class="justify-content-between d-flex">
                <p class="pt-3"> ${curr.cname}
                    <c:if test="${fn:contains(studyInfoList, curr.ccode)}">
                        <span class="badge badge-pill badge-warning ml-2"> 수강 완료 </span>
                    </c:if>
                </p>

                <c:if test="${lecture.state eq 'on' and (empty sid or isReg)}">
                    <button class="btn disable-primary-btn text-uppercase" disabled> 강의 듣기 </button>
                </c:if>
                <c:if test="${(lecture.state eq 'on') and (not empty sid) and (not isReg)}">
                    <button onclick="openLecture(${curr.ccode}, '${curr.lcode}')"
                            class="btn primary-btn text-uppercase"> 강의 듣기 </button>
                </c:if>
            </li>
        </c:forEach>
        <c:if test="${empty curriculumList}">
            <p class="text-center"> 등록된 커리큘럼이 없습니다. </p>
        </c:if>
    </ul>

    <!-- pagination -->
    <nav aria-label="Page navigation example" class="mt-25 mb-30">
        <ul class="pagination justify-content-center">
            <c:if test="${curPage > 5}">
                <li class="page-item">
                    <a class="page-link" href="${path}/lecture/detail?page=${page.blockStartNum - 1}" aria-label="Previous">
                        <span aria-hidden="true"><<</span>
                    </a>
                </li>
            </c:if>
            <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                <c:choose>
                    <c:when test="${i == curPage}">
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="${path}/lecture/detail?page=${i}">${i}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="${path}/lecture/detail?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${page.blockLastNum < page.totalPageCount}">
                <li class="page-item">
                    <a class="page-link" href="${path}/lecture/detail?page=${page.blockLastNum + 1}" aria-label="Next">
                        <span aria-hidden="true">>></span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>