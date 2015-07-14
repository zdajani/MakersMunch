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
    html += '<div id="location">';
    html += "<div id='placeName'>" + results.name + "</div>";
    if(results.photos[0]) {
    photoUrl = results.photos[0].getUrl({maxWidth:1000, maxHeight: 1000});
    html += "<div id='photo'><img src='" + photoUrl + "' width = '200px' height = '200px'></div>";
  }
    html += "<div id=writing>" + results.adr_address + "</div>";
    html += "<div>" + results.formatted_phone_number + "</div>";
    html += "<div> Is it open right now? "
    if (results.opening_hours.open_now == true) {
      html += " Yes! </div>"
    }
    else {
      html += " No! </div>"
    }
    html += "</div>"
    $('#boxed').append(html);
  });
};
