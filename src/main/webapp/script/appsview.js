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

var jobcode = sessionStorage.getItem("appsview_jobcode");

$.getJSON(baseURL + "appsViewServices" + "/" + "getAppsHtml", {
	jobcode : jobcode
}, function(response) {

	$('.jdbox').append(response[0].jobPostingData);
	$('.demo-tbl').append(response[0].appsData);

	$("#countryUL").html(response[0].countryFilterData);
	$("#appstatusUL").html(response[0].appstatusFilterData);
	$("#industryUL").html(response[0].industryFilterData);
	$("#skillUL").html(response[0].skillFilterData);

	$('#demo').jplist({

		itemsBox : '.demo-tbl',
		itemPath : '.tbl-item',
		panelPath : '.jplist-panel',
		effect : 'fade'
	});

	$('#profileView').on('hidden.bs.modal', function(e) {
		$('#profileView').modal('hide');
		$("#videoBrief")[0].pause();
	});

	$(".StatusSelect").hide();
	$(".hideStatusSelect").hide();
	$(".saveStatusSelect").hide();

});

function initializeAppsViewButtons() {

	$(document).on(
			'click',
			'.demo-tbl button',
			function() {

				var btnname = $(this).attr('name');

				if (btnname === "showStatusSelect") {

					var appcode = '#' + this.id;

					var oldStatus = $(appcode + ".appstatus").text();

					$(appcode + ".StatusSelect").fadeIn();
					$(appcode + ".showStatusSelect").hide();
					$(appcode + ".hideStatusSelect").fadeIn();
					$(appcode + ".saveStatusSelect").fadeIn();

				} else if (btnname === "hideStatusSelect") {

					var appcode = '#' + this.id;

					var oldStatus = $(appcode + ".appstatus").text();

					$(appcode + ".StatusSelect").hide();
					$(appcode + ".hideStatusSelect").hide();
					$(appcode + ".saveStatusSelect").hide();
					$(appcode + ".showStatusSelect").fadeIn();

				} else if (btnname === "saveStatusSelect") {

					var appcode = '#' + this.id;

					var oldStatus = $(appcode + ".appstatus").text();
					var newStatus = $(appcode + ".StatusSelect").val();

					var baseURL = window.location.protocol + "//"
							+ window.location.host + "/rest/";

					$.getJSON(
							baseURL + "appsViewServices" + "/"
									+ "updateAppStatus", {
								appcode : this.id,
								appstatus : newStatus
							}, function(response) {

								$(appcode + ".appstatus").show();
								$(appcode + ".StatusSelect").hide();
								$(appcode + ".hideStatusSelect").hide();
								$(appcode + ".saveStatusSelect").hide();
								$(appcode + ".showStatusSelect").fadeIn();

							}).success(function() {

						$(appcode + ".appstatus").text(newStatus);

					}).error(function(jqXHR, textStatus, errorThrown) {

						console.log("Error: " + textStatus);
						console.log("Incoming Text: " + jqXHR.responseText);
						alert("Some error occurred. Please try again.");

					});
					;

				}
			});

	$(".StatusSelect").hide();
	$(".hideStatusSelect").hide();
	$(".saveStatusSelect").hide();

	$("#demo").jplist({

		itemsBox : '.demo-tbl',
		itemPath : '.tbl-item',
		panelPath : '.jplist-panel',
		effect : 'fade'
	});

};
