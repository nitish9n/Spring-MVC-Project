<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/utils.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mobile.css">

<title>iBlog - Heaven for bloggers</title>

</head>

<body>

	<!-- ================= NAVIGATION ================= -->

	<nav class="navigation max-width-1 m-auto">

		<div class="nav-left">

			<a href="${pageContext.request.contextPath}/"> <span> <img
					src="${pageContext.request.contextPath}/img/logo.png" width="94px"
					alt="iBlog">
			</span>
			</a>

			<ul>

				<li><a href="${pageContext.request.contextPath}/"> Home </a></li>

				<li><a href="${pageContext.request.contextPath}/about">
						About </a></li>

				<li><a href="${pageContext.request.contextPath}/contact">
						Contact </a></li>

			</ul>

		</div>


		<!-- ================= SEARCH ================= -->

		<div class="nav-right">

			<form action="${pageContext.request.contextPath}/search" method="get">

				<input class="form-input" type="text" name="query"
					placeholder="Article Search">

				<button class="btn" type="submit">Search</button>

			</form>

		</div>

	</nav>


	<div class="max-width-1 m-auto">
		<hr>
	</div>


	<!-- ================= HOME CONTENT ================= -->

	<div class="m-auto content max-width-1 my-2">

		<div class="content-left">

			<h1>The heaven for bloggers</h1>

			<p>iBlog is a website which lets you submit an article which upon
				approval will be up on our website and you can get a good amount of
				reach from here!</p>

			<p>My Halloween decorations are staying in the box this year. To
				be honest, they didn’t make it out of the box last year either. My
				Halloween spirit has officially been bludgeoned to death by
				teenagers who no longer care and a persistent October fear of the
				Northern California wildfires. And speaking of fear, isn’t there
				more than enough of that going around? Maybe all of us can pretend
				that Halloween isn’t even happening this year?</p>

		</div>


		<div class="content-right">

			<img src="${pageContext.request.contextPath}/img/home.svg"
				alt="iBlog">

		</div>

	</div>


	<div class="max-width-1 m-auto">
		<hr>
	</div>


	<!-- ================= FEATURED ARTICLES ================= -->

	<div class="home-articles max-width-1 m-auto font2">

		<h2>Featured Articles</h2>


		<!-- YEAR FILTER -->

		<div class="year-box adjust-year">

			<div>
				<h3>Year</h3>
			</div>

			<div>
				<input type="radio" name="year" id="year2020"> 2020
			</div>

			<div>
				<input type="radio" name="year" id="year2021"> 2021
			</div>

		</div>


		<!-- ================= ARTICLE 1 ================= -->

		<div class="home-article">

			<div class="home-article-img">

				<img src="${pageContext.request.contextPath}/img/3.png"
					alt="article">

			</div>

			<div class="home-article-content font1">

				<a href="${pageContext.request.contextPath}/blogpost">

					<h3>Lorem ipsum dolor sit amet consectetur adipisicing.</h3>

				</a>

				<div>Author Name</div>

				<span> 07 January | 6 min read </span>

			</div>

		</div>


		<!-- ================= ARTICLE 2 ================= -->

		<div class="home-article">

			<div class="home-article-img">

				<img src="${pageContext.request.contextPath}/img/1.png"
					alt="article">

			</div>

			<div class="home-article-content font1">

				<a href="${pageContext.request.contextPath}/blogpost">

					<h3>Lorem ipsum dolor sit amet consectetur adipisicing.</h3>

				</a>

				<div>Author Name</div>

				<span> 07 January | 6 min read </span>

			</div>

		</div>


		<!-- ================= ARTICLE 3 ================= -->

		<div class="home-article">

			<div class="home-article-img">

				<img src="${pageContext.request.contextPath}/img/2.png"
					alt="article">

			</div>

			<div class="home-article-content font1">

				<a href="${pageContext.request.contextPath}/blogpost">

					<h3>Lorem ipsum dolor sit amet consectetur adipisicing.</h3>

				</a>

				<div>Author Name</div>

				<span> 07 January | 6 min read </span>

			</div>

		</div>


		<!-- ================= ARTICLE 4 ================= -->

		<div class="home-article">

			<div class="home-article-img">

				<img src="${pageContext.request.contextPath}/img/1.png"
					alt="article">

			</div>

			<div class="home-article-content font1">

				<a href="${pageContext.request.contextPath}/blogpost">

					<h3>Lorem ipsum dolor sit amet consectetur adipisicing.</h3>

				</a>

				<div>Author Name</div>

				<span> 07 January | 6 min read </span>

			</div>

		</div>


		<!-- ================= ARTICLE 5 ================= -->

		<div class="home-article">

			<div class="home-article-img">

				<img src="${pageContext.request.contextPath}/img/11.svg"
					alt="article">

			</div>

			<div class="home-article-content font1">

				<a href="${pageContext.request.contextPath}/blogpost">

					<h3>Lorem ipsum dolor sit amet consectetur adipisicing.</h3>

				</a>

				<div>Author Name</div>

				<span> 07 January | 6 min read </span>

			</div>

		</div>


		<!-- ================= ARTICLE 6 ================= -->

		<div class="home-article">

			<div class="home-article-img">

				<img src="${pageContext.request.contextPath}/img/3.png"
					alt="article">

			</div>

			<div class="home-article-content font1">

				<a href="${pageContext.request.contextPath}/blogpost">

					<h3>Lorem ipsum dolor sit amet consectetur adipisicing.</h3>

				</a>

				<div>Author Name</div>

				<span> 07 January | 6 min read </span>

			</div>

		</div>


		<!-- ================= ARTICLE 7 ================= -->

		<div class="home-article">

			<div class="home-article-img">

				<img src="${pageContext.request.contextPath}/img/2.png"
					alt="article">

			</div>

			<div class="home-article-content font1">

				<a href="${pageContext.request.contextPath}/blogpost">

					<h3>Lorem ipsum dolor sit amet consectetur adipisicing.</h3>

				</a>

				<div>Author Name</div>

				<span> 07 January | 6 min read </span>

			</div>

		</div>


		<!-- ================= ARTICLE 8 ================= -->

		<div class="home-article">

			<div class="home-article-img">

				<img src="${pageContext.request.contextPath}/img/11.svg"
					alt="article">

			</div>

			<div class="home-article-content font1">

				<a href="${pageContext.request.contextPath}/blogpost">

					<h3>Lorem ipsum dolor sit amet consectetur adipisicing.</h3>

				</a>

				<div>Author Name</div>

				<span> 07 January | 6 min read </span>

			</div>

		</div>

	</div>


	<!-- ================= FOOTER ================= -->

	<div class="footer">

		<p>Copyright &copy; iBlog.com</p>

	</div>

</body>

</html>