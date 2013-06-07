<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Analysis Results</title>
	<meta name="description" content="Results of analysis of SEO metrics with top Google search results
		and Shopzilla sites" />
	<link rel="shortcut icon" href="http://img01.shopzilla-images.com/s2static/us/sz/4e60ea69/sz2/common/images/shopzilla.ico" />

	<link href="http://twitter.github.com/bootstrap/assets/css/bootstrap.css" rel="stylesheet" media="screen">

	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript">

		google.load('visualization', '1.0', {'packages': ['corechart','table']});

		google.setOnLoadCallback(drawCharts);

		function drawCharts() {
			// The title table
			var tableData = new google.visualization.DataTable();
			tableData.addColumn('string', 'Website');
			tableData.addColumn('string', 'Title String');
			tableData.addColumn('boolean', 'Keyword Exists in Title');
			tableData.addRows([
				['${sites[0].domain}', '${sites[0].titleString}', ${sites[0].keywordExistsTitle}],
				['${sites[1].domain}', '${sites[1].titleString}', ${sites[1].keywordExistsTitle}],
				['${sites[2].domain}', '${sites[2].titleString}', ${sites[2].keywordExistsTitle}],
				['${sites[3].domain}', '${sites[3].titleString}', ${sites[3].keywordExistsTitle}]
			]);

			var titleTable = new google.visualization.Table(document.getElementById('titleTable_div'));
			titleTable.draw(tableData, {showRowNumber: false});

			// The description table
			var descData = new google.visualization.DataTable();
			descData.addColumn('string', 'Website');
			descData.addColumn('string', 'Description String');
			descData.addColumn('boolean', 'Keyword Exists in Description');
			descData.addRows([
				['${sites[0].domain}', '${sites[0].descString}', ${sites[0].keywordExistsDesc}],
				['${sites[1].domain}', '${sites[1].descString}', ${sites[1].keywordExistsDesc}],
				['${sites[2].domain}', '${sites[2].descString}', ${sites[2].keywordExistsDesc}],
				['${sites[3].domain}', '${sites[3].descString}', ${sites[3].keywordExistsDesc}]
			]);

			var descTable = new google.visualization.Table(document.getElementById('descTable_div'));
			descTable.draw(descData, {showRowNumber: false});

			// The number of keywords chart
			var numKeywordData = google.visualization.arrayToDataTable([
				['Websites', 'Number of Keywords'],
				['${sites[0].domain}', ${sites[0].numKeyword}],
				['${sites[1].domain}', ${sites[1].numKeyword}],
				['${sites[2].domain}', ${sites[2].numKeyword}],
				['${sites[3].domain}', ${sites[3].numKeyword}]
			]);

			var numKeywordOptions = {
				title: 'Number of Keywords',
				legend: {position: 'none'},
				colors: ['#3300FF'],
				backgroundColor: {stroke: '#2E2E2E', strokeWidth: 3}
			};

			var numKeywordChart = new google.visualization.BarChart(document.getElementById('numKeyword_div'));
			numKeywordChart.draw(numKeywordData, numKeywordOptions);

			// The position of keyword chart
			var posKeywordData = google.visualization.arrayToDataTable([
				['Websites', 'Position of Keyword'],
				['${sites[0].domain}', ${sites[0].keywordPos}],
				['${sites[1].domain}', ${sites[1].keywordPos}],
				['${sites[2].domain}', ${sites[2].keywordPos}],
				['${sites[3].domain}', ${sites[3].keywordPos}]
			]);

			var posKeywordOptions = {
				title: 'Position of Keyword',
				legend: {position: 'none'},
				colors: ['#3300FF'],
				backgroundColor: {stroke: '#2E2E2E', strokeWidth: 3}
			};

			var posKeywordChart = new google.visualization.BarChart(document.getElementById('posKeyword_div'));
			posKeywordChart.draw(posKeywordData, posKeywordOptions);

			// The h1 tags chart
			var h1Data = google.visualization.arrayToDataTable([
				['Websites', 'Number of H1 tags', 'Number of keywords in H1 tags'],
				['${sites[0].domain}', ${sites[0].numH1Tag}, ${sites[0].keywordH1Tag}],
				['${sites[1].domain}', ${sites[1].numH1Tag}, ${sites[1].keywordH1Tag}],
				['${sites[2].domain}', ${sites[2].numH1Tag}, ${sites[2].keywordH1Tag}],
				['${sites[3].domain}', ${sites[3].numH1Tag}, ${sites[3].keywordH1Tag}]
			]);

			var h1Options = {
				title: 'H1 tags',
				legend: {position: 'bottom'},
				colors: ['#3300FF', '#FF9900'],
				backgroundColor: {stroke: '#2E2E2E', strokeWidth: 3}
			};

			var h1Chart = new google.visualization.BarChart(document.getElementById('h1_div'));
			h1Chart.draw(h1Data, h1Options);

			// The h2 tags chart
			var h2Data = google.visualization.arrayToDataTable([
				['Websites', 'Number of H2 tags', 'Number of keywords in H2 tags'],
				['${sites[0].domain}', ${sites[0].numH2Tag}, ${sites[0].keywordH2Tag}],
				['${sites[1].domain}', ${sites[1].numH2Tag}, ${sites[1].keywordH2Tag}],
				['${sites[2].domain}', ${sites[2].numH2Tag}, ${sites[2].keywordH2Tag}],
				['${sites[3].domain}', ${sites[3].numH2Tag}, ${sites[3].keywordH2Tag}]
			]);

			var h2Options = {
				title: 'H2 tags',
				legend: {position: 'bottom'},
				colors: ['#3300FF', '#FF9900'],
				backgroundColor: {stroke: '#2E2E2E', strokeWidth: 3}
			};

			var h2Chart = new google.visualization.BarChart(document.getElementById('h2_div'));
			h2Chart.draw(h2Data, h2Options);

			// The h3 tags chart
			var h3Data = google.visualization.arrayToDataTable([
				['Websites', 'Number of H3 tags', 'Number of keywords in H3 tags'],
				['${sites[0].domain}', ${sites[0].numH3Tag}, ${sites[0].keywordH3Tag}],
				['${sites[1].domain}', ${sites[1].numH3Tag}, ${sites[1].keywordH3Tag}],
				['${sites[2].domain}', ${sites[2].numH3Tag}, ${sites[2].keywordH3Tag}],
				['${sites[3].domain}', ${sites[3].numH3Tag}, ${sites[3].keywordH3Tag}]
			]);

			var h3Options = {
				title: 'H3 tags',
				legend: {position: 'bottom'},
				colors: ['#3300FF', '#FF9900'],
				backgroundColor: {stroke: '#2E2E2E', strokeWidth: 3}
			};

			var h3Chart = new google.visualization.BarChart(document.getElementById('h3_div'));
			h3Chart.draw(h3Data, h3Options);

			// The h4 tags chart
			var h4Data = google.visualization.arrayToDataTable([
				['Websites', 'Number of H4 tags', 'Number of keywords in H4 tags'],
				['${sites[0].domain}', ${sites[0].numH4Tag}, ${sites[0].keywordH4Tag}],
				['${sites[1].domain}', ${sites[1].numH4Tag}, ${sites[1].keywordH4Tag}],
				['${sites[2].domain}', ${sites[2].numH4Tag}, ${sites[2].keywordH4Tag}],
				['${sites[3].domain}', ${sites[3].numH4Tag}, ${sites[3].keywordH4Tag}]
			]);

			var h4Options = {
				title: 'H4 tags',
				legend: {position: 'bottom'},
				colors: ['#3300FF', '#FF9900'],
				backgroundColor: {stroke: '#2E2E2E', strokeWidth: 3}
			};

			var h4Chart = new google.visualization.BarChart(document.getElementById('h4_div'));
			h4Chart.draw(h4Data, h4Options);

			// The h5 tags chart
			var h5Data = google.visualization.arrayToDataTable([
				['Websites', 'Number of H5 tags', 'Number of keywords in H5 tags'],
				['${sites[0].domain}', ${sites[0].numH5Tag}, ${sites[0].keywordH5Tag}],
				['${sites[1].domain}', ${sites[1].numH5Tag}, ${sites[1].keywordH5Tag}],
				['${sites[2].domain}', ${sites[2].numH5Tag}, ${sites[2].keywordH5Tag}],
				['${sites[3].domain}', ${sites[3].numH5Tag}, ${sites[3].keywordH5Tag}]
			]);

			var h5Options = {
				title: 'H5 tags',
				legend: {position: 'bottom'},
				colors: ['#3300FF', '#FF9900'],
				backgroundColor: {stroke: '#2E2E2E', strokeWidth: 3}
			};

			var h5Chart = new google.visualization.BarChart(document.getElementById('h5_div'));
			h5Chart.draw(h5Data, h5Options);

			// The h6 tags chart
			var h6Data = google.visualization.arrayToDataTable([
				['Websites', 'Number of H6 tags', 'Number of keywords in H6 tags'],
				['${sites[0].domain}', ${sites[0].numH6Tag}, ${sites[0].keywordH6Tag}],
				['${sites[1].domain}', ${sites[1].numH6Tag}, ${sites[1].keywordH6Tag}],
				['${sites[2].domain}', ${sites[2].numH6Tag}, ${sites[2].keywordH6Tag}],
				['${sites[3].domain}', ${sites[3].numH6Tag}, ${sites[3].keywordH6Tag}]
			]);

			var h6Options = {
				title: 'H6 tags',
				legend: {position: 'bottom'},
				colors: ['#3300FF', '#FF9900'],
				backgroundColor: {stroke: '#2E2E2E', strokeWidth: 3}
			};

			var h6Chart = new google.visualization.BarChart(document.getElementById('h6_div'));
			h6Chart.draw(h6Data, h6Options);
		}
	</script>

