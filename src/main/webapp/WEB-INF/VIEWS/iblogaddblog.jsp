<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Add Blog - iBlog</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/utils.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <h1>Create New Blog</h1>


    <form
        action="${pageContext.request.contextPath}/processBlog"
        method="post">

        <label>
            Blog Title
        </label>

        <br>

        <input
            type="text"
            name="title"
            placeholder="Enter blog title"
            required>

        <br><br>


        <label>
            Blog Content
        </label>

        <br>

        <textarea
            name="content"
            rows="12"
            cols="80"
            placeholder="Write your blog..."
            required></textarea>

        <br><br>


        <button type="submit">
            Publish Blog
        </button>

    </form>


    <br>

    <a href="${pageContext.request.contextPath}/">
        Back to Home
    </a>

</body>

</html>