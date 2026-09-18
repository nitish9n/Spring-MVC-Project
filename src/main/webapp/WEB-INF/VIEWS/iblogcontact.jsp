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

    <title>Contact Us - iBlog</title>

</head>


<body>


    <!-- =========================================
         NAVIGATION
         ========================================= -->

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


        <!-- =====================================
             SEARCH
             ===================================== -->

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


        <!-- =====================================
             LOGIN
             ===================================== -->

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


    <!-- =========================================
         CONTACT CONTENT
         ========================================= -->

    <div class="contact-content max-width-1 m-auto my-2">


        <h1>
            Contact Us
        </h1>


        <p>
            Have a question, suggestion, or problem?
            Send us a message and our admin will get
            back to you.
        </p>


        <!-- =====================================
             SUCCESS MESSAGE
             ===================================== -->

        <%
            String success =
                    request.getParameter("success");
        %>

        <% if ("true".equals(success)) { %>

            <div
                style="
                    background: #d4edda;
                    color: #155724;
                    padding: 12px;
                    margin: 20px 0;
                    border-radius: 5px;
                ">

                Your message has been sent successfully.
                Admin will reply soon.

            </div>

        <% } %>


        <!-- =====================================
             CONTACT FORM
             ===================================== -->

        <form
            action="${pageContext.request.contextPath}/processContact"
            method="post">


            <!-- NAME -->

            <div class="form-box">

                <label for="name">
                    Your Name
                </label>

                <input
                    class="form-input"
                    type="text"
                    id="name"
                    name="name"
                    value="${loggedInUser.username}"
                    placeholder="Enter your name"
                    required>

            </div>


            <!-- EMAIL -->

            <div class="form-box">

                <label for="email">
                    Email
                </label>

                <input
                    class="form-input"
                    type="email"
                    id="email"
                    name="email"
                    value="${loggedInUser.email}"
                    placeholder="Enter your email"
                    required>

            </div>


            <!-- SUBJECT -->

            <div class="form-box">

                <label for="subject">
                    Subject
                </label>

                <input
                    class="form-input"
                    type="text"
                    id="subject"
                    name="subject"
                    placeholder="Enter subject"
                    required>

            </div>


            <!-- MESSAGE -->

            <div class="form-box">

                <label for="message">
                    Message
                </label>

                <textarea
                    class="form-input"
                    id="message"
                    name="message"
                    rows="10"
                    placeholder="Write your message here..."
                    required></textarea>

            </div>


            <!-- SUBMIT -->

            <div class="form-box">

                <button
                    class="btn"
                    type="submit">

                    Send Message

                </button>

            </div>


        </form>


        <!-- =====================================
             USER MESSAGE LINK
             ===================================== -->

        <div style="margin-top: 25px;">

            <a
                href="${pageContext.request.contextPath}/myMessages"
                class="btn">

                View My Messages & Replies

            </a>

        </div>


    </div>


    <!-- =========================================
         FOOTER
         ========================================= -->

    <div class="footer">

        <p>
            Copyright &copy; iBlog.com
        </p>

    </div>


</body>

</html>