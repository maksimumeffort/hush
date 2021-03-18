import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

mapboxgl.workerClass = require('worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker').default;

const flyOnMap = (map, card) => {
  const center = JSON.parse(card.dataset.center)
  console.log(center);
  map.flyTo({
    center: [center.lng, center.lat],
    zoom: 15
  });
}

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
    });

    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    };

    fitMapToMarkers(map, markers);

    const carousel = document.querySelector(".carousel")
    if (carousel) {
      $('.carousel').on('slid.bs.carousel', function () {
        const card = document.querySelector(".carousel-item.active")
        flyOnMap(map, card)
      })
    }

    const steps = document.querySelectorAll(".step-button");
    steps.forEach((item) => {
      item.addEventListener("click", (e) => {
        flyOnMap(map, e.target)
        })
    });

    const start = document.querySelector("#button")
    const step1 = document.querySelector(".neutral")
    start.addEventListener("click", (e) => {
      flyOnMap(map, step1)
      const steps = document.querySelectorAll("[id^='Step']");

      steps.forEach((item) => {
          item.style.display = "none";
      });
      var x = document.querySelector(".step-card")
      x.style.display = "block";    
    })
  }
};

export { initMapbox };


// import mapboxgl from 'mapbox-gl';
// import 'mapbox-gl/dist/mapbox-gl.css';

// const initMapbox = () => {
//   const mapElement = document.getElementById('map');

//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v11'
//     });
//     const markers = JSON.parse(mapElement.dataset.markers);
//     console.log(markers)
//     markers.forEach((marker) => {
//         new mapboxgl.Marker()
//         .setLngLat([ marker.lng, marker.lat ])
//         .addTo(map);
//     });
//     const fitMapToMarkers = (map, markers) => {
//     const bounds = new mapboxgl.LngLatBounds();
//     markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//     map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
//     };

//     if (mapElement) {
//       fitMapToMarkers(map, markers);

//     }
//   }
//   window.addEventListener('DOMContentLoaded', () => {
//     window.map.resize()
//   } )
// };


// export { initMapbox };
