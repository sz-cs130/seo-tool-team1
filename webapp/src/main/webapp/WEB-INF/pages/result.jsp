<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Search Results</title>
</head>

<body>
<h2>Search Results</h2>
	<h4>Keyword: ${query}</h4>
	<h4>Site to Compare With: ${siteToCompare}</h4>
	<c:forEach items="${sites}" var="site">
		<h3>${site.domain}</h3>
		<table>
			<tr>
				<th>Content:</th>
				<td>
					<ul>
						<li>Keyword Position: ${site.keywordPos}</li>
						<li>Number of Keywords: ${site.numKeyword}</li>
					</ul>
				</td>
			</tr>
			<tr>
				<th>Description:</th>
				<td>
					<ul>
						<li>Description String: ${site.descString}</li>
						<li>Does Keyword Exist?: ${site.keywordExistsDesc}</li>
					</ul>
				</td>
			</tr>
			<tr>
				<th>Heading:</th>
				<td>
					<h5>H1 Tags</h5>
					<ul>
						<li>Keyword in Tag: ${site.keywordH1Tag}</li>
						<li>Number of Tags: ${site.numH1Tag}</li>
					</ul>
				</td>
				<td>
					<h5>H2 Tags</h5>
					<ul>
						<li>Keyword in Tag: ${site.keywordH2Tag}</li>
						<li>Number of Tags: ${site.numH2Tag}</li>
					</ul>
				</td>
				<td>
					<h5>H3 Tags</h5>
					<ul>
						<li>Keyword in Tag: ${site.keywordH3Tag}</li>
						<li>Number of Tags: ${site.numH3Tag}</li>
					</ul>
				</td>
				<td>
					<h5>H4 Tags</h5>
					<ul>
						<li>Keyword in Tag: ${site.keywordH4Tag}</li>
						<li>Number of Tags: ${site.numH4Tag}</li>
					</ul>
				</td>
				<td>
					<h5>H5 Tags</h5>
					<ul>
						<li>Keyword in Tag: ${site.keywordH5Tag}</li>
						<li>Number of Tags: ${site.numH5Tag}</li>
					</ul>
				</td>
				<td>
					<h5>H6 Tags</h5>
					<ul>
						<li>Keyword in Tag: ${site.keywordH6Tag}</li>
						<li>Number of Tags: ${site.numH6Tag}</li>
					</ul>
				</td>
			</tr>
			<tr>
				<th>Title</th>
				<td>
					<ul>
						<li>Keyword Exists: ${site.keywordExistsTitle}</li>
						<li>Title String: ${site.titleString}</li>
					</ul>
				</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>
