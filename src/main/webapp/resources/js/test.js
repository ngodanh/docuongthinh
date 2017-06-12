/**
 * TEST.JS
 */

// A $( document ).ready() block.
jQuery(document).ready(function($) {
	$('#test').on('click', function() {
		alert('Hello');
	});
});
$(function(){
	pannellum.viewer('panorama', {
		"type": "cubemap",
	    "autoLoad" : true,
	    "autoRotate" : -1,
	    "cubeMap": [
   		       		"resources/images/panorama/29408_1img_3141.jpg",
   		       		"resources/images/panorama/1328362802_2img_3142.jpg",
   		       		"resources/images/panorama/31663_examplepanocube2.jpg",
   		       		"resources/images/panorama/1934_examplepanocube3.jpg",
   		       		"resources/images/panorama/14248_examplepanocube4.jpg",
   		       		"resources/images/panorama/2662_examplepanocube5.jpg",
	       		    ]
	});
});
