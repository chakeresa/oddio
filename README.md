# Terrificus

# List of Landmarks
<% unless @landmarks.nil? %>
  <% @landmarks.each do |landmark| %>
    <ul class="landmark_results">
      <li class="landmark_name">Name: <%= landmark.name %></li>
      <li class="landmark_rating">Rating: <%= landmark.rating %></li>
      <li class="landmark_types">Type(s): <%= landmark.types %></li>
      <li class="landmark_lat">Latitute: <%= landmark.lat %></li>
      <li class="landmark_lng">Longitude: <%= landmark.lng %></li>
      <li class="landmark_place_id">Place ID: <%= landmark.place_id %></li>
    </ul>
  <% end %>
<% end %>

var greenIcon = new L.Icon({
  iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-green.png',
  shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
  iconSize: [25, 41],
  iconAnchor: [12, 41],
  popupAnchor: [1, -34],
  shadowSize: [41, 41]
});
var redIcon = new L.Icon({
  iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png',
  shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
  iconSize: [25, 41],
  iconAnchor: [12, 41],
  popupAnchor: [1, -34],
  shadowSize: [41, 41]
});

<script>
var x = document.getElementById("demo");

function getLocation() {
 if (navigator.geolocation) {
   navigator.geolocation.getCurrentPosition(showPosition);
 } else {
   x.innerHTML = "Geolocation is not supported by this browser.";
 }
}

function setMyLocation(lat, long)

function showPosition(position) {
 x.innerHTML = "Latitude: " + position.coords.latitude +
 "<br>Longitude: " + position.coords.longitude;
}
</script>



<!--to prevent error before search-->
<% if @landmarks %>

//<!--show parks on map-->
<%  @parks.each_with_index do |point, index| %>
var marker<%= index %> = L.marker([<%=point.lat%>, <%= point.long%>], {
  icon: greenIcon
}).addTo(map);
marker<%= index %>.bindPopup("<%= point.name %>" );
<% end %>

//<!--show museums on map-->
<%  @museums.each_with_index do |point, index| %>
var marker<%= index %> = L.marker([<%=point.lat%>, <%= point.long%>], {
  icon: orangeIcon
}).addTo(map);
marker<%= index %>.bindPopup("<%= point.name %>" );
<% end %>

//<!--show theaters on map-->
<%  @theaters.each_with_index do |point, index| %>
var marker<%= index %> = L.marker([<%=point.lat%>, <%= point.long%>], {
  icon: violetIcon
}).addTo(map);
marker<%= index %>.bindPopup("<%= point.name %>" );
<% end %>
<% end %>
