
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width">
<title>Org Chart Demo</title>
<link rel="stylesheet" href="styles/Treant.css">
<link rel="stylesheet" href="styles/collapsable.css">
<link rel="stylesheet" href="styles/custom-color-plus-scrollbar3.css">
<link rel="stylesheet" href="styles/perfect-scrollbar.css">

</head>
<body>
	<div class="chart" id="OrganiseChart1"></div>

	<div style="width: 100%; text-align: center;">
		<button id="export">Export to PDF</button>
	</div>
	<!-- 
	<button id="L1">L1</button>
	<button id="L2">L2</button>
	<button id="L3">L3</button>
	<button id="L4">L4</button>
	<button id="L5">L5</button>
	 -->

	<script src="styles/raphael.js"></script>
	<script src="styles/Treant.js"></script>

	<script src="styles/jquery.min.js"></script>
	<script src="styles/jquery.easing.js"></script>
	<!-- <script src="styles/jquery.transition.js"></script> -->
	<script src="styles/jquery.mousewheel.js"></script>
	<script src="styles/perfect-scrollbar.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.1/jspdf.min.js"></script>

	<script>
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
		}, dgml = {
			text : {
				name : "Udham Singh",
				title : "DGM - Logistics",
				contact : 'Dept. F'
			},
			image : "images/avatar/eg2.jpeg",
			HTMLclass : 'nodeNormal',
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
				contact : 'Dept. F'
			},
			image : "images/avatar/eg3.jpg",
			HTMLid : "ml"
		}, dml1 = {
			parent : dgml_1,
			text : {
				name : "Devasis Patra",
				title : "DM-Logistics",
				contact : 'Dept. E'
			},
			image : "images/avatar/eg1.jpeg",
			HTMLclass : 'nodeNormal',
			HTMLid : "dml1"
		}, dml2 = {
			parent : dgml_1,
			text : {
				name : "Arun Ranikar",
				title : "DM - Logistics",
				contact : 'Dept. E'
			},
			image : "images/avatar/eg4.jpeg",
			HTMLclass : 'nodeNormal',
			HTMLid : "dml2"
		}, aml = {
			parent : dgml_1,
			text : {
				name : "Mahendra Solanki",
				title : "Assistant Manager - Logistics",
				contact : 'Dept. E'
			},
			image : "images/avatar/eg5.jpg",
			HTMLclass : 'nodeNormal',
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
				contact : 'Dept. F'
			},
			HTMLclass : 'nodeDotted',
			image : "images/avatar/eg2.jpeg",
			HTMLid : "sclh"
		}

		var ALTERNATIVE = [ config, dgml, dgml_1, ml, dml1, dml2, aml, dgml_2,
				sclh ];

		var orgchart = new Treant(ALTERNATIVE);

		$("#export").click(function() {

			/*
			html2canvas($('#OrganiseChart1'), {
				width : $('#OrganiseChart1').find("svg").width(),
				height : $('#OrganiseChart1').find("svg").height(),
				useCORS : true,
				allowTaint : false,
				letterRendering : true,
				logging : true,
				onrendered : function(canvas) {
					var img = canvas.toDataURL("image/png")
					window.open(img);
				}
			});
			 */
			var doc = new jsPDF();
			doc.addHTML($('#OrganiseChart1')[0], 2, 2, {
				'background' : '#fff',
			}, function() {
				doc.save('sample-file.pdf');
			});

			var pdf = new jsPDF('p', 'pt', 'letter');
			pdf.addHTML($('#ElementYouWantToConvertToPdf')[0], function() {
				pdf.save('Test.pdf');
			});

		});
	</script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

</body>
</html>