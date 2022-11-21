$(function () {
    let map_div = document.getElementById("map");
    let init_coords = {lat: 39.8097343, lng: -98.5556199};
    initMap(init_coords, map_div);
    let map_info = map_div.dataset;
    for (let building_id of Object.keys(map_info)) {
        let data = JSON.parse(map_info[building_id]);
        let marker = markAddress(data.coordinates);
        buildingInfoWindow(marker, data.info);
    }
});
function initMap(coords, map_div) {
    let mapOptions = {
        styles: [
            {
              "elementType": "geometry",
              "stylers": [
                {
                  "color": "#f5f5f5"
                }
              ]
            },
            {
              "elementType": "labels.icon",
              "stylers": [
                {
                  "color": "#f5f5f5"
                }
              ]
            },
            {
              "elementType": "labels.text.fill",
              "stylers": [
                {
                  "color": "#616161"
                }
              ]
            },
            {
              "elementType": "labels.text.stroke",
              "stylers": [
                {
                  "color": "#f5f5f5"
                }
              ]
            },
            {
              "featureType": "administrative.country",
              "elementType": "geometry.stroke",
              "stylers": [
                {
                  "color": "#00338D"
                },
                {
                  "visibility": "on"
                },
                {
                  "weight": 2
                }
              ]
            },
            {
              "featureType": "administrative.land_parcel",
              "elementType": "labels.text.fill",
              "stylers": [
                {
                 "color": "#bdbdbd"
                }
              ]
            },
            {
              "featureType": "poi",
              "elementType": "labels",
              "stylers": [
                {
                  "visibility": "off"
                }
              ]
            },
            {
              "featureType": "road",
              "elementType": "geometry",
              "stylers": [
                {
                  "color": "#ffffff"
                }
              ]
            },
            {
              "featureType": "road.arterial",
              "elementType": "labels.text.fill",
              "stylers": [
                {
                  "color": "#757575"
                }
              ]
            },
            {
              "featureType": "road.highway",
              "elementType": "geometry",
              "stylers": [
                {
                  "color": "#dadada"
                }
              ]
            },
            {
              "featureType": "road.highway",
              "elementType": "labels.text.fill",
              "stylers": [
                {
                  "color": "#616161"
                }
              ]
            },
            {
              "featureType": "road.local",
              "elementType": "labels.text.fill",
              "stylers": [
                {
                  "color": "#9e9e9e"
                }
              ]
            },
            {
              "featureType": "water",
              "elementType": "geometry.fill",
              "stylers": [
                {
                  "color": "#bbdefb"
                }
              ]
            },
            {
              "featureType": "water",
              "elementType": "labels.text.fill",
              "stylers": [
                {
                  "color": "#9e9e9e"
                }
              ]
            }
          ],
          zoom: 5,
          minZoom: 1,
          maxZoom: 17,
          zoomControl: true,
          zoomControlOptions: {
            style: google.maps.ZoomControlStyle.DEFAULT
          },
        center: coords,
        zoom: 5,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scrollwheel: true,
        panControl: false,
        mapTypeControl: false,
        scaleControl: false,
        streetViewControl: false,
        overviewMapControl: false,
        rotateControl: false
    };
    map = new google.maps.Map(
        map_div,
        mapOptions
    );
}
function markAddress(coords) {
    let marker = new google.maps.Marker({
        position: coords,
        map: map,
    });
    return marker;
}
function buildingInfoWindow(marker, contentString) {
    let infoWindow = new google.maps.InfoWindow({
        content: contentString,
    });
    google.maps.event.addListener(marker, "mouseover", function () {
        infoWindow.open(map, marker);
    });
    google.maps.event.addListener(marker, "mouseout", function () {
        infoWindow.close(map, marker);
    });
}
