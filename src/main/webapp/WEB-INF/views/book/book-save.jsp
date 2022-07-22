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

    <form action="/book/write" method="post">
        # 플랫폼 아이디: <input type="text" name="platformId">
        <br>
        # 책 제목 : <input type="text" name="bookTitle">
        <br>
        # 작가 : <input type="text" name="writer">
        <br>
        # 현재 회차 : <input type="text" name="curPage">
        <br>
        # 총 회차 : <input type="text" name="totalPage">
        <br>
        # 연재중 <input type="radio" name="theEnd" value="false" checked>
        완결 <input type="radio" name="theEnd" value="true">
        <br>
        # 별점 : <input type="text" name="starRate">
        <br>
        # 한줄평
        <textarea name="bookComment" cols="30" rows="2"></textarea>
        <br>
        <button type="submit">등록</button>

    </form>
    <a href="/book/list">목록</a>

</body>

</html>