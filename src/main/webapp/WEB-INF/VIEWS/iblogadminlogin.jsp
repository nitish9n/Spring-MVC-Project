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

    <title>Admin Login - iBlog</title>

    <style>

        .admin-login-container {
            max-width: 500px;
            margin: 60px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background: #fff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        }

        .admin-login-container h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .admin-login-container .form-box {
            margin-bottom: 20px;
        }

        .admin-login-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .admin-login-container .btn {
            width: 100%;
            margin-top: 10px;
        }

        .error-message {
            color: #dc3545;
            background: #f8d7da;
            border: 1px solid #f5c2c7;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
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

            </ul>

        </div>

    </nav>


    <div class="max-width-1 m-auto">
        <hr>
    </div>


    <!-- ================= ADMIN LOGIN ================= -->

    <div class="admin-login-container">

        <h1>Admin Login</h1>

        <p style="text-align: center; margin-bottom: 25px;">
            Login to manage iBlog
        </p>


        <% 
            String error =
                (String) request.getAttribute("error");

            if (error != null) {
        %>

            <div class="error-message">
                <%= error %>
            </div>

        <%
            }
        %>


        <form
            action="${pageContext.request.contextPath}/processAdminLogin"
            method="post">


            <!-- USERNAME -->

            <div class="form-box">

                <label for="username">
                    Admin Username
                </label>

                <input
                    class="form-input"
                    type="text"
                    id="username"
                    name="username"
                    placeholder="Enter admin username"
                    required>

            </div>


            <!-- PASSWORD -->

            <div class="form-box">

                <label for="password">
                    Admin Password
                </label>

                <input
                    class="form-input"
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter admin password"
                    required>

            </div>


            <!-- LOGIN BUTTON -->

            <div class="form-box">

                <button
                    class="btn"
                    type="submit">

                    Login as Admin

                </button>

            </div>

        </form>


        <!-- BACK TO USER LOGIN -->

        <a
            class="back-link"
            href="${pageContext.request.contextPath}/login">

            ← Back to User Login

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