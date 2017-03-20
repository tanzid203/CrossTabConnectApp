
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

	<div id="raphaelDiv" style="display: none;"></div>
	<canvas id="myCanvas" style="display: none;"></canvas>


	<canvas id="finalCanvas"></canvas>

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
	<script src="styles/raphael.export.js"></script>
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
		}, sbu = {
			text : {
				name : "Chandan Singh",
				title : "SBU Head - LSC",
				contact : 'Dept. B'
			},
			HTMLclass : 'nodeNormal',
			image : "images/avatar/eg1.jpeg",
			HTMLid : "sbu"
		}, sbu_1 = {
			parent : sbu,
			pseudo : true,
			HTMLid : "sbu_1"
		}, am = {
			parent : sbu_1,
			text : {
				name : "Sunil Singh",
				title : "AM - Dispatch Planning",
				contact : 'Dept. B'
			},
			image : "images/avatar/eg6.png",
			HTMLclass : 'nodeNormal',
			HTMLid : "am"
		}, dgmea = {
			parent : sbu_1,
			text : {
				name : "Deepak Sharma",
				title : "DGM - Europe & Americas"
			},
			image : "images/avatar/eg2.jpeg",
			HTMLclass : 'nodeNormal',
			HTMLid : "dgmea"
		}, dgmpps = {
			parent : sbu_1,
			text : {
				name : "Chintan Gosalia",
				title : "DGM - Product, Project & Strategy",
				contact : 'Dept. E'
			},
			image : "images/avatar/eg1.jpeg",
			HTMLclass : 'nodeNormal',
			HTMLid : "dgmpps"
		}, dgml = {
			parent : sbu_1,
			text : {
				name : "Udham Singh",
				title : "DGM - Logistics",
				contact : 'Dept. F'
			},
			link : {
				href : "/Link2"
			},
			image : "images/avatar/eg2.jpeg",
			HTMLclass : 'nodeNormal',
			HTMLid : "dgml"
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
		}, ppc = {
			parent : sbu_2,
			text : {
				name : "Niskarsh J - Gajraula / Vishwas Chinchore - Nira",
				title : "PPC SPOC",
				contact : 'Dept. F'
			},
			image : "images/avatar/eg7.jpg",
			HTMLclass : 'nodeLinkDotted',
			HTMLid : "ppc"
		}, man = {
			parent : sbu_2,
			text : {
				name : "Jaideep Hajra - Gajraula / RM Waza - Nira",
				title : "Manufacturing",
				contact : 'Dept. G'
			},
			image : "images/avatar/eg1.jpeg",
			HTMLclass : 'nodeLinkDotted',
			HTMLid : "man"
		}, fgd = {
			parent : sbu_2,
			text : {
				name : "Nitin S - Gajraula / Ajay N - Nira",
				title : "FG Dispatch SPOC",
				contact : 'Dept. F'
			},
			image : "images/avatar/eg2.jpeg",
			HTMLclass : 'nodeLinkDotted',
			HTMLid : "fgd"
		}

		var ALTERNATIVE = [
				config, sbu, sbu_1, am, dgmea, dgmpps, dgml, sbu_2, ppc, man, fgd
		];

		var orgchart = new Treant( ALTERNATIVE );

		$( "#export" ).click( function () {

			//canvg('canvas', $("#OrganiseChart1").html());
			//var paper = new Raphael(document.getElementById('OrganiseChart1'), 500,500);

			//var svg = document.getElementById('OrganiseChart1').find("svg");

			var svg = document.querySelector( 'svg' );
			var serializer = new XMLSerializer();
			var svgString = serializer.serializeToString( svg );
			var canvas = document.getElementById( "test" );
			canvg( document.getElementById( 'myCanvas' ), svgString );

			//canvg(document.getElementById('myCanvas'), $("svg"));

			//var dataURL = document.getElementById('myCanvas')
			//		.toDataURL("image/png");
			//window.location = dataURL;
			//var img = document.getElementById("myCanvas").toDataURL(
			//		"image/png");
			//window.location = img;
			/*
			 setTimeout(function() {
			 //fetch the dataURL from the canvas and set it as src on the image
			 var dataURL = document.getElementById('myCanvas')
			 .toDataURL("image/png");
			 window.location = dataURL;
			 }, 100);
			 */
			document.getElementById( 'OrganiseChart1' ).parentNode.style.overflow = 'visible'; //might need to do this to grandparent nodes as well, possibly.

			html2canvas( $( '#OrganiseChart1' ), {
				//seCORS : true,
				//allowTaint : false,
				//letterRendering : true,
				logging : true,
				onrendered : function ( canvas ) {

					document.getElementById( 'OrganiseChart1' ).parentNode.style.overflow = 'hidden';

					var finalCanvas = document.getElementById( 'finalCanvas' );

					var context = finalCanvas.getContext( '2d' );

					//Image HTML
					var img1 = canvas;
					//window.open(img1);

					//Image SVG
					var img2 = document.getElementById( 'myCanvas' );
					//.toDataURL("image/png");
					//window.open(img2);

					finalCanvas.width = img2.width;
					finalCanvas.height = img2.height;

					context.globalAlpha = 1.0;
					context.drawImage( img1, 0, 0 );
					context.globalAlpha = 0.5; //Remove if pngs have alpha
					context.drawImage( img2, 0, 0 );

					var finalImg = finalCanvas.toDataURL( "image/png" );
					window.open( finalImg );

				}
			} );

			/*
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
			 */
		} );
	</script>
	<script type="text/javascript"
		src="http://canvg.github.io/canvg/rgbcolor.js"></script>
	<script type="text/javascript"
		src="http://canvg.github.io/canvg/StackBlur.js"></script>
	<script type="text/javascript"
		src="http://canvg.github.io/canvg/canvg.js"></script>

	<script src="styles/raphael.js"></script>
	<script src="styles/raphael.export.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

</body>
</html>