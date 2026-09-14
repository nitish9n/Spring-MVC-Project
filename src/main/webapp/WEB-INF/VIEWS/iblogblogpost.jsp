<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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


    <title>${post.title} - iBlog</title>


    <style>


        .single-blog {

            max-width: 900px;

            margin: 50px auto;

            padding: 30px;

        }


        .single-blog-title {

            font-size: 42px;

            margin-bottom: 15px;

        }


        .single-blog-meta {

            color: #666;

            margin-bottom: 25px;

        }


        .single-blog-image {

            width: 100%;

            max-height: 500px;

            object-fit: cover;

            border-radius: 8px;

            margin: 25px 0;

        }


        .single-blog-content {

            font-size: 20px;

            line-height: 1.8;

            white-space: pre-wrap;

        }


        .back-home {

            display: inline-block;

            margin-top: 30px;

        }


    </style>

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



    <!-- ================= BLOG DETAILS ================= -->

    <div class="single-blog">


        <!-- TITLE -->

        <h1 class="single-blog-title">

            ${post.title}

        </h1>


        <!-- AUTHOR + DATE -->

        <div class="single-blog-meta">

            By <strong>${post.author}</strong>

            &nbsp; | &nbsp;

            ${post.createdAt}

        </div>



        <!-- ================= IMAGE ================= -->

        <c:choose>


            <c:when
                test="${not empty post.imageName}">

                <img
                    class="single-blog-image"
                    src="${pageContext.request.contextPath}/img/blogs/${post.imageName}"
                    alt="${post.title}">

            </c:when>


            <c:otherwise>

                <img
                    class="single-blog-image"
                    src="${pageContext.request.contextPath}/img/3.png"
                    alt="iBlog">

            </c:otherwise>


        </c:choose>



        <!-- ================= FULL CONTENT ================= -->

        <div class="single-blog-content">

            ${post.content}

        </div>



        <!-- ================= BACK ================= -->

        <a
            class="btn back-home"
            href="${pageContext.request.contextPath}/">

            ← Back to Home

        </a>


    </div>



    <!-- ================= FOOTER ================= -->

    <div class="footer">

        <p>
            Copyright &copy; iBlog.com
        </p>

    </div>


</body>

</html>