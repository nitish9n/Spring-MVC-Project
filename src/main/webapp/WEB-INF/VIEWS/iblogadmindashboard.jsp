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

    <title>Admin Dashboard - iBlog</title>


    <style>

        body {
            background: #f5f5f5;
        }


        .admin-container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 20px;
        }


        .admin-header {
            margin-bottom: 30px;
        }


        .admin-header h1 {
            margin-bottom: 8px;
        }


        .admin-header p {
            color: #666;
        }


        .admin-cards {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-bottom: 35px;
        }


        .admin-card {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        }


        .admin-card h3 {
            margin-bottom: 10px;
        }


        .admin-number {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 12px;
        }


        .admin-card a {
            text-decoration: none;
            font-weight: bold;
        }


        .pending-section {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        }


        .pending-section h2 {
            margin-bottom: 25px;
        }


        .pending-post {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }


        .pending-post h3 {
            margin-bottom: 10px;
        }


        .pending-author {
            color: #555;
            margin-bottom: 10px;
        }


        .pending-date {
            color: #777;
            font-size: 14px;
            margin-bottom: 15px;
        }


        .pending-content {
            line-height: 1.6;
            margin-bottom: 15px;

            display: -webkit-box;
            -webkit-line-clamp: 6;
            -webkit-box-orient: vertical;

            overflow: hidden;
        }


        .pending-image {
            width: 250px;
            height: 150px;
            object-fit: cover;
            border-radius: 6px;
            margin-bottom: 15px;
        }


        .admin-actions {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }


        .approve-btn,
        .reject-btn {
            display: inline-block;
            padding: 9px 16px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            font-weight: bold;
        }


        .approve-btn {
            background: #198754;
        }


        .approve-btn:hover {
            background: #146c43;
        }


        .reject-btn {
            background: #dc3545;
        }


        .reject-btn:hover {
            background: #b02a37;
        }


        .no-pending {
            color: #666;
            padding: 15px 0;
        }


        .admin-nav {
            display: flex;
            align-items: center;
            gap: 15px;
        }


        .admin-nav a {
            text-decoration: none;
        }


        .admin-welcome {
            font-weight: bold;
        }


        .admin-logout {
            color: #dc3545;
            font-weight: bold;
        }


        @media screen and (max-width: 700px) {

            .admin-cards {
                grid-template-columns: 1fr;
            }


            .admin-nav {
                flex-direction: column;
                align-items: flex-start;
            }


            .pending-image {
                width: 100%;
                height: auto;
            }

        }

    </style>

</head>


<body>

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
                    <a href="${pageContext.request.contextPath}/adminDashboard">
                        Dashboard
                    </a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/adminMessages">
                        Messages
                    </a>
                </li>

            </ul>

        </div>


        <div class="admin-nav">

            <c:choose>

                <c:when test="${not empty sessionScope.loggedInAdmin}">

                    <span class="admin-welcome">

                        Hi,
                        ${sessionScope.loggedInAdmin.username}

                    </span>

                    <a
                        href="${pageContext.request.contextPath}/adminLogout"
                        class="admin-logout">

                        Logout

                    </a>

                </c:when>


                <c:otherwise>

                    <a
                        href="${pageContext.request.contextPath}/adminLogin">

                        Admin Login

                    </a>

                </c:otherwise>

            </c:choose>

        </div>

    </nav>


    <div class="max-width-1 m-auto">

        <hr>

    </div>


    <div class="admin-container">

        <div class="admin-header">

            <h1>
                Admin Dashboard
            </h1>

            <p>
                Manage blogs and user messages from here.
            </p>

        </div>


        <div class="admin-cards">


            <div class="admin-card">

                <h3>
                    Pending Blogs
                </h3>

                <div class="admin-number">

                    ${pendingPosts.size()}

                </div>

                <p>
                    Blogs waiting for your approval.
                </p>

            </div>


            <div class="admin-card">

                <h3>
                    User Messages
                </h3>

                <p>
                    View messages received from users.
                </p>

                <br>

                <a
                    href="${pageContext.request.contextPath}/adminMessages">

                    View Messages

                </a>

            </div>

        </div>


        <div class="pending-section">

            <h2>
                Blogs Waiting for Approval
            </h2>


            <c:if test="${empty pendingPosts}">

                <p class="no-pending">

                    There are no blogs waiting for approval.

                </p>

            </c:if>


            <c:forEach
                var="post"
                items="${pendingPosts}">

                <div class="pending-post">


                    <h3>

                        ${post.title}

                    </h3>


                    <div class="pending-author">

                        Author:
                        ${post.author}

                    </div>


                    <div class="pending-date">

                        Submitted:
                        ${post.createdAt}

                    </div>


                    <c:choose>

                        <c:when test="${not empty post.imageName}">

                            <img
                                class="pending-image"
                                src="${pageContext.request.contextPath}/img/blogs/${post.imageName}"
                                alt="${post.title}">

                        </c:when>


                        <c:otherwise>

                            <img
                                class="pending-image"
                                src="${pageContext.request.contextPath}/img/3.png"
                                alt="iBlog">

                        </c:otherwise>

                    </c:choose>


                    <div class="pending-content">

                        ${post.content}

                    </div>


                    <div class="admin-actions">

                        <a
                            class="approve-btn"
                            href="${pageContext.request.contextPath}/approvePost/${post.id}">

                            Approve

                        </a>


                        <a
                            class="reject-btn"
                            href="${pageContext.request.contextPath}/rejectPost/${post.id}"
                            onclick="return confirm('Are you sure you want to reject this blog?');">

                            Reject

                        </a>

                    </div>

                </div>

            </c:forEach>

        </div>

    </div>


    <div class="footer">

        <p>
            Copyright &copy; iBlog.com
        </p>

    </div>


</body>

</html>