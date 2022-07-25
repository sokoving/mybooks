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
    <h1> # modify page </h1>


    <form action="/book/modify" method="post" id="modify-form">
        <ul>
            <input type="hidden" value="${modibook.bookNo}" name="bookNo">

            <label>
                이미지 링크 : <input type="text" value="${modibook.bookImg}" name="bookImg">
            </label>

            <label>
                # 플랫폼 :
                <select name="platformId">
                    <option value="1">카카오 페이지</option>
                    <option value="2">네이버 시리즈</option>
                    <option value="3">리디북스</option>
                    <option value="4">문피아</option>
                    <option value="5">조아라</option>
                    <option value="6">기타</option>
                </select>
            </label>
            <br>
            <label>
                책 제목 : <input id="book-name-input" maxlength="50" type="text" value="${modibook.bookTitle}" name="bookTitle">
            </label>
            <br>
            <label>
                작가 : <input id="writer-input" maxlength="50" type="text" value="${modibook.writer}" name="writer">
            </label>
            <br>
            <label>
                별점 :
                <select name="starRate">
                    <option value="1">*</option>
                    <option value="2">**</option>
                    <option value="3">***</option>
                    <option value="4">****</option>
                    <option value="5">*****</option>
                </select>
            </label>
            <br>
            <label>
                현재 페이지 : <input type="text" maxlength="5" value="${modibook.curPage}" name="curPage">
            </label>
            <br>
            <label>
                총 페이지 : <input type="text" maxlength="5" value="${modibook.totalPage}" name="totalPage">
            </label>
            <br>
            <label>
                한줄평 <input type="text" maxlength="50" value="${modibook.bookComment}" name="bookComment">
            </label>
        </ul>
        <button id="reg-btn" type="button">
            수정완료
        </button>

    </form>

    <div class="modi-remo-list">
        <a href="/book/list/">목록</a>
    </div>




    <script>
        (function () {
            function validateFormValue() {

                const $bookNameInput = document.getElementById('book-name-input');
                const $writerInput = document.getElementById('writer-input');
                let flag = false;

                console.log('b: ', $bookNameInput.value);
                console.log('w: ', $writerInput.value);
                if ($bookNameInput.value.trim() === '') {
                    alert('제목은 필수값입니다');
                } else if ($writerInput.value.trim() === '') {
                    alert('작가는 필수값입니다');
                } else {
                    flag = true;
                }
                return flag;
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