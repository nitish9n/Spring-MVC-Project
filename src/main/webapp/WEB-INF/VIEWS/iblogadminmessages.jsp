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

    <title>Admin Messages - iBlog</title>


    <style>

        body {
            background: #f5f5f5;
        }


        .admin-container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }


        .admin-header {
            margin-bottom: 30px;
        }


        .admin-header h1 {
            margin-bottom: 10px;
        }


        .admin-header p {
            color: #666;
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
            margin-bottom: 15px;
        }


        .message-info {
            color: #666;
            font-size: 14px;
            margin-bottom: 15px;
        }


        .message-content {
            background: #f7f7f7;
            padding: 15px;
            border-radius: 5px;
            line-height: 1.6;
            white-space: pre-wrap;
            margin-bottom: 20px;
        }


        .reply-box {
            margin-top: 20px;
        }


        .reply-box label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }


        .reply-box textarea {
            width: 100%;
            min-height: 120px;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: vertical;
            box-sizing: border-box;
            font-family: inherit;
        }


        .reply-btn {
            margin-top: 10px;
            padding: 10px 18px;
            border: none;
            border-radius: 5px;
            background: #457b9d;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }


        .reply-btn:hover {
            background: #35657f;
        }


        .previous-reply {
            background: #eaf7f5;
            padding: 15px;
            border-radius: 5px;
            line-height: 1.6;
            white-space: pre-wrap;
            margin-bottom: 20px;
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


        .logout-link {
            color: #dc3545;
            font-weight: bold;
        }


        .back-link {
            display: inline-block;
            margin-bottom: 25px;
            text-decoration: none;
            font-weight: bold;
        }


        @media screen and (max-width: 700px) {

            .admin-nav {
                flex-direction: column;
                align-items: flex-start;
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
                        class="logout-link">

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
                User Messages
            </h1>

            <p>
                Messages received from iBlog users.
            </p>

        </div>


        <a
            href="${pageContext.request.contextPath}/adminDashboard"
            class="back-link">

            ← Back to Dashboard

        </a>


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
                                Name:
                            </strong>

                            ${message.name}

                            &nbsp;&nbsp; | &nbsp;&nbsp;


                            <strong>
                                Email:
                            </strong>

                            ${message.email}

                        </div>


                        <div class="message-info">

                            <strong>
                                Sent:
                            </strong>

                            ${message.createdAt}

                            &nbsp;&nbsp; | &nbsp;&nbsp;


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


                        <div>

                            <strong>
                                User Message
                            </strong>

                        </div>


                        <div class="message-content">

                            ${message.message}

                        </div>


                        <c:if test="${not empty message.reply}">

                            <div>

                                <strong>
                                    Previous Admin Reply
                                </strong>

                            </div>


                            <div class="previous-reply">

                                ${message.reply}

                            </div>

                        </c:if>


                        <div class="reply-box">


                            <form
                                action="${pageContext.request.contextPath}/replyMessage"
                                method="post">


                                <input
                                    type="hidden"
                                    name="id"
                                    value="${message.id}">


                                <label
                                    for="reply-${message.id}">

                                    Reply to User

                                </label>


                                <textarea
                                    id="reply-${message.id}"
                                    name="reply"
                                    placeholder="Write your reply here..."
                                    required></textarea>


                                <button
                                    type="submit"
                                    class="reply-btn">

                                    Send Reply

                                </button>


                            </form>


                        </div>


                    </div>


                </c:forEach>


            </c:when>


            <c:otherwise>


                <div class="no-messages">

                    <h2>
                        No Messages Yet
                    </h2>

                    <p style="margin-top: 10px;">

                        No user messages have been
                        received yet.

                    </p>

                </div>


            </c:otherwise>


        </c:choose>


    </div>


    <div class="footer">

        <p>
            Copyright &copy; iBlog.com
        </p>

    </div>


</body>

</html>