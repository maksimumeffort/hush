const initDirectionStyle = () => {

  const style = [{
    'id': 'directions-route-line-alt',
    'type': 'line',
    'source': 'directions',
    'layout': {
      'line-cap': 'round',
      'line-join': 'round'
    },
    'paint': {
      'line-color': 'white',
      'line-width': 1
    },
    'filter': [
      'all',
      ['in', '$type', 'LineString'],
      ['in', 'route', 'alternate']
    ]
  }, {
    'id': 'directions-route-line-casing',
    'type': 'line',
    'source': 'directions',
    'layout': {
      'line-cap': 'round',
      'line-join': 'round'
    },
    'paint': {
      'line-color': 'white',
      'line-width': 1
    },
    'filter': [
      'all',
      ['in', '$type', 'LineString'],
      ['in', 'route', 'selected']
    ]
  }, {
    'id': 'directions-route-line',
    'type': 'line',
    'source': 'directions',
    'layout': {
      'line-cap': 'butt',
      'line-join': 'round'
    },
    'paint': {
      'line-color': {
        'property': 'congestion',
        'type': 'categorical',
        'default': 'red',
        'stops': [
          ['unknown', 'red'],
          ['low', 'red'],
          ['moderate', 'red'],
          ['heavy', '#e34341'],
          ['severe', 'red']
        ]
      },
      'line-width': 1
    },
    'filter': [
      'all',
      ['in', '$type', 'LineString'],
      ['in', 'route', 'selected']
    ]
  }, {
    'id': 'directions-hover-point-casing',
    'type': 'circle',
    'source': 'directions',
    'paint': {
      'circle-radius': 1,
      'circle-color': '#fff'
    },
    'filter': [
      'all',
      ['in', '$type', 'Point'],
      ['in', 'id', 'hover']
    ]
  }, {
    'id': 'directions-hover-point',
    'type': 'circle',
    'source': 'directions',
    'paint': {
      'circle-radius': 6,
      'circle-color': 'red'
    },
    'filter': [
      'all',
      ['in', '$type', 'Point'],
      ['in', 'id', 'hover']
    ]
  }, {
    'id': 'directions-waypoint-point-casing',
    'type': 'circle',
    'source': 'directions',
    'paint': {
      'circle-radius': 8,
      'circle-color': '#fff'
    },
    'filter': [
      'all',
      ['in', '$type', 'Point'],
      ['in', 'id', 'waypoint']
    ]
  }, {
    'id': 'directions-waypoint-point',
    'type': 'circle',
    'source': 'directions',
    'paint': {
      'circle-radius': 6,
      'circle-color': 'red'
    },
    'filter': [
      'all',
      ['in', '$type', 'Point'],
      ['in', 'id', 'waypoint']
    ]
  }, {
    'id': 'directions-origin-point',
    'type': 'circle',
    'source': 'directions',
    'paint': {
      'circle-radius': 18,
      'circle-color': 'red'
    },
    'filter': [
      'all',
      ['in', '$type', 'Point'],
      ['in', 'marker-symbol', 'A']
    ]
  }, {
    'id': 'directions-origin-label',
    'type': 'symbol',
    'source': 'directions',
    'layout': {
      'text-field': 'A',
      'text-font': ['Open Sans Bold', 'Arial Unicode MS Bold'],
      'text-size': 12
    },
    'paint': {
      'text-color': '#fff'
    },
    'filter': [
      'all',
      ['in', '$type', 'Point'],
      ['in', 'marker-symbol', 'A']
    ]
  }, {
    'id': 'directions-destination-point',
    'type': 'circle',
    'source': 'directions',
    'paint': {
      'circle-radius': 18,
      'circle-color': 'red'
    },
    'filter': [
      'all',
      ['in', '$type', 'Point'],
      ['in', 'marker-symbol', 'B']
    ]
  }, {
    'id': 'directions-destination-label',
    'type': 'symbol',
    'source': 'directions',
    'layout': {
      'text-field': 'B',
      'text-font': ['Open Sans Bold', 'Arial Unicode MS Bold'],
      'text-size': 12
    },
    'paint': {
      'text-color': '#fff'
    },
    'filter': [
      'all',
      ['in', '$type', 'Point'],
      ['in', 'marker-symbol', 'B']
    ]
  }];
};



export { initDirectionStyle };
