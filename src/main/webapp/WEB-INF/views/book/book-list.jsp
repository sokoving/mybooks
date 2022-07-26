<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MY BOOKS</title>

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
    <link rel="stylesheet" href="/css/main.css">
    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- custom js -->
    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

    <style>
        body {
            background-color: #eee !important;
            color: inherit !important;
            font-size: 18px !important;
            font-family: 'NanumSquareRound', sans-serif;
        }
    </style>

</head>

<body>

    <div id="wrap">
        <!-- 헤더 영역 (작업해야 함)-->
        <header id="header">
            <div class="inner-header">
                <span class="lnr lnr-pencil"></span>
                <h1> My Books</h1>
            </div>
        </header>



        <!-- 책 목록 영역 -->
        <div id="book-wrap">
            <!-- 즐겨찾기 책 목록(작업해야 함) -->
            <ul id="like-book" class="list-group">
                <li class="list-head list-group-item d-flex justify-content-center" id="accordion">
                    <h2 class="fs-3">즐겨찾기 목록</h2>
                    <span class="accordionBtn lnr lnr-chevron-up"></span>
                </li>
                <!--  d-flex list-group-item justify-content-between align-items-start -->
                <li>
                    <c:forEach var="im" items="${imList}">
                        <div class="d-flex list-group-item justify-content-between align-items-start">
                            <div class="list-left d-flex flex-column">
                                <div class="img-book"><img class="img-custom" src="${im.bookImg}"></div>
                                <div class="importance" data-book-no="${im.bookNo}" data-importance="${im.importance}">
                                    즐겨찾기
                                </div>
                            </div>
                            <div class="ms-2 me-auto text-break">
                                <h3 class="title fs-5 fw-bold">
                                    <a href="/book/detail?bookNo=${im.bookNo}">
                                        ${im.bookTitle}
                                    </a>
                                </h3>
                                <div class="writer fs-6">${im.writer}</div>
                                <div class="star-rate mb-1">${im.starRate}</div>
                                <div class="page fs-6">${im.curPage} / ${im.totalPage}</div>
                                <div class="comment fs-6"># ${im.bookComment}</div>
                            </div>

                            <div class="list-right">
                                <div class="platform badge bg-auto" data-platform-id="${im.platformId}">
                                    <a href="${im.platformLink}">${im.platformName}</a>
                                </div>
                                <div class="the-end badge badge bg-secondary">${im.theEnd}</div>
                            </div>
                        </div>
                    </c:forEach>
                </li>

            </ul> <!-- end like-book -->


            <!-- 전체 책 목록 -->
            <ul id="all-book" class="list-group">
                <li class="list-head list-group-item d-flex justify-content-center">
                    <h2 class="fs-3">전체 목록</h2>
                    <span class="accordionBtn lnr lnr-chevron-up"></span>
                </li>
                <li class="list-group-item-warning text-center input-book-bg" id="savebook">
                    <a href="/book/write">새 책 등록하기 <i class="fas fa-plus"></i></a>
                </li>

                <!-- 검색 li -->
                <li class="list-group-item list-group-item-action text-center fs-6 filter-section">
                    <div>
                    <div class="filter-area">
                        <!-- change 이벤트 -->
                        <label>
                            <select name="platformId" class="form-select" id="p-select">
                                <option value="0" ${search.platformId==0 ? 'selected' : '' }>플랫폼을 선택해 보세요</option>
                                <option value="1" ${search.platformId==1 ? 'selected' : '' }>
                                    카카오 페이지
                                </option>
                                <option value="2" ${search.platformId==2 ? 'selected' : '' }>
                                    네이버 시리즈
                                </option>
                                <option value="3" ${search.platformId==3 ? 'selected' : '' }>
                                    리디북스
                                </option>
                                <option value="4" ${search.platformId==4 ? 'selected' : '' }>
                                    문피아
                                </option>
                                <option value="5" ${search.platformId==5 ? 'selected' : '' }>
                                    조아라
                                </option>
                                <option value="6" ${search.platformId==6 ? 'selected' : '' }>
                                    미분류
                                </option>
                            </select>
                        </label>
                        <label>
                            <select name="starRate" class="form-select" id="s-select">
                                <option value="0" ${search.starRate==0 ? 'selected' : '' }>
                                    별점을 선택해 보세요
                                </option>
                                <option value="1" ${search.starRate==1 ? 'selected' : '' }>
                                    ★☆☆☆☆
                                </option>
                                <option value="2" ${search.starRate==2 ? 'selected' : '' }>
                                    ★★☆☆☆
                                </option>
                                <option value="3" ${search.starRate==3 ? 'selected' : '' }>
                                    ★★★☆☆
                                </option>
                                <option value="4" ${search.starRate==4 ? 'selected' : '' }>
                                    ★★★★☆
                                </option>
                                <option value="5" ${search.starRate==5 ? 'selected' : '' }>
                                    ★★★★★
                                </option>
                            </select>
                        </label>
                    </div>

                    <!-- keyup 이벤트 -->
                    <div class="search-area">
                        <label>
                            <input type="text" id="b-search" name="bookTitle" placeholder="제목으로 검색해 보세요"
                                value="${search.bookTitle}">
                        </label>
                        <label>
                            <input type="text" id="w-search" name="writer" placeholder="작가로 검색해 보세요"
                                value="${search.writer}">
                        </label>
                    </div>
                </div>
                    <div class="search-btn-group text-end">
                        <div>
                            <a href="/book/list" id="reset-btn">
                                <span class="lnr lnr-redo"></span>
                            </a>
                        </div>
                        <div>
                            <span class="lnr lnr-magnifier" id="search-btn"></span>
                        </div>

                    </div>

                </li>

                <!-- 전체 책 목록 li -->
                <li>
                    <c:forEach var="bp" items="${bpList}">
                        <div class="list-group-item d-flex justify-content-between align-items-start">
                            <div class="list-left d-flex flex-column ">
                                <div class="img-book"><img class="img-custom" src="${bp.bookImg}"></div>
                                <div class="importance" data-book-no="${bp.bookNo}" data-importance="${bp.importance}">
                                    즐겨찾기
                                </div>
                            </div>
                            <div class="ms-2 me-auto text-break">
                                <h3 class="title fs-5 fw-bold">
                                    <a href="/book/detail?bookNo=${bp.bookNo}">
                                        ${bp.bookTitle}
                                    </a>
                                </h3>
                                <div class="writer fs-6">${bp.writer}</div>
                                <div class="star-rate mb-1">${bp.starRate}</div>
                                <div class="page fs-6">${bp.curPage} / ${bp.totalPage}</div>
                                <div class="comment fs-6"># ${bp.bookComment}</div>
                            </div>

                            <div class="list-right">
                                <div class="platform badge bg-auto" data-platform-id="${bp.platformId}">
                                    <a href="${bp.platformLink}">${bp.platformName}</a>
                                </div>
                                <div class="the-end badge badge bg-secondary">${bp.theEnd}</div>
                            </div>
                        </div>
                    </c:forEach>
                
                <!-- 페이지 버튼 영역 -->
                <div class="list-group-item d-flex justify-content-center">
                    <nav aria-label="Page navigation">
                        <ul class="pagination pagination-lg pagination-custom">
    
                            <c:if test="${pm.prev}">
                                <li class="page-item"><a class="page-link"
                                        href="/book/list?pageNum=${pm.beginPage - 1}&amount=${search.amount}&platformId=${search.platformId}&starRate=${search.starRate}&bookTitle=${search.bookTitle}&writer=${search.writer}">
                                        prev</a></li>
                            </c:if>
    
                            <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                                <li data-page-num="${n}" class="page-item">
                                    <a class="page-link"
                                        href="/book/list?pageNum=${n}&amount=${search.amount}&platformId=${search.platformId}&starRate=${search.starRate}&bookTitle=${search.bookTitle}&writer=${search.writer}">${n}</a>
                                </li>
                            </c:forEach>
    
                            <c:if test="${pm.next}">
                                <li class="page-item"><a class="page-link"
                                        href="/board/list?pageNum=${pm.endPage + 1}&amount=${search.amount}&platformId=${search.platformId}&starRate=${search.starRate}&bookTitle=${search.bookTitle}&writer=${search.writer}">next</a>
                                </li>
                            </c:if>
    
                        </ul>
                    </nav>
                </div>
            </li>
            </ul><!-- end all-book -->
            <footer>
                <h3>Copyright 2021. My Books. all rights reserved.</h3>

            </footer>
        </div> <!-- end book-wrap -->
    </div> <!-- end wrap -->


    <script src="/js/config.js"></script>
    <script>




        const $savebook = document.getElementById('savebook');

        $savebook.onclick = e => {
            location.href = "/book/write";
        }


        const params = {
            platformId: '${search.platformId}',
            starRate: '${search.starRate}',
            bookTitle: '${search.bookTitle}',
            writer: '${search.writer}'
        };

        (function () {
            // test();

            // 별점, 배지 css 변동 이벤트
            convertStarRate();
            convertPlatformBadge();
            convertTheEndBadge();
            convertImportance();


            // 아코디언 이벤트
            listAccordion();

            // 즐겨찾기 추가, 제거 이벤트
            switchImportance();

            // 필터 이벤트
            console.log(params);
            document.getElementById('p-select').onchange = e => {
                searchPlatform(e, params);
            };
            document.getElementById('s-select').onchange = e => {
                searchStarRate(e, params);
            }

            // 검색 이벤트(인풋창 엔터)
            const $txtInput = document.querySelector('.search-area');
            $txtInput.addEventListener('keyup', e => {
                if (!e.target.matches('input')) return;
                searchKeyUp(e, params);
            })
            // 검색 이벤트(검색 버튼 클릭)
            const $searchBtn = document.getElementById('search-btn')
            $searchBtn.addEventListener('click', e => {
                searchTitleWriter(e, params);
            })

            // 현재 위치한 페이지에 색칠하기
            const curPageNum = '${pm.search.pageNum}';
            console.log("현재페이지: ", curPageNum);
            paintPage(curPageNum);

        })();
    </script>

</body>

</html>