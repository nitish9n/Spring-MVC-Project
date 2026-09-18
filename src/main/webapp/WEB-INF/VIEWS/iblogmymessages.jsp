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

    <title>My Messages - iBlog</title>


    <style>

        .messages-container {
            width: 90%;
            max-width: 1000px;
            margin: 40px auto;
        }


        .message-card {
            background: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow:
                0 2px 8px rgba(0, 0, 0, 0.08);
        }


        .message-card h2 {
            margin-bottom: 12px;
        }


        .message-info {
            color: #666;
            font-size: 14px;
            margin-bottom: 18px;
        }


        .message-section {
            margin-top: 18px;
        }


        .message-section h3 {
            margin-bottom: 8px;
        }


        .message-text {
            background: #f7f7f7;
            padding: 15px;
            border-radius: 5px;
            line-height: 1.6;
            white-space: pre-wrap;
        }


        .reply-box {
            background: #eaf7f5;
            padding: 15px;
            border-radius: 5px;
            line-height: 1.6;
            white-space: pre-wrap;
        }


        .status {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 15px;
            font-size: 13px;
            font-weight: bold;
        }


        .pending {
            background: #fff3cd;
            color: #856404;
        }


        .replied {
            background: #d4edda;
            color: #155724;
        }


        .no-messages {
            background: #ffffff;
            text-align: center;
            padding: 40px;
            border-radius: 8px;
            border: 1px solid #ddd;
        }


        .user-nav {
            display: flex;
            align-items: center;
            gap: 15px;
        }


        .user-nav a {
            text-decoration: none;
        }


        .welcome-user {
            font-size: 14px;
        }


        .messages-link {
            font-weight: bold;
        }


        .logout-link {
            color: #dc3545;
            font-weight: bold;
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


        <!-- USER NAVIGATION -->

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


    <!-- MESSAGES -->

    <div class="messages-container">


        <h1>
            My Messages
        </h1>


        <p style="margin-top: 10px; margin-bottom: 25px;">

            Messages you have sent to the iBlog admin
            and their replies.

        </p>


        <c:choose>


            <c:when test="${not empty messages}">


                <c:forEach
                    var="message"
                    items="${messages}">


                    <div class="message-card">


                        <h2>

                            ${message.subject}

                        </h2>


                        <div class="message-info">

                            <strong>
                                Sent:
                            </strong>

                            ${message.createdAt}

                            &nbsp; | &nbsp;


                            <strong>
                                Status:
                            </strong>


                            <c:choose>

                                <c:when test="${message.status == 'REPLIED'}">

                                    <span class="status replied">

                                        REPLIED

                                    </span>

                                </c:when>


                                <c:otherwise>

                                    <span class="status pending">

                                        PENDING

                                    </span>

                                </c:otherwise>

                            </c:choose>

                        </div>


                        <div class="message-section">

                            <h3>
                                Your Message
                            </h3>


                            <div class="message-text">

                                ${message.message}

                            </div>

                        </div>


                        <c:choose>


                            <c:when test="${not empty message.reply}">


                                <div class="message-section">

                                    <h3>
                                        Admin Reply
                                    </h3>


                                    <div class="reply-box">

                                        ${message.reply}

                                    </div>

                                </div>


                                <div
                                    class="message-info"
                                    style="margin-top: 12px;">

                                    <strong>
                                        Replied:
                                    </strong>

                                    ${message.repliedAt}

                                </div>


                            </c:when>


                            <c:otherwise>


                                <div class="message-section">

                                    <h3>
                                        Admin Reply
                                    </h3>


                                    <div class="message-text">

                                        Your message is waiting
                                        for an admin reply.

                                    </div>

                                </div>


                            </c:otherwise>


                        </c:choose>


                    </div>


                </c:forEach>


            </c:when>


            <c:otherwise>


                <div class="no-messages">

                    <h2>
                        No Messages Yet
                    </h2>


                    <p style="margin-top: 10px;">

                        You have not contacted the
                        iBlog admin yet.

                    </p>


                    <p style="margin-top: 20px;">

                        <a
                            href="${pageContext.request.contextPath}/contact"
                            class="btn">

                            Contact Admin

                        </a>

                    </p>

                </div>


            </c:otherwise>


        </c:choose>


    </div>


    <!-- FOOTER -->

    <div class="footer">

        <p>
            Copyright &copy; iBlog.com
        </p>

    </div>


</body>

</html>