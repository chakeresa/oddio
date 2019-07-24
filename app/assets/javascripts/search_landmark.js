function searchLandmark(){
  let input = document.getElementById('searchTerm').value
  fetch(`api/v1/landmarks/${input}`)
  .then(function(response) {
    return response.json();
  })
  .then(function(myJson) {
    if (myJson['data']===null){
      window.alert('Please try a different search')
    } else{
    map.flyTo([parseFloat(myJson['data']['attributes']['lat']),parseFloat(myJson['data']['attributes']['long'])], 18)
  }
  })
};
