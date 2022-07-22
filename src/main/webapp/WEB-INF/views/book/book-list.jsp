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

<style>
    tr {
        margin-top: 10px;
        border-top: 1px solid #000;
    }
</style>

<body>
    <h1> book-list.jsp </h1>


    <table>
        <tr>
            <th>번호</th>
            <th>플랫폼</th>
            <th>제목</th>
            <th>작가</th>
            <th>진행도</th>
            <th>별점</th>
        </tr>

        <c:forEach var="bp" items="${bpList}">
            <tr>
                <td>${bp.bookNo} / ${bp.theEnd}</td>
                <td>${bp.platformName}</td>
                <td>${bp.bookTitle}</td>
                <td>${bp.writer}</td>
                <td>${bp.curPage} / ${bp.totalPage}</td>
                <td>${bp.starRate}점</td>
            </tr>
            <tr>
                <td>${bp.bookComment}</td>
                <td>${bp.regDate}</td>
            </tr>
        </c:forEach>
    </table>

    <a href="/write">글쓰기</a>


    
    



</body>

</html>