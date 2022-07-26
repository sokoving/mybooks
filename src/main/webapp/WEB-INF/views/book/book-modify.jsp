<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
        <!-- reset css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

        <!-- linear icons -->
        <!-- https://linearicons.com/free#cdn -->
        <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
        <!-- fontawesome css: https://fontawesome.com -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    
        <!-- naver font -->
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    
        <!-- custom css -->
        <link rel="stylesheet" href="/css/bookmodi.css">
        <!-- bootstrap css -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
        <!-- custom js -->
        <!-- <script src="/js/config.js" defer></script> -->
        <!-- bootstrap js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>
    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    

    
</head>


<body>
    <div class="page" style="margin: 50px;">
        <div id="wrapper">

            <h1>수정 페이지</h1>

            <form action="/book/modify" method="post" id="modify-form">
                

                <div class="modi-table">
                    <input type="hidden" value="${modibook.bookNo}" name="bookNo">

                    
                    <!-- <label> -->
                        <div class="left">
                            <h3>이미지 링크</h3>
                        </div>
                        <div class="right">
                            <input type="text" value="${modibook.bookImg}" name="bookImg">
                        </div>
                        
                    <!-- </label> -->

                    <!-- <label> -->
                        <div class="left">
                            <h3>플랫폼</h3>
                        </div>
                        
                        <div class="right">
                            <select name="platformId" class="form-select" aria-label="Default select example">
                                <option disabled>플랫폼을 선택해주세요</option>
                                <option value="1" <c:if test="${modibook.platformId eq 1}">selected="selected"</c:if>>카카오 페이지</option>
                                <option value="2" <c:if test="${modibook.platformId eq 2}">selected="selected"</c:if>>네이버 시리즈</option>
                                <option value="3" <c:if test="${modibook.platformId eq 3}">selected="selected"</c:if>>리디북스</option>
                                <option value="4" <c:if test="${modibook.platformId eq 4}">selected="selected"</c:if>>문피아</option>
                                <option value="5" <c:if test="${modibook.platformId eq 5}">selected="selected"</c:if>>조아라</option>
                                <option value="6" <c:if test="${modibook.platformId eq 6}">selected="selected"</c:if>>미분류</option>
                            </select>
                        </div>
                        
                    <!-- </label> -->
                    <!-- <label> -->
                        <div class="left">
                            <h3>책 제목</h3>
                        </div>
                        <div class="right">
                            <input id="book-name-input" maxlength="50" type="text" value="${modibook.bookTitle}" name="bookTitle">
                        </div>
                        
                        <div class="left">
                            <h3>작가</h3>
                        </div>
                        <div class="right">
                            <input id="writer-input" maxlength="50" type="text" value="${modibook.writer}" name="writer">
                        </div>
                        
                        <div class="left">
                            <h3>별점</h3>
                        </div>
                        <div class="right">
                            <select name="starRate" class="form-select" aria-label="Default select example">
                                <option disabled>별점을 선택해주세요</option>
                                <option value="1" <c:if test="${modibook.starRate eq 1}">selected="selected"</c:if>> ★☆☆☆☆</option>
                                <option value="2" <c:if test="${modibook.starRate eq 2}">selected="selected"</c:if>>★★☆☆☆</option>
                                <option value="3" <c:if test="${modibook.starRate eq 3}">selected="selected"</c:if>>★★★☆☆</option>
                                <option value="4" <c:if test="${modibook.starRate eq 4}">selected="selected"</c:if>>★★★★☆</option>
                                <option value="5" <c:if test="${modibook.starRate eq 5}">selected="selected"</c:if>>★★★★★</option>
                            </select>
                        </div>
                        
                        <div class="left">
                            <h3>현재 페이지</h3>
                        </div>
                        <div class="right">
                            <input type="number" id="curPage" maxlength="5" value="${modibook.curPage}" name="curPage">
                        </div>

                        <div class="left">
                            <h3>총 페이지</h3>
                        </div>
                        <div class="right">
                            <input type="number" id="totalPage" maxlength="5" value="${modibook.totalPage}" name="totalPage">
                        </div>
                        
                    <!-- </label> -->
                    <!-- <br> -->
                        <div class="theend">
                            <div class="left" >
                                <h3>연재중</h3>
                            </div>
                            <div class="right" id="half">
                                <input type="radio" name="theEnd" value="1" <c:if test="${modibook.theEnd eq 1}">checked="checked"</c:if>>
                            </div>
                            <div class="left" id="border">
                                <h3>완결</h3>
                            </div>
                            <div class="right" id="half">
                                <input type="radio" name="theEnd" value="0" <c:if test="${modibook.theEnd eq 0}">checked="checked"</c:if>>
                            </div>
                        </div>
                    <!-- <label> -->
                        <div class="left">
                            <h3>한줄평</h3>
                        </div>
                        <div class="right" id="comment">
                            <input type="text" maxlength="50" value="${modibook.bookComment}" name="bookComment">
                        </div>
                        
                    <!-- </label> -->
                </div>


                <div id="regBtn" style="padding: 10px;">
                    <button type="button" id="reg-btn" class="btn btn-outline-danger" style="float: right;">수정완료</button>
                </div>

            </form>
            <button type="button" id="list-btn" class="btn btn-secondary btn-sm" onclick="location.href='/book/list/'">이전으로</button>
        </div>


        
    </div>




    <script>
        (function () {
            function validateFormValue() {

                const $bookNameInput = document.getElementById('book-name-input');
                const $writerInput = document.getElementById('writer-input');

                const $curPage = document.getElementById('curPage');
                const $totalPage = document.getElementById('totalPage');

                let flag = false;

                console.log('b: ', $bookNameInput.value);
                console.log('w: ', $writerInput.value);
                if ($bookNameInput.value.trim() === '') {
                    alert('제목은 필수값입니다');
                    return false;
                } else if ($writerInput.value.trim() === '') {
                    alert('작가는 필수값입니다');
                    return false;
                } 

                // page값 확인

                if($curPage.value.trim() === '') {
                    $curPage.value = 0;
                } else if($curPage.value < 0 ) {
                    alert('현재 페이지 값을 확인해주세요.');
                    return false;
                } 

                if($totalPage.value.trim() === '') {
                    $totalPage.value = 0;
                    return false;
                } else if($totalPage.value < 0){
                    alert('총 페이지 값(음수)을 다시 한번 확인해주세요.');
                    return false;
                } 
                

                if(+$totalPage.value < +$curPage.value){
                    console.log($totalPage.value);
                    console.log($curPage.value);
                    alert('총 페이지 값(작음)을 다시 한번 확인해주세요.');
                    return false;
                } 

                return true;


            }

            // 게시물 입력값 검증
            const $regBtn = document.getElementById('reg-btn');

            $regBtn.onclick = e => {
                // 입력값을 제대로 채우지 않았는지 확인
                if (!validateFormValue()) {
                    return;
                }

                // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
                const $form = document.getElementById('modify-form');
                $form.submit();
            };


        })();
    </script>




</body>

</html>