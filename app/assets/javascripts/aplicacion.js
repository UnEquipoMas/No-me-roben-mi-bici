function openNav() {
    document.getElementById("mySidenav").style.width = "450px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

  
function dir (latlng){
    var geocoder = new google.maps.Geocoder();
    var infowindow = new google.maps.InfoWindow;
    geocoder.geocode({'location': latlng}, function(results, status) {
      if (status === 'OK') {
        if (results[1]) {
          handler.getMap().setZoom(11);
          var marker = new google.maps.Marker({
            icon: 'info-i_maps.png',
            position: latlng,
            map: handler.getMap()
          });
          document.getElementById("report_site_name").value = results[1].formatted_address;
          infowindow.setContent(results[1].formatted_address);
          infowindow.open(map, marker);
        } else {
          window.alert('No results found');
        }
      } else {
        window.alert('Geocoder failed due to: ' + status);
      }
    });

  }
  
  function placeMarker(location) {
    var marker = new google.maps.Marker({
        position: location, 
        map: handler.getMap(),
        draggable: true
    });
    document.getElementById('report_site_lat').value = location;
    var aux = document.getElementById('report_site_lat').value.substr(1,document.getElementById('report_site_lat').value.length - 2).split(",")
    document.getElementById("report_site_lat").value = aux[0]
    document.getElementById("report_site_long").value = aux[1]
    //document.getElementById("site_latitude").value = aux[0]
    //document.getElementById("site_longitude").value = aux[1]

    google.maps.event.addListener(marker, 'click', function(event) {
      marker.setMap(null);
      markers = [];
    });
    markers.push(marker);
  }
 
  