</head>

<body>
	<div class="container-fluid">
		<div class="page-header">
			<a class="brand"> <img src="${pageContext.request.contextPath}/resources/images/Shopzilla_Logo.png"></a>
			<h1>SEO Tool Analysis Results<small> Based on keyword: ${query}</small></h1>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<h3>Title</h3>
				<div id='titleTable_div'></div>
				<h5>Recommendation: ${recs.keywordExistsTitleRec}</h5>
				<hr>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<h3>Description</h3>
				<div id='descTable_div'></div>
				<h5>Recommendation: ${recs.keywordExistsDescRec}</h5>
				<hr>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<h3>Content</h3>
				<div class="row-fluid">
					<div class="span6">
						<div id='numKeyword_div'></div>
						<h5>Recommendation: ${recs.numKeywordRec}</h5>
					</div>
					<div class="span6">
						<div id='posKeyword_div'></div>
						<h5>Recommendation: ${recs.keywordPosRec}</h5>
					</div>
				</div>
				<hr>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<h3>Heading tags</h3>
				<div class="row-fluid">
					<div class="span6">
						<div id='h1_div'></div>
						<h5>Recommendations:<br>${recs.numH1TagRec}<br>${recs.keywordH1TagRec}</h5>
					</div>
					<div class="span6">
						<div id='h2_div'></div>
						<h5>Recommendations:<br>${recs.numH2TagRec}<br>${recs.keywordH2TagRec}</h5>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div id='h3_div'></div>
						<h5>Recommendations:<br>${recs.numH3TagRec}<br>${recs.keywordH3TagRec}</h5>
					</div>
					<div class="span6">
        					<div id='h4_div'></div>
						<h5>Recommendations:<br>${recs.numH4TagRec}<br>${recs.keywordH4TagRec}</h5>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div id='h5_div'></div>
						<h5>Recommendations:<br>${recs.numH5TagRec}<br>${recs.keywordH5TagRec}</h5>
					</div>
					<div class="span6">
        					<div id='h6_div'></div>
						<h5>Recommendations:<br>${recs.numH6TagRec}<br>${recs.keywordH6TagRec}</h5>
					</div>
				</div>
				<hr>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="nav">
			<a href="/seotool-team1-webapp/search/" class="btn btn-primary" type="button">Back to search</a>
		</div>
	</div>
</body>
</html>
