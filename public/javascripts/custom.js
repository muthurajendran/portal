// JavaScript Document

$(document).ready(function(){
	$("ul.sf-menu").superfish({
		animation: { opacity:"show", height:"show" }
	});						   
	
	$('a[href*=#top]').click(function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
			var $target = $(this.hash);
			$target = $target.length && $target || $('[name=' + this.hash.slice(1) +']');
			if ($target.length) {
		  		var targetOffset = $target.offset().top;
		  		$('html,body').animate({scrollTop: targetOffset}, 1000);
		  		return false;
			}
	  	}
	});
	
	$('.preload').preloadImages();
	//$(".addcaption").caption();
	$('.tipfade').tipsy({fade: true});
	
	$(".imghover").mouseenter(function(e) {
		$(this).children('a').children('span').fadeIn(200);
	}).mouseleave(function(e) {
		$(this).children('a').children('span').fadeOut(200);
	});	
	
	$(".close").click(function(event){
		event.preventDefault();
		$(this).parent("div").parent("div").hide("slow");
	});
	
	$(".togglebox").hide();
		//slide up and down when click over heading 2
		$(".toggle").click(function(){
		// slide toggle effect set to slow you can set it to fast too.
		$(this).next(".togglebox").slideToggle("slow");
		if($(this).hasClass('togglehide')){
			$(this).removeClass('togglehide');
		} else {
			$(this).addClass('togglehide');
		}
		return true;
	});
	
	$(".panes1 div").hide();
	$(".tab1 li:first").addClass("active").show();
	$(".panes1 div:first").show();
	
	$(".tab1 li").click(function(){
	   	 $(".tab1 li").removeClass("active");
		 $(this).addClass("active");
		 $(".panes1 div").hide();
		 
		 var activeTab = $(this).find("a").attr("href");
		 $(activeTab).fadeIn();
		 return false;
	});
	
	$(".panes2 div").hide();
	$(".tab2 li:first").addClass("active").show();
	$(".panes2 div:first").show();
	
	$(".tab2 li").click(function(){
    	 $(".tab2 li").removeClass("active");
		 $(this).addClass("active");
		 $(".panes2 div").hide();
		 
		 var activeTab = $(this).find("a").attr("href");
		 $(activeTab).fadeIn();
		 return false;
	});
	
	$("a[rel^='prettyPhoto']").prettyPhoto({animationSpeed:'fast',slideshow:10000,theme:'light_rounded'});
	
	$(function(){ $("input:text, input:password, input:checkbox, input:radio, input:file, textarea, select").uniform(); });

	$('#accordion li').each(function() { 
		$(this).find('span p').hide();
		
		$(this).hover(function() { 
				$(this).find('span p').stop().fadeTo(500, 1); 
			},
			function(){ 
				$(this).find('span p').stop().fadeTo(1000,0); 
			}
		) // end hover
	}) // end each

});

/* Kwicks Functions */
function kwicksPlay(strKwicks,intKwicks,intTotal,intSeconds,intDirection) {
	$(strKwicks).data('kwicks').openKwick(intKwicks);
	if (intDirection == -1) {
		if (intKwicks < intTotal && intKwicks > -1) {
			intKwicks--;
		} else {
			$(strKwicks).data('kwicks').closeKwick();
			intKwicks = intTotal-1;
		}
	} else {
		if (intKwicks < intTotal && intKwicks > -1) {
			intKwicks++;
		} else {
			$(strKwicks).data('kwicks').closeKwick();
			intKwicks = 0;
		}
	}
	
	tmrKwicks = setTimeout("kwicksPlay('" + strKwicks + "'," +
	intKwicks + "," + intTotal + "," + intSeconds + "," + intDirection + ");",
	intSeconds*1000);
}

function kwicksPause() {
	clearTimeout(tmrKwicks);
}

 

  $(function() {
    $(".submit").click(function() {
      // validate and process form here
	  $("input#name").removeClass("formerrorbox");
	  $("input#email").removeClass("formerrorbox");
  	  var name = $("input#name").val();
  	  if (name == "") {
		$("input#name").addClass("formerrorbox");
        $("input#name").focus();
        return false;
      }
  	  var email = $("input#email").val();
	  var pattern = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
  	  if ((email == "") || (!email.match(pattern))) {
		$("input#email").addClass("formerrorbox");
        $("input#email").focus();
        return false;
      }
	 var comment = $("textarea#comment").val();
	 var dataString = $("#contact_form form").serialize();
	  $.ajax({	 
		type: "POST",
		url: "bin/process.php",
		data: dataString,
		success: function() {
		  $('#contact_form').html("<div id='message'></div>");
		  $('#message').html("<h2>Email has been sent successfully!</h2>")
		  .append("<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>")
		  .hide()
        .fadeIn(1500, function() {});
		}
	  });
	  return false;
    });
  });
  
(function($){
    $.fn.preloadImages = function(options){
		return this.each(function(){
			var container = $(this);
			var image = container.find('img');
			$(image).css({ "visibility": "hidden", "opacity": "0" });
			$(image).load(function(){
			  $(this).css({ "visibility": "visible" }).animate({ opacity:"1" }, {duration:500});
			  //$(container).removeClass('preload');
			}).each(function(){
				if(this.complete || ($.browser.msie && parseInt($.browser.version) == 6)) { $(this).trigger('load'); }
			});
		});
    }
})(jQuery);  
