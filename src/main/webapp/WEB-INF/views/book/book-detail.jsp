<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>
</head>

<style>
    @font-face {
        font-family: 'KOTRAHOPE';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }

    @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

    .notosanskr * {
        font-family: 'Noto Sans KR', sans-serif;
    }


    body {
        position: relative;
        background: #eee;
    }

    body a {
        text-decoration: none;
        color: #000;
        font-weight: bold;
    }

    .wrap {
        width: 50%;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, 0%);
        background: rgb(255, 255, 255);
    }

    .detail-page {
        margin-top: 100px;
        display: flex;
        flex-wrap: wrap;
    }

    .custom-img {
        width: 300px;
        height: 350px;
        flex-grow: 1;
        padding-left: 30px;
    }

    .detail-content {
        flex-grow: 1;
        width: 500px;
    }

    .detail-content li {
        line-height: 70px;
        font-weight: 700;
        font-size: 20px;
        font-family: 'Noto Sans KR';
    }

    .book-comment {
        width: 100%;
        font-weight: 700;
        font-size: 20px;
        font-family: 'Noto Sans KR';
    }



    .detail-btn {
        display: flex;
        width: 100%;
        justify-content: center;
        height: 50px;
        margin-top: 30px;
    }

    .detail-btn li {
        width: 150px;
    }

    .btn-yellow {
        background: #fdc324;
        color: #333 !important;
        border: 1px solid #fdc324 !important;
        width: 100px;
        height: 40px;
    }

    .btn-custom {
        font-weight: 700;
        font-size: 20px;
        font-family: 'Noto Sans KR';
    }

    .bookmarkHead {
        width: 50%;
        text-align: center;
        font-weight: 700;
        font-size: 40px;
        font-family: 'Noto Sans KR';

    }

    .bookmemoHead {
        width: 50%;
        text-align: center;
        font-weight: 700;
        font-size: 40px;
        font-family: 'Noto Sans KR';
    }

    .mkme-head {
        border-bottom: 1px solid #000;
    }

    .bookmark-custom {
        background: rgb(229, 229, 229, .5);
        height: 300px;
        /* margin-left: 3%; */
        border-right: 1px solid rgb(208, 208, 208);
        border-left: 1px solid rgb(208, 208, 208);
    }

    .bookmemo-custom {
        /* width: 50%; */
        background: rgb(229, 229, 229, .5);
        height: 300px;
        border-right: 1px solid rgb(208, 208, 208);
    }

    .bookmark-container {
        width: 50%;

    }

    .bookmemo-container {
        width: 50%;
    }

    .bookcomment-container {
        display: flex;
        /* margin-bottom: 1000px; */
    }

    #bookmarkPage-input {
        border: 1px solid rgb(207, 207, 207);
    }

    #bookmarkContent-input {
        border: 1px solid rgb(207, 207, 207);
    }

    #bookmark-insert-form {
        position: relative;
    }


    #bookmark-reg-btn {
        position: absolute;
        right: 20px;
        border: 1px solid rgba(000, 000, 000, 0);
        /* background: rgb(255, 255, 93); */
        border-radius: 20%;
    }

    #bookmemoContent-input {
        border: 1px solid rgb(207, 207, 207);
    }

    #bookmemo-insert-form {
        position: relative;
    }
    
    #bookmemo-reg-btn {
        position: absolute;
        right: 20px;
        bottom: -40px;
        border: 1px solid rgba(000, 000, 000, 0);
        /* background: rgb(255, 255, 93); */
        border-radius: 20%;
    }
    #bookmark-list {
        
    }
    .bookmark-list-wrap {
        position: relative;
        border: 1px solid rgb(180, 180, 180, .5);
        padding: 30px;
        height: 300px;
        margin-right: 25px;
        background: rgb(255, 249, 213);
    }
    .bookmark-btn-event {
        position: absolute;
        bottom: -150px;
        right: 10px;
        border: 1px solid rgba(000, 000, 000, 0.2);
        background: rgba(000, 000, 000, 000);
        color: #000;
    }

</style>



