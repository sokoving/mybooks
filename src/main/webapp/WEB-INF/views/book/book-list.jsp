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
    <script src="/js/config.js" defer></script>
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
                <h1> logo</h1>
            </div>
        </header>



        <!-- 책 목록 영역 -->
        <div id="book-wrap">
            <!-- 즐겨찾기 책 목록(작업해야 함) -->
            <ul id="like-book" class="list-group">
                <li class="list-head list-group-item d-flex justify-content-center">
                    <h2 class="fs-3">즐겨찾기 목록</h2>
                </li>
                <li class="list-group-item list-group-item-action text-center fs-6">
                    <a href="#">+ 펼치기</a>
                </li>

                <c:forEach var="im" items="${imList}">
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="list-left d-flex flex-column ">
                            <div class="img-book"><img class="img-custom" src="${im.bookImg}" alt="책표지"></div>
                            <div class="importance" data-book-no="${im.bookNo}" data-importance="${im.importance}">즐겨찾기</div>
                        </div>
                        <div class="ms-2 me-auto text-break">
                            <h3 class="title fs-5 fw-bold">
                                <a href="/book/detail?bookNo=${bp.bookNo}">
                                    ${im.bookTitle}
                                </a>
                            </h3>
                            <div class="writer fs-6">${im.writer}</div>
                            <div class="star-rate mb-1">${im.starRate}</div>
                            <div class="page fs-6">${im.curPage} / ${im.totalPage}</div>
                            <div class="comment fs-6"># ${im.bookComment}</div>
                        </div>

                        <div class="list-right">
                            <div class="platform badge bg-auto" data-platform-id="${im.platformId}">${im.platformName}</div>
                            <div class="the-end badge badge bg-secondary">${im.theEnd}</div>
                        </div>
                    </li>
                </c:forEach>

            </ul> <!-- end like-book -->


            <!-- 전체 책 목록 -->
            <ul id="all-book" class="list-group">
                <li class="list-head list-group-item d-flex justify-content-center">
                    <h2 class="fs-3">전체 목록</h2>
                </li>
                <li class="list-group-item list-group-item-action text-center fs-6">
                    <a href="/book/write">+ 새 책 등록하기</a>
                </li>

                <c:forEach var="bp" items="${bpList}">
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="list-left d-flex flex-column ">
                            <div class="img-book"><img class="img-custom" src="${bp.bookImg}" alt="책표지"></div>
                            <div class="importance" data-book-no="${bp.bookNo}" data-importance="${bp.importance}">즐겨찾기</div>
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
                            <div class="platform badge bg-auto" data-platform-id="${bp.platformId}">${bp.platformName}</div>
                            <div class="the-end badge badge bg-secondary">${bp.theEnd}</div>
                        </div>
                    </li>
                </c:forEach>

            </ul><!-- end all-book -->
        </div> <!-- end book-wrap -->
    </div> <!-- end wrap -->

</body>

</html>