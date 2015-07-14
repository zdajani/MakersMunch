var placeSearch, autocomplete;
var componentForm = {
  place_id: 'place_id'
};

function initialize() {
  var mapOptions = {
  center: new google.maps.LatLng(51.517307, -0.07340299999998479),
  zoom: 13
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  var input = document.getElementById('address');

  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);

  var infowindow = new google.maps.InfoWindow();
  var marker = new google.maps.Marker({
  map: map,
  anchorPoint: new google.maps.Point(0, -29)
  });

  google.maps.event.addListener(autocomplete, 'place_changed', function() {

    infowindow.close();
    marker.setVisible(false);

    var place = autocomplete.getPlace();

    // if (!place.geometry) {
    // window.alert("Autocomplete's returned place contains no geometry");
    // return;
    // }

    if (place.geometry.viewport) {
    map.fitBounds(place.geometry.viewport);
    } else {
    map.setCenter(place.geometry.location);
    map.setZoom(17);
    }

    marker.setIcon({
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(35, 35)
    });

    marker.setPosition(place.geometry.location);
    marker.setVisible(true);

    var address = '';

    if (place.address_components) {
      address = [
    (place.address_components[0] && place.address_components[0].short_name || ''),
    (place.address_components[1] && place.address_components[1].short_name || ''),
    (place.address_components[2] && place.address_components[2].short_name || '')
    ].join(' ');
    }

    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    infowindow.open(map, marker);

    fillInAddress();
  });

  function fillInAddress() {
    var place = autocomplete.getPlace();
    for (var component in componentForm) {
      document.getElementById(component).value = '';
      document.getElementById(component).disabled = false;
    }

    var val = componentForm.place_id = place.place_id;
    document.getElementById('place_id').value = val;
  }

  function preventEnterSubmit(e) {
     if (e.which == 13) {
         var $targ = $(e.target);

         if (!$targ.is("textarea") && !$targ.is(":button,:submit")) {
             var focusNext = false;
             $(this).find(":input:visible:not([disabled],[readonly]), a").each(function(){
                 if (this === e.target) {
                     focusNext = true;
                 }
                 else if (focusNext){
                     $(this).focus();
                     return false;
                 }
             });

             return false;
         }
     }
  }
}



google.maps.event.addDomListener(window, 'load', initialize);
