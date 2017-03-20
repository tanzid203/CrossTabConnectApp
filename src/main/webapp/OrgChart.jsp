<!DOCTYPE html>
<html lang="en" data-ng-app="myApp">
<head>
<title>Org Chart | Jubilant</title>
<base href="/">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<link rel="stylesheet" href="styles/minimal/grey.css"></link>
<link rel="stylesheet" type="text/css"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/flick/jquery-ui.css">

<link rel="stylesheet" href="styles/Treant.css">
<link rel="stylesheet" href="styles/collapsable.css">
<link rel="stylesheet" href="styles/printable.orgchart.css">
<link rel="stylesheet" href="styles/perfect-scrollbar.css">

<link rel="stylesheet" href="styles/tabs.css"></link>

<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/jstree/3.3.3/themes/default/style.min.css" />

<link rel="stylesheet" href="styles/switchery.css"></link>
<link rel="stylesheet"
	href="styles/jstree-bootstrap-theme/dist/themes/proton/style.min.css" />
<link rel="stylesheet" href="styles/tooltipster.bundle.min.css"></link>
<link rel="stylesheet"
	href="styles/tooltipster-sideTip-borderless.min.css"></link>
<link rel="stylesheet" href="styles/tooltipster-sideTip-light.min.css"></link>
<link rel="stylesheet" href="styles/tooltipster-sideTip-noir.min.css"></link>
<link rel="stylesheet" href="styles/tooltipster-sideTip-shadow.min.css"></link>
</head>
<style>
#orgChartSketch {
	background: #FFF;
	max-width: 100%;
	width: 100%;
	border: 5px dashed #e0e0e0;
}
</style>

