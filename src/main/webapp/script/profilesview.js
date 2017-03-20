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

$.getJSON(baseURL + "profilesViewServices" + "/" + "getProfilesHtml", function(
		response) {
	$('.demo-tbl').append(response[0].usersData);

	$("#countryUL").html(response[0].countryFilterData);
	$("#industryUL").html(response[0].industryFilterData);
	$("#skillUL").html(response[0].skillFilterData);

	$('#demo').jplist({

		itemsBox : '.demo-tbl',
		itemPath : '.tbl-item',
		panelPath : '.jplist-panel',
		effect : 'fade'
	});

});


$('#profileView').on('hidden.bs.modal', function(e) {
	$("#videoBrief")[0].pause();
});

function initializeProfilesViewButtons() {

	$("#demo").jplist({

		itemsBox : '.demo-tbl',
		itemPath : '.tbl-item',
		panelPath : '.jplist-panel',
		effect : 'fade'
	});

};
