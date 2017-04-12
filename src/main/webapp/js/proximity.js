$(document).ready(function() {
	
	var searchCity = new URLSearchParams(window.location.search).get('city');
	var searchRadius = new URLSearchParams(window.location.search).get('radius');
	
	var jsonURL = url_base + "jsonLandmarks?city=" + searchCity + "&radius=" + searchRadius;
	
	var map = new google.maps.Map(document.getElementById('mapT'), {
	    zoom: 14,
	    center: {lat: 41.5030, lng: -81.6911}
	});
	
	$.ajax({
	    url: jsonURL,
	    type: 'GET',
	    dataType: "json",
	    success: function (data) {
	    	for(var i = 0;i < data.length;i++){
	    		var marker = new google.maps.Marker({
	    			position: {lat: data[i].latitude, lng: data[i].longitude},
	    			map: map,
	    			
	    		});
	    		
	    		
	    	}
	    },
	    error: function(e) {
	    	console.error(e);
	        //alert('Error: '+e);
	    }  
	})

});