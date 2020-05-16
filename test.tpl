<!DOCTYPE html>
<html>
  <head>
      <meta name="viewport" content="initial-scale=1.0,
            width=device-width" />
        <script src="https://js.api.here.com/v3/3.1/mapsjs-core.js"
            type="text/javascript" charset="utf-8"></script>
        <script src="https://js.api.here.com/v3/3.1/mapsjs-service.js"
            type="text/javascript" charset="utf-8"></script>
        <script src="https://js.api.here.com/v3/3.1/mapsjs-ui.js"
            type="text/javascript" charset="utf-8"></script>
        <link rel="stylesheet" type="text/css"
            href="https://js.api.here.com/v3/3.1/mapsjs-ui.css" />
  </head>
  <script type="text/javascript" charset="utf-8">
      //Initialize the Platform object:
      var platform = new H.service.Platform({
          'apikey': '{YOUR_API_KEY}'
      });

      // Get the default map types from the Platform object:
      var defaultLayers = platform.createDefaultLayers();

      // Instantiate the map:
      var map = new H.Map(
          document.getElementById('mapContainer'),
          defaultLayers.vector.normal.map,
          {
              zoom: 10,
              center: { lng: 13.4, lat: 52.51 }
          });

      // Create the default UI:
      var ui = H.ui.UI.createDefault(map, defaultLayers);
  </script>
</html>