<body>

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
				<a id="logo" class="navbar-brand"><span class="fa fa-rocket"></span><span
					class="logo-text">OrgChart</span><span style="display: none"
					class="logo-text-icon">OC</span></a>
			</div>
			<div class="topbar-main">
				<a id="menu-toggle" class="hidden-xs"><i class="fa fa-search"></i></a>
				<div id="topbar-search" class="hidden-sm hidden-xs">
					<div class="input-icon text-white">
						<!-- <i class="fa fa-search"></i>  -->
						<input type="text"
							placeholder="Search by Employee Name/Designation.."
							class="form-control text-white" style="width: 90ex;" />
					</div>
				</div>
			</div>
		</nav>

		<!--BEGIN MODAL CONFIG PORTLET-->
		<div id="orientationModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" data-dismiss="modal" aria-hidden="true"
							class="close">&times;</button>
						<h4 style="color: #2c2c2c; font-size: 1.5ex">
							<i class="fa fa-file-pdf-o"></i>&nbsp;&nbsp;&nbsp;Chart
							Orientation?
						</h4>
					</div>
					<div class="modal-body" style="text-align: center;">
						<button type="button" class="btn btn-dark btn-sm"
							id="portraitOrientation">Portrait</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-dark btn-sm"
							id="landscapeOrientation">Landscape</button>
					</div>
				</div>
			</div>
		</div>

		<div class="common-modal modal fade" id="common-Modal1" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-content">
				<ul class="list-inline item-details">
					<li><a href="http://www.crosstab.in">CrossTab Consulting</a></li>
				</ul>
			</div>
		</div>
		<!--END MODAL CONFIG PORTLET-->
	</div>
	<!--END TOPBAR-->
	<div id="wrapper" style="background-color: #EEEEEE">
		<!--BEGIN SIDEBAR MENU-->

		<!--END SIDEBAR MENU-->
		<!--BEGIN PAGE WRAPPER-->
		<!--BEGIN TITLE & BREADCRUMB PAGE-->
		<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
			<button id="showFilters" class="btn btn-dark"
				style="margin-top: 1ex; margin-left: 82ex;">
				<i class="fa fa-filter"></i>&nbsp;&nbsp;Show Filters
			</button>
			<button id="hideFilters" class="btn btn-active"
				style="margin-top: 1ex; display: none; margin-left: 82.7ex;">
				<i class="fa fa-filter"></i>&nbsp;&nbsp;Hide Filters
			</button>
			&nbsp;
			<!-- 
			<button id="editImage" class="btn btn-dark">
				<i class="fa fa-save"></i>&nbsp;&nbsp;Save as Image/PDF
			</button>
			 -->
			<div class="btn-group" style="margin-top: 1ex" id="exportButtons">
				<button type="button" class="btn btn-dark">
					<i class="fa fa-save"></i>&nbsp;&nbsp;Export To..
				</button>
				<button type="button" data-toggle="dropdown" data-hover="dropdown"
					data-delay="250" data-close-others="true"
					class="btn btn-dark dropdown-toggle">
					<i class="fa fa-angle-down"></i>
				</button>
				<ul class="dropdown-menu">
					<li><a id="downloadImage" href="javascript:void(0)"><i
							class="fa fa-image"></i>&nbsp;PNG</a></li>
					<li><a id="downloadPDF" href="javascript:void(0)"><i
							class="fa fa-file-pdf-o"></i>&nbsp;PDF</a></li>
					<li><a id="directToPrinter" href="javascript:void(0)"><i
							class="fa fa-print"></i>&nbsp;Printer</a></li>
					<!-- 
					<li class="divider"></li>
					<li><a href="#" class="text-center">View All</a></li> 
					-->
				</ul>
			</div>
			<div class="btn-group" style="margin-left: 30ex; margin-top: 1.5ex;">
				<label for="printableChartSwitch" class="control-label"
					style="color: #2c2c2c;"> NON-PRINTABLE
					VIEW&nbsp;&nbsp;&nbsp;</label><input type="checkbox"
					class="printableChartSwitch" id="printableChartSwitch"
					checked="checked" /> &nbsp; <label for="printableChartSwitch"
					class="control-label" style="color: #2c2c2c;"> PRINTABLE
					VIEW</label>
			</div>
			<!-- <button id="testButton" class="btn btn-dark">Test Button</button> -->
			<br> <br>
			<div id="filtersDiv" align="left"
				style="width: 50%; z-index: 104; background: #ffffff; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; border: 2px solid #242424; position: absolute; overflow: auto; cursor: move; top: 20%; left: 30%;">
				<div style="background: #242424; height: 5ex;">
					<label style="color: white; margin: 1ex;"><i
						class="fa fa-filter"></i>&nbsp;&nbsp;F I L T E R S</label>
					<button class="btn btn-dark btn-xs" id="hideFilters2"
						style="float: right; margin: 1ex;">
						<i class="fa fa-close"></i>
					</button>
					<button class="btn btn-dark btn-xs" id="expandFiltersDiv"
						style="float: right; margin: 1ex; display: none;">
						<i class="fa fa-chevron-down"></i>
					</button>
					<button class="btn btn-dark btn-xs" id="collapseFiltersDiv"
						style="float: right; margin: 1ex;">
						<i class="fa fa-chevron-up"></i>
					</button>
				</div>
				<div style="width: 100%; color: #000" id="filtersContainer">
					<div style="margin: 4ex; border: 1px solid #bfbfbf;"
						onmouseenter="$(this).css('border-color','#4c4c4c'); $(this).css('border-width','1.5px');"
						onmouseleave="$(this).css('border-color','#bfbfbf'); $(this).css('border-width','1px');">
						<span
							style="background: #ffffff; position: absolute; transform: translate(27ex, -1.4ex); font-size: 1.8ex">&nbsp;&nbsp;&nbsp;<i
							class="fa fa-window-restore"></i>&nbsp;&nbsp;C H A R T&emsp;F I L
							T E R S&nbsp;&nbsp;&nbsp;
						</span>
						<div class="form-group mal">
							<div class="checkbox"
								style="display: inline-block; width: 27%; margin-top: 2ex;">
								<label><input class="icheckbox" type="checkbox"
									id="chartDept" />&nbsp;Show Department</label>
							</div>
							&emsp;&emsp;
							<div class="checkbox"
								style="display: inline-block; width: 27%; margin-top: 2ex;">
								<label><input class="icheckbox" type="checkbox"
									id="chartLocation" />&nbsp;Show Location</label>
							</div>
							&emsp;&emsp;
							<div class="checkbox"
								style="display: inline-block; width: 27%; margin-top: 2ex;">
								<label><input class="icheckbox" type="checkbox"
									id="chartContact" />&nbsp;Show Contact Details</label>
							</div>
							&emsp;&emsp;

							<div class="checkbox"
								style="display: inline-block; width: 27%; margin-top: 2ex;">
								<label><input class="icheckbox" type="checkbox"
									id="chartLocation" />&nbsp;Show Location</label>
							</div>
							&emsp;&emsp;
							<div class="checkbox"
								style="display: inline-block; width: 27%; margin-top: 2ex;">
								<label><input class="icheckbox" type="checkbox"
									id="chartDI" />&nbsp;Show Direct/Indirect</label>
							</div>
							&emsp;&emsp;
							<div class="checkbox"
								style="display: inline-block; width: 27%; margin-top: 2ex;">
								<label><input class="icheckbox" type="checkbox"
									id="chartI" />&nbsp;Show Indirect</label>
							</div>
						</div>
					</div>

					<div style="margin: 4ex; border: 1px solid #bfbfbf;"
						onmouseenter="$(this).css('border-color','#4c4c4c'); $(this).css('border-width','1.5px');"
						onmouseleave="$(this).css('border-color','#bfbfbf'); $(this).css('border-width','1px');">
						<span
							style="background: #ffffff; position: absolute; transform: translate(28ex, -1.4ex); font-size: 1.8ex">&nbsp;&nbsp;&nbsp;<i
							class="fa fa-list-ul"></i>&nbsp;&nbsp;T R E E&emsp;F I L T E R
							S&nbsp;&nbsp;&nbsp;
						</span>
						<div class="form-group mal">
							<div class="checkbox"
								style="display: inline-block; width: 27%; margin-top: 2ex;">
								<label><input class="icheckbox" type="checkbox"
									id="chartDept" />&nbsp;Show Department</label>
							</div>
							&emsp;&emsp;
							<div class="checkbox"
								style="display: inline-block; width: 27%; margin-top: 2ex;">
								<label><input class="icheckbox" type="checkbox"
									id="chartLocation" />&nbsp;Show Location</label>
							</div>
							&emsp;&emsp;
							<div class="checkbox"
								style="display: inline-block; width: 27%; margin-top: 2ex;">
								<label><input class="icheckbox" type="checkbox"
									id="chartContact" />&nbsp;Show Contact Details</label>
							</div>
							&emsp;&emsp;

							<div class="checkbox"
								style="display: inline-block; width: 27%; margin-top: 2ex;">
								<label><input class="icheckbox" type="checkbox"
									id="chartLocation" />&nbsp;Show Location</label>
							</div>
							&emsp;&emsp;
							<div class="checkbox"
								style="display: inline-block; width: 27%; margin-top: 2ex;">
								<label><input class="icheckbox" type="checkbox"
									id="chartDI" />&nbsp;Show Direct/Indirect</label>
							</div>
							&emsp;&emsp;
							<div class="checkbox"
								style="display: inline-block; width: 27%; margin-top: 2ex;">
								<label><input class="icheckbox" type="checkbox"
									id="chartI" />&nbsp;Show Indirect</label>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!--END TITLE & BREADCRUMB PAGE-->
		<!--BEGIN CONTENT-->
		<div class="page-content" align="center">
			<div id="twitter-bootstrap-container"
				style="width: 100%; background: #eee;">
				<div id="twitter-bootstrap-tabs">
					<ul class="nav nav-tabs">
						<li><a href="#orgchart" style="font-size: 1.5ex;">&emsp;O
								R G&emsp;C H A R T&emsp;</a></li>
						<li><a href="#tree" style="font-size: 1.5ex;">&emsp;O R
								G&emsp;T R E E&emsp;</a></li>
					</ul>
					<div class="panels">
						<div id="orgchart">
							<div style="width: 100%;">
								<div id="orgChartMenu1"
									style="width: 92%; background: #00ffffff; position: absolute; z-index: 103; transform: translate(0, 4ex);">
									<br>&nbsp;&nbsp;
									<button id="zoomInOrgChart" class="btn btn-dark btn-lg"
										style="float: right;">
										<i class="fa fa-plus"></i>
									</button>
									<br> <br> <br>
									<button id="zoomOutOrgChart" class="btn btn-dark btn-lg"
										style="float: right;">
										<i class="fa fa-minus"></i>
									</button>
									<br> <br>
								</div>
								<div id="orgChartMenu2"
									style="width: 10%; background: #00ffffff; position: absolute; z-index: 103; transform: translate(0, 4ex);">
									<br>&nbsp;&nbsp;
									<button id="panUpOrgChart" class="btn btn-dark btn-lg"
										style="float: right;">
										<i class="fa fa-chevron-up"></i>
									</button>
									<button id="panRightOrgChart" class="btn btn-dark btn-lg"
										style="margin-left: 17ex;">
										<i class="fa fa-chevron-right"></i>
									</button>
									<button id="panDownOrgChart" class="btn btn-dark btn-lg"
										style="float: right;">
										<i class="fa fa-chevron-down"></i>
									</button>
									<br> <br>
								</div>
								<div id="orgChartMenu3"
									style="background: #00ffffff; position: absolute; z-index: 103; transform: translate(7ex, 13ex);">
									<button id="panLeftOrgChart" class="btn btn-dark btn-lg">
										<i class="fa fa-chevron-left"></i>
									</button>
								</div>
								<div id="orgChartLegend"
									style="width: 25ex; background: #ffffff; border: 3px solid #d3d3d3; position: absolute; z-index: 103; transform: translate(5ex, 76ex); -webkit-border-radius: 6px; -moz-border-radius: 6px; border-radius: 6px;">
									<div id="showLegendDiv" class="col-lg-12"
										style="margin-top: 1ex; margin-bottom: 1ex; display: none;">
										<a href="javascript:void(0)" id="showLegend"
											style="color: #2c2c2c; font-size: 1.5ex;"
											onmouseenter="$(this).css('font-weight','bold');"
											onmouseleave="$(this).css('font-weight','normal');">LEGEND&nbsp;<i
											class="fa fa-angle-double-down"></i></a>
									</div>
									<div id="hideLegendDiv" class="col-lg-12"
										style="margin-top: 1ex; margin-bottom: 1ex; margin-top: 1ex;">
										<a href="javascript:void(0)" id="hideLegend"
											onmouseenter="$(this).css('font-weight','bold')"
											onmouseleave="$(this).css('font-weight','normal')"
											style="color: #2c2c2c; font-size: 1.5ex;">LEGEND&nbsp;<i
											class="fa fa-angle-double-up"></i></a>
									</div>
									<div id="legendContent" class="col-lg-12"
										style="margin-bottom: 1ex; margin-top: 1ex; padding-right: 10ex;">
										<div class="col-lg-6">
											<div class="col-lg-3">
												<div
													style="width: 4ex; height: 4ex; border: 2px solid #2c2c2c; background: #FFFFFF;"></div>
											</div>
											<div class="col-lg-3">
												<font style="font-size: 1ex; color: #000000">FILLED</font>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="col-lg-3">
												<div
													style="width: 4ex; height: 4ex; border: 2px solid #2c2c2c; background: #FFFFFF;"></div>
											</div>
											<div class="col-lg-3">
												<font style="font-size: 1ex; color: #000000">FILLED</font>
											</div>
										</div>
										<br> <br>
										<div class="col-lg-6">
											<div class="col-lg-3">
												<div
													style="width: 4ex; height: 4ex; border: 2px solid #2c2c2c; background: #FFFFFF;"></div>
											</div>
											<div class="col-lg-3">
												<font style="font-size: 1ex; color: #000000">FILLED</font>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="col-lg-3">
												<div
													style="width: 4ex; height: 4ex; border: 2px dashed #2c2c2c; background: #ffffff;"></div>
											</div>
											<div class="col-lg-3">
												<font style="font-size: 1ex; color: #2c2c2c">VACANT</font>
											</div>
										</div>
									</div>
								</div>
								<!-- 
								<div id="orgChartMenu3"
									style="width: 6%; background: #00ffffff; position: absolute; z-index: 103; transform: translate(0, 8ex);">
									<br> <br>
									<button id="panUpOrgChart" class="btn btn-dark btn-lg"
										style="float: right;">
										<i class="fa fa-chevron-left"></i>
									</button>
								</div>
								<div id="orgChartMenu4"
									style="width: 14%; background: #00ffffff; position: absolute; z-index: 103; transform: translate(0, 8ex);">
									<br> <br>
									<button id="panUpOrgChart" class="btn btn-dark btn-lg"
										style="float: right;">
										<i class="fa fa-chevron-right"></i>
									</button>
								</div>
								-->
								<div class="chart" id="OrganiseChart1"
									style="width: 100%; height: 100ex; overflow: auto; background-color: #FFFFFF;"></div>
							</div>
						</div>
						<div id="tree">
							<div id="orgChartTree"
								style="background: #fff; color: #242424; padding: 4ex; font-size: 1.7ex; font-weight: 100; font-family: Oswald, sans-serif; font-weight: normal;"></div>
						</div>
					</div>
				</div>
			</div>

			<div class="panel mal" id="orgChartSketchDiv" style="display: none;">
				<div class="page-title-breadcrumb option-demo mbxxl">
					<div class="page-header pull-left">
						<i class="fa fa-edit fa-5x"></i>
						<div class="page-title">&nbsp;&nbsp;Save Chart as Image/PDF</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="panel-body" id="orgChartSketchDivBody"></div>
			</div>
		</div>
	</div>
	<!--END CONTENT-->
	<!--BEGIN FOOTER-->
	<!--
	<div id="footer">
	</div>
	-->
	<!--END FOOTER-->
	<!--END PAGE WRAPPER-->

	<script src="script/jquery.js"></script>
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


	<script src="styles/raphael.js"></script>
	<script src="styles/raphael.export.js"></script>
	<script src="styles/Treant.js"></script>

	<script src="styles/jquery.easing.js"></script>
	<!-- <script src="styles/jquery.transition.js"></script> -->
	<script src="styles/jquery.mousewheel.js"></script>
	<script src="styles/perfect-scrollbar.js"></script>

	<script src="styles/switchery.js"></script>

	<script src="styles/jquery.easytabs.js"></script>

	<script src="styles/jquery.tiny-draggable.min.js"></script>

	<script src="script/e-smart-zoom-jquery.js"></script>

	<script src="styles/jspdf.debug.js">
		
	</script>
	<script src="styles/html2pdf.js">
		
	</script>
	<!-- 
	<script src="styles/sketch.min.js"></script>
 -->
	<script src="styles/tooltipster.bundle.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.3/jstree.min.js"></script>

	<script type="text/javascript"
		src="https://canvg.github.io/canvg/rgbcolor.js"></script>
	<script type="text/javascript"
		src="https://canvg.github.io/canvg/StackBlur.js"></script>
	<script type="text/javascript"
		src="https://canvg.github.io/canvg/canvg.js"></script>

	<script src="styles/raphael.js"></script>
	<script src="styles/raphael.export.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>
	<script>
		$( function () {
			$( '#orgChartTree' ).jstree( {
				'core' : {
					'multiple' : false,
					'themes' : {
						'name' : 'proton',
						'responsive' : true
					},
					'data' : [
						{
							"id" : "Rajeev",
							"text" : "Rajeev Shirvastava  |  CO - CEO - Life Scinces Ingredients",
							"icon" : "fa fa-user",
							"state" : {
								"opened" : false,
								"disabled" : false
							},
							"children" : [
								{
									"text" : "Chandan Singh  |  SBU Head - LSC",
									"state" : {
										"selected" : false,
										"opened" : false
									},
									"icon" : "fa fa-user",
									"children" : [
											{
												"text" : "V Sridhar | Sales Coordinator",
												"icon" : "fa fa-user"
											}, {
												"text" : "Ranjeet Singh | VP - Sales",
												"icon" : "fa fa-user"
											}, {
												"text" : "Sunil Singh | AM - Dispatch Planning",
												"icon" : "fa fa-user"
											}, {
												"text" : "Deepak Sharma | DGM - Europe & Americas",
												"icon" : "fa fa-user"
											}, {
												"text" : "Chintan Gosalia | DGM - Product, Project & Strategy",
												"icon" : "fa fa-user"
											}, {
												"text" : "Udham Singh | DGM - Logistics",
												"icon" : "fa fa-user"
											}, {
												"text" : "(Vacant) | Procurement & Planning",
												"icon" : "fa fa-user"
											}, {
												"text" : "Nishkarsh J - Gajraula / Vishwas Chinchore - Nira | PPC SPOC",
												"icon" : "fa fa-user"
											}, {
												"text" : "Jaideep Hajra - Gajraula / RM Waza - Nira | Manufacturing",
												"icon" : "fa fa-user"
											}, {
												"text" : "Nitin S - Gajraula / Ajay N - Nira | FG Dispatch SPOC",
												"icon" : "fa fa-user"
											}
									]
								}
							]
						}
					]
				}
			} );

			$( '#filtersDiv' ).tinyDraggable();

			$( '#orgChartTree' )
			// listen for event
			.on( 'changed.jstree', function ( e, data ) {
				var i, j, r = [];
				for ( i = 0, j = data.selected.length; i < j; i++ ) {
					r.push( data.instance.get_node( data.selected[ i ] ).id ); //id or text can be asked here
				}
				//alert( 'Selected: ' + r.join( ', ' ) );
			} )
			// create the instance
			.jstree();

			$( '#twitter-bootstrap-tabs' ).easytabs();

		} );
	</script>
	<script>
		var config = {
			container : "#OrganiseChart1",
			rootOrientation : 'NORTH', // NORTH || EAST || WEST || SOUTH
			levelSeparation : 15,
			siblingSeparation : 5,
			subTeeSeparation : 5,
			connectors : {
				type : 'step'
			},
			node : {
				collapsable : false,
				HTMLclass : 'nodePrintable'
			},
			animateOnInit : true,
			animation : {
				nodeAnimation : "easeOutQuad",
				nodeSpeed : 700,
				connectorsAnimation : "bounce",
				connectorsSpeed : 700
			}
		}, ceo = {
			text : {
				name : "Rajeev Shrivastava",
				title : "CO - CEO - Life Sciences Ingredients",
			//contact : 'Dept. A'
			},
			//image : "images/avatar/48.jpg",
			//HTMLclass : 'nodeRed',
			HTMLclass : 'nodePrintableCollapsable',
			HTMLid : "ceo"
		}, sbu = {
			parent : ceo,
			text : {
				name : "Chandan Singh",
				title : "SBU Head - LSC",
			//contact : 'Dept. B'
			},
			//HTMLclass : 'nodeBlue',
			HTMLclass : 'nodePrintable',
			//image : "images/avatar/eg1.jpeg",
			HTMLid : "sbu"
		}, sbu_1 = {
			parent : sbu,
			pseudo : true,
			HTMLid : "sbu_1"
		}, sc = {
			parent : sbu_1,
			text : {
				name : "V Sridhar",
				title : "Sales Coordinator",
			//contact : 'Dept. C'
			},
			//image : "images/avatar/eg6.png",
			//HTMLclass : 'nodeGreen',
			HTMLclass : 'nodePrintable',
			HTMLid : "sc"
		}, vps = {
			parent : sbu_1,
			text : {
				name : "Ranjeet Singh",
				title : "VP - Sales",
			//contact : 'Dept. C'
			},
			//image : "images/avatar/eg3.jpg",
			collapsed : false,
			//HTMLclass : 'nodeGreen',
			HTMLclass : 'nodePrintable',
			HTMLid : "vps"
		}, rhg = {
			parent : vps,
			text : {
				name : "Jitendra Kalantri",
				title : "Regional Head - Gujrat (LSC)",
			//contact : 'Dept. C'
			},
			//image : "images/avatar/eg2.jpeg",
			//HTMLclass : 'nodePurple',
			HTMLclass : 'nodePrintable',
			HTMLid : "rhg"
		}, dmsa = {
			parent : rhg,
			text : {
				name : "Keyur Shah",
				title : "DM - Sales Admin",
			//contact : 'Dept. C'
			},
			//image : "images/avatar/eg4.jpeg",
			HTMLid : "dmsa"
		}, rhane = {
			parent : vps,
			text : {
				name : "Raj Kishor",
				title : "Regional Head - Acetyls - North & East India",
			//contact : 'Dept. C'
			},
			//image : "images/avatar/eg7.jpg",
			HTMLclass : 'nodePurple',
			HTMLid : "rhane"
		}, sm = {
			parent : rhane,
			text : {
				name : "Abhishek Dube",
				title : "Sales Manager",
			//contact : 'Dept. C'
			},
			//image : "images/avatar/eg2.jpeg",
			HTMLid : "sm"
		}, rhp = {
			parent : rhane,
			text : {
				name : "Rajeev Aggarwal",
				title : "Regional Head - Punjab",
			//contact : 'Dept. C'
			},
			//image : "images/avatar/eg5.jpg",
			HTMLid : "rhp"
		}, amk = {
			parent : rhane,
			text : {
				name : "Bikash Shaw",
				title : "Area Manager - Kolkata",
			//contact : 'Dept. C'
			},
			//image : "images/avatar/eg1.jpeg",
			HTMLid : "amk"
		}, rhais = {
			parent : vps,
			text : {
				name : "TNLV Rao",
				title : "Regional Head - Acetyls - AI-South",
			//contact : 'Dept. C'
			},
			//image : "images/avatar/eg3.jpg",
			//HTMLclass : 'nodePurple',
			HTMLclass : 'nodePrintable',
			HTMLid : "rhais"
		}, ams = {
			parent : rhais,
			text : {
				name : "M Munisekhar",
				title : "Area Manager - Sales",
			//contact : 'Dept. D'
			},
			//image : "images/avatar/eg6.png",
			HTMLid : "ams"
		}, ess = {
			parent : rhais,
			text : {
				name : "Jeevan Kumar (Comm. Pool)",
				title : "Executive Sales Supp.",
			//contact : 'Dept. D'
			},
			//image : "images/avatar/eg7.jpg",
			HTMLid : "ess"
		}, ch = {
			parent : rhais,
			text : {
				name : "Suresh Babu (Comm. Pool)",
				title : "Coordinator Hyderabad",
			//contact : 'Dept. D'
			},
			//image : "images/avatar/eg3.jpg",
			HTMLid : "ch"
		}, smroa = {
			parent : vps,
			text : {
				name : "Manish Saxena",
				title : "Sales Manager - Rest of Asia",
			//contact : 'Dept. B'
			},
			//image : "images/avatar/eg4.jpeg",
			//HTMLclass : 'nodePurple',
			HTMLclass : 'nodePrintable',
			HTMLid : "smroa"
		}, rhm = {
			parent : vps,
			text : {
				name : "R.K.Sharma",
				title : "Regional Head - Mumbai",
			//contact : 'Dept. B'
			},
			//image : "images/avatar/eg1.jpeg",
			//HTMLclass : 'nodePurple',
			HTMLclass : 'nodePrintable',
			HTMLid : "rhm"
		}, c = {
			parent : rhm,
			text : {
				name : "Id Unni",
				title : "Coordinator",
			//contact : 'Dept. B'
			},
			//image : "images/avatar/eg2.jpeg",
			HTMLid : "c"
		}, am = {
			parent : sbu_1,
			text : {
				name : "Sunil Singh",
				title : "AM - Dispatch Planning",
			//contact : 'Dept. B'
			},
			//image : "images/avatar/eg6.png",
			collapsed : false,
			//HTMLclass : 'nodeGreen',
			HTMLclass : 'nodePrintable',
			HTMLid : "am"
		}, es = {
			parent : am,
			text : {
				name : "Prateek Sharma",
				title : "Executive Sales",
			//contact : 'Dept. F'
			},
			//image : "images/avatar/eg5.jpg",
			//HTMLclass : 'nodePurple',
			HTMLclass : 'nodePrintable',
			HTMLid : "es"
		}, esv = {
			parent : es,
			text : {
				name : "(Vacant)",
				title : "Sales Supp.",
			//contact : 'Dept. F'
			},
			//image : "images/avatar/vacantdp.png",
			//HTMLclass : 'nodeVacant',
			HTMLclass : 'nodePrintable',
			HTMLid : "esv"
		}, dgmea = {
			parent : sbu_1,
			text : {
				name : "Deepak Sharma",
				title : "DGM - Europe & Americas"
			},
			collapsed : false,
			//image : "images/avatar/eg2.jpeg",
			//HTMLclass : 'nodeGreen',
			HTMLclass : 'nodePrintable',
			HTMLid : "dgmea"
		}, sme = {
			parent : dgmea,
			text : {
				name : "Chandroday Pande",
				title : "Sales Manager - Europe",
			//contact : 'Dept. B'
			},
			//image : "images/avatar/eg3.jpg",
			//HTMLclass : 'nodePurple',
			HTMLclass : 'nodePrintable',
			HTMLid : "sme"
		}, dgmpps = {
			parent : sbu_1,
			text : {
				name : "Chintan Gosalia",
				title : "DGM - Product, Project & Strategy",
			//contact : 'Dept. E'
			},
			//image : "images/avatar/eg1.jpeg",
			collapsed : false,
			//HTMLclass : 'nodeGreen',
			HTMLclass : 'nodePrintable',
			HTMLid : "dgmpps"
		}, ba = {
			parent : dgmpps,
			text : {
				name : "Nishant Goel",
				title : "Business Analyst",
			//contact : 'Dept. E'
			},
			//image : "images/avatar/eg7.jpg",
			//HTMLclass : 'nodePurple',
			HTMLclass : 'nodePrintable',
			HTMLid : "ba"
		}, dgml = {
			parent : sbu_1,
			text : {
				name : "Udham Singh",
				title : "DGM - Logistics",
			//contact : 'Dept. F'
			},
			//image : "images/avatar/eg2.jpeg",
			collapsed : false,
			//HTMLclass : 'nodeGreen',
			HTMLclass : 'nodePrintable',
			HTMLid : "dgml"
		}, dgml_1 = {
			parent : dgml,
			pseudo : true,
			HTMLid : "dgml_1"
		}, ml = {
			parent : dgml_1,
			text : {
				name : "Kamal Kumar",
				title : "Managing Logistics",
			//contact : 'Dept. F'
			},
			//image : "images/avatar/eg3.jpg",
			HTMLid : "ml"
		}, dml1 = {
			parent : dgml_1,
			text : {
				name : "Devasis Patra",
				title : "DM-Logistics",
			//contact : 'Dept. E'
			},
			//image : "images/avatar/eg1.jpeg",
			HTMLid : "dml1"
		}, dml2 = {
			parent : dgml_1,
			text : {
				name : "Arun Ranikar",
				title : "DM - Logistics",
			//contact : 'Dept. E'
			},
			//image : "images/avatar/eg4.jpeg",
			HTMLid : "dml2"
		}, aml = {
			parent : dgml_1,
			text : {
				name : "Mahendra Solanki",
				title : "Assistant Manager - Logistics",
			//contact : 'Dept. E'
			},
			//image : "images/avatar/eg5.jpg",
			HTMLid : "aml"
		}, dgml_2 = {
			parent : dgml,
			connectors : {
				type : 'step',
				style : {
					'stroke' : '#000',
					"stroke-dasharray" : "--",
					"stroke-width" : 1,
					'arrow-start' : 'classic-long'
				}
			},
			pseudo : true,
			HTMLid : "dgml_2"
		}, sclh = {
			parent : dgml_2,
			text : {
				name : "Vikas Gupta",
				title : "SC Logistic Head",
			//contact : 'Dept. F'
			},
			//HTMLclass : 'nodeDotted',
			HTMLclass : 'nodePrintable',
			//image : "images/avatar/eg2.jpeg",
			HTMLid : "sclh"
		}, sbu_2 = {
			parent : sbu,
			connectors : {
				type : 'step',
				style : {
					'stroke' : '#000',
					"stroke-dasharray" : "--",
					"stroke-width" : 1,
					'arrow-start' : 'classic-long'
				}
			},
			pseudo : true,
			HTMLid : "sbu_2"
		}, pap = {
			parent : sbu_2,
			text : {
				name : "(Vacant)",
				title : "Procurement & Planning",
			//contact : 'Dept. B'
			},
			//image : "images/avatar/vacantdp.png",
			collapsed : false,
			//HTMLclass : 'nodeVacant',
			HTMLclass : 'nodePrintable',
			HTMLid : "pap"
		}, mp = {
			parent : pap,
			text : {
				name : "Mumbai Port",
				title : "Suhas Mule",
			//contact : 'Dept. E'
			},
			//image : "images/avatar/eg6.png",
			//HTMLclass : 'nodePurple',
			HTMLclass : 'nodePrintable',
			HTMLid : "mp"
		}, kp = {
			parent : pap,
			text : {
				name : "Deepak Pancholi",
				title : "Kandla Port",
			//contact : 'Dept. E'
			},
			//image : "images/avatar/eg5.jpg",
			//HTMLclass : 'nodePurple',
			HTMLclass : 'nodePrintable',
			HTMLid : "kp"
		}, kpv = {
			parent : kp,
			text : {
				name : "(Vacant)",
				title : "Kandla Port Supp.",
			//contact : 'Dept. E'
			},
			//image : "images/avatar/vacantdp.png",
			//HTMLclass : 'nodeVacant',
			HTMLclass : 'nodePrintable',
			HTMLid : "kpv"
		}, ppc = {
			parent : sbu_2,
			text : {
				name : "Niskarsh J - Gajraula / Vishwas Chinchore - Nira",
				title : "PPC SPOC",
			//contact : 'Dept. F'
			},
			//image : "images/avatar/eg7.jpg",
			//HTMLclass : 'nodeLinkDotted',
			HTMLclass : 'nodePrintable',
			HTMLid : "ppc"
		}, man = {
			parent : sbu_2,
			text : {
				name : "Jaideep Hajra - Gajraula / RM Waza - Nira",
				title : "Manufacturing",
			//contact : 'Dept. G'
			},
			//image : "images/avatar/eg1.jpeg",
			//HTMLclass : 'nodeLinkDotted',
			HTMLclass : 'nodePrintable',
			HTMLid : "man"
		}, fgd = {
			parent : sbu_2,
			text : {
				name : "Nitin S - Gajraula / Ajay N - Nira",
				title : "FG Dispatch SPOC",
			//contact : 'Dept. F'
			},
			//image : "images/avatar/eg2.jpeg",
			//HTMLclass : 'nodeLinkDotted',
			HTMLclass : 'nodePrintable',
			HTMLid : "fgd"
		};

		var ALTERNATIVE = [
				config, ceo, sbu, sbu_1, sbu_2, sc, vps, rhg, dmsa, rhane, sm, rhp, amk, rhais, ams, ess, ch, smroa, rhm, c, am, es, esv, dgmea, sme, dgmpps, ba, dgml, dgml_1, ml, dml1, dml2, aml, dgml_2, sclh, pap, mp, kp, kpv, ppc, man, fgd
		]; // 34

		var orgchart = new Treant( ALTERNATIVE );
	</script>

	<script>
		$( document ).ready( function () {

			$( document ).keydown( function ( event ) {
				if ( event.ctrlKey == true && ( event.which == '61' || event.which == '107' || event.which == '173' || event.which == '109' || event.which == '187' || event.which == '189' ) ) {
					//alert('disabling zooming');
					event.preventDefault();
					// 107 Num Key  +
					//109 Num Key  -
					//173 Min Key  hyphen/underscor Hey
					// 61 Plus key  +/=
				}
			} );

			$( window ).bind( 'mousewheel DOMMouseScroll', function ( event ) {
				if ( event.ctrlKey == true ) {
					//alert('disabling zooming');
					event.preventDefault();
				}
			} );

			options = {
				'top' : '0', // zoom target container top position in pixel
				'left' : '0', // zoom target container left position in pixel
				'width' : '100%', // zoom target container width in pixel or in percent
				'height' : '100%', // zoom target container height in pixel or in percent 
				'easing' : 'smartZoomEasing', // jquery easing function used when the browser doesn't support css transitions
				'maxScale' : 3, // the max scale that will be applied on the zoom target
				'dblClickMaxScale' : 1.8, // the max scale that will be applied on the zoom target on double click
				'mouseEnabled' : true, // enable plugin mouse interaction 
				'scrollEnabled' : true, // enable plugin mouse wheel behviour
				'dblClickEnabled' : true, // enable plugin mouse doubleClick behviour
				/**/'mouseMoveEnabled' : true, // enable plugin target drag behviour
				'moveCursorEnabled' : true, // show moveCursor for drag
				'touchEnabled' : true, // enable plugin touch interaction 
				'dblTapEnabled' : true, // enable plugin double tap behaviour 
				'pinchEnabled' : true, // enable zoom when user pinch on target
				'touchMoveEnabled' : true, // enable target move via touch
			//'containerBackground' : '#FFFFFF', // zoom target container background color (if containerClass is not set)
			//'containerClass' : ''// class to apply to zoom target container if you whant to change background or borders (don't change size or position via css)
			}

			$( "#OrganiseChart1" ).smartZoom( options ); // start plugin behaviour

			$( "#zoomInOrgChart" ).click( function () {
				$( '#OrganiseChart1' ).smartZoom( "zoom", 1 );
			} );

			$( "#zoomOutOrgChart" ).click( function () {
				$( '#OrganiseChart1' ).smartZoom( "zoom", -1 );
			} );

			$( "#panUpOrgChart" ).click( function () {
				$( '#OrganiseChart1' ).smartZoom( "pan", 0, 250 );
			} );
			$( "#panDownOrgChart" ).click( function () {
				$( '#OrganiseChart1' ).smartZoom( "pan", 0, -250 );
			} );
			$( "#panLeftOrgChart" ).click( function () {
				$( '#OrganiseChart1' ).smartZoom( "pan", 250, 0 );
			} );
			$( "#panRightOrgChart" ).click( function () {
				$( '#OrganiseChart1' ).smartZoom( "pan", -250, 0 );
			} );

			$( "#collapseFiltersDiv" ).click( function () {

				$( "#filtersContainer" ).fadeOut();
				$( "#collapseFiltersDiv" ).hide();
				$( "#expandFiltersDiv" ).show();
			} );

			$( "#expandFiltersDiv" ).click( function () {

				$( "#filtersContainer" ).fadeIn();
				$( "#expandFiltersDiv" ).hide();
				$( "#collapseFiltersDiv" ).show();
			} );

			$( "#showLegend" ).click( function () {

				$( '#orgChartLegend' ).css( "transform", "translate(5ex, 76ex)" );
				$( "#legendContent" ).fadeIn();
				$( "#showLegendDiv" ).hide();
				$( "#hideLegendDiv" ).show();
			} );

			$( "#hideLegend" ).click( function () {
				$( '#orgChartLegend' ).css( "transform", "translate(5ex, 90ex)" );
				$( "#legendContent" ).hide();
				$( "#hideLegendDiv" ).hide();
				$( "#showLegendDiv" ).show();
			} );

			$( "#showFilters" ).click( function () {

				$( "#filtersDiv" ).fadeIn();
				$( "#showFilters" ).hide();
				$( "#hideFilters" ).show();
				//$( '#OrganiseChart1' ).css( "transform", "translate(0ex, 100ex)" );
			} );

			$( "#hideFilters" ).click( function () {

				//$( '#OrganiseChart1' ).css( "transform", "translate(0ex, -50ex)" );
				$( "#filtersDiv" ).fadeOut();
				$( "#hideFilters" ).hide();
				$( "#showFilters" ).show();
			} );

			$( "#hideFilters2" ).click( function () {

				$( "#filtersDiv" ).fadeOut();
				$( "#hideFilters" ).hide();
				$( "#showFilters" ).show();
			} );

			var switchChartElem = document.querySelector( '.printableChartSwitch' );
			var switchery = new Switchery( switchChartElem, {
				color : '#2c2c2c',
				secondaryColor : '#c1c1c1',
				size : 'medium'
			} );
			switchChartElem.onchange = function () {
				if ( switchChartElem.checked === true ) {

					$( '#exportButtons' ).css( 'visibility', 'visible' );

					var config = {
						container : "#OrganiseChart1",
						rootOrientation : 'NORTH', // NORTH || EAST || WEST || SOUTH
						levelSeparation : 15,
						siblingSeparation : 5,
						subTeeSeparation : 5,
						connectors : {
							type : 'step'
						},
						node : {
							collapsable : true,
							HTMLclass : 'nodeNormal',
						},
						animateOnInit : false,
						animation : {
							nodeAnimation : "easeOutQuad",
							nodeSpeed : 700,
							connectorsAnimation : "bounce",
							connectorsSpeed : 700
						}
					}, ceo = {
						text : {
							name : "Rajeev",
							title : "CO - CEO",
						//contact : 'Dept. A'
						},
						//image : "images/avatar/48.jpg",
						HTMLclass : 'nodeNormal',
						HTMLid : "ceo"
					}, sbu = {
						parent : ceo,
						text : {
							name : "Chandan",
							title : "SBU",
						//contact : 'Dept. B'
						},
						HTMLclass : 'nodeDotted',
						//image : "images/avatar/eg1.jpeg",
						HTMLid : "sbu"
					};

					var ALTERNATIVE = [
							config, ceo, sbu
					]; // 34

					var orgchart = new Treant( ALTERNATIVE );

				} else {

					$( '#exportButtons' ).css( 'visibility', 'hidden' );

					var config = {
						container : "#OrganiseChart1",
						rootOrientation : 'NORTH', // NORTH || EAST || WEST || SOUTH
						levelSeparation : 15,
						siblingSeparation : 5,
						subTeeSeparation : 5,
						connectors : {
							type : 'step'
						},
						node : {
							collapsable : false,
							HTMLclass : 'nodePrintable',
						},
						animateOnInit : true,
						animation : {
							nodeAnimation : "easeOutQuad",
							nodeSpeed : 700,
							connectorsAnimation : "bounce",
							connectorsSpeed : 700
						}
					}, ceo = {
						text : {
							name : "Rajeev",
							title : "CO - CEO",
						//contact : 'Dept. A'
						},
						//image : "images/avatar/48.jpg",
						//HTMLclass : 'nodeRed',
						HTMLclass : 'nodePrintableCollapsable',
						HTMLid : "ceo"
					}, sbu = {
						parent : ceo,
						text : {
							name : "Chandan",
							title : "SBU",
						//contact : 'Dept. B'
						},
						//HTMLclass : 'nodeBlue',
						collapsed : true,
						HTMLclass : 'nodePrintable',
						//image : "images/avatar/eg1.jpeg",
						HTMLid : "sbu"
					};

					var ALTERNATIVE = [
							config, ceo, sbu
					]; // 34

					var orgchart = new Treant( ALTERNATIVE );

				}
			};

			$( '.icheckbox' ).iCheck( {
				checkboxClass : 'icheckbox_minimal',
				radioClass : 'iradio_minimal'
			} );

			$( '.node' ).tooltipster( {
				animation : 'fade',
				side : 'bottom',
				theme : 'tooltipster-borderless',
				contentAsHTML : true
			} );

			$( '.node' ).mouseenter( function () {
				$( '#' + this.id ).tooltipster( 'content', '_$t' + this.id + '_$ta' ).tooltipster( 'open' );
			} );

			$( '.node' ).mouseleave( function () {
				$( '.node' ).tooltipster( 'close' );
			} );

			$( "#downloadImage" ).click( function () {

				$( '#OrganiseChart1' ).smartZoom( 'destroy' );

				document.getElementById( 'OrganiseChart1' ).style.overflow = 'visible'; //might need to do this to grandparent nodes as well, possibly.

				var useWidth = $( '#OrganiseChart1' ).prop( 'scrollWidth' ); //document.getElementById("primary").style.width;
				var useHeight = $( '#OrganiseChart1' ).prop( 'scrollHeight' ); //document.getElementById("primary").style.height;

				var scaleBy = 2;
				var w = useWidth;
				var h = useHeight;
				var scaledCanvas = document.createElement( 'canvas' );
				scaledCanvas.width = w * scaleBy;
				scaledCanvas.height = h * scaleBy;
				var scaledContext = scaledCanvas.getContext( '2d' );
				scaledContext.scale( scaleBy, scaleBy );

				html2canvas( $( '#OrganiseChart1' ), {
					canvas : scaledCanvas,
					logging : true,
					onrendered : function ( canvas ) {

						$( "#orgChartSketchDivBody" ).html( "_$tag__________________________$tag____" );

						var sketchCanvas = document.getElementById( 'orgChartSketch' );
						var sketchContext = sketchCanvas.getContext( '2d' );
						sketchCanvas.width = w * scaleBy;
						sketchCanvas.height = h * scaleBy;
						console.log( w * scaleBy );
						console.log( h * scaleBy );
						sketchContext.drawImage( canvas, 0, 0 );
						sketchContext.scale( ( w * scaleBy ) / ( h * scaleBy ), ( w * scaleBy ) / ( h * scaleBy ) );

						var a = document.createElement( 'a' );
						a.href = sketchCanvas.toDataURL( "image/png" ).replace( "image/png", "image/octet-stream" );
						a.download = 'OrgChart.jpg';

						a.click();

					}
				} );

				$( "#OrganiseChart1" ).smartZoom();
			} );

			$( "#downloadPDF" ).click( function () {
				$( "#orientationModal" ).modal( 'show' );
			} );

			$( "#portraitOrientation" ).click( function () {

				$( "#orientationModal" ).modal( 'hide' );

				$( '#OrganiseChart1' ).smartZoom( 'destroy' );

				document.getElementById( 'OrganiseChart1' ).style.overflow = 'visible'; //might need to do this to grandparent nodes as well, possibly.

				var useWidth = $( '#OrganiseChart1' ).prop( 'scrollWidth' ); //document.getElementById("primary").style.width;
				var useHeight = $( '#OrganiseChart1' ).prop( 'scrollHeight' ); //document.getElementById("primary").style.height;

				var scaleBy = 2;
				var w = useWidth;
				var h = useHeight;
				var scaledCanvas = document.createElement( 'canvas' );
				scaledCanvas.width = w * scaleBy;
				scaledCanvas.height = h * scaleBy;
				var scaledContext = scaledCanvas.getContext( '2d' );
				scaledContext.scale( scaleBy, scaleBy );

				html2canvas( $( '#OrganiseChart1' ), {
					canvas : scaledCanvas,
					logging : true,
					onrendered : function ( canvas ) {

						$( "#orgChartSketchDivBody" ).html( "_$tag__________________________$tag____" );

						var sketchCanvas = document.getElementById( 'orgChartSketch' );
						var sketchContext = sketchCanvas.getContext( '2d' );
						sketchCanvas.width = w * scaleBy;
						sketchCanvas.height = h * scaleBy;
						console.log( w * scaleBy );
						console.log( h * scaleBy );
						sketchContext.drawImage( canvas, 0, 0 );
						sketchContext.scale( ( w * scaleBy ) / ( h * scaleBy ), ( w * scaleBy ) / ( h * scaleBy ) );

						var doc = new jsPDF( "p", "mm", "a4" );

						var width = doc.internal.pageSize.width;
						var height = doc.internal.pageSize.width / ( w / h );

						//var orgChartCanvas = document.getElementById( 'orgChartSketch' );
						var imgData = sketchCanvas.toDataURL( "image/png" );

						doc.addImage( imgData, 'PNG', 0, 30, width, height );

						doc.save( 'OrgChart.pdf' );

					}
				} );

				$( "#OrganiseChart1" ).smartZoom();

			} );

			$( "#landscapeOrientation" ).click( function () {

				$( "#orientationModal" ).modal( 'hide' );

				$( '#OrganiseChart1' ).smartZoom( 'destroy' );

				document.getElementById( 'OrganiseChart1' ).style.overflow = 'visible'; //might need to do this to grandparent nodes as well, possibly.

				var useWidth = $( '#OrganiseChart1' ).prop( 'scrollWidth' ); //document.getElementById("primary").style.width;
				var useHeight = $( '#OrganiseChart1' ).prop( 'scrollHeight' ); //document.getElementById("primary").style.height;

				var scaleBy = 2;
				var w = useWidth;
				var h = useHeight;
				var scaledCanvas = document.createElement( 'canvas' );
				scaledCanvas.width = w * scaleBy;
				scaledCanvas.height = h * scaleBy;
				var scaledContext = scaledCanvas.getContext( '2d' );
				scaledContext.scale( scaleBy, scaleBy );

				html2canvas( $( '#OrganiseChart1' ), {
					canvas : scaledCanvas,
					logging : true,
					onrendered : function ( canvas ) {

						$( "#orgChartSketchDivBody" ).html( "_$tag__________________________$tag____" );

						var sketchCanvas = document.getElementById( 'orgChartSketch' );
						var sketchContext = sketchCanvas.getContext( '2d' );
						sketchCanvas.width = w * scaleBy;
						sketchCanvas.height = h * scaleBy;
						console.log( w * scaleBy );
						console.log( h * scaleBy );
						sketchContext.drawImage( canvas, 0, 0 );
						sketchContext.scale( ( w * scaleBy ) / ( h * scaleBy ), ( w * scaleBy ) / ( h * scaleBy ) );

						var doc = new jsPDF( "landscape", "mm", "a4" );

						var width = doc.internal.pageSize.width;
						var height = doc.internal.pageSize.width / ( w / h );

						//var orgChartCanvas = document.getElementById( 'orgChartSketch' );
						var imgData = sketchCanvas.toDataURL( "image/png" );

						doc.addImage( imgData, 'PNG', 0, 30, width, height );

						doc.save( 'OrgChart.pdf' );

					}
				} );

				$( "#OrganiseChart1" ).smartZoom();

			} );

			$( "#directToPrinter" ).click( function () {

				$( '#OrganiseChart1' ).smartZoom( 'destroy' );

				document.getElementById( 'OrganiseChart1' ).style.overflow = 'visible'; //might need to do this to grandparent nodes as well, possibly.

				var useWidth = $( '#OrganiseChart1' ).prop( 'scrollWidth' ); //document.getElementById("primary").style.width;
				var useHeight = $( '#OrganiseChart1' ).prop( 'scrollHeight' ); //document.getElementById("primary").style.height;

				var scaleBy = 2;
				var w = useWidth;
				var h = useHeight;
				var scaledCanvas = document.createElement( 'canvas' );
				scaledCanvas.width = w * scaleBy;
				scaledCanvas.height = h * scaleBy;
				var scaledContext = scaledCanvas.getContext( '2d' );
				scaledContext.scale( scaleBy, scaleBy );

				html2canvas( $( '#OrganiseChart1' ), {
					canvas : scaledCanvas,
					logging : true,
					onrendered : function ( canvas ) {

						$( "#orgChartSketchDivBody" ).html( "_$tag__________________________$tag____" );

						var sketchCanvas = document.getElementById( 'orgChartSketch' );
						var sketchContext = sketchCanvas.getContext( '2d' );
						sketchCanvas.width = w * scaleBy;
						sketchCanvas.height = h * scaleBy;
						console.log( w * scaleBy );
						console.log( h * scaleBy );
						sketchContext.drawImage( canvas, 0, 0 );
						sketchContext.scale( ( w * scaleBy ) / ( h * scaleBy ), ( w * scaleBy ) / ( h * scaleBy ) );

						var myImage = sketchCanvas.toDataURL( "image/png" );
						var tWindow = window.open( "" );
						$( tWindow.document.body ).html( "<img id='Image' src=" + myImage + " style='width:100%;'>_$tag_" ).ready( function () {
							tWindow.focus();
							tWindow.print();
						} );
					}

				} );

				$( "#OrganiseChart1" ).smartZoom();
			} );

			/*
			$( "#editImage" ).click( function () {

				$( '#OrganiseChart1' ).smartZoom( 'destroy' );

				document.getElementById( 'OrganiseChart1' ).style.overflow = 'visible'; //might need to do this to grandparent nodes as well, possibly.

				var useWidth = $( '#OrganiseChart1' ).prop( 'scrollWidth' ); //document.getElementById("primary").style.width;
				var useHeight = $( '#OrganiseChart1' ).prop( 'scrollHeight' ); //document.getElementById("primary").style.height;

				var scaleBy = 2;
				var w = useWidth;
				var h = useHeight;
				var scaledCanvas = document.createElement( 'canvas' );
				scaledCanvas.width = w * scaleBy;
				scaledCanvas.height = h * scaleBy;
				var scaledContext = scaledCanvas.getContext( '2d' );
				scaledContext.scale( scaleBy, scaleBy );

				html2canvas( $( '#OrganiseChart1' ), {
					canvas : scaledCanvas,
					logging : true,
					onrendered : function ( canvas ) {

						
						$( "#orgChartSketchDivBody" ).html(
								"_$tag________________________________________________________________________________________$tag______________________$ta&nbsp;&nbsp;Marker_$ta" + "&nbsp;&nbsp;&nbsp;"
										+ "_$tag____________________________________________________________________________________$tag______________________$ta&nbsp;&nbsp;Eraser_$ta" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
										+ "_$tag______________________________________________________________________________1_$ta" + "&nbsp;" + "_$tag______________________________________________________________________________3_$ta" + "&nbsp;"
										+ "_$tag______________________________________________________________________________5_$ta" + "&nbsp;" + "_$tag________________________________________________________________________________10_$ta" + "&nbsp;"
										+ "_$tag________________________________________________________________________________30_$ta" + "&nbsp;" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
										+ "_$tag_______________________________________________________________________________________________________________________&nbsp;&nbsp;_$ta" + "&nbsp;"
										+ "_$tag________________________________________________________________________________________________________________________&nbsp;&nbsp;_$ta" + "&nbsp;"
										+ "_$tag_________________________________________________________________________________________________________________________&nbsp;&nbsp;_$ta" + "&nbsp;"
										+ "_$tag__________________________________________________________________________________________________________________________&nbsp;&nbsp;_$ta" + "&nbsp;"
										+ "_$tag_________________________________________________________________________________________________________________________&nbsp;&nbsp;_$ta" + "&nbsp;"
										+ "_$tag________________________________________________________________________________________________________________________&nbsp;&nbsp;_$ta" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
										+ "_$tag__________________________________________________________________$tag_______________________$ta&nbsp;&nbsp;Reset_$ta" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
										+ "_$tag____________________________________________________________________$tag_____________________$ta&nbsp;&nbsp;Save as Image_$ta" + "&nbsp;&nbsp;"
										+ "_$tag_________________________________________$tag__________________________$ta&nbsp;&nbsp;Save as PDF_$ta" + "&nbsp;" + "_$ta_$ta" + "_$tag__________________________$tag____" );
						

						var sketchCanvas = document.getElementById( 'orgChartSketch' );
						var sketchContext = sketchCanvas.getContext( '2d' );
						sketchCanvas.width = w * scaleBy;
						sketchCanvas.height = h * scaleBy;
						console.log( w * scaleBy );
						console.log( h * scaleBy );
						//sketchCanvas.style.width = "1200px";
						//sketchCanvas.style.height = "1200px";
						sketchContext.drawImage( canvas, 0, 0 );
						sketchContext.scale( ( w * scaleBy ) / ( h * scaleBy ), ( w * scaleBy ) / ( h * scaleBy ) );

						$( "#orgChartSketch" ).sketch( {
							defaultColor : "#000",
							defaultSize : "1"
						} );

						$( "#orgChartSketchDiv" ).show();
						$( 'html,body' ).animate( {
							scrollTop : $( "#orgChartSketchDiv" ).offset().top
						}, 'fast' );

						$( "#resetCanvas" ).click( function () {
						} );

						$( "#downloadImage" ).click( function () {

							//var orgChartCanvas = document.getElementById( 'orgChartSketch' );

							var a = document.createElement( 'a' );
							a.href = sketchCanvas.toDataURL( "image/png" ).replace( "image/png", "image/octet-stream" );
							a.download = 'OrgChart.jpg';

							a.click();
						} );

						$( "#downloadPDF" ).click( function () {

							var doc = new jsPDF( "p", "mm", "a4" );

							var width = doc.internal.pageSize.width;
							var height = doc.internal.pageSize.width / ( w / h );

							//var orgChartCanvas = document.getElementById( 'orgChartSketch' );
							var imgData = sketchCanvas.toDataURL( "image/png" );

							doc.addImage( imgData, 'PNG', 0, 30, width, height );

							doc.save( 'OrgChart.pdf' );

						} );
					}
				} );

				$( "#OrganiseChart1" ).smartZoom();
			} );
			 */
		} );
	</script>

</body>
</html>