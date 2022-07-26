// ---------- 함수, 변수 선언부 ---------- //

function test() {
    // console.log('js test!!');
}


// star-rate의 숫자를 별로 바꾼다
function convertStarRate() {
    // console.log("convertStarRate 함수 시작");
    const $starArr = [...document.querySelectorAll('.star-rate')];

    for (let star of $starArr) {
        let str = '';
        let starNum = star.textContent;
        // console.log(starNum);
        if (starNum > 5) starNum = 5;

        for (let i = 0; i < starNum; i++) {
            str += '★';
        }
        for (let i = 0; i < 5 - starNum; i++) {
            str += '☆';
        }
        star.textContent = str;
    }
}

// the-end의 숫자 따라 배지의 배경색과 텍스트가 바뀐다

/*
1 카카오 페이지   배경: #f9e000	글자색: #333
2 네이버 시리즈   배경: #03c75a	글자색: #000
3 리디북스        배경: #1E9EFF	글자색: #fff
4 문피아          배경: #5aa2dd/ #5f9bd1 글자색: #333
5 조아라          배경: #004c99 글자색: #a5f72c
6 미분류          배경: #088F8F 글자색: #fff
*/
function convertPlatformBadge() {
    // console.log('convert Platform Badge 함수 시작');
    const $platformArr = [...document.querySelectorAll('.platform')];
    for (let $platform of $platformArr) {
        const num = $platform.dataset.platformId;
        // console.log(num);
        switch (num) {
            case '1':
                $platform.style.background = '#f9e000';
                $platform.style.color = '#333';
                break;
            case '2':
                $platform.style.background = '#03c75a';
                $platform.style.color = '#000';
                break;
            case '3':
                $platform.style.background = '#1E9EFF';
                $platform.style.color = '#fff';
                break;
            case '4':
                $platform.style.background = '#5aa2dd';
                $platform.style.color = '#333';
                break;
            case '5':
                $platform.style.background = '#004c99';
                $platform.style.color = '#a5f72c';
                break;
            case '6':
                $platform.style.background = '#088F8F';
                $platform.style.color = '#ffc107';
                break;
            default:
                break;
        }

    }
}


/*
0: 완결 .bg-danger / 
1: 연재중 .bg-secondary
*/
function convertTheEndBadge() {
    // console.log('convert the end Badge 함수 시작');
    const $theEndArr = [...document.querySelectorAll('.the-end')];
    for (let $theEnd of $theEndArr) {
        const num = $theEnd.textContent;
        if (num == 0) {
            $theEnd.textContent = '완결';
            $theEnd.classList = 'the-end badge badge bg-danger';
        } else if (num == 1) {
            $theEnd.textContent = '연재중';
            $theEnd.classList = 'the-end badge badge bg-secondary';
        } else {
            $theEnd.textContent = '';
        }
    }
}

//즐겨찾기 클래스 색칠하기
// data-importance가 0보다 크면 importance badge bg-warning text-dark
// 0이면 importance badge bg-secondary text-white 
function convertImportance() {
    // console.log("convertImportance 함수 작동");
    const $importanceArr = [...document.querySelectorAll('.importance')];
    for (let $im of $importanceArr) {
        const imNo = $im.dataset.importance;
        if (imNo > 0) {
            $im.classList = 'importance badge bg-warning text-dark';
        } else if (imNo == 0) {
            $im.classList = 'importance badge bg-secondary text-white';
        }

    }
}


// 즐겨찾기 등록, 삭제 이벤트
// .importance를 클릭하면
// data-importance가 0보다 크면 remove
//  data-importance가 0보다 작으면 save
function switchImportance() {
    console.log("switchImportanceBadge 함수 작동");
    const $bookUlList = [...document.querySelectorAll('.list-group')]

    for (let $bookUl of $bookUlList) {
        $bookUl.addEventListener('click', e => {
            if (!e.target.matches('.importance')) return;
            console.log(e.target);
            const bn = e.target.dataset.bookNo;
            console.log(bn);

            if (e.target.dataset.importance > 0) {
                location.href = '/book/importance/remove?bookNo=' + bn;

            } else if (e.target.dataset.importance == 0) {
                location.href = '/book/importance/save?bookNo=' + bn;
            }
        })
    }
}

// 플랫폼 필터링 change 이벤트
function searchPlatform(e, params){
    // console.log("e: ", e.target.value);
    const selectVal = e.target.value;
    console.log('selectVal' + selectVal);
    location.href = '/book/list?platformId=' + selectVal 
                + '&starRate=' + params.starRate
                + '&bookTitle=' + params.bookTitle
                + '&writer=' + params.writer
                ;
}

// 별점 필터링 change 이벤트
function searchStarRate(e, params){
    // console.log("e: ", e.target.value);
    const selectVal = e.target.value;
    console.log('selectVal' + selectVal);
    location.href = '/book/list?platformId=' + params.platformId
                + '&starRate=' + selectVal
                + '&bookTitle=' + params.bookTitle
                + '&writer=' + params.writer
    ;
}

// 책 제목 




