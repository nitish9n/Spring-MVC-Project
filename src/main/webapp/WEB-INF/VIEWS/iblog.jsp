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


    <title>iBlog - Heaven for bloggers</title>


    <style>

        /* =========================================
           BLOG GRID
           ========================================= */

        .blog-grid {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 30px;

            margin-top: 30px;
        }


        /* =========================================
           BLOG CARD
           ========================================= */

        .blog-card {

            border: 1px solid #ddd;

            border-radius: 8px;

            overflow: hidden;

            background: white;

            transition: 0.2s;
        }


        .blog-card:hover {

            transform: translateY(-5px);

            box-shadow:
                0 5px 15px
                rgba(0, 0, 0, 0.12);
        }


        /* =========================================
           BLOG IMAGE
           ========================================= */

        .blog-card-image {

            width: 100%;

            height: 200px;

            object-fit: cover;

            display: block;
        }


        /* =========================================
           BLOG CONTENT
           ========================================= */

        .blog-card-content {

            padding: 20px;
        }


        .blog-card-content h3 {

            margin-bottom: 10px;
        }


        .blog-card-content h3 a {

            text-decoration: none;
        }


        .blog-author {

            font-size: 14px;

            margin-bottom: 8px;
        }


        .blog-date {

            font-size: 13px;

            color: #777;
        }


        .blog-preview {

            margin-top: 12px;

            line-height: 1.5;
        }


        /* =========================================
           BUTTON CONTAINER
           ========================================= */

        .blog-actions {

            margin-top: 15px;

            display: flex;

            gap: 10px;
        }


        /* =========================================
           UPDATE BUTTON
           ========================================= */

        .update-btn {

            display: inline-block;

            padding: 8px 14px;

            border: none;

            border-radius: 5px;

            background: #007bff;

            color: white;

            text-decoration: none;

            cursor: pointer;
        }


        .update-btn:hover {

            background: #0056b3;
        }


        /* =========================================
           DELETE BUTTON
           ========================================= */

        .delete-btn {

            display: inline-block;

            padding: 8px 14px;

            border: none;

            border-radius: 5px;

            background: #dc3545;

            color: white;

            text-decoration: none;

            cursor: pointer;
        }


        .delete-btn:hover {

            background: #b02a37;
        }


        /* =========================================
           RESPONSIVE
           ========================================= */

        @media screen and (max-width: 900px) {

            .blog-grid {

                grid-template-columns:
                    repeat(2, 1fr);
            }
        }


        @media screen and (max-width: 600px) {

            .blog-grid {

                grid-template-columns: 1fr;
            }
        }

    </style>

</head>


<body>


    <!-- ================= NAVIGATION ================= -->

    <nav class="navigation max-width-1 m-auto">


        <!-- LEFT -->

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


    <!-- ================= HOME CONTENT ================= -->

    <div class="m-auto content max-width-1 my-2">


        <div class="content-left">

            <h1>

                The heaven for bloggers

            </h1>


            <p>

                iBlog is a website which lets you submit

                an article and share your thoughts with

                other readers.

            </p>


            <p>

                Read interesting articles, share your

                knowledge and discover new ideas from

                other bloggers.

            </p>

        </div>


        <div class="content-right">

            <img
                src="${pageContext.request.contextPath}/img/home.svg"
                alt="iBlog">

        </div>

    </div>


    <div class="max-width-1 m-auto">

        <hr>

    </div>


    <!-- ================= BLOGS ================= -->

    <div class="home-articles max-width-1 m-auto font2">


        <h2>

            Featured Articles

        </h2>


        <!-- NO BLOGS -->

        <c:if test="${empty posts}">

            <p>

                No blogs available yet.

            </p>

        </c:if>


        <!-- BLOG GRID -->

        <div class="blog-grid">


            <c:forEach
                var="post"
                items="${posts}">


                <div class="blog-card">


                    <!-- ================= IMAGE ================= -->

                    <c:choose>


                        <c:when
                            test="${not empty post.imageName}">

                            <img
                                class="blog-card-image"
                                src="${pageContext.request.contextPath}/img/blogs/${post.imageName}"
                                alt="${post.title}">

                        </c:when>


                        <c:otherwise>

                            <img
                                class="blog-card-image"
                                src="${pageContext.request.contextPath}/img/3.png"
                                alt="iBlog">

                        </c:otherwise>


                    </c:choose>


                    <!-- ================= CONTENT ================= -->

                    <div class="blog-card-content">


                        <!-- TITLE -->

                        <h3>

                            <a
                                href="${pageContext.request.contextPath}/blogpost/${post.id}">

                                ${post.title}

                            </a>

                        </h3>


                        <!-- AUTHOR -->

                        <div class="blog-author">

                            By ${post.author}

                        </div>


                        <!-- DATE -->

                        <div class="blog-date">

                            ${post.createdAt}

                        </div>


                        <!-- CONTENT PREVIEW -->

                        <div class="blog-preview">

                            ${post.content}

                        </div>


                        <!-- ================= UPDATE + DELETE ================= -->

                        <c:if
                            test="${not empty sessionScope.loggedInUser
                            and sessionScope.loggedInUser.username == post.author}">


                            <div class="blog-actions">


                                <!-- UPDATE -->

                                <a
                                    class="update-btn"
                                    href="${pageContext.request.contextPath}/updateBlog/${post.id}">

                                    Update

                                </a>


                                <!-- DELETE -->

                                <a
                                    class="delete-btn"
                                    href="${pageContext.request.contextPath}/deleteBlog/${post.id}"
                                    onclick="return confirm('Are you sure you want to delete this post?');">

                                    Delete

                                </a>


                            </div>


                        </c:if>


                    </div>


                </div>


            </c:forEach>


        </div>


    </div>


    <!-- ================= FOOTER ================= -->

    <div class="footer">

        <p>

            Copyright &copy; iBlog.com

        </p>

    </div>


</body>

</html>