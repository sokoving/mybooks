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
    <link rel="stylesheet" href="/css/booksave.css">
    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- jquery -->
    <script src="/js/jquery-3.3.1.min.js"></script>

    <!-- custom js -->
    <!-- <script src="/js/config.js" defer></script> -->
    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">


        <style>
            .fileDrop {
                width: 600px;
                height: 200px;
                border: 1px dashed gray;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 1.5em;
            }
            .uploaded-list {
                display: flex;
            }
            .img-sizing {
                display: block;
                width: 100px;
                height: 100px;
            }
        </style>

</head>


<body>
    <div id="page" style="padding: 50px;">


        <div id="wrapper">
            <h1> 책 등록하기 </h1>

            <form id="write-form" action="/book/write" method="post" autocomplete="off" enctype="multipart/form-data">
                <div class="input-table">

                    <div class="left">
                        <h3>이미지 링크</h3>
                    </div>
                    <div class="right">
                        <input type="text" name="bookImg">
                    </div>


                    <div class="left">
                        <h3>플랫폼</h3>
                    </div>
                    <div class="right">
                        <select name="platformId" class="form-select" aria-label="Default select example">
                            <option value="0" disabled>플랫폼을 선택해주세요</option>
                            <option value="1" selected>카카오 페이지</option>
                            <option value="2">네이버 시리즈</option>
                            <option value="3">리디북스</option>
                            <option value="4">문피아</option>
                            <option value="5">조아라</option>
                            <option value="6">미분류</option>
                        </select>

                    </div>



                    <div class="left">
                        <h3>책 제목</h3>
                    </div>
                    <div class="right">
                        <input id="book-name-input" maxlength="50" type="text" name="bookTitle">
                    </div>

                    <div class="left">
                        <h3>작가</h3>
                    </div>
                    <div class="right">
                        <input id="writer-input" maxlength="50" type="text" name="writer">
                    </div>



                    <div class="pageCount">
                        <div class="left">
                            <h3>현재 회차</h3>
                        </div>
                        <div class="right">
                            <input id="cur-page" maxlength="5" type="number" name="curPage">
                        </div>

                        <div class="left">
                            <h3>전체 회차</h3>
                        </div>
                        <div class="right">
                            <input id="total-page" maxlength="5" type="number" name="totalPage">
                        </div>
                    </div>

                    <div class="theend">
                        <div class="left">
                            <h3>연재중</h3>
                        </div>
                        <div class="right" id="half">
                            <input type="radio" name="theEnd" value="1" checked>
                        </div>
                        <div class="left">
                            <h3>완결</h3>
                        </div>
                        <div class="right" id="half">
                            <input type="radio" name="theEnd" value="0">
                        </div>

                    </div>

                    <!-- <div class="starRate-input"> -->
                    <div class="left">
                        <h3>별점</h3>
                    </div>

                    <div class="right">
                        <select name="starRate" class="form-select" aria-label="Default select example">
                            <option disabled>별점을 선택해주세요</option>
                            <option value="1" selected>★☆☆☆☆</option>
                            <option value="2">★★☆☆☆</option>
                            <option value="3">★★★☆☆</option>
                            <option value="4">★★★★☆</option>
                            <option value="5">★★★★★</option>
                        </select>
                    </div>


                    <!-- </div> -->
                    <!-- <div class="bookComment-input"> -->
                    <div class="left">
                        <h3>한줄평</h3>
                    </div>
                    <div class="right">
                        <textarea id="book-comment" name="bookComment" maxlength="50" rows="2"></textarea>
                    </div>
                    <!-- </div> -->

                    <!-- 첨부파일 드래그 앤 드롭 영역 -->
                    <div class="form-group">
                        <div class="fileDrop">
                            <span>Drop Here!!</span>
                        </div>
                        <div class="uploadDiv">
                            <input type="file" name="files" id="ajax-file" style="display:none;">
                        </div>
                        <!-- 업로드된 파일의 썸네일을 보여줄 영역 -->
                        <div class="uploaded-list">

                        </div>
                    </div>

                </div>

                <div id="button" style="padding: 10px;">
                    <button type="button" id="reg-btn" class="btn btn-outline-danger" style="float: right;">등록</button>
                </div>


            </form>

            <button type="button" id="list-btn" class="btn btn-secondary btn-sm"
                onclick="location.href='/book/list'">목록</button>
            <!-- <a href="/book/list">목록</a> -->
        </div>
    </div>



    <script>
        // start JQuery  (jQuery 즉시실행 함수, jQuery 구문 시작)
        $(document).ready(function () {
            function isImageFile(originFileName) {
                //정규표현식
                const pattern = /jpg$|gif$|png$/i;
                return originFileName.match(pattern);
            }
            // 파일의 확장자에 따른 렌더링 처리
            function checkExtType(fileName) {
                //원본 파일 명 추출
                let originFileName = fileName.substring(fileName.indexOf("_") + 1);
                // hidden input을 만들어서 변환파일명을 서버로 넘김
                const $hiddenInput = document.createElement('input');
                $hiddenInput.setAttribute('type', 'hidden');
                $hiddenInput.setAttribute('name', 'fileNames');
                $hiddenInput.setAttribute('value', fileName);
                $('#write-form').append($hiddenInput);
                //확장자 추출후 이미지인지까지 확인
                if (isImageFile(originFileName)) { // 파일이 이미지라면
                    const $img = document.createElement('img');
                    $img.classList.add('img-sizing');
                    $img.setAttribute('src', '/loadFile?fileName=' + fileName);
                    $img.setAttribute('alt', originFileName);
                    $('.uploaded-list').append($img);
                }
                // 이미지가 아니라면 다운로드 링크를 생성
                else {
                    const $a = document.createElement('a');
                    $a.setAttribute('href', '/loadFile?fileName=' + fileName); // raw file 줌
                    const $img = document.createElement('img');
                    $img.classList.add('img-sizing');
                    $img.setAttribute('src', '/img/file_icon.jpg');
                    $img.setAttribute('alt', originFileName);
                    $a.append($img);
                    $a.innerHTML += '<span>' + originFileName + '</span>';
                    $('.uploaded-list').append($a);
                }
            }
            // 드롭한 파일을 화면에 보여주는 함수
            function showFileData(fileNames) {
                // 이미지인지? 이미지가 아닌지에 따라 구분하여 처리
                // 이미지면 썸네일을 렌더링하고 아니면 다운로드 링크를 렌더링한다.
                for (let fileName of fileNames) {
                    checkExtType(fileName);
                }
            }
            // drag & drop 이벤트
            const $dropBox = $('.fileDrop');
            // drag 진입 이벤트
            $dropBox.on('dragover dragenter', e => {
                e.preventDefault();
                $dropBox
                    .css('border-color', 'red')
                    .css('background', 'lightgray');
            });
            // drag 탈출 이벤트 (on = addEventListener)
            $dropBox.on('dragleave', e => {
                e.preventDefault(); // 이미지 파일 드랍했을 때 열리는 거 막기
                $dropBox
                    .css('border-color', 'gray')
                    .css('background', 'transparent');
            });
            // drop 이벤트
            $dropBox.on('drop', e => {
                e.preventDefault();
                console.log('드롭 이벤트 작동!');
                // 드롭된 파일 정보를 서버로 전송
                // 1. 드롭된 파일 데이터 읽기
                console.log(e);

                // e에서 파일 정보가 있는 곳
                const files = e.originalEvent.dataTransfer.files;
                console.log('drop file data: ', files);
                // 2. 읽은 파일 데이터를 input[type=file]태그에 저장
                const $fileInput = $('#ajax-file');
                console.log($fileInput);
                $fileInput.prop('files', files); // 첫번째 파라미터는 input의 name 속성과 맞추기
                console.log($fileInput);
                // 3. 파일 데이터를 비동기 전송하기 위해서는 FormData객체가 필요
                const formData = new FormData();
                // 4. 전송할 파일들을 전부 FormData안에 포장
                for (let file of $fileInput[0].files) {
                    formData.append('files', file);
                }
                // 5. 비동기 요청 전송
                const reqInfo = {
                    method: 'POST',
                    body: formData
                };
                fetch('/ajax-upload', reqInfo)
                    .then(res => {
                        console.log(res.status);
                        return res.json();
                    })
                    .then(fileNames => {
                        console.log(fileNames);
                        showFileData(fileNames);
                    });
            });
        });
        // end jQuery
    </script>


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
                    return false;
                } else if ($writerInput.value.trim() === '') {
                    alert('작가는 필수값입니다');
                    return false;
                }


                if ($curPage.value.trim() === '') {
                    $curPage.value = 0;
                } else if ($curPage.value < 0) {
                    alert('현재 페이지 값을 확인해주세요.');
                    return false;
                }

                if ($totalPage.value.trim() === '') {
                    $totalPage.value = 0;
                    return false;
                } else if ($totalPage.value < 0) {
                    alert('총 페이지 값을 다시 한번 확인해주세요.');
                    return false;
                }



                if (+$totalPage.value < +$curPage.value) {
                    console.log($totalPage.value);
                    console.log($curPage.value);
                    alert('총 페이지 값을 다시 한번 확인해주세요.');
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

                // const $formSelect = document.querySelector('.form-select');
                // console.log($formSelect.value); 
                // if($formSelect.value === 0) {
                //     $formSelect.selectedIndex = 1;
                // }
                // console.log($formSelect.value);

                // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
                const $form = document.getElementById('write-form');
                $form.submit();
            };
        })();
    </script>

</body>

</html>