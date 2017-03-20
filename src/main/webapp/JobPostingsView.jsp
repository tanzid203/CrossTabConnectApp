<div document-jobpostings-view>

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
		<div id="modal-config" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" data-dismiss="modal" aria-hidden="true"
							class="close">&times;</button>
						<h4 class="modal-title">Modal title</h4>
					</div>
					<div class="modal-body">
						<p>Modal Content Here.</p>
					</div>
					<div class="modal-footer">
						<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
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
					<div class="page-title">Job Postings</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i>&nbsp;<a
						ui-sref="jobPostingsView">Job Postings</a></li>
				</ol>
				<div class="clearfix"></div>
			</div>
			<!--END TITLE & BREADCRUMB PAGE-->
			<!--BEGIN CONTENT-->
			<div class="page-content">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel mbl" id="addNewJobPostingDiv" hidden="hidden">
							<div class="panel-body">
								<div class="page-title-breadcrumb option-demo mbxxl">
									<div class="page-header pull-left">
										<div class="page-title">New Job Posting</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="row mas">
									<div class="col-md-4 mbl">
										<div class="form-group">
											<label for="inputJobTitle" class="control-label"
												style="color: black;"> Job-Title</label>
											<div class="input-icon right">
												<i class="fa fa-font"></i> <input id="inputJobTitle"
													type="text" placeholder="" class="form-control"
													style="color: black;" />
											</div>
										</div>
									</div>
									<div class="col-md-4 mbl">
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
									<div class="col-md-4 mbl">
										<div class="form-group">
											<label for="inputIndustry" class="control-label"
												style="color: black;"> Industry</label>
											<div class="input-icon right">
												<i class="fa fa-suitcase"></i> <input id="inputIndustry"
													type="text" placeholder="" class="form-control"
													style="color: black;" />
											</div>
										</div>
									</div>
									<div class="col-md-3 mbl">
										<div class="form-group">
											<label for="inputExp" class="control-label"
												style="color: black;"> Experience (In Years)</label>
											<div class="input-icon right">
												<i class="fa fa-hourglass"></i> <input id="inputExp"
													type="number" min="0" placeholder="" class="form-control"
													style="color: black;" />
											</div>
										</div>
									</div>
									<div class="col-md-3 mbl">
										<div class="form-group">
											<label for="countrySelect" class="control-label"
												style="color: black;"> Country</label> <select
												id="countrySelect" class="form-control">
												<option selected>Select Country</option>
												<option>India</option>
												<option>United Kingdom</option>
											</select>
										</div>
									</div>
									<div class="col-md-3 mbl">
										<div class="form-group">
											<label for="inputLocation" class="control-label"
												style="color: black;"> City</label>
											<div class="input-icon right">
												<i class="fa fa-map-marker"></i> <input id="inputLocation"
													type="text" placeholder="" class="form-control"
													style="color: black;" />
											</div>
										</div>
									</div>
									<div class="col-md-3 mbl">
										<div class="form-group">
											<label for="inputPinCode" class="control-label"
												style="color: black;"> Pin-Code</label>
											<div class="input-icon right">
												<i class="fa fa-map-pin"></i> <input id="inputPinCode"
													type="text" placeholder="" class="form-control"
													style="color: black;" />
											</div>
										</div>
									</div>
									<div class="col-md-12 mbl">
										<div class="form-group">
											<label for="inputSkills" class="control-label"
												style="color: black;"> Skills</label>
											<div class="input-icon right">
												<i class="fa fa-wrench"></i> <input id="inputSkills"
													type="text" class="form-control" style="color: black;" />
											</div>
										</div>
									</div>
									<div class="col-md-6 mbl">
										<div class="form-group">
											<label for="inputJobDesc" class="control-label"
												style="color: black;"> Job Description</label>
											<textarea rows="6" id="inputJobDesc" placeholder=""
												class="form-control" style="color: black;"></textarea>
										</div>
									</div>
									<div class="col-md-6 mbl">
										<div class="form-group">
											<label for="inputCompanyInfo" class="control-label"
												style="color: black;"> Company Information</label>
											<textarea rows="6" id="inputCompanyInfo" placeholder=""
												class="form-control" style="color: black;"></textarea>
										</div>
									</div>

									<div class="col-md-12 mbl mal">
										<div class="form-group" align="center"
											style="text-align: center;">
											<label class="control-label" style="color: black;">Record
												a Video Brief?</label> &nbsp;&nbsp;&nbsp;&nbsp;
											<button class="btn btn-green btn-xs" id="showRecordDiv">
												<i class="fa fa-check"></i>
											</button>
											&nbsp;&nbsp;
											<button class="btn btn-red btn-xs" id="hideRecordDiv">
												<i class="fa fa-close"></i>
											</button>
										</div>
										<div id="recordDiv" class="col-md-4"
											style="margin-left: 400px;">
											<video id="myVideo" class="video-js vjs-default-skin"
												style="background-color: #636363;"></video>
										</div>
									</div>
									<div class="col-md-6 mbl">
										<div class="form-group">
											<label for="inputHRName" class="control-label"
												style="color: black;"> HR Name</label>
											<div class="input-icon right">
												<i class="fa fa-user"></i> <input id="inputHRName"
													type="text" placeholder="" class="form-control"
													style="color: black;" />
											</div>
										</div>
									</div>
									<div class="col-md-6 mbl">
										<div class="form-group">
											<label for="inputHRPosition" class="control-label"
												style="color: black;"> HR Position</label>
											<div class="input-icon right">
												<i class="fa fa-briefcase"></i> <input id="inputHRPosition"
													type="text" placeholder="" class="form-control"
													style="color: black;" />
											</div>
										</div>
									</div>
									<div class="col-md-12 mbl">
										<div class="form-group">
											<label for="inputHRQuote" class="control-label"
												style="color: black;"> HR Quote</label>
											<div class="input-icon right">
												<i class="fa fa-quote-right"></i> <input id="inputHRQuote"
													type="text" placeholder="" class="form-control"
													style="color: black;" />
											</div>
										</div>
									</div>
									<div class="col-md-12 mbl">
										<div class="form-group">
											<label for="inputTags" class="control-label"
												style="color: black;"> Tags</label>
											<div class="input-icon right">
												<i class="fa fa-tags"></i> <input id="inputTags" type="text"
													class="form-control" style="color: black;" />
											</div>
										</div>
									</div>
									<div class="col-md-4 mbl">
										<div class="form-group">
											<label for="statusSelect" class="control-label"
												style="color: black;"> Status</label> <select
												id="statusSelect" class="form-control">
												<option selected>Select Status</option>
												<option>Active</option>
												<option>On-Hold</option>
												<option>Closed</option>
											</select>
										</div>
									</div>
									<div class="col-md-4 mbl">
										<div class="form-group">
											<label for="recruiterSelect" class="control-label"
												style="color: black;"> Created By</label> <select
												id="recruiterSelect" class="form-control">
												<option selected>Select Recruiter</option>
												<option>Gautam Misra</option>
												<option>Tanuj Dhaundiyal</option>
											</select>
										</div>
									</div>
									<div class="col-md-4 mbl">
										<div class="form-group">
											<label for="inputCreationDate" class="control-label"
												style="color: black;"> Created On</label>
											<div class="input-icon right">
												<i class="fa fa-calendar-o"></i> <input
													id="inputCreationDate" class="form-control"
													style="color: black;">
											</div>
										</div>
									</div>
									<div class="col-md-12 mbl mal" style="text-align: center;">
										<div class="form-group">
											<button class="btn btn-green btn-lg" id="saveNewJobPosting">Add</button>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button class="btn btn-red btn-lg"
												id="hideAddNewJobPostingDiv">Cancel</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="panel">
							<div class="panel-body">
								<div id="demo" class="box jplist">

									<!-- panel -->
									<div class="jplist-panel box panel-top">

										<div class="col-lg-12 mbl">

											<!-- New Job Posting button -->
											<button type="button" class="btn btn-default"
												id="showAddNewJobPostingDiv">
												<i class="fa fa-plus"></i>&nbsp;Create New Job Posting
											</button>
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
											<div class="jplist-drop-down" style="width: 220px;"
												data-control-type="sort-drop-down" data-control-name="sort"
												data-control-action="sort"
												data-datetime-format="{day} {month}, {year}">
												<!-- {year}, {month}, {day}, {hour}, {min}, {sec} -->

												<ul>
													<li><span data-path="default">Sort by</span></li>

													<li><span data-path=".jobcode" data-order="asc"
														data-type="text">Job-Code (asc)</span></li>
													<li><span data-path=".jobcode" data-order="desc"
														data-type="text">Job-Code (desc)</span></li>

													<li><span data-path=".title" data-order="asc"
														data-type="text">Job Title A-Z</span></li>
													<li><span data-path=".title" data-order="desc"
														data-type="text">Job Title Z-A</span></li>

													<li><span data-path=".company" data-order="asc"
														data-type="text">Company A-Z</span></li>
													<li><span data-path=".company" data-order="desc"
														data-type="text">Company Z-A</span></li>

													<li><span data-path=".country" data-order="asc"
														data-type="text">Country A-Z</span></li>
													<li><span data-path=".country" data-order="desc"
														data-type="text">Country Z-A</span></li>

													<li><span data-path=".location" data-order="asc"
														data-type="text">Location (City) A-Z</span></li>
													<li><span data-path=".location" data-order="desc"
														data-type="text">Location (City) Z-A</span></li>

													<li><span data-path=".exp" data-order="asc"
														data-type="text">Experience (asc)</span></li>
													<li><span data-path=".exp" data-order="desc"
														data-type="text">Experience (desc)</span></li>

													<li><span data-path=".industry" data-order="asc"
														data-type="text">Industry A-Z</span></li>
													<li><span data-path=".industry" data-order="desc"
														data-type="text">Industry Z-A</span></li>

													<li><span data-path=".createdate" data-order="asc"
														data-type="datetime">Create Date (asc)</span></li>
													<li><span data-path=".createdate" data-order="desc"
														data-type="datetime" data-default="true">Create
															Date (desc)</span></li>

												</ul>
											</div>

											<!-- Company drop down filter -->
											<div class="jplist-drop-down" style="width: 220px;"
												data-control-type="filter-drop-down"
												data-control-name="company-selector-filter"
												data-control-action="filter">
												<ul id="companyUL">
												</ul>
											</div>

											<!-- Country drop down filter -->
											<div class="jplist-drop-down" style="width: 220px;"
												data-control-type="filter-drop-down"
												data-control-name="country-selector-filter"
												data-control-action="filter">
												<ul id="countryUL">
												</ul>
											</div>

											<!-- Status drop down filter -->
											<div class="jplist-drop-down" style="width: 220px;"
												data-control-type="filter-drop-down"
												data-control-name="status-selector-filter"
												data-control-action="filter">
												<ul id="jobstatusUL">
												</ul>
											</div>

										</div>
										<div class="col-lg-12 mbl">
											<div class="text-filter-box">

												<i class="fa fa-search  jplist-icon"></i> <input
													style="width: 220px;" data-path=".title" type="text"
													value="" placeholder="Filter by Job Title"
													data-control-type="textbox"
													data-control-name="title-filter"
													data-control-action="filter" data-ng-model="searchFilter1" />
											</div>

											<div class="text-filter-box">

												<i class="fa fa-search  jplist-icon"></i> <input
													style="width: 220px;" data-path=".location" type="text"
													value="" placeholder="Filter by Location (City)"
													data-control-type="textbox"
													data-control-name="location-filter"
													data-control-action="filter" data-ng-model="searchFilter2" />
											</div>

											<div class="text-filter-box">

												<i class="fa fa-search  jplist-icon"></i> <input
													style="width: 220px;" data-path=".pincode" type="text"
													value="" placeholder="Filter by Pin-Code"
													data-control-type="textbox"
													data-control-name="pincode-filter"
													data-control-action="filter" data-ng-model="searchFilter3" />
											</div>

											<div class="text-filter-box">

												<i class="fa fa-search  jplist-icon"></i> <input
													style="width: 220px;" data-path=".skills" type="text"
													value="" placeholder="Filter by Skill"
													data-control-type="textbox"
													data-control-name="skills-filter"
													data-control-action="filter" data-ng-model="searchFilter4" />
											</div>
											<div data-control-type="date-picker-range-filter"
												data-control-name="date-picker-range-filter"
												data-control-action="filter" data-path=".createdate"
												data-datetime-format="{day} {month}, {year}"
												data-datepicker-func="datepicker"
												class="jplist-date-picker-range">
												<i class="fa fa-calendar-o  jplist-icon"></i> <input
													type="text" class="date-picker"
													placeholder="Creation Date (From)" data-type="prev"
													data-ng-model="searchFilter5" /> <span class="gap"><b>_</b></span>
												<i class="fa fa-calendar-o  jplist-icon"></i> <input
													type="text" class="date-picker"
													placeholder="Creation Date (To)" data-type="next"
													data-ng-model="searchFilter6" />
											</div>
										</div>
										<div class="col-lg-12 mbs">
											<!-- Show Hide Filters Buttons -->
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
											&nbsp;
											<button type="button" class="btn btn-default"
												data-ng-hide="showTagsFilter"
												data-ng-click="showTagsFilter=true">
												<i class="fa fa-tags"></i>&nbsp; Show Tags Filter &nbsp;<i
													class="fa fa-caret-down"></i>
											</button>
											&nbsp;
											<button type="button" class="btn btn-default active"
												data-ng-show="showTagsFilter"
												data-ng-click="showTagsFilter=false">
												<i class="fa fa-pencil"></i>&nbsp; Hide Tags Filter &nbsp;<i
													class="fa fa-caret-up"></i>
											</button>
											&nbsp;
											<button type="button" class="btn btn-default"
												data-ng-hide="showRecruitersFilter"
												data-ng-click="showRecruitersFilter=true">
												<i class="fa fa-pencil"></i>&nbsp; Show Recruiters Filter
												&nbsp;<i class="fa fa-caret-down"></i>
											</button>
											&nbsp;
											<button type="button" class="btn btn-default active"
												data-ng-show="showRecruitersFilter"
												data-ng-click="showRecruitersFilter=false">
												<i class="fa fa-pencil"></i>&nbsp; Hide Recruiters Filter
												&nbsp;<i class="fa fa-caret-up"></i>
											</button>
											<!-- INDUSTRY FILTER -->
											<div class="col-lg-12 jplist-group mbs"
												data-ng-show="showIndustryFilter"
												data-control-type="checkbox-text-filter"
												data-control-action="filter" data-control-name="industry"
												data-path=".industry" data-logic="or"
												style="text-align: center;">
												<ul id="industryUL">
												</ul>
											</div>
											<!-- SKILLS FILTER -->
											<div class="col-lg-12 jplist-group mbs"
												data-ng-show="showSkillsFilter"
												data-control-type="checkbox-text-filter"
												data-control-action="filter" data-control-name="skill"
												data-path=".skill" data-logic="and"
												style="text-align: center;">
												<ul id="skillUL">
													<li><span style="font-weight: bold;">SKILLS
															FILTER</span></li>
													<li><input value=".NET" id=".NET" type="checkbox" />&nbsp;
														.NET</li>
													<li><input value="Adobe Dreamweaver"
														id="Adobe Dreamweaver" type="checkbox" />&nbsp; Adobe
														Dreamweaver</li>
													<li><input value="AngularJS" id="AngularJS"
														type="checkbox" />&nbsp; AngularJS</li>
													<li><input value="Java" id="Java" type="checkbox" />&nbsp;
														Java</li>
													<li><input value="XML" id="XML" type="checkbox" />&nbsp;
														XML</li>
												</ul>
											</div>
											<!-- TAGS FILTER -->
											<div class="col-lg-12 jplist-group mbs"
												data-ng-show="showTagsFilter"
												data-control-type="checkbox-text-filter"
												data-control-action="filter" data-control-name="tag"
												data-path=".tag" data-logic="and"
												style="text-align: center;">
												<ul id="tagUL">
													<li><span style="font-weight: bold;">TAGS
															FILTER</span></li>
													<li><input value="Misys" id="Misys" type="checkbox" />&nbsp;
														Misys</li>
													<li><input value="Gautam" id="Gautam" type="checkbox" />&nbsp;
														Gautam</li>
													<li><input value="January 2016 Campaign"
														id="January 2016 Campaign" type="checkbox" />&nbsp;
														January 2016 Campaign</li>
													<li><input value="Tanuj" id="Tanuj" type="checkbox" />&nbsp;
														Tanuj</li>
													<li><input value="Architect HCL Role"
														id="Architect HCL Role" type="checkbox" />&nbsp;
														Architect HCL Role</li>
												</ul>
											</div>
											<!-- RECRUITER FILTER -->
											<div class="col-lg-12 jplist-group mbs"
												data-ng-show="showRecruitersFilter"
												data-control-type="checkbox-text-filter"
												data-control-action="filter" data-control-name="recruiter"
												data-path=".recruiter" data-logic="or"
												style="text-align: center;">
												<ul id="recruiterUL">
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
											<!-- {year}, {month}, {day}, {hour}, {min}, {sec} -->

											<ul>
												<li><span data-path="default">Sort by</span></li>

												<li><span data-path=".jobcode" data-order="asc"
													data-type="text">Job-Code (asc)</span></li>
												<li><span data-path=".jobcode" data-order="desc"
													data-type="text">Job-Code (desc)</span></li>

												<li><span data-path=".title" data-order="asc"
													data-type="text">Job Title A-Z</span></li>
												<li><span data-path=".title" data-order="desc"
													data-type="text">Job Title Z-A</span></li>

												<li><span data-path=".company" data-order="asc"
													data-type="text">Company A-Z</span></li>
												<li><span data-path=".company" data-order="desc"
													data-type="text">Company Z-A</span></li>

												<li><span data-path=".country" data-order="asc"
													data-type="text">Country A-Z</span></li>
												<li><span data-path=".country" data-order="desc"
													data-type="text">Country Z-A</span></li>

												<li><span data-path=".location" data-order="asc"
													data-type="text">Location (City) A-Z</span></li>
												<li><span data-path=".location" data-order="desc"
													data-type="text">Location (City) Z-A</span></li>

												<li><span data-path=".exp" data-order="asc"
													data-type="text">Experience (asc)</span></li>
												<li><span data-path=".exp" data-order="desc"
													data-type="text">Experience (desc)</span></li>

												<li><span data-path=".industry" data-order="asc"
													data-type="text">Industry A-Z</span></li>
												<li><span data-path=".industry" data-order="desc"
													data-type="text">Industry Z-A</span></li>

												<li><span data-path=".createdate" data-order="asc"
													data-type="datetime">Create Date (asc)</span></li>
												<li><span data-path=".createdate" data-order="desc"
													data-type="datetime" data-default="true">Create Date
														(desc)</span></li>
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
					</div>
				</div>
			</div>
			<!--END CONTENT-->
			<!--BEGIN FOOTER-->
			<div id="footer">
				<div class="copyright">
					<a href="http://www.crosstab.in">2016 © CrossTab Consulting</a>
				</div>
			</div>
			<!--END FOOTER-->
		</div>
		<!--END PAGE WRAPPER-->
	</div>

</div>

<script src="script/bootstrap-hover-dropdown.js"></script>
<script src="script/jquery.menu.js"></script>
<script src="script/jobpostingsview.js"></script>

