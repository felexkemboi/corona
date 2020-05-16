<html>
<head>
<meta name="viewport" content="initial-scale=1.0, width=device-width" />
<script src="https://js.api.here.com/v3/3.1/mapsjs-core.js"type="text/javascript" charset="utf-8"></script>
<script src="https://js.api.here.com/v3/3.1/mapsjs-service.js"type="text/javascript" charset="utf-8"></script>
</head>

<body style='margin: 0'>
  <div class="">
    <form method="post" action="/getCountry">
    <div>
        <label for="country">Country Name:</label>
         <input type="text" id="country" name="country">
        <button type="submit">Show Country</button>
    </div>
</form>
<p>Available options : Aruba,Afghanistan,Angola,Anguilla,Albania,Andorra,United Arab Emirates,Argentina,Armenia,Antigua and Barbuda,Australia,Austria,Azerbaijan,Burundi,Belgium</p>
<!--{{ dicts }}
{{ dicts['latitude'] }}
{{ dicts['longitude'] }}-->
  </div>
<div style="width: 100%; height: 100%" id="mapContainer"></div>

<script>
      // Initialize the platform object:
      var platform = new H.service.Platform({
        'apikey': 'd7qyuWHVaDSj8__qx-KAVeP1AWzTWQMHFHbEnX0zT7Q'
      });

      const data = {{!dicts}};

	   const lat = data.latitude;
	   const long = data.longitude;

	// Obtain the default map types from the platform object
      var maptypes = platform.createDefaultLayers();

      // Instantiate (and display) a map object:
      var map = new H.Map(
        document.getElementById('mapContainer'),
        maptypes.vector.normal.map,
        {
          zoom: 10,
          center: { lat: lat, lng: long }
        });

	var marker = new H.map.Marker({ lat: lat, lng: long });

	// Add the marker to the map:
	map.addObject(marker);

</script>
</body>
</html>
