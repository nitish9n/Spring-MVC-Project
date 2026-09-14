<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/utils.css">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/style.css">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/mobile.css">

    <title>Update Blog - iBlog</title>

</head>


<body>


    <!-- ================= NAVIGATION ================= -->

    <nav class="navigation max-width-1 m-auto">

        <div class="nav-left">

            <a href="${pageContext.request.contextPath}/">

                <span>

                    <img
                        src="${pageContext.request.contextPath}/img/logo.png"
                        width="94px"
                        alt="iBlog">

                </span>

            </a>


            <ul>

                <li>
                    <a href="${pageContext.request.contextPath}/">
                        Home
                    </a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/about">
                        About
                    </a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/contact">
                        Contact
                    </a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/addBlog">
                        Add Blog
                    </a>
                </li>

            </ul>

        </div>


        <!-- SEARCH -->

        <div class="nav-search">

            <form
                action="${pageContext.request.contextPath}/search"
                method="get">

                <input
                    class="form-input"
                    type="text"
                    name="query"
                    placeholder="Article Search">

                <button
                    class="btn"
                    type="submit">

                    Search

                </button>

            </form>

        </div>


        <!-- LOGIN -->

        <div class="nav-login">

            <a
                href="${pageContext.request.contextPath}/login"
                class="login-link">

                Sign In

            </a>

        </div>

    </nav>


    <div class="max-width-1 m-auto">

        <hr>

    </div>


    <!-- ================= UPDATE BLOG ================= -->

    <div class="contact-content max-width-1 m-auto my-2">

        <h1>
            Update Your Blog
        </h1>


        <form
            action="${pageContext.request.contextPath}/processUpdateBlog"
            method="post"
            enctype="multipart/form-data">


            <!-- POST ID -->

            <input
                type="hidden"
                name="id"
                value="${post.id}">


            <!-- TITLE -->

            <div class="form-box">

                <label for="title">
                    Blog Title
                </label>

                <input
                    class="form-input"
                    type="text"
                    id="title"
                    name="title"
                    value="${post.title}"
                    placeholder="Enter blog title"
                    required>

            </div>


            <!-- CONTENT -->

            <div class="form-box">

                <label for="content">
                    Blog Content
                </label>

                <textarea
                    class="form-input"
                    id="content"
                    name="content"
                    rows="12"
                    placeholder="Write your blog here..."
                    required>${post.content}</textarea>

            </div>


            <!-- CURRENT IMAGE -->

            <div class="form-box">

                <label>
                    Current Blog Image
                </label>


                <c:choose>

                    <c:when test="${not empty post.imageName}">

                        <img
                            src="${pageContext.request.contextPath}/img/blogs/${post.imageName}"
                            alt="${post.title}"
                            style="max-width: 300px; display: block; margin: 10px 0;">

                    </c:when>


                    <c:otherwise>

                        <img
                            src="${pageContext.request.contextPath}/img/3.png"
                            alt="iBlog"
                            style="max-width: 300px; display: block; margin: 10px 0;">

                    </c:otherwise>

                </c:choose>

            </div>


            <!-- NEW IMAGE -->

            <div class="form-box">

                <label for="image">
                    Change Blog Image
                </label>

                <input
                    class="form-input"
                    type="file"
                    id="image"
                    name="image"
                    accept="image/*">

                <small>
                    Leave this empty if you want to keep the current image.
                </small>

            </div>


            <!-- SUBMIT -->

            <div class="form-box">

                <button
                    class="btn"
                    type="submit">

                    Update Blog

                </button>

            </div>

        </form>

    </div>


    <!-- ================= FOOTER ================= -->

    <div class="footer">

        <p>
            Copyright &copy; iBlog.com
        </p>

    </div>


</body>

</html>