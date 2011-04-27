var Logger = {
	add: function(message){
		var logger = $("<div id='logger'></div>");
		
		var width = window.innerWidth / 2 - logger.width() / 2;
		
		// Set some css
		logger.attr("style", "background: #333; color: #ffffff; font: italic normal .95em Aller; padding: 10px; -moz-border-radius: 18px; position: fixed; top: 30px; left: " + width + "px;");
		
		// What yerr be wantin' to say?
		logger.html(message);
		
		// Append to the header. Dunno why $(document).append(logger) doesn't work..
		$("#header").append(logger);
		
		// Make it b-gone.
		var to = setTimeout(function(){logger.fadeOut();}, 5000);
	},
};

$(document).ready(function(){
	
	/////////////////////////////////////////////////////////////////////
	//// tooltbox creation //////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////
	var category_h1 = $(".category h1");
	var category_li = $(".category ul li");
	var toolbox = $("<div class='toolbox'></div>");
	
	category_h1.append(toolbox);
	
	category_li.mouseover(function(){
		// Get the id, which is stored like in: <li rel="forum:1:2">...</li> (here the id is 2)
		var id = $(this).attr('rel').split(':')[2];
		toolbox.css({'padding-left': 9, 'padding-right': 9});
		toolbox.html("<a href='/forum/" + id + "/edit'><img src='images/hawknee/icons/application_edit.png'></a>&nbsp;<a href='/forum/" + id + "/delete'><img src='images/hawknee/icons/application_delete.png'></a>&nbsp;<a href='/forum/" + id + "/keys/new'><img src='images/hawknee/icons/key_add.png'></a>");
		
		// Some data
		var pos = $(this).offset();
		var height = $(this).height();
		var t_height = toolbox.height();
		var t_width = toolbox.width();
		
		// Calcutate the tooltip's new position
		toolbox.css({"top": ((pos.top - t_height / 2 + 2) + height / 2) + "px", "left": (pos.left - t_width + 402) + "px"});
		toolbox.mouseover(function(){
			// Hey! I want to click you! :D
			 toolbox.show();
		}).mouseleave(function(){
			
			// Now, you can b-gone.
			 toolbox.hide();
		});
		
		// Show me yourself.
		toolbox.show();
	}).mouseleave(function(){
		
		// BUHAHAHAHAHUAHU! Now, you must b-gone!
		 toolbox.hide();
	});
	
	/////////////////////////////////////////////////////////////////////
	//// main header animation //////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////
	var header_h1 = $("#header h1");
	
	header_h1.mouseover(function(){
		Logger.add("Hoo'erd!");
	});
});
