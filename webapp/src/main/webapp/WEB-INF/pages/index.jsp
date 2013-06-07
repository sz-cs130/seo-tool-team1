<!Doctype html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
	<title>Shopzilla SEO Tool</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="description" content="Analysis of SEO metrics with top Google search results and Shopzilla sites" />
	<link rel="shortcut icon" href="http://img01.shopzilla-images.com/s2static/us/sz/4e60ea69/sz2/common/images/shopzilla.ico" />

	<link href="http://twitter.github.com/bootstrap/assets/css/bootstrap.css" rel="stylesheet" media="screen" />
</head>

<style>
.content {
padding:40px auto 0 auto;
height:100%;
background-image: linear-gradient(left, rgba(0,23,79,1) 0%, rgba(0,23,79,.95) 5%, rgba(125,185,232,1) 100%);
background-image: -o-linear-gradient(left, rgba(0,23,79,1) 0%, rgba(0,23,79,0.95) 5%. rgba(125,185,232,1) 100%);
background-image: -moz-linear-gradient(left, rgba(0,23,160,1) 0%, rgba(0,23,79,0.95) 5%, rgba(125,185,232,1) 100%);
background-image: -webkit-linear-gradient(left, rgba(0,23,160,1) 0%, rgba(0,23,79,0.95) 5%, rgba(125,185,232,1) 100%);
background-image: -ms-linear-gradient(left, rgba(0,23,160,1) 0%, rgba(0,23,79,0.95) 5%, rgba(125,185,232,1) 100%);

background-image: -webkit-gradient(
	linear,
	left bottom,
	right bottom,
	color-stop(0, rgba(0,23,160,1)),
	color-stop(0.05, rgba(0,23,79,0.95))
	color-stop(1, rgba(125,185,232,1))
);
position:relative;
color: #FFFFFF;
}

</style>

<body class="content">
	<div class="container-fluid" style="background: white;">
		<div class="page-header">
			<a class="brand"> <img src="//upload.wikimedia.org/wikipedia/en/8/80/Shopzilla_Logo.png"></a>
			<h1 style="padding-left:40px; color: #2e2e2e;">SEO Tool</h1>
		</div>
	</div>
	<div class="container-fluid">
		<div style="padding-top:40px; padding-left:40px;">
		<form:form id="ui_element" action="/result" method="POST">
			<form:input path="query" type="text" class="input-xxlarge search-query" placeholder="Search by Keyword" />
			<form:input path="query" type="submit" class="btn btn-warning" value="Analyze" />
			<ul class="unstyled">
				<br><li>Chose site to analyze:</li>
				<li><form:radiobutton path="siteToCompare" name="site" value="shopzilla"/>Shopzilla</li>
				<li><form:radiobutton path="siteToCompare" name="site" value="retrevo"/>Retrevo</li>
				<li><form:radiobutton path="siteToCompare" name="site" value="bizrate"/>Bizrate</li>
			</ul>
		</form:form>
		</div>
	</div>

</body>
</html>
