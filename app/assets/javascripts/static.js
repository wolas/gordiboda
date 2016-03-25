function initMap() {
  var info_content = '<h3>Gordiboda!!</h3>'


  var printoria_hq = {lat: 43.016495, lng: -4.252605};



  var map = new google.maps.Map(document.getElementById('contact-map'), {
    zoom: 18,
    center: printoria_hq,
    scrollwheel: false,
    mapTypeId: google.maps.MapTypeId.SATELLITE
  });

  var marker = new google.maps.Marker({
    position: printoria_hq,
    map: map,
    title: 'Printoria HQ',
    icon: 'assets/marker.png'
  });

  var info_window = new google.maps.InfoWindow({
    content: info_content,
    position : printoria_hq
  });

  marker.addListener('click', function() {
    info_window.open(map, marker);
  });
}