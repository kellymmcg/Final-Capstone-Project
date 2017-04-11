$(document).ready(function() {
	var searchName = new URLSearchParams(window.location.search).get('name');
	var jsonURL = url_base + "testPage?name=" + searchName;
	
	var map = new google.maps.Map(document.getElementById('mapT'), {
	    zoom: 12,
	    center: {lat: 41.4993, lng: -81.6944}
	});
	
	$.ajax({
	    url: jsonURL,
	    type: 'GET',
	    dataType: "json",
	    success: function (data) {
	    	for(var i = 0;i < data.length;i++){
	    		var marker = new google.maps.Marker({
	    			position: {lat: data[i].longitude, lng: data[i].latitude},
	    			map: map
	    			
	    		});
	    		
	    		
	    	}
	    },
	    error: function(e) {
	    	console.error(e);
	        //alert('Error: '+e);
	    }  
	})

});