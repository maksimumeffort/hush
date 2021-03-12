//Guido_js

import mapboxgl from "mapbox-gl";
import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions';
import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css';
import "mapbox-gl/dist/mapbox-gl.css";
mapboxgl.workerClass = require("worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker").default;
const flyOnMap = (map, card) => {
  const center = JSON.parse(card.dataset.center);
  map.flyTo({
    center: [center.lng, center.lat],
    zoom: 15,
  });
};
const initMapbox = () => {
  const mapElement = document.getElementById("map");
  if (mapElement) {
    // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/streets-v10",
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker().setLngLat([marker.lng, marker.lat]).addTo(map);
    });
    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    };
    fitMapToMarkers(map, markers);
    const carousel = document.querySelector(".carousel");
    if (carousel) {
      $(".carousel").on("slid.bs.carousel", function () {
        const card = document.querySelector(".carousel-item.active");
        flyOnMap(map, card);
      });
      const start = [markers[0].lng, markers[0].lat];
      console.log(markers)
      const end = [
        markers[markers.length - 1].lng,
        markers[markers.length - 1].lat,
      ];
      const middle = markers.slice(1, -1);
      var directions = new MapboxDirections({
        accessToken: mapElement.dataset.mapboxApiKey,
        unit: "metric",
        profile: "driving",
        interactive: false,
        // container: "directions", // Specify an element thats not the map container.
      });
      map.addControl(directions);
      directions.setOrigin(start);
      middle.forEach((m, i) => directions.addWaypoint(i, [m.lng, m.lat]));
      directions.setDestination(end);
      directions.on("route", function (e) {
        console.log(e.route); // Logs the current route shown in the interface.
      });
    }
  }
};
export { initMapbox };
