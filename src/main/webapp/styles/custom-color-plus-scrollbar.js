var config = {
	container : "#OrganiseChart1",
	rootOrientation : 'NORTH', // NORTH || EAST || WEST || SOUTH
	// levelSeparation: 30,
	siblingSeparation : 20,
	subTeeSeparation : 60,
	nodeAlign : "CENTER",
	scrollbar : "fancy",
	connectors : {
		type : 'step'
	},
	node : {
		collapsable : true,
		HTMLclass : 'nodeNormal'
	},
	animateOnInit : false,
	animation : {
		nodeAnimation : "easeOutQuad",
		nodeSpeed : 700,
		connectorsAnimation : "bounce",
		connectorsSpeed : 700
	},
	callback : {
		onTreeLoaded : function() {

			var elmnt = document.getElementById("OrganiseChart1");
			elmnt.scrollLeft = 1800;
		}

	}
}, ceo = {
	text : {
		name : "Rajeev Shrivastava",
		title : "CO - CEO - Life Sciences Ingredients",
		contact : 'Dept. A'
	},
	image : "images/avatar/48.jpg",
	HTMLclass : 'nodeRed',
	HTMLid : "ceo"
}, sbu = {
	parent : ceo,
	text : {
		name : "Chandan Singh",
		title : "SBU Head - LSC",
		contact : 'Dept. B'
	},
	HTMLclass : 'nodeBlue',
	image : "images/avatar/eg1.jpeg",
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
		contact : 'Dept. C'
	},
	image : "images/avatar/eg6.png",
	HTMLclass : 'nodeGreen',
	HTMLid : "sc"
}, vps = {
	parent : sbu_1,
	text : {
		name : "Ranjeet Singh",
		title : "VP - Sales",
		contact : 'Dept. C'
	},
	image : "images/avatar/eg3.jpg",
	collapsed : false,
	HTMLclass : 'nodeGreen',
	HTMLid : "vps"
}, rhg = {
	parent : vps,
	text : {
		name : "Jitendra Kalantri",
		title : "Regional Head - Gujrat (LSC)",
		contact : 'Dept. C'
	},
	image : "images/avatar/eg2.jpeg",
	HTMLclass : 'nodePurple',
	HTMLid : "rhg"
}, dmsa = {
	parent : rhg,
	text : {
		name : "Keyur Shah",
		title : "DM - Sales Admin",
		contact : 'Dept. C'
	},
	image : "images/avatar/eg4.jpeg",
	HTMLid : "dmsa"
}, rhane = {
	parent : vps,
	text : {
		name : "Raj Kishor",
		title : "Regional Head - Acetyls - North & East India",
		contact : 'Dept. C'
	},
	image : "images/avatar/eg7.jpg",
	HTMLclass : 'nodePurple',
	HTMLid : "rhane"
}, sm = {
	parent : rhane,
	text : {
		name : "Abhishek Dube",
		title : "Sales Manager",
		contact : 'Dept. C'
	},
	image : "images/avatar/eg2.jpeg",
	HTMLid : "sm"
}, rhp = {
	parent : rhane,
	text : {
		name : "Rajeev Aggarwal",
		title : "Regional Head - Punjab",
		contact : 'Dept. C'
	},
	image : "images/avatar/eg5.jpg",
	HTMLid : "rhp"
}, amk = {
	parent : rhane,
	text : {
		name : "Bikash Shaw",
		title : "Area Manager - Kolkata",
		contact : 'Dept. C'
	},
	image : "images/avatar/eg1.jpeg",
	HTMLid : "amk"
}, rhais = {
	parent : vps,
	text : {
		name : "TNLV Rao",
		title : "Regional Head - Acetyls - AI-South",
		contact : 'Dept. C'
	},
	image : "images/avatar/eg3.jpg",
	HTMLclass : 'nodePurple',
	HTMLid : "rhais"
}, ams = {
	parent : rhais,
	text : {
		name : "M Munisekhar",
		title : "Area Manager - Sales",
		contact : 'Dept. D'
	},
	image : "images/avatar/eg6.png",
	HTMLid : "ams"
}, ess = {
	parent : rhais,
	text : {
		name : "Jeevan Kumar (Comm. Pool)",
		title : "Executive Sales Supp.",
		contact : 'Dept. D'
	},
	image : "images/avatar/eg7.jpg",
	HTMLid : "ess"
}, ch = {
	parent : rhais,
	text : {
		name : "Suresh Babu (Comm. Pool)",
		title : "Coordinator Hyderabad",
		contact : 'Dept. D'
	},
	image : "images/avatar/eg3.jpg",
	HTMLid : "ch"
}, smroa = {
	parent : vps,
	text : {
		name : "Manish Saxena",
		title : "Sales Manager - Rest of Asia",
		contact : 'Dept. B'
	},
	image : "images/avatar/eg4.jpeg",
	HTMLclass : 'nodePurple',
	HTMLid : "smroa"
}, rhm = {
	parent : vps,
	text : {
		name : "R.K.Sharma",
		title : "Regional Head - Mumbai",
		contact : 'Dept. B'
	},
	image : "images/avatar/eg1.jpeg",
	HTMLclass : 'nodePurple',
	HTMLid : "rhm"
}, c = {
	parent : rhm,
	text : {
		name : "Id Unni",
		title : "Coordinator",
		contact : 'Dept. B'
	},
	image : "images/avatar/eg2.jpeg",
	HTMLid : "c"
}, am = {
	parent : sbu_1,
	text : {
		name : "Sunil Singh",
		title : "AM - Dispatch Planning",
		contact : 'Dept. B'
	},
	image : "images/avatar/eg6.png",
	collapsed : false,
	HTMLclass : 'nodeGreen',
	HTMLid : "am"
}, es = {
	parent : am,
	text : {
		name : "Prateek Sharma",
		title : "Executive Sales",
		contact : 'Dept. F'
	},
	image : "images/avatar/eg5.jpg",
	HTMLclass : 'nodePurple',
	HTMLid : "es"
}, esv = {
	parent : es,
	text : {
		name : "(Vacant)",
		title : "Sales Supp.",
		contact : 'Dept. F'
	},
	image : "images/avatar/vacantdp.png",
	HTMLclass : 'nodeVacant',
	HTMLid : "esv"
}, dgmea = {
	parent : sbu_1,
	text : {
		name : "Deepak Sharma",
		title : "DGM - Europe & Americas"
	},
	image : "images/avatar/eg2.jpeg",
	collapsed : false,
	HTMLclass : 'nodeGreen',
	HTMLid : "dgmea"
}, sme = {
	parent : dgmea,
	text : {
		name : "Chandroday Pande",
		title : "Sales Manager - Europe",
		contact : 'Dept. B'
	},
	image : "images/avatar/eg3.jpg",
	HTMLclass : 'nodePurple',
	HTMLid : "sme"
}, dgmpps = {
	parent : sbu_1,
	text : {
		name : "Chintan Gosalia",
		title : "DGM - Product, Project & Strategy",
		contact : 'Dept. E'
	},
	image : "images/avatar/eg1.jpeg",
	collapsed : false,
	HTMLclass : 'nodeGreen',
	HTMLid : "dgmpps"
}, ba = {
	parent : dgmpps,
	text : {
		name : "Nishant Goel",
		title : "Business Analyst",
		contact : 'Dept. E'
	},
	image : "images/avatar/eg7.jpg",
	HTMLclass : 'nodePurple',
	HTMLid : "ba"
}, dgml = {
	parent : sbu_1,
	text : {
		name : "Udham Singh",
		title : "DGM - Logistics",
		contact : 'Dept. F'
	},
	image : "images/avatar/eg2.jpeg",
	collapsed : false,
	HTMLclass : 'nodeGreen',
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
	HTMLid : "dml1"
}, dml2 = {
	parent : dgml_1,
	text : {
		name : "Arun Ranikar",
		title : "DM - Logistics",
		contact : 'Dept. E'
	},
	image : "images/avatar/eg4.jpeg",
	HTMLid : "dml2"
}, aml = {
	parent : dgml_1,
	text : {
		name : "Mahendra Solanki",
		title : "Assistant Manager - Logistics",
		contact : 'Dept. E'
	},
	image : "images/avatar/eg5.jpg",
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
		contact : 'Dept. B'
	},
	image : "images/avatar/vacantdp.png",
	collapsed : false,
	HTMLclass : 'nodeVacant',
	HTMLid : "pap"
}, mp = {
	parent : pap,
	text : {
		name : "Mumbai Port",
		title : "Suhas Mule",
		contact : 'Dept. E'
	},
	image : "images/avatar/eg6.png",
	HTMLclass : 'nodePurple',
	HTMLid : "mp"
}, kp = {
	parent : pap,
	text : {
		name : "Deepak Pancholi",
		title : "Kandla Port",
		contact : 'Dept. E'
	},
	image : "images/avatar/eg5.jpg",
	HTMLclass : 'nodePurple',
	HTMLid : "kp"
}, kpv = {
	parent : kp,
	text : {
		name : "(Vacant)",
		title : "Kandla Port Supp.",
		contact : 'Dept. E'
	},
	image : "images/avatar/vacantdp.png",
	HTMLclass : 'nodeVacant',
	HTMLid : "kpv"
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

ALTERNATIVE = [ config, ceo, sbu, sbu_1, sbu_2, sc, vps, rhg, dmsa, rhane, sm,
		rhp, amk, rhais, ams, ess, ch, smroa, rhm, c, am, es, esv, dgmea, sme,
		dgmpps, ba, dgml, dgml_1, ml, dml1, dml2, aml, dgml_2, sclh, pap, mp,
		kp, kpv, ppc, man, fgd ]; // 34

$("#export").click(function() {

	html2canvas($('#OrganiseChart1'), {
		width : elem.find("svg").width(),
		height : elem.find("svg").height(),
		onrendered : function(canvas) {
			var img = canvas.toDataURL("image/png")
			window.open(img);
		}
	});

});
