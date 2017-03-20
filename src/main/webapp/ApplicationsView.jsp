<div document-apps-view>

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
				<a id="logo" ui-sref="jobPostingsView" class="navbar-brand"><span
					class="fa fa-rocket"></span><span class="logo-text">CrossTabConnect</span><span
					style="display: none" class="logo-text-icon">µ</span></a>
			</div>
			<div class="topbar-main">
				<a id="menu-toggle" href="#" target="_blank" class="hidden-xs"><i
					class="fa fa-bars"></i></a>

				<ul class="nav navbar navbar-top-links navbar-right mbn">
					<li class="dropdown"><a data-hover="dropdown" href="#">
							<li class="dropdown topbar-user"><a data-hover="dropdown"
								href="#" class="dropdown-toggle"><img
									src="images/avatar/48.jpg" alt=""
									class="img-responsive img-circle" />&nbsp;<span
									class="hidden-xs">Tanuj Dhaundiyal</span>&nbsp;<span
									class="caret"></span></a>
								<ul class="dropdown-menu dropdown-user pull-right">
									<li><a href="#"><i class="fa fa-user"></i>My Profile</a></li>
									<li class="divider"></li>
									<li><a href="/"><i class="fa fa-key"></i>Log Out</a></li>
								</ul></li>
				</ul>
			</div>
		</nav>
		<!--BEGIN MODAL CONFIG PORTLET-->
		<div id="profileView" class="modal fade">
			<div class="modal-dialog" style="width: 740px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" data-dismiss="modal" aria-hidden="true"
							class="close">&times;</button>
						<h4 class="modal-title">Full Profile</h4>
					</div>
					<div class="modal-body" data-ng-repeat="user in users">
						<img src="{{user.dpurl}}" width="105" height="105" alt="DP"
							title=""
							style="display: inline-block; float: left; clear: left; margin-right: 20px;"
							class="img-responsive img-circle">
						<p class="usercode">UC{{user.usercode}}</p>
						<p class="username">{{user.username}}</p>
						<p class="maindetailscolored2">
							<span class="userjobtitle">{{user.userjobtitle}}</span>&nbsp;-&nbsp;
							<span class="usercompany">{{user.usercompany}}</span>
						</p>
						<p class="mbs" />
						<hr>
						<p class="maindetailsbig">
							<i class="fa fa-map-marker"></i>&nbsp;Location :&nbsp;<span
								class="userlocation">{{user.location}}</span>, <span
								class="usercountry">{{user.country}}</span>
						</p>
						<p class="mbs" />
						<hr>
						<p class="maindetailsbig">
							<i class="fa fa-suitcase"></i>&nbsp;Industry :&nbsp;<span
								class="userindustry">{{user.industry}}</span>
						</p>
						<p class="mbs" />
						<hr>
						<p class="maindetailsbig">
							<i class="fa fa-wrench"></i>&nbsp;Skills :&nbsp;<span
								class="userskills">{{user.skills}}</span>
						</p>
						<p class="mbs" />
						<hr>
						<p class="maindetailsbig">
							<i class="fa fa-book"></i>&nbsp;Education :&nbsp;<span
								class="usereducation1">{{user.crname1}}<span
								style="font-style: italic;"> from </span> {{user.clname1}}
							</span>&nbsp;&nbsp;||&nbsp;&nbsp; <span class="usereducation2">{{user.crname2}}<span
								style="font-style: italic;"> from </span> {{user.clname2}}
							</span>
						</p>
						<p class="mbs" />
						<hr>
						<p class="maindetailsbig">
							<i class="fa fa-chain"></i>&nbsp;LinkedIn Connections :&nbsp;<span
								class="userconnections">{{user.connections}}</span>
						</p>
						<p class="mbs" />
						<hr>
						<p class="maindetailsbig">
							<i class="fa fa-wrench"></i>&nbsp;Member Since :&nbsp;<span
								class="usermembersince">{{user.membersince}}</span>
						</p>
						<p class="mbs" />
						<hr>
						<p class="maindetailsbig" data-ng-if="user.videostatus === '1'">

							<i class="fa fa-video-camera"></i>&nbsp;Video Brief :
							<video id="videoBrief" width="250px" height="580px"
								style="margin-left: 220px; margin-top: 20px; display: block; text-align: center;"
								poster="images/icons/videoloading.gif" preload="auto" controls
								autoplay>
								<source src="{{user.videourl | trustUrl}}" type="video/mp4">
								Your browser does not support the video tag.
							</video>
						</p>
						<p class="maindetailsbig" data-ng-if="user.videostatus === '0'">
							<i class="fa fa-video-camera"></i>&nbsp;Video Brief : Not
							Uploaded.
						</p>
						<p class="mbs" />
						<hr>
						<p class="maindetails">
							<a href="tel:{{user.phone}}" class="btn btn-success"><i
								class="fa fa-phone"></i>&nbsp;{{user.phone}}</a>&nbsp;&nbsp;&nbsp; <a
								href="mailto:{{user.email}}" class="btn btn-yellow"><i
								class="fa fa-envelope"></i>&nbsp;{{user.email}}</a>&nbsp;&nbsp;&nbsp;
							<a href="{{user.profileurl}}" target="_blank"
								class="btn btn-blue"><i class="fa fa-linkedin-square"></i>&nbsp;Go
								to LinkedIn Profile</a>
						</p>
						<p class="mbl" />
					</div>
					<!-- 
					<div class="modal-footer" style="text-align: center;">
						<button type="button" data-dismiss="modal" class="btn btn-default">View
							Applications</button>
					</div>
					 -->
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
	<div id="wrapper">
		<!--BEGIN SIDEBAR MENU-->
		<nav id="sidebar" role="navigation" data-step="2"
			data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
			data-position="right" class="navbar-default navbar-static-side">
			<div class="sidebar-collapse menu-scroll">
				<ul id="side-menu" class="nav">

					<div class="clearfix"></div>
					<!-- <li><a href="dashboard.html"><i
							class="fa fa-tachometer fa-fw">
								<div class="icon-bg bg-orange"></div>
						</i><span class="menu-title">Dashboard</span></a></li>
						 -->
					<li class="active"><a ui-sref="jobPostingsView"><i
							class="fa fa-suitcase fa-fw">
								<div class="icon-bg bg-orange"></div>
						</i><span class="menu-title">Manage Job Postings</span></a></li>

					<li><a ui-sref="profilesView"><i class="fa fa-user fa-fw">
								<div class="icon-bg bg-orange"></div>
						</i><span class="menu-title">Manage Profiles</span></a></li>
				</ul>
			</div>
		</nav>
		<!--END SIDEBAR MENU-->
		<!--BEGIN PAGE WRAPPER-->
		<div id="page-wrapper">
			<!--BEGIN TITLE & BREADCRUMB PAGE-->
			<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
				<div class="page-header pull-left">
					<div class="page-title">Job Applications</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i>&nbsp;<a
						ui-sref="jobPostingsView">Job Postings</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li class="hidden"><a href="#">Job Applications</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
					<li class="active">Job Applications</li>
				</ol>
				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel">
							<div class="panel-body">

								<div class="jdbox">
									<!-- Selected Job Posting Details -->
								</div>
								<div id="demo" class="box jplist mal">

									<!-- panel -->
									<div class="jplist-panel box panel-top">

										<div class="col-lg-12 mbl">
											<!-- reset button -->
											<button type="button" class="jplist-reset-btn"
												data-control-type="reset" data-control-name="reset"
												data-control-action="reset"
												data-ng-click="searchFilter1 = null; searchFilter2 = null; searchFilter3 = null; searchFilter4 = null; searchFilter5 = null; searchFilter6 = null">
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

											<!-- Sort dropdown -->
											<div class="jplist-drop-down" style="width: 250px;"
												data-control-type="sort-drop-down" data-control-name="sort"
												data-control-action="sort"
												data-datetime-format="{day} {month}, {year}">

												<ul>
													<li><span data-path="default">Sort by</span></li>

													<li><span data-path=".usercode" data-order="asc"
														data-type="text">User-Code (asc)</span></li>
													<li><span data-path=".usercode" data-order="desc"
														data-type="text">User-Code (desc)</span></li>

													<li><span data-path=".username" data-order="asc"
														data-type="text">User Name A-Z</span></li>
													<li><span data-path=".username" data-order="desc"
														data-type="text">User Name Z-A</span></li>

													<li><span data-path=".usercompany" data-order="asc"
														data-type="text">User Company A-Z</span></li>
													<li><span data-path=".usercompany" data-order="desc"
														data-type="text">User Company Z-A</span></li>

													<li><span data-path=".usercountry" data-order="asc"
														data-type="text">User Country A-Z</span></li>
													<li><span data-path=".usercountry" data-order="desc"
														data-type="text">User Country Z-A</span></li>

													<li><span data-path=".userlocation" data-order="asc"
														data-type="text">User City A-Z</span></li>
													<li><span data-path=".userlocation" data-order="desc"
														data-type="text">User City Z-A</span></li>

													<li><span data-path=".userexp" data-order="asc"
														data-type="text">User Exp (asc)</span></li>
													<li><span data-path=".userexp" data-order="desc"
														data-type="text">User Exp (desc)</span></li>

													<li><span data-path=".userindustry" data-order="asc"
														data-type="text">User Industry A-Z</span></li>
													<li><span data-path=".userindustry" data-order="desc"
														data-type="text">User Industry Z-A</span></li>

													<li><span data-path=".jobapplydate" data-order="asc"
														data-type="datetime">Date Applied (asc)</span></li>
													<li><span data-path=".jobapplydate" data-order="desc"
														data-type="datetime" data-default="true">Date
															Applied (desc)</span></li>
												</ul>
											</div>

											<!-- Country drop down filter -->
											<div class="jplist-drop-down" style="width: 180px;"
												data-control-type="filter-drop-down"
												data-control-name="country-selector-filter"
												data-control-action="filter">
												<ul id="countryUL">
												</ul>
											</div>
											<!-- Status drop down filter 
											<div class="jplist-drop-down" style="width: 180px;"
												data-control-type="filter-drop-down"
												data-control-name="appstatus-selector-filter"
												data-control-action="filter">
												<ul id="appstatusUL">
												</ul>
											</div>
											-->
										</div>
										<div class="col-lg-12 mbl">
											<div class="text-filter-box">

												<i class="fa fa-search  jplist-icon"></i> <input
													style="width: 220px;" data-path=".username" type="text"
													value="" placeholder="Filter by Applicant's Name"
													data-control-type="textbox"
													data-control-name="username-filter"
													data-control-action="filter" data-ng-model="searchFilter1" />
											</div>

											<div class="text-filter-box">

												<i class="fa fa-search  jplist-icon"></i> <input
													style="width: 220px;" data-path=".userlocation" type="text"
													value=""
													placeholder="Filter by Applicant's Location (City)"
													data-control-type="textbox"
													data-control-name="userlocation-filter"
													data-control-action="filter" data-ng-model="searchFilter2" />
											</div>

											<div class="text-filter-box">

												<i class="fa fa-search  jplist-icon"></i> <input
													style="width: 220px;" data-path=".userjobtitle" type="text"
													value="" placeholder="Filter by Applicant's Job-Title"
													data-control-type="textbox"
													data-control-name="userjobtitle-filter"
													data-control-action="filter" data-ng-model="searchFilter3" />
											</div>

											<div class="text-filter-box">

												<i class="fa fa-search  jplist-icon"></i> <input
													style="width: 220px;" data-path=".usercompany" type="text"
													value="" placeholder="Filter by Applicant's Company"
													data-control-type="textbox"
													data-control-name="usercompany-filter"
													data-control-action="filter" data-ng-model="searchFilter4" />
											</div>

											<div data-control-type="date-picker-range-filter"
												data-control-name="date-picker-range-filter"
												data-control-action="filter" data-path=".jobapplydate"
												data-datetime-format="{day} {month}, {year}"
												data-datepicker-func="datepicker"
												class="jplist-date-picker-range">
												<i class="fa fa-calendar-o  jplist-icon"></i> <input
													type="text" class="date-picker"
													placeholder="Date Applied (From)" data-type="prev"
													data-ng-model="searchFilter5" /> <span class="gap"><b>_</b></span>
												<i class="fa fa-calendar-o  jplist-icon"></i> <input
													type="text" class="date-picker"
													placeholder="Date Applied (To)" data-type="next"
													data-ng-model="searchFilter6" />
											</div>
										</div>
										<div class="col-lg-12 mbs">
											<button type="button" class="btn btn-default"
												data-ng-hide="showIndustryFilter"
												data-ng-click="showIndustryFilter=true">
												<i class="fa fa-suitcase"></i>&nbsp; Show Industry Filter
												&nbsp;<i class="fa fa-caret-down"></i>
											</button>
											&nbsp;
											<button type="button" class="btn btn-default active"
												data-ng-show="showIndustryFilter"
												data-ng-click="showIndustryFilter=false">
												<i class="fa fa-suitcase"></i>&nbsp; Hide Industry Filter
												&nbsp;<i class="fa fa-caret-up"></i>
											</button>
											&nbsp;
											<button type="button" class="btn btn-default"
												data-ng-hide="showSkillsFilter"
												data-ng-click="showSkillsFilter=true">
												<i class="fa fa-wrench"></i>&nbsp; Show Skills Filter &nbsp;<i
													class="fa fa-caret-down"></i>
											</button>
											&nbsp;
											<button type="button" class="btn btn-default active"
												data-ng-show="showSkillsFilter"
												data-ng-click="showSkillsFilter=false">
												<i class="fa fa-wrench"></i>&nbsp; Hide Skills Filter &nbsp;<i
													class="fa fa-caret-up"></i>
											</button>
											<!-- INDUSTRY FILTER -->
											<div class="col-lg-12 jplist-group mbs"
												data-ng-show="showIndustryFilter"
												data-control-type="checkbox-text-filter" data-logic="or"
												data-control-action="filter"
												data-control-name="userindustry" data-path=".userindustry"
												style="text-align: center;">
												<ul id="industryUL">
												</ul>
											</div>
											<div class="col-lg-12 jplist-group mbs"
												data-ng-show="showSkillsFilter"
												data-control-type="checkbox-text-filter"
												data-control-action="filter" data-control-name="skill"
												data-path=".skill" data-logic="and"
												style="text-align: center;">
												<ul id="skillUL">
												</ul>
											</div>
										</div>
										<div class="col-lg-12">
											<!-- pagination results -->
											<div class="jplist-label" style="float: right;"
												data-type="Page {current} of {pages}"
												data-control-type="pagination-info"
												data-control-name="paging" data-control-action="paging"></div>

											<!-- pagination -->
											<div class="jplist-pagination" data-control-type="pagination"
												data-control-name="paging" data-control-action="paging"></div>

										</div>
									</div>

									<!-- data -->
									<div class="box text-shadow">
										<table class="demo-tbl">
										</table>
									</div>
									<!-- end of data -->

									<div class="box jplist-no-results text-shadow align-center">
										<p style="font-weight: bold;">No results found</p>
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

										<!-- sort dropdown -->
										<div class="jplist-drop-down" style="width: 220px;"
											data-control-type="sort-drop-down" data-control-name="sort"
											data-control-action="sort"
											data-datetime-format="{day} {month}, {year}">


											<ul>
												<li><span data-path="default">Sort by</span></li>

												<li><span data-path=".usercode" data-order="asc"
													data-type="text">User-Code (asc)</span></li>
												<li><span data-path=".usercode" data-order="desc"
													data-type="text">User-Code (desc)</span></li>

												<li><span data-path=".username" data-order="asc"
													data-type="text">User Name A-Z</span></li>
												<li><span data-path=".username" data-order="desc"
													data-type="text">User Name Z-A</span></li>

												<li><span data-path=".usercompany" data-order="asc"
													data-type="text">User Company A-Z</span></li>
												<li><span data-path=".usercompany" data-order="desc"
													data-type="text">User Company Z-A</span></li>

												<li><span data-path=".usercountry" data-order="asc"
													data-type="text">User Country A-Z</span></li>
												<li><span data-path=".usercountry" data-order="desc"
													data-type="text">User Country Z-A</span></li>

												<li><span data-path=".userlocation" data-order="asc"
													data-type="text">User City A-Z</span></li>
												<li><span data-path=".userlocation" data-order="desc"
													data-type="text">User City Z-A</span></li>

												<li><span data-path=".userexp" data-order="asc"
													data-type="text">User Exp (asc)</span></li>
												<li><span data-path=".userexp" data-order="desc"
													data-type="text">User Exp (desc)</span></li>

												<li><span data-path=".userindustry" data-order="asc"
													data-type="text">User Industry A-Z</span></li>
												<li><span data-path=".userindustry" data-order="desc"
													data-type="text">User Industry Z-A</span></li>

												<li><span data-path=".jobapplydate" data-order="asc"
													data-type="datetime">Date Applied (asc)</span></li>
												<li><span data-path=".jobapplydate" data-order="desc"
													data-type="datetime" data-default="true">Date
														Applied (desc)</span></li>
											</ul>
										</div>
										<!-- pagination results -->
										<div class="jplist-label" data-type="{start} - {end} of {all}"
											data-control-type="pagination-info"
											data-control-name="paging" data-control-action="paging"></div>

										<!-- pagination -->
										<div class="jplist-pagination" data-control-type="pagination"
											data-control-name="paging" data-control-action="paging"
											data-control-animate-to-top="true"></div>

									</div>
								</div>


								<!-- end of demo -->
							</div>
						</div>
						<!-- End of Panel -->
					</div>
				</div>
			</div>
			<!--END CONTENT-->
			<!--BEGIN FOOTER-->
			<div id="footer">
				<div class="copyright">
					<a href="http://www.crosstab.in">2016 Â© CrossTab Consulting</a>
				</div>
			</div>
			<!--END FOOTER-->
		</div>
		<!--END PAGE WRAPPER-->
	</div>

</div>

<script src="script/bootstrap-hover-dropdown.js"></script>
<script src="script/jquery.menu.js"></script>
<script src="script/appsview.js"></script>

