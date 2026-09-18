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

    <title>iBlog - Heaven for bloggers</title>


    <style>

        /* =========================================
           BLOG GRID
           ========================================= */

        .blog-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
            margin-top: 25px;
        }


        .blog-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            background: white;
            box-shadow:
                0 2px 8px rgba(0, 0, 0, 0.08);
        }


        .blog-card-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            display: block;
        }


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

            display: -webkit-box;
            -webkit-line-clamp: 4;
            -webkit-box-orient: vertical;

            overflow: hidden;
        }


        /* =========================================
           READ MORE
           ========================================= */

        .read-more {
            display: inline-block;
            margin-top: 12px;
            text-decoration: none;
            font-weight: bold;
        }


        /* =========================================
           OWNER BUTTONS
           ========================================= */

        .blog-actions {
            margin-top: 15px;
            display: flex;
            gap: 8px;
        }


        .update-btn,
        .delete-btn {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            font-size: 14px;
        }


        .update-btn {
            background: #457b9d;
        }


        .update-btn:hover {
            background: #35657f;
        }


        .delete-btn {
            background: #dc3545;
        }


        .delete-btn:hover {
            background: #b02a37;
        }


        /* =========================================
           USER NAVIGATION
           ========================================= */

        .user-nav {
            display: flex;
            align-items: center;
            gap: 12px;
        }


        .user-nav a {
            text-decoration: none;
        }


        .welcome-user {
            font-size: 14px;
        }


        .logout-link {
            color: #dc3545;
            font-weight: bold;
        }


        .messages-link {
            font-weight: bold;
        }


        /* =========================================
           RESPONSIVE
           ========================================= */

        @media screen and (max-width: 900px) {

            .blog-grid {
                grid-template-columns: repeat(2, 1fr);
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


    <!-- NAVIGATION -->

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
                    placeholder="Article Search"
                    required>

                <button
                    class="btn"
                    type="submit">

                    Search

                </button>

            </form>

        </div>


        <!-- LOGIN / USER -->

        <div class="nav-login">

            <c:choose>

                <c:when test="${not empty sessionScope.loggedInUser}">

                    <div class="user-nav">

                        <span class="welcome-user">

                            Hi,
                            ${sessionScope.loggedInUser.username}

                        </span>


                        <a
                            href="${pageContext.request.contextPath}/myMessages"
                            class="messages-link">

                            My Messages

                        </a>


                        <a
                            href="${pageContext.request.contextPath}/logout"
                            class="logout-link">

                            Logout

                        </a>

                    </div>

                </c:when>


                <c:otherwise>

                    <a
                        href="${pageContext.request.contextPath}/login"
                        class="login-link">

                        Sign In

                    </a>

                </c:otherwise>

            </c:choose>

        </div>

    </nav>


    <div class="max-width-1 m-auto">

        <hr>

    </div>


    <!-- HOME CONTENT -->

    <div class="m-auto content max-width-1 my-2">

        <div class="content-left">

            <h1>
                The heaven for bloggers
            </h1>


            <p>

                iBlog is a website which lets you
                submit an article and share your
                thoughts with other readers.

            </p>


            <p>

                Read interesting articles, share your
                knowledge and discover new ideas
                from other bloggers.

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


    <!-- BLOGS -->

    <div class="home-articles max-width-1 m-auto font2">

        <h2>
            Featured Articles
        </h2>


        <c:if test="${empty posts}">

            <p>
                No blogs available yet.
            </p>

        </c:if>


        <div class="blog-grid">

            <c:forEach
                var="post"
                items="${posts}">

                <div class="blog-card">


                    <!-- IMAGE -->

                    <c:choose>

                        <c:when test="${not empty post.imageName}">

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


                    <!-- CONTENT -->

                    <div class="blog-card-content">


                        <h3>

                            <a
                                href="${pageContext.request.contextPath}/blogpost/${post.id}">

                                ${post.title}

                            </a>

                        </h3>


                        <div class="blog-author">

                            By ${post.author}

                        </div>


                        <div class="blog-date">

                            ${post.createdAt}

                        </div>


                        <div class="blog-preview">

                            ${post.content}

                        </div>


                        <a
                            class="read-more"
                            href="${pageContext.request.contextPath}/blogpost/${post.id}">

                            Read Full Blog →

                        </a>


                        <c:if test="${not empty sessionScope.loggedInUser and sessionScope.loggedInUser.username == post.author}">

                            <div class="blog-actions">

                                <a
                                    class="update-btn"
                                    href="${pageContext.request.contextPath}/updateBlog/${post.id}">

                                    Update

                                </a>


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


    <!-- FOOTER -->

    <div class="footer">

        <p>
            Copyright &copy; iBlog.com
        </p>

    </div>


</body>

</html>