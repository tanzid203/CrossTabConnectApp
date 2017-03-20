// BEGIN MENU SIDEBAR
$('#sidebar').css('min-height', '100%');
$('#side-menu').metisMenu();

$(window).bind("load resize", function() {
	if ($(this).width() < 768) {
		$('div.sidebar-collapse').addClass('collapse');
	} else {
		$('div.sidebar-collapse').removeClass('collapse');
		$('div.sidebar-collapse').css('height', 'auto');
	}
	if ($('body').hasClass('sidebar-icons')) {
		$('#menu-toggle').hide();
	} else {
		$('#menu-toggle').show();
	}
});
// END MENU SIDEBAR

// BEGIN TOPBAR DROPDOWN
$('.dropdown-slimscroll').slimScroll({
	"height" : '250px',
	"wheelStep" : 5
});
// END TOPBAR DROPDOWN

// BEGIN BACK TO TOP
$(window).scroll(function() {
	if ($(this).scrollTop() < 200) {
		$('#totop').fadeOut();
	} else {
		$('#totop').fadeIn();
	}
});
$('#totop').on('click', function() {
	$('html, body').animate({
		scrollTop : 0
	}, 'fast');
	return false;
});
// END BACK TO TOP

// CALL FUNCTION RESPONSIVE TABS
fakewaffle.responsiveTabs([ 'xs', 'sm' ]);

jQuery.fn.jplist.settings = {

	/**
	 * jQuery UI date picker
	 */
	datepicker : function(input, options) {

		// set options
		options.dateFormat = 'dd/mm/yy'

		// start datepicker
		input.datepicker(options);
	}

};

var baseURL = window.location.protocol + "//" + window.location.host + "/rest/";

$.getJSON(baseURL + "jobPostingsViewServices" + "/" + "getJobPostingDataHtml",
		function(response) {

			$('.demo-tbl').append(response[0].jobPostingsData);

			$("#companyUL").html(response[0].companyFilterData);
			$("#countryUL").html(response[0].countryFilterData);
			$("#jobstatusUL").html(response[0].jobstatusFilterData);
			$("#industryUL").html(response[0].industryFilterData);
			$("#skillUL").html(response[0].skillFilterData);
			$("#tagUL").html(response[0].tagFilterData);
			$("#recruiterUL").html(response[0].recruiterFilterData);

			$('#demo').jplist({

				itemsBox : '.demo-tbl',
				itemPath : '.tbl-item',
				panelPath : '.jplist-panel',
				effect : 'fade'
			});

			$(".hideJDButton").hide();
			$(".hideCompanyInfoButton").hide();

		});

