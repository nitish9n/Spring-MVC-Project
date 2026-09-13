<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>${post.title} - iBlog</title>

</head>

<body>

    <h1>${post.title}</h1>

    <p>
        Author: ${post.author}
    </p>

    <p>
        ${post.content}
    </p>

    <br>

    <a href="${pageContext.request.contextPath}/blogs">
        ← All Blogs
    </a>

    |

    <a href="${pageContext.request.contextPath}/">
        Home
    </a>

</body>

</html>