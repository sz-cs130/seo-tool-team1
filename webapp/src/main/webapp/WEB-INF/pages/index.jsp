<!Doctype html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
    <head>
        <title>Shopzilla SEO Tool</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Analysis of SEO metrics with top Google search results and Shopzilla sites" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css"/>
        <style>
            *{
                padding:0;
                margin:0;
            }
             body{
                background:transparent url(http://tympanus.net/codrops/wp-content/themes/codropstheme/images/bg_main.png) repeat scroll left top;
                font-family:"Helvetica Neue",Arial,Helvetica,Geneva,sans-serif;

            }
            h1{
                font-size:180px;
                line-height:180px;
                text-transform: uppercase;
                color:#1275AD;
                position:absolute;
                text-shadow:0 1px 1px #45A8DF;
                top:-25px;
                left:-20px;
                white-space: nowrap;
            }
            span.reference{
                position:fixed;
                left:10px;
                bottom:10px;
                font-size:11px;
            }
            span.reference a{
                color:#fff;
                text-decoration:none;
                text-transform: uppercase;
                text-shadow:0 1px 0 #000;
            }
            span.reference a:hover{
                color:#f0f0f0;
            }
            .box{
                margin:129px auto 0 auto;
                height:430px;
                width:100%;
                position:relative;
                -moz-box-shadow:0px 0px 5px #444;
                -webkit-box-shadow:0px 0px 5px #444;
                box-shadow:0px 0px 5px #444;
				background:#1783BF url("${pageContext.request.contextPath}/resources/images/Shopzilla_Logo.png") no-repeat 422px 77px;
            }
            .box h2{
				background-color:#1275AD;
				border-color:#0E5A85 #0E5A85 #0E5A85;
				border-style:ridge ridge solid;
				border-width:1px;
				color:#FFFFFF;
				font-size:22px;
				padding:10px;
				text-shadow:1px 1px 1px #000000;
            }

        </style>
    </head>
    <body>
        <div class="content">
            <h1>SEO Tool</h1>
			<div class="box">
				<h2>Search by Keyword</h2>
                <form:form id="ui_element" class="sb_wrapper" action="/result" method="POST">
                    <p>
						<span class="sb_down"></span>
						<form:input path="query" class="sb_input" type="text"/>
						<form:input path="query" class="sb_search" type="submit" value=""/>

					</p>
					<ul class="sb_dropdown" style="display:none;">
						<li class="sb_filter">Filter your search</li>
						<li><form:radiobutton path="siteToCompare" name="site" value="retrevo"/>Retrevo</li>
						<li><form:radiobutton path="siteToCompare" name="site" value="shopzilla"/>Shopzilla</li>
						<li><form:radiobutton path="siteToCompare" name="site" value="bizrate"/>Bizrate</li>
					</ul>
                </form:form>
            </div>
        </div>

				<!--<h2>Query Information</h2>
				<form:form method="POST" action="/result">
					<table>
					<tr>
						<td><form:label path="query">Query</form:label></td>
						<td><form:input path="query" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="Submit"/>
						</td>
					</tr>
				</table>
				</form:form>-->

		<!-- The JavaScript -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script type="text/javascript">
            $(function() {
				/**
				* the element
				*/
				var $ui 		= $('#ui_element');
				
				/**
				* on focus and on click display the dropdown, 
				* and change the arrow image
				*/
				$ui.find('.sb_input').bind('focus click',function(){
					$ui.find('.sb_down')
					   .addClass('sb_up')
					   .removeClass('sb_down')
					   .andSelf()
					   .find('.sb_dropdown')
					   .show();
				});
				
				/**
				* on mouse leave hide the dropdown, 
				* and change the arrow image
				*/
				$ui.bind('mouseleave',function(){
					$ui.find('.sb_up')
					   .addClass('sb_down')
					   .removeClass('sb_up')
					   .andSelf()
					   .find('.sb_dropdown')
					   .hide();
				});
				
				/**
				* Not using checkboxes
				
				$ui.find('.sb_dropdown').find('label[for="all"]').prev().bind('click',function(){
					$(this).parent().siblings().find(':checkbox').attr('checked',this.checked).attr('disabled',this.checked);
				});

				*/

            });
        </script>	
    </body>
</html>
