
<!DOCTYPE html>
<html lang="en">
<head>
<title>Jubilant | Dashboard Demo</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="images/icons/favicon.ico">
<link rel="apple-touch-icon" href="images/icons/favicon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="images/icons/favicon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="images/icons/favicon-114x114.png">
<!--Loading bootstrap css-->
<link type="text/css" rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
<link type="text/css" rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
<link type="text/css" rel="stylesheet"
	href="styles/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet"
	href="styles/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="styles/animate.css">
<link type="text/css" rel="stylesheet" href="styles/all.css">
<link type="text/css" rel="stylesheet" href="styles/main.css">
<link type="text/css" rel="stylesheet"
	href="styles/style-responsive.css">
<link type="text/css" rel="stylesheet"
	href="styles/zabuto_calendar.min.css">
<link type="text/css" rel="stylesheet" href="styles/pace.css">
<link rel="stylesheet" type="text/css"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/flick/jquery-ui.css">

<link type="text/css" rel="stylesheet" href="styles/demojplist.css">
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.core.min.css"
	rel="stylesheet" type="text/css" />

<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.filter-toggle-bundle.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.pagination-bundle.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.history-bundle.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.textbox-filter.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.jquery-ui-bundle.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.preloader-control.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.start-rating-control.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.views-control.min.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div>
		<!--BEGIN BACK TO TOP-->
		<a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
		<!--END BACK TO TOP-->
		<!--BEGIN TOPBAR-->
		<div id="header-topbar-option-demo" class="page-header-topbar">
			<nav id="topbar" role="navigation" style="margin-bottom: 0;"
				data-step="3" class="navbar navbar-default navbar-static-top">
				<div class="navbar-header">
					<button type="button" data-toggle="collapse"
						data-target=".sidebar-collapse" class="navbar-toggle">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a id="logo" href="#" class="navbar-brand"><span
						class="fa fa-rocket"></span><span class="logo-text">DashboardDemo</span><span
						style="display: none" class="logo-text-icon">DBoard</span></a>
				</div>
				<div class="topbar-main">
					<a id="menu-toggle" href="#" class="hidden-xs"><i
						class="fa fa-bars"></i></a>
					<ul class="nav navbar navbar-top-links navbar-right mbn">
						<li class="dropdown"><a data-hover="dropdown" href="#"
							class="dropdown-toggle"><i class="fa fa-bell fa-fw"></i><span
								class="badge badge-green">3</span></a></li>
						<li class="dropdown"><a data-hover="dropdown" href="#"
							class="dropdown-toggle"><i class="fa fa-envelope fa-fw"></i><span
								class="badge badge-orange">7</span></a></li>
						<li class="dropdown"><a data-hover="dropdown" href="#"
							class="dropdown-toggle"><i class="fa fa-tasks fa-fw"></i><span
								class="badge badge-yellow">8</span></a></li>
						<li class="dropdown topbar-user"><a data-hover="dropdown"
							href="#" class="dropdown-toggle"><img
								src="images/avatar/48.jpg" alt=""
								class="img-responsive img-circle" />&nbsp;<span
								class="hidden-xs">Mayank Sunny</span>&nbsp;<span class="caret"></span></a>
							<ul class="dropdown-menu dropdown-user pull-right">
								<li><a href="#"><i class="fa fa-user"></i>My Profile</a></li>
								<li><a href="#"><i class="fa fa-calendar"></i>My
										Calendar</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i>My Inbox<span
										class="badge badge-danger">3</span></a></li>
								<li><a href="#"><i class="fa fa-tasks"></i>My Tasks<span
										class="badge badge-success">7</span></a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="fa fa-lock"></i>Lock Screen</a></li>
								<li><a href="#"><i class="fa fa-key"></i>Log Out</a></li>
							</ul></li>
						<li id="topbar-chat" class="hidden-xs"><a
							href="javascript:void(0)" data-step="4"
							data-intro="&lt;b&gt;Form chat&lt;/b&gt; keep you connecting with other coworker"
							data-position="left" class="btn-chat"><i
								class="fa fa-comments"></i><span class="badge badge-info">3</span></a></li>
					</ul>
				</div>
			</nav>
		</div>
		<!--END TOPBAR-->
		<div id="wrapper">
			<!--BEGIN SIDEBAR MENU-->
			<nav id="sidebar" role="navigation" data-step="2"
				data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
				data-position="right" class="navbar-default navbar-static-side">
				<div class="sidebar-collapse menu-scroll">
					<ul id="side-menu" class="nav">

						<div class="clearfix"></div>
						<li><a href="/DashboardDemo"><i
								class="fa fa-tachometer fa-fw">
									<div class="icon-bg bg-orange"></div>
							</i><span class="menu-title">Dashboard</span></a></li>
					</ul>
				</div>
			</nav>


			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<div class="page-header pull-left">
						<div class="page-title">HR Action Dashboard</div>
					</div>
					<ol class="breadcrumb page-breadcrumb pull-right">
						<li><i class="fa fa-home"></i>&nbsp;<a href="#">Home</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li class="hidden"><a href="#">Dashboard</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li class="active">Dashboard</li>
					</ol>
					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
					<div id="tab-general">
						<div class="row mbl">
							<div class="col-lg-12">
								<div class="row">
									<div class="panel">
										<div class="panel-body">
											<!-- demo -->
											<div id="demo" class="box jplist">

												<!-- ios button: show/hide panel -->
												<div class="jplist-ios-button">
													<i class="fa fa-sort"></i> jPList Actions
												</div>

												<!-- panel -->
												<div class="jplist-panel box panel-top">

													<!-- New Activity Button -->
													<button type="button" class="btn btn-default"
														id="showAddNewActivityDiv">
														<i class="fa fa-plus"></i>&nbsp;Plan New Activity
													</button>

													<!-- reset button -->
													<button type="button" class="jplist-reset-btn"
														data-control-type="reset" data-control-name="reset"
														data-control-action="reset">
														Reset &nbsp;<i class="fa fa-share"></i>
													</button>

													<!-- items per page dropdown -->
													<div class="jplist-drop-down"
														data-control-type="items-per-page-drop-down"
														data-control-name="paging" data-control-action="paging">

														<ul>
															<li><span data-number="3"> 3 per page </span></li>
															<li><span data-number="5"> 5 per page </span></li>
															<li><span data-number="10" data-default="true">
																	10 per page </span></li>
															<li><span data-number="all"> View All </span></li>
														</ul>
													</div>

													<!-- filter by Employee Name -->
													<div class="text-filter-box">

														<i class="fa fa-search  jplist-icon"></i>

														<!--[if lt IE 10]>
			            <div class="jplist-label">Filter by Title:</div>
			            <![endif]-->

														<input data-path=".title" type="text" value=""
															placeholder="Filter by Emp Name"
															data-control-type="textbox"
															data-control-name="title-filter"
															data-control-action="filter" />
													</div>

													<!-- filter by description -->
													<div class="text-filter-box">

														<i class="fa fa-search  jplist-icon"></i> <input
															data-path=".activity" type="text" value=""
															placeholder="Filter by Activity"
															data-control-type="textbox"
															data-control-name="activity-filter"
															data-control-action="filter" />
													</div>

													<!-- pagination results -->
													<div class="jplist-label"
														data-type="Page {current} of {pages}"
														data-control-type="pagination-info"
														data-control-name="paging" data-control-action="paging">
													</div>

													<!-- pagination -->
													<div class="jplist-pagination"
														data-control-type="pagination" data-control-name="paging"
														data-control-action="paging"></div>
												</div>

												<!-- data -->
												<div class="box text-shadow">
													<table class="demo-tbl">
														<thead>
															<tr>
																<th>Employee ID</th>
																<th>Name</th>
																<th>Company</th>
																<th>Function</th>
																<th>Business</th>
																<th>HR Portfolio</th>
																<th>Planned Activities</th>
															</tr>
														</thead>
														<tbody>
															<!-- item 1 -->
															<tr class="tbl-item">
																<td class="td-block">
																	<p class="desc">50012236</p>
																</td>
																<td class="td-block">
																	<p>
																		<a class="title" id="pierre1" href="#">Pierre
																			Marcel Cote</a>
																	</p>
																</td>
																<td class="td-block">
																	<p class="like">JPI</p>
																</td>
																<td class="td-block">
																	<p class="like">Human Resource</p>
																</td>
																<td class="td-block">
																	<p class="like">CMO</p>
																</td>
																<td class="td-block">
																	<p class="like">Talent Acquisition</p>
																</td>
																<td class="td-block">
																	<p>
																		<a class="activity" id="hiringCMOHead" href="#">Hiring
																			of CMO Head</a>
																	</p>
																</td>
															</tr>

															<!-- item 2 -->
															<tr class="tbl-item">
																<td class="td-block">
																	<p class="desc">10007096</p>
																</td>
																<td class="td-block">
																	<p>
																		<a class="title" id="skumar1" href="#">Shivshant
																			Kumar</a>
																	</p>
																</td>
																<td class="td-block">
																	<p class="like">JOL</p>
																</td>
																<td class="td-block">
																	<p class="like">Human Resource</p>
																</td>
																<td class="td-block">
																	<p class="like">--</p>
																</td>
																<td class="td-block">
																	<p class="like">HRIS</p>
																</td>
																<td class="td-block">
																	<p>
																		<a class="activity" id="impLMS" href="#">Implementation
																			of LMS </a>
																	</p>
																</td>
															</tr>

															<!-- item 3 -->
															<tr class="tbl-item">
																<td class="td-block">
																	<p class="desc">10003880</p>
																</td>
																<td class="td-block">
																	<p>
																		<a class="title" id="msingh1" href="#">Mukesh
																			Singh Bhadauria</a>
																	</p>
																</td>
																<td class="td-block">
																	<p class="like">JOL</p>
																</td>
																<td class="td-block">
																	<p class="like">Human Resource</p>
																</td>
																<td class="td-block">
																	<p class="like">--</p>
																</td>
																<td class="td-block">
																	<p class="like">Performance Management</p>
																</td>
																<td class="td-block">
																	<p>
																		<a class="activity" id="clousureOfPMS" href="#">Closure
																			of PMS FY16-17 by June 17</a>
																	</p>
																</td>
															</tr>

															<!-- item 4 -->
															<tr class="tbl-item">
																<td class="td-block">
																	<p class="desc">10012280</p>
																</td>
																<td class="td-block">
																	<p>
																		<a class="title" id="vkaul1" href="#">Vinita Koul
																		</a>
																	</p>
																</td>
																<td class="td-block">
																	<p class="like">JOL</p>
																</td>
																<td class="td-block">
																	<p class="like">Human Resource</p>
																</td>
																<td class="td-block">
																	<p class="like">--</p>
																</td>
																<td class="td-block">
																	<p class="like">Leadership & Succession Planning</p>
																</td>
																<td class="td-block">
																	<p>
																		<a class="activity" id="devOfCareerPlans" href="#">Development
																			of Career Plans for Manager & Above</a>
																	</p>
																</td>
															</tr>

															<!-- item 5 -->
															<tr class="tbl-item">
																<td class="td-block">
																	<p class="desc">10010434</p>
																</td>
																<td class="td-block">
																	<p>
																		<a class="title" id="ngupta1" href="#">Nikhil
																			Gupta </a>
																	</p>
																</td>
																<td class="td-block">
																	<p class="like">JOL</p>
																</td>
																<td class="td-block">
																	<p class="like">Human Resource</p>
																</td>
																<td class="td-block">
																	<p class="like">--</p>
																</td>
																<td class="td-block">
																	<p class="like">Talent Acquisition</p>
																</td>
																<td class="td-block">
																	<p>
																		<a class="activity" id="RPOVendor" href="#">Finalization
																			of RPO Vendor</a>
																	</p>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<!-- end of data -->

												<div class="box jplist-no-results text-shadow align-center">
													<p>No results found</p>
												</div>

												<!-- ios button: show/hide panel -->
												<div class="jplist-ios-button">
													<i class="fa fa-sort"></i> jPList Actions
												</div>

												<!-- panel -->
												<div class="jplist-panel box panel-bottom">

													<!-- items per page dropdown -->
													<div class="jplist-drop-down"
														data-control-type="items-per-page-drop-down"
														data-control-name="paging" data-control-action="paging"
														data-control-animate-to-top="true">

														<ul>
															<li><span data-number="3"> 3 per page </span></li>
															<li><span data-number="5"> 5 per page </span></li>
															<li><span data-number="10" data-default="true">
																	10 per page </span></li>
															<li><span data-number="all"> View All </span></li>
														</ul>
													</div>

													<!-- pagination results -->
													<div class="jplist-label"
														data-type="{start} - {end} of {all}"
														data-control-type="pagination-info"
														data-control-name="paging" data-control-action="paging">
													</div>

													<!-- pagination -->
													<div class="jplist-pagination"
														data-control-type="pagination" data-control-name="paging"
														data-control-action="paging"
														data-control-animate-to-top="true"></div>

												</div>
											</div>
										</div>
									</div>
									<!-- end of demo -->
								</div>
								<br> <br>
								<div class="row" id="hiringCMOHeadActivity" hidden="hidden">
									<div class="col-lg-12">
										<div class="panel panel-blue" style="background: #fff">
											<div class="panel-heading" style="font-size: small;">
												Pierre Marcel Cote&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Hiring
												of CMO Head&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Project
												Status
											</div>
											<div class="panel-body">
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th>Planned Date</th>
															<th>Remarks/Comments</th>
															<th>Supporting Documents</th>
															<th>Q1 Details</th>
															<th>Q2 Details</th>
															<th>Q3 Details</th>
															<th>Q4 Details</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>31 Mar 18</td>
															<td>--</td>
															<td>--</td>
															<td class="success">Status Date : 30 Mar 17<br>Status
																Remarks: --<br>
															</td>
															<td class="danger">Status Date : 30 June 17<br>Status
																Remarks: --<br>
															</td>
															<td class="active">NA</td>
															<td class="active">NA</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>

									<div class="col-lg-12">
										<div class="panel panel-green">
											<div class="panel-heading" style="font-size: small;">
												Pierre Marcel Cote&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Hiring
												of CMO Head&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Budget
												Status
											</div>
											<div class="panel-body">
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th>Approved Budget</th>
															<th>Q1 Details</th>
															<th>Q2 Details</th>
															<th>Q3 Details</th>
															<th>Q4 Details</th>
															<th>Total Balance</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>--</td>
															<td>Actual : --<br>Remarks: --<br>
															</td>
															<td>Actual : --<br>Remarks: --<br>
															</td>
															<td class="active">NA</td>
															<td class="active">NA</td>
															<td>0</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="row" id="pierreActivities" hidden="hidden">
									<div class="col-lg-12">
										<div id="title-breadcrumb-option-demo"
											class="page-title-breadcrumb">
											<div class="page-header pull-left">
												<div class="page-title">
													Pierre Marcel Cote&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;Planned
													Activites
												</div>
											</div>
											<div class="clearfix"></div>
										</div>

										<br>

										<ul class="nav nav-tabs">
											<li class="active"><a href="#tab-act1" data-toggle="tab">Hiring
													of CMO Head</a></li>
											<li><a href="#tab-act2" data-toggle="tab">Plan for
													YoY Activities for HR Ops</a></li>
											<li><a href="#tab-act3" data-toggle="tab">Strategize
													Employer Branding</a></li>

										</ul>
										<div id="generalTabContent" class="tab-content">
											<div id="tab-act1" class="tab-pane fade in active"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: Strategy Under Development<br>
																		</td>
																		<td class="warning">Status Date : --<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<div id="tab-act2" class="tab-pane fade in"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="success">Status Date : 30 Mar 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<div id="tab-act3" class="tab-pane fade in"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="success">Status Date : 30 Mar 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row" id="impLMSActivity" hidden="hidden">
									<div class="col-lg-12">
										<div class="panel panel-blue" style="background: #fff">
											<div class="panel-heading" style="font-size: small;">
												Shivshant Kumar&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Implementation
												of LMS&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Project
												Status
											</div>
											<div class="panel-body">
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th>Planned Date</th>
															<th>Remarks/Comments</th>
															<th>Supporting Documents</th>
															<th>Q1 Details</th>
															<th>Q2 Details</th>
															<th>Q3 Details</th>
															<th>Q4 Details</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>31 Mar 18</td>
															<td>--</td>
															<td>--</td>
															<td class="success">Status Date : 1 Oct 17<br>Status
																Remarks: Implementation of LMS for LSI & DDDS<br>
															</td>
															<td class="success">Status Date : --<br>Status
																Remarks: --<br>
															</td>
															<td class="active">NA</td>
															<td class="active">NA</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>

									<div class="col-lg-12">
										<div class="panel panel-green">
											<div class="panel-heading" style="font-size: small;">
												Shivshant Kumar&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Implementation
												of LMS&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Budget
												Status
											</div>
											<div class="panel-body">
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th>Approved Budget</th>
															<th>Q1 Details</th>
															<th>Q2 Details</th>
															<th>Q3 Details</th>
															<th>Q4 Details</th>
															<th>Total Balance</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>45,00,000</td>
															<td class="success">Actual : 0<br>Remarks: --<br>
															</td>
															<td class="success">Actual : 0<br>Remarks: --<br>
															</td>
															<td class="active">NA</td>
															<td class="active">NA</td>
															<td>45,00,000</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="row" id="skumarActivities" hidden="hidden">
									<div class="col-lg-12">
										<div id="title-breadcrumb-option-demo"
											class="page-title-breadcrumb">
											<div class="page-header pull-left">
												<div class="page-title">
													Shivshant Kumar&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;Planned
													Activites
												</div>
											</div>
											<div class="clearfix"></div>
										</div>

										<br>

										<ul class="nav nav-tabs">
											<li class="active"><a href="#tab-act4" data-toggle="tab">Support
													Cost for India Entities</a></li>
											<li><a href="#tab-act5" data-toggle="tab">Support
													Cost for North America - Vendor</a></li>
											<li><a href="#tab-act6" data-toggle="tab">Implementation
													of Time & Attendance</a></li>
											<li><a href="#tab-act7" data-toggle="tab">Implementation
													of LMS</a></li>
											<li><a href="#tab-act8" data-toggle="tab">Internal
													Travel</a></li>

										</ul>
										<div id="generalTabContent" class="tab-content">
											<div id="tab-act4" class="tab-pane fade in active"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: Strategy Under Development<br>
																		</td>
																		<td class="warning">Status Date : --<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<div id="tab-act5" class="tab-pane fade in"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="success">Status Date : 30 Mar 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<div id="tab-act6" class="tab-pane fade in"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="success">Status Date : 30 Mar 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>

											<div id="tab-act7" class="tab-pane fade in"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="success">Status Date : 1 Oct 17<br>Status
																			Remarks: Implementation of LMS for LSI & DDDS<br>
																		</td>
																		<td class="success">Status Date : --<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>45,00,000</td>
																		<td class="success">Actual : 0<br>Remarks:
																			--<br>
																		</td>
																		<td class="success">Actual : 0<br>Remarks:
																			--<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>45,00,000</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>

											<div id="tab-act8" class="tab-pane fade in"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="success">Status Date : 30 Mar 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="row" id="clousureOfPMSActivity" hidden="hidden">
									<div class="col-lg-12">
										<div class="panel panel-blue" style="background: #fff">
											<div class="panel-heading" style="font-size: small;">
												Mukesh Singh Bhadauria&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Closure
												of PMS FY16-17 by June 17&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Project
												Status
											</div>
											<div class="panel-body">
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th>Planned Date</th>
															<th>Remarks/Comments</th>
															<th>Supporting Documents</th>
															<th>Q1 Details</th>
															<th>Q2 Details</th>
															<th>Q3 Details</th>
															<th>Q4 Details</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>31 Mar 18</td>
															<td>--</td>
															<td>--</td>
															<td class="success">Status Date : 30 Mar 17<br>Status
																Remarks: --<br>
															</td>
															<td class="danger">Status Date : 30 June 17<br>Status
																Remarks: --<br>
															</td>
															<td class="active">NA</td>
															<td class="active">NA</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>

									<div class="col-lg-12">
										<div class="panel panel-green">
											<div class="panel-heading" style="font-size: small;">
												Mukesh Singh Bhadauria&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Closure
												of PMS FY16-17 by June 17&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Budget
												Status
											</div>
											<div class="panel-body">
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th>Approved Budget</th>
															<th>Q1 Details</th>
															<th>Q2 Details</th>
															<th>Q3 Details</th>
															<th>Q4 Details</th>
															<th>Total Balance</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>--</td>
															<td>Actual : --<br>Remarks: --<br>
															</td>
															<td>Actual : --<br>Remarks: --<br>
															</td>
															<td class="active">NA</td>
															<td class="active">NA</td>
															<td>0</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="row" id="msinghActivities" hidden="hidden">
									<div class="col-lg-12">
										<div id="title-breadcrumb-option-demo"
											class="page-title-breadcrumb">
											<div class="page-header pull-left">
												<div class="page-title">
													Mukesh Singh Bhadauria&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;Planned
													Activites
												</div>
											</div>
											<div class="clearfix"></div>
										</div>

										<br>

										<ul class="nav nav-tabs">
											<li class="active"><a href="#tab-act1" data-toggle="tab">Closure
													of PMS FY16-17 by June 17</a></li>
										</ul>
										<div id="generalTabContent" class="tab-content">
											<div id="tab-act9" class="tab-pane fade in active"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: Strategy Under Development<br>
																		</td>
																		<td class="warning">Status Date : --<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="row" id="devOfCareerPlansActivity" hidden="hidden">
									<div class="col-lg-12">
										<div class="panel panel-blue" style="background: #fff">
											<div class="panel-heading" style="font-size: small;">
												Vinita Koul&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Development
												of Career Plans for Manager & Above&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Project
												Status
											</div>
											<div class="panel-body">
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th>Planned Date</th>
															<th>Remarks/Comments</th>
															<th>Supporting Documents</th>
															<th>Q1 Details</th>
															<th>Q2 Details</th>
															<th>Q3 Details</th>
															<th>Q4 Details</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>31 Mar 18</td>
															<td>--</td>
															<td>--</td>
															<td class="success">Status Date : 30 Mar 17<br>Status
																Remarks: --<br>
															</td>
															<td class="danger">Status Date : 30 June 17<br>Status
																Remarks: --<br>
															</td>
															<td class="active">NA</td>
															<td class="active">NA</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>

									<div class="col-lg-12">
										<div class="panel panel-green">
											<div class="panel-heading" style="font-size: small;">
												Vinita Koul&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Development
												of Career Plans for Manager & Above&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Budget
												Status
											</div>
											<div class="panel-body">
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th>Approved Budget</th>
															<th>Q1 Details</th>
															<th>Q2 Details</th>
															<th>Q3 Details</th>
															<th>Q4 Details</th>
															<th>Total Balance</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>--</td>
															<td>Actual : --<br>Remarks: --<br>
															</td>
															<td>Actual : --<br>Remarks: --<br>
															</td>
															<td class="active">NA</td>
															<td class="active">NA</td>
															<td>0</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>

								<div class="row" id="RPOVendorActivity" hidden="hidden">
									<div class="col-lg-12">
										<div class="panel panel-blue" style="background: #fff">
											<div class="panel-heading" style="font-size: small;">
												Nikhil Gupta&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Finalization
												of RPO Vendor&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Project
												Status
											</div>
											<div class="panel-body">
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th>Planned Date</th>
															<th>Remarks/Comments</th>
															<th>Supporting Documents</th>
															<th>Q1 Details</th>
															<th>Q2 Details</th>
															<th>Q3 Details</th>
															<th>Q4 Details</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>31 Mar 18</td>
															<td>--</td>
															<td>--</td>
															<td class="success">Status Date : 30 Mar 17<br>Status
																Remarks: --<br>
															</td>
															<td class="danger">Status Date : 30 June 17<br>Status
																Remarks: --<br>
															</td>
															<td class="active">NA</td>
															<td class="active">NA</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>

									<div class="col-lg-12">
										<div class="panel panel-green">
											<div class="panel-heading" style="font-size: small;">
												Nikhil Gupta&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Finalization
												of RPO Vendor&nbsp;&nbsp;&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;&nbsp;&nbsp;Budget
												Status
											</div>
											<div class="panel-body">
												<table class="table table-hover table-bordered">
													<thead>
														<tr>
															<th>Approved Budget</th>
															<th>Q1 Details</th>
															<th>Q2 Details</th>
															<th>Q3 Details</th>
															<th>Q4 Details</th>
															<th>Total Balance</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>--</td>
															<td>Actual : --<br>Remarks: --<br>
															</td>
															<td>Actual : --<br>Remarks: --<br>
															</td>
															<td class="active">NA</td>
															<td class="active">NA</td>
															<td>0</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>


								<div class="row" id="vkaulActivities" hidden="hidden">
									<div class="col-lg-12">
										<div id="title-breadcrumb-option-demo"
											class="page-title-breadcrumb">
											<div class="page-header pull-left">
												<div class="page-title">
													Vinita Kaul&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;Planned
													Activites
												</div>
											</div>
											<div class="clearfix"></div>
										</div>

										<br>

										<ul class="nav nav-tabs">
											<li class="active"><a href="#tab-act10"
												data-toggle="tab">Development of Career Plans for
													Manager & Above</a></li>
										</ul>
										<div id="generalTabContent" class="tab-content">
											<div id="tab-act10" class="tab-pane fade in active"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: Strategy Under Development<br>
																		</td>
																		<td class="warning">Status Date : --<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<div id="tab-act2" class="tab-pane fade in"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="success">Status Date : 30 Mar 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<div id="tab-act3" class="tab-pane fade in"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="success">Status Date : 30 Mar 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row" id="nguptaActivities" hidden="hidden">
									<div class="col-lg-12">
										<div id="title-breadcrumb-option-demo"
											class="page-title-breadcrumb">
											<div class="page-header pull-left">
												<div class="page-title">
													Nikhil Gupta&nbsp;&nbsp;<b>/</b>&nbsp;&nbsp;Planned
													Activites
												</div>
											</div>
											<div class="clearfix"></div>
										</div>

										<br>

										<ul class="nav nav-tabs">
											<li class="active"><a href="#tab-act11"
												data-toggle="tab">Finalization of RPO Vendor</a></li>

										</ul>
										<div id="generalTabContent" class="tab-content">
											<div id="tab-act1" class="tab-pane fade in active"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: Strategy Under Development<br>
																		</td>
																		<td class="warning">Status Date : --<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<div id="tab-act2" class="tab-pane fade in"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="success">Status Date : 30 Mar 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<div id="tab-act3" class="tab-pane fade in"
												style="height: 460px">
												<div class="col-lg-12">
													<div class="panel panel-grey" style="background: #fff">
														<div class="panel-heading" style="font-size: small;">
															Project Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Planned Date</th>
																		<th>Remarks/Comments</th>
																		<th>Supporting Documents</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>31 Mar 18</td>
																		<td>--</td>
																		<td>--</td>
																		<td class="success">Status Date : 30 Mar 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="danger">Status Date : 30 June 17<br>Status
																			Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="panel panel-grey">
														<div class="panel-heading" style="font-size: small;">Budget
															Status</div>
														<div class="panel-body">
															<table class="table table-hover table-bordered">
																<thead>
																	<tr>
																		<th>Approved Budget</th>
																		<th>Q1 Details</th>
																		<th>Q2 Details</th>
																		<th>Q3 Details</th>
																		<th>Q4 Details</th>
																		<th>Total Balance</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>--</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td>Actual : --<br>Remarks: --<br>
																		</td>
																		<td class="active">NA</td>
																		<td class="active">NA</td>
																		<td>0</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row" id="newActivityDiv" hidden="hidden">
									<div class="col-lg-12">
										<div class="panel mbl">
											<div class="panel-body">
												<div class="page-title-breadcrumb mbxxl">
													<div class="page-header pull-left">
														<div class="page-title">Plan New Activity</div>
													</div>
													<div class="clearfix"></div>
												</div>
												<div class="row mas">
													<div class="col-md-3 mbl">
														<div class="form-group">
															<label for="inputEmployee" class="control-label"
																style="color: black;"> Employee</label>
															<div class="input-icon right">
																<i class="fa fa-user"></i> <input id="inputEmployee"
																	type="text" placeholder="" class="form-control"
																	style="color: black;" />
															</div>
														</div>
													</div>
													<div class="col-md-3 mbl">
														<div class="form-group">
															<label for="inputCompany" class="control-label"
																style="color: black;"> Company</label>
															<div class="input-icon right">
																<i class="fa fa-building"></i> <input id="inputCompany"
																	type="text" placeholder="" class="form-control"
																	style="color: black;" />
															</div>
														</div>
													</div>
													<div class="col-md-3 mbl">
														<div class="form-group">
															<label for="inputFunction" class="control-label"
																style="color: black;"> Function</label>
															<div class="input-icon right">
																<i class="fa fa-wrench"></i> <input id="inputFunction"
																	type="text" placeholder="" class="form-control"
																	style="color: black;" />
															</div>
														</div>
													</div>
													<div class="col-md-3 mbl">
														<div class="form-group">
															<label for="inputBusiness" class="control-label"
																style="color: black;"> Business</label>
															<div class="input-icon right">
																<i class="fa fa-briefcase"></i> <input
																	id="inputBusiness" type="text" placeholder=""
																	class="form-control" style="color: black;" />
															</div>
														</div>
													</div>
													<div class="col-md-6 mbl">
														<div class="form-group">
															<div class="form-group">
																<label for="inputHRPortfolio" class="control-label"
																	style="color: black;"> HR Portfolio</label>
																<div class="input-icon right">
																	<i class="fa fa-tag"></i> <input id="inputHRPortfolio"
																		type="text" placeholder="" class="form-control"
																		style="color: black;" />
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-6 mbl">
														<div class="form-group">
															<label for="inputActivityName" class="control-label"
																style="color: black;"> Activity Name</label>
															<div class="input-icon right">
																<i class="fa fa-pencil"></i> <input
																	id="inputActivityName" type="text" placeholder=""
																	class="form-control" style="color: black;" />
															</div>
														</div>
													</div>
													<div class="col-md-3 mbl">
														<div class="form-group">
															<label for="inputPlanningDate" class="control-label"
																style="color: black;"> Planning Date</label>
															<div class="input-icon right">
																<i class="fa fa-calendar"></i> <input
																	id="inputPlanningDate" class="form-control"
																	style="color: black;">
															</div>
														</div>
													</div>
													<div class="col-md-5 mbl">
														<div class="form-group">
															<label for="inputComments" class="control-label"
																style="color: black;"> Remarks/Comments</label>
															<div class="input-icon right">
																<i class="fa fa-comment"></i> <input id="inputComments"
																	type="text" placeholder="" class="form-control"
																	style="color: black;" />
															</div>
														</div>
													</div>
													<div class="col-md-4 mbl">
														<div class="form-group">
															<label for="inputDocuments" class="control-label"
																style="color: black;"> Supporting Documents</label>
															<div class="input-icon right">
																<i class="fa fa-file"></i> <input id="inputDocuments"
																	type="text" placeholder="" class="form-control"
																	style="color: black;" />
															</div>
														</div>
													</div>

													<div class="col-md-12 mbl">
														<div class="panel panel-grey" style="background: #fff">
															<div class="panel-heading" style="font-size: small;">
																Project Status</div>
															<div class="panel-body">
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-calendar-o"></i> <input
																				id="inputQ1StatusDate" type="text"
																				placeholder="Q1 Status Date" class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-calendar-o"></i> <input
																				id="inputQ2StatusDate" type="text"
																				placeholder="Q2 Status Date" class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-calendar-o"></i> <input
																				id="inputQ3StatusDate" type="text"
																				placeholder="Q3 Status Date" class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-calendar-o"></i> <input
																				id="inputQ4StatusDate" type="text"
																				placeholder="Q4 Status Date" class="form-control" />
																		</div>
																	</div>
																</div>

																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-comment-o"></i> <input
																				id="inputQ1Remarks" type="text"
																				placeholder="Q1 Remarks" class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-comment-o"></i> <input
																				id="inputQ2Remarks" type="text"
																				placeholder="Q2 Remarks" class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-comment-o"></i> <input
																				id="inputQ3Remarks" type="text"
																				placeholder="Q3 Remarks" class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-comment-o"></i> <input
																				id="inputQ4Remarks" type="text"
																				placeholder="Q4 Remarks" class="form-control" />
																		</div>
																	</div>
																</div>

																<div class="col-md-3">
																	<div class="form-group">
																		<select class="form-control" id="Q1Status">
																			<option>Select Q1 Status</option>
																			<option value="">Green</option>
																			<option value="">Amber</option>
																			<option value="">Red</option>
																		</select>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<select class="form-control" id="Q2Status">
																			<option>Select Q2 Status</option>
																			<option value="">Green</option>
																			<option value="">Amber</option>
																			<option value="">Red</option>
																		</select>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<select class="form-control" id="Q3Status">
																			<option>Select Q3 Status</option>
																			<option value="">Green</option>
																			<option value="">Amber</option>
																			<option value="">Red</option>
																		</select>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<select class="form-control" id="Q4Status">
																			<option>Select Q4 Status</option>
																			<option value="">Green</option>
																			<option value="">Amber</option>
																			<option value="">Red</option>
																		</select>
																	</div>
																</div>

															</div>
														</div>
													</div>

													<div class="col-md-12 mbl">
														<div class="panel panel-grey" style="background: #fff">
															<div class="panel-heading" style="font-size: small;">
																Budget Status</div>
															<div class="panel-body">

																<div class="col-md-12">
																	<div class="col-md-4"></div>
																	<div class="col-md-4">
																		<div class="form-group">
																			<div class="input-icon">
																				<i class="fa fa-rupee"></i> <input
																					id="inputQ1Remarks2" type="text"
																					placeholder="Approved Budget" class="form-control" />
																			</div>
																		</div>
																		<br>
																	</div>
																	<div class="col-md-4"></div>
																</div>

																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-rupee"></i> <input id="inputQ1Actual"
																				type="text" placeholder="Q1 Actual"
																				class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-rupee"></i> <input id="inputQ2Actual"
																				type="text" placeholder="Q2 Actual"
																				class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-rupee"></i> <input id="inputQ3Actual"
																				type="text" placeholder="Q3 Actual"
																				class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-rupee"></i> <input id="inputQ4Actual"
																				type="text" placeholder="Q4 Actual"
																				class="form-control" />
																		</div>
																	</div>
																</div>

																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-comment-o"></i> <input
																				id="inputQ1Remarks2" type="text"
																				placeholder="Q1 Remarks" class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-comment-o"></i> <input
																				id="inputQ2Remarks2" type="text"
																				placeholder="Q2 Remarks" class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-comment-o"></i> <input
																				id="inputQ3Remarks2" type="text"
																				placeholder="Q3 Remarks" class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<div class="input-icon">
																			<i class="fa fa-comment-o"></i> <input
																				id="inputQ4Remarks2" type="text"
																				placeholder="Q4 Remarks" class="form-control" />
																		</div>
																	</div>
																</div>

																<div class="col-md-3">
																	<div class="form-group">
																		<select class="form-control" id="Q1Status">
																			<option>Select Q1 Status</option>
																			<option value="">Green</option>
																			<option value="">Amber</option>
																			<option value="">Red</option>
																		</select>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<select class="form-control" id="Q2Status">
																			<option>Select Q2 Status</option>
																			<option value="">Green</option>
																			<option value="">Amber</option>
																			<option value="">Red</option>
																		</select>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<select class="form-control" id="Q3Status">
																			<option>Select Q3 Status</option>
																			<option value="">Green</option>
																			<option value="">Amber</option>
																			<option value="">Red</option>
																		</select>
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<select class="form-control" id="Q4Status">
																			<option>Select Q4 Status</option>
																			<option value="">Green</option>
																			<option value="">Amber</option>
																			<option value="">Red</option>
																		</select>
																	</div>
																</div>

															</div>
														</div>
													</div>

													<div class="col-md-12 mbl mal" style="text-align: center;">
														<div class="form-group">
															<button class="btn btn-green btn-lg" id="addNewActivity">Add</button>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<button class="btn btn-red btn-lg"
																id="hideAddNewActivityDiv">Cancel</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>

						</div>

					</div>
				</div>
			</div>
			<!--END CONTENT-->
			<!--BEGIN FOOTER-->
			<div id="footer">
				<div class="copyright">
					<a href="http://crosstab.in">2017 CrossTab IT Consulting</a>
				</div>
			</div>
			<!--END FOOTER-->
		</div>
		<!--END PAGE WRAPPER-->
	</div>
	</div>
	<script src="script/jquery-1.10.2.min.js"></script>
	<script src="script/jquery-migrate-1.2.1.min.js"></script>
	<script src="script/jquery-ui.js"></script>
	<script src="script/bootstrap.min.js"></script>
	<script src="script/bootstrap-hover-dropdown.js"></script>
	<script src="script/html5shiv.js"></script>
	<script src="script/respond.min.js"></script>
	<script src="script/jquery.metisMenu.js"></script>
	<script src="script/jquery.slimscroll.js"></script>
	<script src="script/jquery.cookie.js"></script>
	<script src="script/icheck.min.js"></script>
	<script src="script/custom.min.js"></script>
	<script src="script/jquery.menu.js"></script>
	<script src="script/pace.min.js"></script>
	<script src="script/holder.js"></script>
	<script src="script/responsive-tabs.js"></script>
	<script src="script/zabuto_calendar.min.js"></script>
	<!--CORE JAVASCRIPT-->
	<script src="script/main.js"></script>

	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.core.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.counter-control.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.filter-dropdown-bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.filter-toggle-bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.history-bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.jquery-ui-bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.pagination-bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.sort-bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.textbox-filter.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.start-rating-control.min.js"></script>

	<script>
		$('document').ready(function() {

			$('#demo').jplist({

				itemsBox : '.demo-tbl',
				itemPath : '.tbl-item',
				panelPath : '.jplist-panel'

				//save plugin state
				,
				storage : 'localstorage' //'', 'cookies', 'localstorage'			
				,
				storageName : 'jplist-tabl'
			});
		});

		var employees = [ "Pierre Marcel Cote", "Mukesh Singh Bhadauria",
				"Vinita Koul", "Shivshant Kumar", "Nikhil Gupta" ];

		$("#inputEmployee").autocomplete({
			source : employees,
			minLength : 0
		}).focus(function() {
			$(this).autocomplete("search");
		});

		var companies = [ "JPI", "JOL" ];

		$("#inputCompany").autocomplete({
			source : companies,
			minLength : 0
		}).focus(function() {
			$(this).autocomplete("search");
		});

		var functions = [ "Human Resource" ];

		$("#inputFunction").autocomplete({
			source : functions,
			minLength : 0
		}).focus(function() {
			$(this).autocomplete("search");
		});

		var businesses = [ "CMO", "JHS" ];

		$("#inputBusiness").autocomplete({
			source : businesses,
			minLength : 0
		}).focus(function() {
			$(this).autocomplete("search");
		});

		var hrportfolios = [ "Talent Acquisition", "HR Operations",
				"Employer Branding", "Learning & Developmment", "Rewards",
				"Performance Management", "Leadership & Succession Planning",
				"Employee Engagement", "HRIS" ];

		$("#inputHRPortfolio").autocomplete({
			source : hrportfolios,
			minLength : 0
		}).focus(function() {
			$(this).autocomplete("search");
		});

		$("#inputPlanningDate").datepicker({
			dateFormat : "dd/mm/yy"
		});

		$("#inputQ1StatusDate").datepicker({
			dateFormat : "dd/mm/yy"
		});
		$("#inputQ2StatusDate").datepicker({
			dateFormat : "dd/mm/yy"
		});
		$("#inputQ3StatusDate").datepicker({
			dateFormat : "dd/mm/yy"
		});
		$("#inputQ4StatusDate").datepicker({
			dateFormat : "dd/mm/yy"
		});

		$("#pierre1").click(function() {

			$("#pierreActivities").fadeIn();
			$("#hiringCMOHeadActivity").hide();

			$("#skumarActivities").hide();
			$("#impLMSActivity").hide();

			$("#msinghActivities").hide();
			$("#clousureOfPMSActivity").hide();

			$("#vkaulActivities").hide();
			$("#devOfCareerPlansActivity").hide();

			$("#nguptaActivities").hide();
			$("#RPOVendorActivity").hide();

			$('html,body').animate({
				scrollTop : $("#pierreActivities").offset().top
			}, 'slow');

		});

		$("#hiringCMOHead").click(function() {

			$("#hiringCMOHeadActivity").fadeIn();
			$("#pierreActivities").hide();

			$("#skumarActivities").hide();
			$("#impLMSActivity").hide();

			$("#msinghActivities").hide();
			$("#clousureOfPMSActivity").hide();

			$("#vkaulActivities").hide();
			$("#devOfCareerPlansActivity").hide();

			$("#nguptaActivities").hide();
			$("#RPOVendorActivity").hide();

			$('html,body').animate({
				scrollTop : $("#hiringCMOHeadActivity").offset().top
			}, 'slow');

		});
		$("#skumar1").click(function() {

			$("#skumarActivities").fadeIn();
			$("#impLMSActivity").hide();

			$("#hiringCMOHeadActivity").hide();
			$("#pierreActivities").hide();

			$("#msinghActivities").hide();
			$("#clousureOfPMSActivity").hide();

			$("#vkaulActivities").hide();
			$("#devOfCareerPlansActivity").hide();

			$("#nguptaActivities").hide();
			$("#RPOVendorActivity").hide();

			$('html,body').animate({
				scrollTop : $("#skumarActivities").offset().top
			}, 'slow');

		});

		$("#impLMS").click(function() {

			$("#impLMSActivity").fadeIn();
			$("#skumarActivities").hide();

			$("#hiringCMOHeadActivity").hide();
			$("#pierreActivities").hide();

			$("#msinghActivities").hide();
			$("#clousureOfPMSActivity").hide();

			$("#vkaulActivities").hide();
			$("#devOfCareerPlansActivity").hide();

			$("#nguptaActivities").hide();
			$("#RPOVendorActivity").hide();

			$('html,body').animate({
				scrollTop : $("#impLMSActivity").offset().top
			}, 'slow');

		});

		$("#msingh1").click(function() {

			$("#msinghActivities").fadeIn();
			$("#clousureOfPMSActivity").hide();

			$("#pierreActivities").hide();
			$("#hiringCMOHeadActivity").hide();

			$("#skumarActivities").hide();
			$("#impLMSActivity").hide();

			$("#vkaulActivities").hide();
			$("#devOfCareerPlansActivity").hide();

			$("#nguptaActivities").hide();
			$("#RPOVendorActivity").hide();

			$('html,body').animate({
				scrollTop : $("#msinghActivities").offset().top
			}, 'slow');

		});

		$("#clousureOfPMS").click(function() {

			$("#clousureOfPMSActivity").fadeIn();
			$("#msinghActivities").hide();

			$("#pierreActivities").hide();
			$("#hiringCMOHeadActivity").hide();

			$("#skumarActivities").hide();
			$("#impLMSActivity").hide();

			$("#vkaulActivities").hide();
			$("#devOfCareerPlansActivity").hide();

			$("#nguptaActivities").hide();
			$("#RPOVendorActivity").hide();

			$('html,body').animate({
				scrollTop : $("#clousureOfPMSActivity").offset().top
			}, 'slow');

		});

		$("#vkaul1").click(function() {

			$("#vkaulActivities").fadeIn();
			$("#devOfCareerPlansActivity").hide();

			$("#pierreActivities").hide();
			$("#hiringCMOHeadActivity").hide();

			$("#skumarActivities").hide();
			$("#impLMSActivity").hide();

			$("#msinghActivities").hide();
			$("#clousureOfPMSActivity").hide();

			$("#nguptaActivities").hide();
			$("#RPOVendorActivity").hide();

			$('html,body').animate({
				scrollTop : $("#vkaulActivities").offset().top
			}, 'slow');

		});

		$("#devOfCareerPlans").click(function() {

			$("#devOfCareerPlansActivity").fadeIn();
			$("#vkaulActivities").hide();

			$("#pierreActivities").hide();
			$("#hiringCMOHeadActivity").hide();

			$("#skumarActivities").hide();
			$("#impLMSActivity").hide();

			$("#msinghActivities").hide();
			$("#clousureOfPMSActivity").hide();

			$("#nguptaActivities").hide();
			$("#RPOVendorActivity").hide();

			$('html,body').animate({
				scrollTop : $("#devOfCareerPlansActivity").offset().top
			}, 'slow');

		});

		$("#ngupta1").click(function() {

			$("#nguptaActivities").fadeIn();

			$("#pierreActivities").hide();
			$("#hiringCMOHeadActivity").hide();

			$("#skumarActivities").hide();
			$("#impLMSActivity").hide();

			$("#msinghActivities").hide();
			$("#clousureOfPMSActivity").hide();

			$("#vkaulActivities").hide();
			$("#devOfCareerPlansActivity").hide();

			$("#RPOVendorActivity").hide();

			$('html,body').animate({
				scrollTop : $("#nguptaActivities").offset().top
			}, 'slow');

		});

		$("#RPOVendor").click(function() {

			$("#RPOVendorActivity").fadeIn();

			$("#pierreActivities").hide();
			$("#hiringCMOHeadActivity").hide();

			$("#skumarActivities").hide();
			$("#impLMSActivity").hide();

			$("#msinghActivities").hide();
			$("#clousureOfPMSActivity").hide();

			$("#vkaulActivities").hide();
			$("#devOfCareerPlansActivity").hide();

			$("#nguptaActivities").hide();

			$('html,body').animate({
				scrollTop : $("#RPOVendorActivity").offset().top
			}, 'slow');

		});

		$("#showAddNewActivityDiv").click(function() {

			$("#newActivityDiv").fadeIn();

			$('html,body').animate({
				scrollTop : $("#newActivityDiv").offset().top
			}, 'slow');
		});

		$("#hideAddNewActivityDiv").click(function() {

			$("#newActivityDiv").hide();
		});

		$("#addNewActivity").click(function() {

			$("#newActivityDiv").hide();
		});
	</script>
</body>
</html>
