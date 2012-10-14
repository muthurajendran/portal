// JavaScript Document
var cookie_name1 = "selected-combo";
var cookie_name2 = "selected-color";
var cookie_name3 = "selected-texture";
var cookie_options = { path: '/', expires: 7 };
var switcher = "close";

$(document).ready(function(){
	var get_cookie = $.cookie(cookie_name1);
	if(get_cookie != null) {
		$("#active-combo").attr({ href: "css/" + get_cookie + ".css"});
	}
	
	var get_cookie2 = $.cookie(cookie_name2);
	if(get_cookie2 != null) {
		$("#active-color").attr({ href: "css/color" + get_cookie2 + ".css"});
	}
	
	var get_cookie3 = $.cookie(cookie_name3);
	if(get_cookie3 != null) {
		$("#active-texture").attr({ href: "css/texture-" + get_cookie3 + ".css"});
	}
/*	
	$("#styleswitcher ul#stylecombo li a").click(function() {
		var thecombo = $(this).attr("rel");
		$("#active-combo").attr({ href: "css/" + thecombo + ".css"});
		$.cookie(cookie_name1, thecombo, cookie_options);
		return false;
	});*/
	
	$("#stylecombo").change(function(){
		//alert($(this).val());
		var thecombo = $(this).val();
		$("#active-combo").attr({ href: "css/" + thecombo + ".css"});
		$.cookie(cookie_name1, thecombo, cookie_options);
		return false;
	});
	
	$("#styleswitcher ul#stylecolor li a").click(function() {
		var thecolor = $(this).attr("rel");
		$("#active-color").attr({ href: "css/color" + thecolor + ".css"});
		$.cookie(cookie_name2, thecolor, cookie_options);
		return false;
	});

	$("#styleswitcher ul#styletexture li a").click(function() {
		var thetexture = $(this).attr("rel");
		$("#active-texture").attr({ href: "css/texture-" + thetexture + ".css"});
		$.cookie(cookie_name3, thetexture, cookie_options);
		return false;
	});
	
	$("#openClose").click(function(){						
		if(switcher=="close"){
			$("#openClose img").attr('src','images/swtr-close.png');	
			$("#switcherwrap").animate({
				right: "-50px"
			}, 500 );
			switcher="open";
		} else { 
			$("#openClose img").attr('src','images/swtr-open.png');
			$("#switcherwrap").animate({
				right: "-300px"
			}, 500 );
			switcher="close";
		}
	});
	
});