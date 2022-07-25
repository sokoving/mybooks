<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>


<body>
    <h1> book-save.jsp </h1>

    <form action="/book/write" method="post" id="write-form">
        # 플랫폼 :
        <select name="platformId">
            <option value="1">카카오 페이지</option>
            <option value="2">네이버 시리즈</option>
            <option value="3">리디북스</option>
            <option value="4">문피아</option>
            <option value="5">조아라</option>
            <option value="6">미분류</option>
        </select>
        <br>
        # 이미지 링크 : <input type="text" name="bookImg">
        <br>
        # 책 제목 : <input id="book-name-input" maxlength="50" type="text" name="bookTitle">
        <br>
        # 작가 : <input id="writer-input" maxlength="50" type="text" name="writer">
        <br>
        # 현재 회차 : <input id="cur-page" maxlength="5" type="number" name="curPage">
        <br>
        # 총 회차 : <input id="total-page" maxlength="5" type="number" name="totalPage">
        <br>
        # 연재중 <input type="radio" name="theEnd" value="1" checked>
        완결 <input type="radio" name="theEnd" value="0">
        <br>
        # 별점 : 
        <select name="starRate">
            <option value="1">*</option>
            <option value="2">**</option>
            <option value="3">***</option>
            <option value="4">****</option>
            <option value="5">*****</option>
        </select>
        <br>
        # 한줄평
        <textarea id="book-comment" name="bookComment" maxlength="50" cols="30" rows="2"></textarea>
        <br>
        <button id="reg-btn" type="button">등록</button>

    </form>

    <a href="/book/list">목록</a>





    <script>
        (function () {
            function validateFormValue() {

                const $bookNameInput = document.getElementById('book-name-input');
                const $writerInput = document.getElementById('writer-input');
                let flag = false;

                const $curPage = document.getElementById('cur-page');
                const $totalPage = document.getElementById('total-page');

                console.log('b: ', $bookNameInput.value);
                console.log('w: ', $writerInput.value);
                if ($bookNameInput.value.trim() === '') {
                    alert('제목은 필수값입니다');
                } else if ($writerInput.value.trim() === '') {
                    alert('작가는 필수값입니다');
                } else {
                    flag = true;
                }

                if($curPage.value.trim() === '') {
                    $curPage.value = 0;
                }
                if($totalPage.value.trim() === '') {
                    $totalPage.value = 0;
                }

                return flag;
            }

//             function checkStringCnt() {

//                 let flag = false;

//                 const $bookNameInput = document.getElementById('book-name-input');
//                 const $writerinput = document.getElementById('writer-input');
//                 const $curPage = document.getElementById('cur-page');
//                 const $totalPage = document.getElementById('total-page');
//                 const $bookComment = document.getElementById('book-comment');

                
// while(true){
//                 if ($bookNameInput.value.lenght > 50) {
//                     alert("제목은 50글자 이하로 입력해주세요");
                
//                 } else {
//                     flag = true;
//                 }
//             }
//                 return flag;
//             }

            // 게시물 입력값 검증
            const $regBtn = document.getElementById('reg-btn');

            $regBtn.onclick = e => {
                // 입력값을 제대로 채우지 않았는지 확인
                if (!validateFormValue()) {
                    return;
                }
                // if (!checkStringCnt()) {
                //     return;
                // }

                // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
                const $form = document.getElementById('write-form');
                $form.submit();
            };
        })();
    </script>

</body>

</html>