function initializeJobPostingsViewButtons() {

	$(document).on('click', '.demo-tbl button', function() {

		var btnname = $(this).attr('name');
		var jobcode = '#' + this.id;

		if (btnname === "showJDButton") {

			$(jobcode + ".showJD").fadeIn();
			$(jobcode + ".showJDButton").hide();
			$(jobcode + ".hideJDButton").show();

		} else if (btnname === "hideJDButton") {

			$(jobcode + ".showJD").fadeOut();
			$(jobcode + ".hideJDButton").hide();
			$(jobcode + ".showJDButton").show();

		} else if (btnname === "showCompanyInfoButton") {

			$(jobcode + ".showCompanyInfo").fadeIn();
			$(jobcode + ".showCompanyInfoButton").hide();
			$(jobcode + ".hideCompanyInfoButton").show();

		} else if (btnname === "hideCompanyInfoButton") {

			$(jobcode + ".showCompanyInfo").fadeOut();
			$(jobcode + ".hideCompanyInfoButton").hide();
			$(jobcode + ".showCompanyInfoButton").show();

		}
	});

	$(".hideJDButton").hide();
	$(".hideCompanyInfoButton").hide();

	$("#inputCreationDate").datepicker({
		dateFormat : "dd/mm/yy"
	});

	$("#showAddNewJobPostingDiv").click(function() {

		reloadNewJobPostingFields();

		$("#addNewJobPostingDiv").fadeIn();
		$("#showAddNewJobPostingDiv").hide();
	});

	$("#hideAddNewJobPostingDiv").click(function() {

		$("#addNewJobPostingDiv").fadeOut();
		$("#showAddNewJobPostingDiv").show();

	});

	$("#showRecordDiv").click(function() {

		$("#myVideo").show();

		var player = videojs("myVideo", {
			controls : true,
			width : 320,
			height : 240,
			plugins : {
				record : {
					audio : true,
					video : true,
					maxLength : 10,
					debug : true
				}
			}
		});
		// error handling
		player.on('deviceError', function() {
			console.log('device error:', player.deviceErrorCode);
		});

		// user clicked the record button and started recording
		player.on('startRecord', function() {
			console.log('started recording!');
		});

		// user completed recording and stream is available
		player.on('finishRecord', function() {
			// the blob object contains the recorded data that
			// can be downloaded by the user, stored on server etc.
			console.log('finished recording: ', player.recordedData);

		});

		$("#recordDiv").show();

	});

	$("#hideRecordDiv").click(function() {

	});

	$("#saveNewJobPosting").click(
			function() {

				var baseURL = window.location.protocol + "//"
						+ window.location.host + "/rest/";

				var jobtitle = $("#inputJobTitle").val();
				var company = $("#inputCompany").val();
				var industry = $("#inputIndustry").val();
				var exp = $("#inputExp").val();
				var country = $("#countrySelect").val();
				var location = $("#inputLocation").val();
				var pincode = $("#inputPinCode").val();
				var skills = $("#inputSkills").val();
				var jobdescription = $("#inputJobDesc").val();
				var companyinfo = $("#inputCompanyInfo").val();
				var tags = $("#inputTags").val();
				var jobstatus = $("#statusSelect").val();
				var createdby = $("#recruiterSelect").val();
				var createdon = $("#inputCreationDate").val();
				var hrname = $("#inputHRName").val();
				var hrposition = $("#inputHRPosition").val();
				var hrquote = $("#inputHRQuote").val();
				var mediastatus = "0"; // 2 for video, 1 for audio, 0 if none 

				$.getJSON(baseURL + "jobPostingsViewServices" + "/"
						+ "createNewJobPosting", {
					jobtitle : jobtitle,
					company : company,
					industry : industry,
					exp : exp,
					country : country,
					location : location,
					pincode : pincode,
					skills : skills,
					jobdescription : jobdescription,
					companyinfo : companyinfo,
					tags : tags,
					jobstatus : jobstatus,
					createdby : createdby,
					createdon : createdon,
					hrname : hrname,
					hrposition : hrposition,
					hrquote : hrquote
				}, function(response) {

					$('.demo-tbl').append(response[0].htmlContent);

					$.getJSON(baseURL + "jobPostingsViewServices" + "/"
							+ "getJobPostingsFilters", function(data) {

						$("#companyUL").html(data[0].companyFilterData);
						$("#countryUL").html(data[0].countryFilterData);
						$("#jobstatusUL").html(data[0].jobstatusFilterData);
						$("#industryUL").html(data[0].industryFilterData);
						$("#skillUL").html(data[0].skillFilterData);
						$("#tagUL").html(data[0].tagFilterData);
						$("#recruiterUL").html(data[0].recruiterFilterData);

						reloadNewJobPostingFields();

						$("#inputJobTitle").val("");
						$("#inputCompany").val("");
						$("#inputIndustry").val("");
						$("#inputExp").val("");
						// var country = $("#countrySelect").val();
						$(
								"#countrySelect option:contains("
										+ "Select Country" + ")").attr(
								'selected', 'selected');
						$("#inputLocation").val("");
						$("#inputPinCode").val("");
						$("#inputSkills").tagit("removeAll");
						$("#inputJobDesc").val("");
						$("#inputCompanyInfo").val("");
						$("#inputTags").tagit("removeAll");
						$(
								"#statusSelect option:contains("
										+ "Select Status" + ")").attr(
								'selected', 'selected');
						$(
								"#recruiterSelect option:contains("
										+ "Select Recruiter" + ")").attr(
								'selected', 'selected');
						$("#inputCreationDate").val("");

						$('#demo').jplist({

							itemsBox : '.demo-tbl',
							itemPath : '.tbl-item',
							panelPath : '.jplist-panel',
							effect : 'fade'
						});

						$(".hideJDButton").hide();
						$(".hideCompanyInfoButton").hide();

					});

					$("#addNewJobPostingDiv").fadeOut();
					$("#showAddNewJobPostingDiv").show();

				});

			});

	$('#demo').jplist({

		itemsBox : '.demo-tbl',
		itemPath : '.tbl-item',
		panelPath : '.jplist-panel',
		effect : 'fade'
	});

};

function reloadNewJobPostingFields() {

	var baseURL = window.location.protocol + "//" + window.location.host
			+ "/rest/";

	$.getJSON(baseURL + "jobPostingsViewServices" + "/"
			+ "getNewJobPostingFields", function(jsonResponse) {

		var locations = jsonResponse.locationsList.replace("[", "").replace(
				"]", "").split(',');

		var industries = jsonResponse.industriesList.replace("[", "").replace(
				"]", "").split(',');

		var skills = jsonResponse.skillsList.replace("[", "").replace("]", "")
				.split(',');

		var tags = jsonResponse.tagsList.replace("[", "").replace("]", "")
				.split(',');

		$("#inputLocation").autocomplete({
			source : locations,
			minLength : 0
		}).focus(function() {
			$(this).autocomplete("search");
		});

		$("#inputIndustry").autocomplete({
			source : industries,
			minLength : 0
		}).focus(function() {
			$(this).autocomplete("search");
		});

		$("#inputSkills").tagit({
			autocomplete : {
				delay : 0,
				minLength : 0
			},
			showAutocompleteOnFocus : true,
			removeConfirmation : true,
			caseSensitive : false,
			availableTags : skills,
			allowSpaces : true,
			tagLimit : 5,
			onTagLimitExceeded : function(event, ui) {
				alert('Only 5 Tags can be added.');
			},
			onTagExists : function(event, ui) {
				alert('Selected Skill Already Added.');
			}
		});

		$("#inputTags").tagit({
			autocomplete : {
				delay : 0,
				minLength : 0
			},
			showAutocompleteOnFocus : true,
			removeConfirmation : true,
			caseSensitive : false,
			availableTags : tags,
			allowSpaces : true,
			tagLimit : 5,
			onTagLimitExceeded : function(event, ui) {
				alert('Only 5 Tags can be added.');
			},
			onTagExists : function(event, ui) {
				alert('Selected Skill Already Added.');
			}
		});

	});

};

function displayLoadingModal(cmd) {

}
