'use strict';

(function($) {

	function filterNodes(keyWord) {
		if (!keyWord.length) {
			window.alert('Please type key word firstly.');
			return;
		} else {
			var $chart = $('.orgchart');
			// disalbe the expand/collapse feture
			$chart.addClass('noncollapsable');
			// distinguish the matched nodes and the unmatched nodes according
			// to the given key word
			$chart.find('.node').filter(function(index, node) {
				return $(node).text().toLowerCase().indexOf(keyWord) > -1;
			}).addClass('matched').closest('table').parents('table').find(
					'tr:first').find('.node').addClass('retained');
			// hide the unmatched nodes
			$chart.find('.matched,.retained').each(
					function(index, node) {
						$(node).removeClass('slide-up').closest('.nodes')
								.removeClass('hidden').siblings('.lines')
								.removeClass('hidden');
						var $unmatched = $(node).closest('table').parent()
								.siblings().find(
										'.node:first:not(.matched,.retained)')
								.closest('table').parent().addClass('hidden');
						$unmatched.parent().prev().children().slice(1,
								$unmatched.length * 2 + 1).addClass('hidden');
					});
			// hide the redundant descendant nodes of the matched nodes
			$chart.find('.matched')
					.each(
							function(index, node) {
								if (!$(node).closest('tr').siblings(':last')
										.find('.matched').length) {
									$(node).closest('tr').siblings().addClass(
											'hidden');
								}
							});
		}
	}

	function clearFilterResult() {
		$('.orgchart').removeClass('noncollapsable').find('.node').removeClass(
				'matched retained').end().find('.hidden').removeClass('hidden')
				.end().find('.slide-up, .slide-left, .slide-right')
				.removeClass('slide-up slide-right slide-left');
	}

	$(function() {

		var datascource = {
			'name' : 'Executive Director',
			'title' : 'Shyam Bang',
			'className' : 'normal-level',
			'children' : [ {
				'name' : 'CSO',
				'title' : 'Vacant',
				'className' : 'cso-level',
				'children' : [ {
					'name' : 'CO-CEOs-LSI',
					'title' : 'XYZ',
					'className' : 'vacant-level'
				}, {
					'name' : 'CEO-Pharma',
					'title' : 'XYZ',
					'className' : 'vacant-level'
				}, {
					'name' : 'Confidential Sec.',
					'title' : 'Rajeev Khanna',
					'className' : 'vacant-level'
				}, {
					'name' : 'Head EHS-LSI',
					'title' : 'Harish Verma',
					'className' : 'normal-level',
					'children' : [ {
						'name' : 'Chief of Mfg. & Projects',
						'title' : 'Anant Pande',
						'className' : 'vacant-level'
					}, {
						'name' : 'AVP-Env.',
						'title' : 'N K Jain',
						'className' : 'normal-level'
					}, {
						'name' : 'Head-Safety',
						'title' : 'Kuntal Manair',
						'className' : 'normal-level',
						'children' : [ {
							'name' : 'Sr. Manager',
							'title' : 'Sumit Kakkar',
							'className' : 'normal-level'
						} ]
					}, {
						'name' : 'EHS GAJ',
						'title' : 'Neeraj G',
						'className' : 'normal-level'
					}, {
						'name' : 'EHS SAVLI',
						'title' : 'Viral P',
						'className' : 'normal-level'
					}, {
						'name' : 'EHS A"NATH',
						'title' : 'Anil D',
						'className' : 'normal-level'
					}, {
						'name' : 'EHS BHARUCH',
						'title' : 'Chirag Shah',
						'className' : 'normal-level'
					}, {
						'name' : 'EHS Nira',
						'title' : 'Rajesh D',
						'className' : 'normal-level'
					} ]
				} ]
			} ]
		};

		$('#chart-container').orgchart({
			'data' : datascource,
			'nodeContent' : 'title'
		});

		$('#btn-filter-node').on('click', function() {
			filterNodes($('#key-word').val());
		});

		$('#btn-cancel').on('click', function() {
			clearFilterResult();
		});

		$('#key-word').on('keyup', function(event) {
			if (event.which === 13) {
				filterNodes(this.value);
			} else if (event.which === 8 && this.value.length === 0) {
				clearFilterResult();
			}
		});

	});

})(jQuery);