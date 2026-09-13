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

    <title>Blogs - iBlog</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/utils.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/mobile.css">

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


        <!-- ================= SEARCH ================= -->

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


        <!-- ================= LOGIN ================= -->

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


    <!-- ================= BLOGS ================= -->

    <main class="home-articles max-width-1 m-auto font2">

        <h1>All Blogs</h1>


        <!-- NO BLOGS -->

        <c:if test="${empty posts}">

            <p>
                No blogs found.
            </p>

        </c:if>


        <!-- BLOG LIST -->

        <c:forEach var="post" items="${posts}">

            <div class="home-article">

                <div class="home-article-content font1">

                    <h2>

                        <a
                            href="${pageContext.request.contextPath}/blogpost/${post.id}">

                            ${post.title}

                        </a>

                    </h2>


                    <p>

                        <strong>By:</strong>
                        ${post.author}

                    </p>


                    <p>

                        ${post.content}

                    </p>


                    <br>


                    <a
                        href="${pageContext.request.contextPath}/blogpost/${post.id}">

                        Read More →

                    </a>

                </div>

            </div>

            <hr>

        </c:forEach>

    </main>


    <!-- ================= FOOTER ================= -->

    <div class="footer">

        <p>
            Copyright &copy; iBlog.com
        </p>

    </div>


</body>

</html>