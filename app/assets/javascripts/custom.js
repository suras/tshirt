$(document).ready(function() {
	function changeHeight() {
		var objects = $(".records").find(".arrow_box");
		console.log(objects.length);
		$(".records").each(function() 
		{
			var arrow_box = $(this).find('.arrow_box');
			var span11 = $(this).find('.span10');
			var documentHeight = 0;

			var documentHeight1 = arrow_box.width()+50;
			var documentHeight2 = span11.height()+35;
			
			if(documentHeight1 > documentHeight2)
				documentHeight = documentHeight1;
			else
				documentHeight = documentHeight2;

			arrow_box.css('width' , (documentHeight-40)+'px' );
			span11.css('height' , (documentHeight)+'px' );
			arrow_box.css('margin-top' , (documentHeight)+'px' );
			arrow_box.css('margin-bottom' , '-40px' );

		});
	}
	changeHeight();

	$('.records').bind('DOMSubtreeModified', function(event) {
		// $('.arrow_box').css('max-width' , '1000px' );
		var arrow_box = $(this).find('.arrow_box');
		var span11 = $(this).find('.span10');
		// console.log(arrow_box.width());
		arrow_box.css('width' , 'auto' );
		arrow_box.css('max-width' , '1000px' );
		// console.log(arrow_box.width());
		// changeHeight($(this).find('.arrow_box'));

		var documentHeight1 = arrow_box.width()+50;
		var documentHeight2 = span11.height()+35;
		// var documentHeight2 = 0;
		var documentHeight = 0;
		
		if(documentHeight1 > documentHeight2)
			documentHeight = documentHeight1;
		else
			documentHeight = documentHeight2;

		// console.log(documentHeight1+"--"+documentHeight2+"--"+documentHeight);
		// console.log(documentHeight+40);
		span11.css('height' , (documentHeight)+'px' );
		arrow_box.css('width' , (documentHeight-40)+'px' );
		arrow_box.css('margin-top' , (documentHeight)+'px' );
		arrow_box.css('margin-bottom' , '-40px' );

	});

	$(".checks li").click(function(){
		// console.log("asas");
		$(this).prevAll().removeClass("icon-check-empty").addClass("icon-check-empty");
		$(this).nextAll().removeClass("icon-check-empty").addClass("icon-check");
		$(this).removeClass("icon-check-empty").addClass("icon-check");
	});
});
