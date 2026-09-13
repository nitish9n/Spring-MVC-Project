<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Blogs - iBlog</title>

</head>

<body>

    <h1>All Blogs</h1>


    <c:if test="${empty posts}">

        <p>
            No blogs found.
        </p>

    </c:if>


    <c:forEach var="post" items="${posts}">

        <article>

            <h2>

                <a href="${pageContext.request.contextPath}/blogpost/${post.id}">

                    ${post.title}

                </a>

            </h2>

            <p>
                By ${post.author}
            </p>

            <p>
                ${post.content}
            </p>

            <hr>

        </article>

    </c:forEach>


    <a href="${pageContext.request.contextPath}/">
        Back to Home
    </a>

</body>

</html>