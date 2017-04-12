$(document).ready(function() {
	var searchId = new URLSearchParams(window.location.search).get('id');
	var jsonURL = url_base + "jsonRoute?id=" + searchId;
	
	var directionsService = new google.maps.DirectionsService;
    var directionsDisplay = new google.maps.DirectionsRenderer;
	var map = new google.maps.Map(document.getElementById('mapG'), {
	    zoom: 14,
	    center: {lat: 41.5030, lng: -81.6911}
	});
	
	directionsDisplay.setMap(map);
	
	var waypts = [];
	
	$.ajax({
	    url: jsonURL,
	    type: 'GET',
	    dataType: "json",
	    success: function (data) {
	    	
	    	for(var i = 1;i < data.length - 1;i++){
	    		waypts.push({
	    			location: data[i].address,
	    			stopover: true
	    		});
	    	}	
	    	
	    	directionsService.route({
	            origin: data[0].address,
	            destination: data[data.length-1].address,
	            waypoints: waypts,
	            optimizeWaypoints: false,
	            travelMode: 'DRIVING'
	    	}, function(response, status) {
	            if (status === 'OK') {
	                directionsDisplay.setDirections(response);
	                var route = response.routes[0];
	                var summaryPanel = document.getElementById('routeDetails');
	                summaryPanel.innerHTML = '';
	                for (var i = 0; i < route.legs.length; i++) {
	                    var routeSegment = i + 1;
	                    summaryPanel.innerHTML += '<p class=rHead> Stop #' + routeSegment +'</p>';
	                    summaryPanel.innerHTML += '<p class=tFrom><b>From:</b> ' + data[i].name  + '</p>';
	                    summaryPanel.innerHTML += '<p class=tTo><b>To:</b> ' + data[i+1].name + '</p>';
	                    summaryPanel.innerHTML += '<p class=tTime>' +route.legs[i].distance.text +" | "+ route.legs[i].duration.text + '</td></tr>';
	                  }
	                } else {
	                  window.alert('Directions request failed due to ' + status);
	                
	            }
	    	});
	    	   	
	    },
	    error: function(e) {
	    	console.error(e);
	    	//alert('Error: '+e);
	    }  
	})
	
	 
	
});