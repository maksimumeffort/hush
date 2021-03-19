// latest try
import mapboxgl from "mapbox-gl";
import MapboxDirections from "@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions";
import "@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css";
import "mapbox-gl/dist/mapbox-gl.css";
// window.mapboxgl = mapboxgl
mapboxgl.workerClass = require("worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker").default;
const flyOnMap = (map, card) => {
  const center = JSON.parse(card.dataset.center)
  // console.log(center);
  map.flyTo({
    center: [center.lng, center.lat],
    zoom: 15
  });
};
const initMapbox = () => {
  const mapElement = document.getElementById("map");
  if (mapElement) {
    // only build a map if there's a div#map to inject into
    // mapbox element
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const geoJsonFeatures = []
    // write a little function that creates an array in the format that we need with the data from the markers
    const createFeaturesForGeoJsonObject = (markers) => {
      // console.log(markers)
      markers.forEach((marker) => {
        geoJsonFeatures.push(
          {
            'type': 'Feature',
            'geometry': {
              'type': 'Point',
              'coordinates': [marker.lng, marker.lat]
            }
          }
        )
      });
    };
    console.log("markers");
    // get markers
    const markers = JSON.parse(mapElement.dataset.markers);
    createFeaturesForGeoJsonObject(markers)
      // console.log(geoJsonFeatures)
    // assign our new features array to our geojson object
    const geojson = {
      'type': 'FeatureCollection',
      'features': geoJsonFeatures
    };
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/alemaks1993/ckm7pyk1ma1ap17qs70bur639"
    });
    // can we do something like geoJSON features but for directions???
    const directions = new MapboxDirections({
      accessToken: mapElement.dataset.mapboxApiKey,
      unit: 'metric',
      profile: 'mapbox/driving',
      controls: { profileSwitcher: false, instructions: false, inputs: false },
      // this is not working, unclear how to target the paint class
      // styles: [paint:{'line-color': '#bbb'} ]
      // this was working for a second then stopped, don't want it to fly to the position on map
      // zoom: 10,
      // flyTo:false
    });
    // declaring coordinates for markers and creating div for every
    geojson.features.forEach(function (marker) {
    // create a HTML element for each feature
      const el = document.createElement('div');
      el.className = 'marker';
    // make a marker for each feature and add it to the map
      new mapboxgl.Marker(el)
      .setLngLat(marker.geometry.coordinates)
      .addTo(map);
    });
    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach((marker) => bounds.extend([marker.geometry.coordinates[0], marker.geometry.coordinates[1]]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    };
    fitMapToMarkers(map, geojson.features);
    const carousel = document.querySelector(".carousel");
    // index carousel calling flyOnMap
    if (carousel) {
      $(".carousel").on("slid.bs.carousel", function () {
        const card = document.querySelector(".carousel-item.active");
        flyOnMap(map, card);
      });
    }
    // directions conditional (only run if page = show)
    if (window.location.href.includes('tours')) {
      const start = [markers[0].lng, markers[0].lat];
      // console.log(markers)
      const end = [
        markers[markers.length - 1].lng,
        markers[markers.length - 1].lat,
      ];
      const middle = markers.slice(1, -1);
      middle.forEach((m, i) => directions.addWaypoint(i, [m.lng, m.lat]));
      directions.setOrigin(start);
      directions.setDestination(end);
      // (important) This seems to be a requirement for getting directions to work
      map.addControl(directions);
      // (important)
      directions.on("route", function (e) {
        console.log(e.route);
        // directions.setOrigin(start);
        // directions.setDestination(end);
             // Logs the current route shown in the interface.
        });
    };
  // this is where the code from the next step will go
  };
};
export { initMapbox };
