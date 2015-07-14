var map;
var service;
var infowindow;

function getApiDetails(placeId) {
  var html = '';
  var makers = new google.maps.LatLng(51.5173990,-0.0735900);
  map = new google.maps.Map(document.getElementById('map'), {
     center: makers,
     zoom: 15
   });
  var request = {
    placeId: placeId
  };

  service = new google.maps.places.PlacesService(map);
  service.getDetails(request, function(results, status) {
    console.log(results);
    html += '<div id="location">';
    html += "<div id='placeName'>" + results.name + "</div>";
    if(results.photos) {
    photoUrl = results.photos[0].getUrl({maxWidth:1000, maxHeight: 1000});
    html += "<div id='photo'><img src='" + photoUrl + "' width = '200px' height = '200px'></div>";
    }
  else {
    html += "<div id='photo'><img src='/no-photo.jpg' width = '200px' height = '200px'></div>";
  }
    html += "<div id=writing>"
                               + results.address_components[0].short_name +
                           " " + results.address_components[1].short_name +
                           " " + results.address_components[2].short_name + "</br>"
                            if (results.address_components[6]) { + results.address_components[6].short_name } + "</div>";
    html += "<div>" + results.formatted_phone_number + "</div>";
    html += "<div> Is it open right now? "
    if (results.opening_hours.open_now === true) {
      html += " Yes! </div>"
    }
    else {
      html += " No! </div>"
    }
    html += "</div>"
    $('#boxed').append(html);
  });
}
google.maps.event.addDomListener(window, 'load', getApiDetails);
