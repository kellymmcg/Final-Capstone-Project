<!DOCTYPE html>
<html> 
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
  <title>Google Maps Multiple Markers</title> 
  <script src="http://maps.google.com/maps/api/js?key=AIzaSyB5Cyxiz7vexNLr_2SLi_HoFXh4-xC31T8" 
          type="text/javascript"></script>

  <script type="text/javascript">

    var map;

    // Cretes the map
    function initialize() {
      map = new google.maps.Map(document.getElementById('map'), {
        zoom: 5,
        center: new google.maps.LatLng(-33.92, 151.25),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      });
    }

    // This function takes an array argument containing a list of marker data
    function generateMarkers(locations) {
      for (var i = 0; i < locations.length; i++) {  
        new google.maps.Marker({
          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
          map: map,
          title: locations[i][0]
        });
      }
    }
  </script>

</head> 
<body> 
  <div id="map" style="width: 500px; height: 400px;"></div>

  <script type="text/javascript">
  function initMap() {
		var location = {
			lat : ${landmark.longitude},
			lng : ${landmark.latitude}
		};
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 16,
			center : location
		});
		var marker = new google.maps.Marker({
			position : location,
			map : map
		});
	}
  </script>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5Cyxiz7vexNLr_2SLi_HoFXh4-xC31T8&callback=initMap"></script>
</body>
</html>