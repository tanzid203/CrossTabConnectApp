var config = {
	container : "#OrganiseChart1",
	rootOrientation : 'NORTH', // NORTH || EAST || WEST || SOUTH
	// levelSeparation: 30,
	siblingSeparation : 20,
	subTeeSeparation : 60,
	scrollbar : "fancy",
	connectors : {
		type : 'step'
	},
	node : {
		collapsable : false,
		HTMLclass : 'nodeNormal'
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
		contact : 'Dept. A'
	},
	image : "images/avatar/48.jpg",
	HTMLclass : 'nodeNormal',
	HTMLid : "ceo"
}, sbu = {
	parent : ceo,
	text : {
		name : "Chandan Singh",
		title : "SBU Head - LSC",
		contact : 'Dept. B'
	},
	link : {
		href : "/Link1"
	},
	HTMLclass : 'nodeNormal',
	image : "images/avatar/eg1.jpeg",
	HTMLid : "sbu"
}

var ALTERNATIVE1 = [ config, ceo, sbu ];
/*
 * var ALTERNATIVE2 = [ config, ceo, sbu, sbu_1, sbu_2, am, es, dgmea, dgmpps,
 * dgml, dgml_1, ml, dml1, dml2, aml, dgml_2, sclh, ppc, man, fgd ];
 * 
 * var ALTERNATIVE3 = [ config, ceo, sbu, sbu_1, sbu_2, am, es, dgmea, dgmpps,
 * dgml, dgml_1, ml, dml1, dml2, aml, dgml_2, sclh, ppc, man, fgd ];
 * 
 * var ALTERNATIVE4 = [ config, ceo, sbu, sbu_1, sbu_2, am, es, dgmea, dgmpps,
 * dgml, dgml_1, ml, dml1, dml2, aml, dgml_2, sclh, ppc, man, fgd ];
 * 
 * var ALTERNATIVE5 = [ config, ceo, sbu, sbu_1, sbu_2, am, es, dgmea, dgmpps,
 * dgml, dgml_1, ml, dml1, dml2, aml, dgml_2, sclh, ppc, man, fgd ];
 * 
 */
var orgchart = new Treant(ALTERNATIVE1);

$("#export").click(function() {

	/*
	 * html2canvas($('#OrganiseChart1'), { width :
	 * $('#OrganiseChart1').find("svg").width(), height :
	 * $('#OrganiseChart1').find("svg").height(), useCORS : true, allowTaint :
	 * false, letterRendering : true, logging : true, onrendered :
	 * function(canvas) { var img = canvas.toDataURL("image/png")
	 * window.open(img); } });
	 */
	var doc = new jsPDF();
	doc.addHTML($('#OrganiseChart1')[0], 2, 2, {
		'background' : '#fff',
	}, function() {
		doc.save('sample-file.pdf');
	});
	/*
	 * var pdf = new jsPDF('p', 'pt', 'letter');
	 * pdf.addHTML($('#ElementYouWantToConvertToPdf')[0], function() {
	 * pdf.save('Test.pdf'); });
	 */
});
/*
 * $("#L1").click(function() { orgchart.destroy(); orgchart = new
 * Treant(ALTERNATIVE1); });
 * 
 * $("#L2").click(function() { orgchart.destroy(); orgchart.reload(); orgchart =
 * new Treant(ALTERNATIVE2); });
 * 
 * $("#L3").click(function() { orgchart.destroy(); orgchart = new
 * Treant(ALTERNATIVE3); });
 * 
 * $("#L4").click(function() { orgchart.destroy(); orgchart = new
 * Treant(ALTERNATIVE4); });
 * 
 * $("#L5").click(function() { orgchart.destroy(); orgchart = new
 * Treant(ALTERNATIVE5); });
 */