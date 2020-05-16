<html>
<head>
<meta name="viewport" content="initial-scale=1.0, width=device-width" />
<script src="https://js.api.here.com/v3/3.1/mapsjs-core.js"type="text/javascript" charset="utf-8"></script>
<script src="https://js.api.here.com/v3/3.1/mapsjs-service.js"type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://js.api.here.com/v3/3.1/mapsjs-ui.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="https://js.api.here.com/v3/3.1/mapsjs-ui.css" />
</head>
<title>WeCorona Records Tracking</title>

<body style='margin: 0;  padding-top: 20px; padding-bottom: 70px;'>
    <nav style='padding-top: 20px;' class="navbar navbar-centre navbar-default">
      <div class="container">
        <div class="collapse navbar-collapse">
          Welcome to my Updates platform
        </div>
      </div>
    </nav>
  <div class="">
    <form method="post" action="/getCountry">
    <div>
      <div class="container center-block">
        <div class="row">
            <form class="col-12">
                <div class="form-inline">
                    <div class="col-md-12 form-group">
                        <label class="col-sm-1 col-form-label">Country</label>
                        <input style="width:350px;" type="text" name="country" class="form-control" placeholder="Type the Country's Name from the options below">
                        <input type="submit" class="btn btn-info" value="Show Country">
                    </div>
                </div>

            </form>
        </div>
    </div>
    </div>
</form>
<p><i><b>Available options </b>: Aruba,&nbsp;&nbsp;Afghanistan,&nbsp;&nbsp;Angola,&nbsp;&nbsp;Anguilla,&nbsp;&nbsp;Albania,&nbsp;&nbsp;Andorra,&nbsp;&nbsp;United Arab Emirates,&nbsp;&nbsp;Argentina,&nbsp;&nbsp;Armenia,&nbsp;&nbsp;Antigua and Barbuda,&nbsp;&nbsp;Australia,&nbsp;&nbsp;Austria,&nbsp;&nbsp;Azerbaijan,&nbsp;&nbsp;Burundi,&nbsp;&nbsp;Belgium</i></p>
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
          zoom: 5,
          center: { lat: lat, lng: long }
        });

	//var marker = new H.map.Marker({ lat: lat, lng: long });
  var ui = H.ui.UI.createDefault(map, maptypes, 'de-DE');


  // Create an info bubble object at a specific geographic location:
  var bubble = new H.ui.InfoBubble({ lng:  long, lat: lat }, {
                  content: `<div>
                                <p><b>Country:</b>${data.location}<p>
                                <p><b>Cases:</b>${data.total_cases}</p>
                                <p><b>New Cases:</b>${data.new_cases}<p>
                                <p><b>Deaths:</b>${data.total_deaths}</p>
                                <p><b>New Deaths:</b>${data.new_deaths}</p>
                            </div>`


               });

  // Add info bubble to the UI:
  ui.addBubble(bubble);




	// Add the marker to the map:
	//map.addObject(marker);



</script>
</body>
</html>
