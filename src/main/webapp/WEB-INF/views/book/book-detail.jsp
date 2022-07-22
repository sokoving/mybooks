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
    <h1> # detial page </h1>

    <!-- 
        "book", detailPageListMap.get("book"));
        "bmkl",detailPageListMap.get("bookMarkList"));
        "bmml", detailPageListMap.get("bookMemoList"));

 -->

    <ul>
        <li>플랫폼: ${book.platformName} </li>
        <li>제목: ${book.bookTitle} (${book.theEnd})</li>
        <li>작가: ${book.writer}</li>
        <li>별점: ${book.starRate}</li>
        <li> ${book.curPage}/${book.totalPage}</li>
        <li>한줄평 : ${book.bookComment}</li>
    </ul>

    <div class="modi-remo-list">
        <a href="/book/modify">수정</a>
        <a href="/book/delete">삭제</a>
        <a href="/book/list">목록</a>
    </div>

<%-- <ul>
    <li>${bmkl.bookmarkNo}</li>
</ul> --%>



<ul>
    <c:forEach var="mk" items="${bmkl}">
        <li> ${mk.bookmarkContent} </li>
    </c:forEach>
</ul>


</body>

</html>