<body>
    <div class="wrap">


        <div class="detail-page">
            <div>
                <img src="${book.bookImg}" class="rounded mx-auto d-block custom-img" alt="책 표지">
            </div>

            <ul class="detail-content">
                <li>플랫폼: ${book.platformName} </li>
                <li>제목: ${book.bookTitle} (${book.theEnd})</li>
                <li>작가: ${book.writer}</li>
                <li>별점: ${book.starRate}</li>
                <li> ${book.curPage}/${book.totalPage}</li>
            </ul>

            <ul class="book-comment">
                <li>한줄평 : <br>
                    ${book.bookComment}
                </li>
            </ul>


            <ul class="modi-remo-list detail-btn">
                <li>
                    <a href="/book/modify?bookNo=${book.bookNo}" class="btn-atag">
                        <button type="button" class="btn btn-warning btn-yellow btn-custom">수정</button>
                    </a>
                </li>
                <li>
                    <a href="/book/delete?bookNo=${book.bookNo}" class="btn-atag">
                        <button type="button" class="btn btn-warning btn-yellow btn-custom">삭제</button>
                    </a>
                </li>
                <li>
                    <a href="/book/list" class="btn-atag">
                        <button type="button" class="btn btn-warning btn-yellow btn-custom">목록</button>
                    </a>
                </li>
            </ul>
        </div>

        <div class="d-flex mkme-head">
            <h1 class="bookmarkHead">북마크</h1>
            <h2 class="bookmemoHead">메모</h2>
        </div>
        <div class="bookcomment-container">
            <div class="bookmark-container">
                <!-- 북마크 등록 -->
                <ul class="bookmark-custom">
                    <li>
                        <form id="bookmark-insert-form" action="/book/bookmark-save" method="post">
                            <br>
                            <input type="hidden" name="bookNo" value="${book.bookNo}" readonly>
                            <label class="form-floating mb-3">
                                페이지  <input type="text" name="bookmarkPage" id="bookmarkPage-input" maxlength="5" size="3">
                                <!-- <input class="form-control" id="bookmarkPage-input floatingInput" maxlength="5" type="text" name="bookmarkPage"> -->
                                <!-- <label for="floatingInput">Page</label> -->
                            </label>
                            <br>
                            <label class="form-floating mb-3">
                                 <!-- <br><input type="text" id="bookmarkContent-input" name="bookmarkContent" size=""> -->
                                북마크 내용  <br><textarea name="bookmarkContent" id="bookmarkContent-input" cols="45" rows="5"></textarea>
                                <!-- <input class="form-control" type="text" id="bookmarkContent-input floatingInput" name="bookmarkContent"> -->
                                <!-- <label for="floatingInput">Content</label> -->
                            </label>
                            <br>
                            <button id="bookmark-reg-btn" type="button">등록</button>
                            <!-- <button class="btn btn-warning" id="bookmark-reg-btn" type="button"></button> -->
                        </form>
                    </li>
                </ul>


                <!-- 북마크 리스트 -->
                <ul>
                    <li id="bookmark-list">

                        <c:forEach var="mk" items="${bmkl}">
                            <div class="bookmark-list-wrap">
                                <label>
                                    <input type="hidden" name="bookNo" value="${mk.bookNo}" readonly>
                                </label>
                                <label>
                                    <!--  <input type="text" name="bookmarkNo" value="${mk.bookmarkNo}" readonly> -->
                                    북마크 번호 <span name="bookmarkNo">${mk.bookmarkNo}</span>
                                </label>
                                <label>
                                    <!-- <input maxlength="5" type="text" name="bookmarkPage" value="${mk.bookmarkPage}"> -->
                                    페이지 <span name="bookmarkPage">${mk.bookmarkPage}</span>
                                    <br>
                                </label>
                                <label>
                                    <!-- <input type="text" name="bookmarkContent" value="${mk.bookmarkContent}"> -->
                                    내용 <br><span name="bookmarkContent">${mk.bookmarkContent}</span>
                                </label>
                                <label>
                                    <input type="hidden" name="regDate" value="${mk.regDate}" readonly>
                                </label>
                                <button type="button" class="btn btn-primary bookmark-btn-event" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">
                                    수정
                                </button>
                            </div>
                        </c:forEach>
                    </li>
                </ul>


            </div>






            <!-- 메모 등록 -->
            <div class="bookmeme-container">
                <ul class="bookmemo-custom">
                    <li>
                        <form id="bookmemo-insert-form" action="/book/bookmemo-save" method="post">
                            <br><br><br>
                            <input type="hidden" name="bookNo" value="${book.bookNo}" readonly>
                            <label>
                                메모 <br>
                                <!-- <input type="text" id="bookmemoContent-input" name="bookMemoContent"> -->
                                <textarea name="bookMemoContent" id="bookmemoContent-input" cols="50" rows="5"></textarea>
                            </label>
                            <button id="bookmemo-reg-btn" type="button">등록</button>
                        </form>
                    </li>
                </ul>

                <!-- 메모 리스트 -->
                <ul>
                    <li id="memo-list">
                        <c:forEach var="ml" items="${bmml}">
                            <div>
                                <label>
                                    <input type="hidden" name="bookNo" value="${ml.bookNo}" readonly>
                                </label>
                                <label>
                                    <!-- <input type="text" name="bookMemoNo" value="${ml.bookMemoNo}" readonly> -->
                                    No : <span name="bookMemoNo">${ml.bookMemoNo}</span>
                                    <br>
                                </label>
                                <label>
                                    <!-- <input type="text" name="bookMemoContent" value="${ml.bookMemoContent}"> -->
                                    Content : <span name="bookMemoContent">${ml.bookMemoContent}</span>
                                    <br>
                                </label>
                                <label>
                                    <input type="hidden" name="regDate" value="${ml.regDate}" disabled>
                                </label>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#memo">
                                    수정
                                </button>
                            </div>
                        </c:forEach>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <!-- Button trigger modal -->
    <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Launch demo modal
    </button> -->

    <!-- bookmark Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="bookmark-form">
                    <form id="bookmark-modify-form" action="/book/bookmark-modify" method="post">
                        <label>
                            <input type="hidden" name="bookNo" readonly>
                        </label>
                        <label>
                            북마크 번호 : <input type="text" maxlength="5" name="bookmarkNo" readonly>
                        </label>
                        <label>
                            페이지 : <input id="bookmarkPage-modify" type="text" maxlength="5"
                                name="bookmarkPage">
                        </label>
                        <label>
                            내용 : <input id="bookmarkContent-modify" type="text" name="bookmarkContent">
                        </label>
                        <br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="bookmark-modify-btn" type="button" class="btn btn-primary">수정</button>
                    </form>
                    <form action="/book/bookmark-delete" method="post">
                        <input id="bookmarkDelete" type="hidden" name="bookmarkNo" readonly>
                        <button type="submit" class="btn btn-primary">삭제</button>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <!-- memo modal -->
    <div class="modal fade" id="memo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="bookmemo-form">
                    <form id="bookmemo-modify-form" action="/book/bookmemo-modify" method="post">
                        <label>
                            <input type="hidden" name="bookNo" readonly>
                        </label>
                        <label>
                            bookMemoNo : <input type="text" maxlength="5" name="bookMemoNo" readonly>
                        </label>
                        <label>
                            bookMemoContent : <input id="bookmemoContent-modify" type="text" name="bookMemoContent">
                        </label>
                        <br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="bookmemo-modify-btn" type="button" class="btn btn-primary">수정</button>
                    </form>
                    <form action="/book/bookmemo-delete" method="post">
                        <input id="bookmemoDelete" type="hidden" name="bookmemoNo" readonly>
                        <button type="submit" class="btn btn-primary">삭제</button>
                    </form>
                </div>
            </div>
        </div>
    </div>





    <script>
        // 북마크 수정
        const $bmList = document.querySelector('#bookmark-list');
        const $bform = document.querySelector('#bookmark-form');
        const [$bfBookNo, $bfBookmarkNo, $bfBookmarkPage, $bfBookConstent, $bfBookmarkButton] = [...$bform
            .firstElementChild.children
        ];

        $bmList.onclick = e => {
            console.log(e.target);
            const [$bmBookNo, $bmBookmarkNo, $bmBookmarkPage, $bmBookmarkContent,
                $bookmarkButton
            ] = [...e.target.parentElement.children]
            console.log($bmBookNo.firstElementChild);
            console.log($bmBookmarkNo.firstElementChild);
            console.log($bmBookmarkPage.firstElementChild);
            console.log($bmBookmarkContent.firstElementChild);

            $bfBookNo.firstElementChild.value = $bmBookNo.firstElementChild.value;
            $bfBookmarkNo.firstElementChild.value = $bmBookmarkNo.firstElementChild.textContent;
            $bfBookmarkPage.firstElementChild.value = $bmBookmarkPage.firstElementChild.textContent;
            $bfBookConstent.firstElementChild.value = $bmBookmarkContent.firstElementChild.textContent;

            console.log($bfBookNo.firstElementChild.value);
            console.log($bfBookmarkNo.firstElementChild.value);
            console.log($bfBookmarkPage.firstElementChild.value);
            console.log($bfBookConstent.firstElementChild.value);
            const $bmDelete = document.querySelector('#bookmarkDelete');
            $bmDelete.value = $bmBookmarkNo.firstElementChild.textContent;
        }

        // 메모 수정
        const $mmList = document.querySelector('#memo-list');
        const $mmform = document.querySelector('#bookmemo-form');
        const [$mmfBookNo, $mmfBookMemoNo, $mmfBookConstent, $mmfBookmarkButton] = [...$mmform
            .firstElementChild.children
        ];

        $mmList.onclick = e => {
            console.log(e.target);
            const [$mmBookNo, $mmBookmemoNo, $mmBookmemoContent] = [...e.target.parentElement.children];


            // console.log($mmfBookNo.firstElementChild);
            // console.log($mmfBookMemoNo.firstElementChild);
            // console.log($mmfBookConstent.firstElementChild);
            console.log($mmBookNo.firstElementChild.value);
            console.log($mmBookmemoNo);
            console.log($mmBookmemoContent.firstElementChild);
            $mmfBookNo.firstElementChild.value = $mmBookNo.firstElementChild.value;
            $mmfBookMemoNo.firstElementChild.value = $mmBookmemoNo.firstElementChild.textContent;
            $mmfBookConstent.firstElementChild.value = $mmBookmemoContent.firstElementChild.textContent;


            const $mmDelte = document.querySelector('#bookmemoDelete');
            $mmDelte.value = $mmBookmemoNo.firstElementChild.textContent;
        }

        // 북마크 등록 필수값 확인
        function validateFormValueBookMark() {
            const $bookmarkPageInput = document.getElementById('bookmarkPage-input');
            const $bookmarkContentInput = document.getElementById('bookmarkContent-input');
            let flag = false;

            if ($bookmarkPageInput.value.trim() === '') {
                alert('페이지는 필수값입니다');
            } else if ($bookmarkContentInput.value.trim() === '') {
                alert('북마크 내용은 필수값입니다');
            } else {
                flag = true;
            }
            return flag;
        }

        const $bookmarkRegBtn = document.getElementById('bookmark-reg-btn');

        $bookmarkRegBtn.onclick = e => {
            // 입력값을 제대로 채우지 않았는지 확인
            if (!validateFormValueBookMark()) {
                return;
            }
            // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
            const $bookmarkInsertForm = document.getElementById('bookmark-insert-form');
            $bookmarkInsertForm.submit();
        };


        // 북마크 수정 필수값 확인
        function validateFormValueBookMarkModify() {
            const $bookmarkPageModify = document.getElementById('bookmarkPage-modify');
            const $bookmarkContentModify = document.getElementById('bookmarkContent-modify');
            let flag = false;

            if ($bookmarkPageModify.value.trim() === '') {
                alert('페이지는 필수값입니다');
            } else if ($bookmarkContentModify.value.trim() === '') {
                alert('북마크 내용은 필수값입니다');
            } else {
                flag = true;
            }
            return flag;
        }

        const $bookmarkModifyBtn = document.getElementById('bookmark-modify-btn');

        $bookmarkModifyBtn.onclick = e => {
            // 입력값을 제대로 채우지 않았는지 확인
            if (!validateFormValueBookMarkModify()) {
                return;
            }
            // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
            const $bookmarkModifyForm = document.getElementById('bookmark-modify-form');
            $bookmarkModifyForm.submit();
        };



        // 메모 등록 필수값 확인
        function validateFormValueMemo() {
            const $bookmemoContentInput = document.getElementById('bookmemoContent-input');
            let flag = false;

            if ($bookmemoContentInput.value.trim() === '') {
                alert('메모 내용은 필수값입니다');
            } else {
                flag = true;
            }
            console.log(flag);
            return flag;
        }

        const $bookmemoRegBtn = document.getElementById('bookmemo-reg-btn');

        $bookmemoRegBtn.onclick = e => {
            // 입력값을 제대로 채우지 않았는지 확인
            if (!validateFormValueMemo()) {
                console.log("리턴되라ㅏㅏㅏ");
                return;
            }
            // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
            const $bookMemoInsertForm = document.getElementById('bookmemo-insert-form');
            $bookMemoInsertForm.submit();
        };


        // 메모 수정 필수값 확인
        function validateFormValueMemoModify() {
            const $bookmemoContentModify = document.getElementById('bookmemoContent-modify');
            let flag = false;

            if ($bookmemoContentModify.value.trim() === '') {
                alert('메모 내용은 필수값입니다');
            } else {
                flag = true;
            }
            console.log(flag);
            return flag;
        }

        const $bookmemoModifyBtn = document.getElementById('bookmemo-modify-btn');

        $bookmemoModifyBtn.onclick = e => {
            // 입력값을 제대로 채우지 않았는지 확인
            if (!validateFormValueMemoModify()) {
                console.log("리턴되라ㅏㅏㅏ");
                return;
            }
            // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
            const $bookMemoModifyForm = document.getElementById('bookmemo-modify-form');
            $bookMemoModifyForm.submit();
        };
    </script>






</body>

</html>