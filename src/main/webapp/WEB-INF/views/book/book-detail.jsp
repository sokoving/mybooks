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
        <h1>북마크 / 북메모 등록기능</h1>

        <ul>

            <li>
                <form action="/book/bookmark-save" method="post">
                    <br>
                    <input type="hidden" name="bookNo" value="${book.bookNo}">
                    <label>
                        bookmarkPage : <input id="bookmarkPage-input" type="text" name="bookmarkPage">
                    </label>
                    <label>
                        bookmarkContent : <input type="text" id="bookmarkContent-input" name="bookmarkContent">
                    </label>
                    <button type="submit">등록</button>
                </form>

                <c:forEach var="mk" items="${bmkl}">
                    <form action="/book/bookmark-modify" method="post">
                        <input type="hidden" name="bookNo" value="${mk.bookNo}" readonly>
                        <label>
                            bookmarkNo : <input type="text" name="bookmarkNo" value="${mk.bookmarkNo}">
                        </label>
                        <label>
                            bookmarkContent : <input type="text" name="bookmarkContent" value="${mk.bookmarkContent}">
                        </label>
                        <button type="submit">수정</button>
                        <br>
                    </form>
                </c:forEach>
            </li>

        </ul>

        <ul>
            <li>
                <c:forEach var="ml" items="${bmml}">
                    <form action="/book/bookmemo-modify" method="post">
                        <input type="hidden" name="bookNo" value="${ml.bookNo}" readonly>
                        bookMemoNo : <input type="text" name="bookMemoNo" value="${ml.bookMemoNo}">
                        <label>
                            bookMemoContent : <input type="text" name="bookMemoContent" value="${ml.bookMemoContent}">
                        </label>
                        <button type="submit">수정</button>
                    </form>
                </c:forEach>
            </li>
        </ul>

    </div>

</body>

</html>