var map = L.map('mapid').on('load', onMapLoad).setView([41.400, 2.206], 9);
//map.locate({setView: true, maxZoom: 17});

var tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);
var urlMap = "http://localhost/mapa/api/apiRestaurants.php";

//en el clusters almaceno todos los markers
var markers = L.markerClusterGroup();
var data_markers;
var kind_food = [];
var kind_food_elements = [];
var kind_food_Unic = [];
var markers;
var UnicCategories;

function onMapLoad() {

	$(document).ready(function () {

		$.ajax({
			type: 'post',
			url: urlMap,
			dataType: 'json',
			success: function (data) {
				data_markers = data;
				render_to_map(data_markers, 'Todos');
				console.log(data);
				$.each(data, function (index, item) {
			
                kind_food_elements = item.kind_food.split(",");
				for(j = 0; j < kind_food_elements.length; j++){

					kind_food.push(kind_food_elements[j]);
				}
				
					
					for (var i = 0; i < kind_food.length; i++) {

						const elemento = kind_food[i];

						if (!kind_food_Unic.includes(kind_food[i])) {
							kind_food_Unic.push(elemento);
						}
					}


				});
				$("#kind_food_selector").append(new Option("Todos"));
				for (var a = 0; a < kind_food_Unic.length; a++) {
					$("#kind_food_selector").append(new Option(kind_food_Unic[a]));

				}




			},
			error: function (xhr, status, error) {
				console.log(xhr);
				console.log(status);
				console.log(error);
			}
		});







	});

	/*
	FASE 3.1
		1) Relleno el data_markers con una petición a la api
		2) Añado de forma dinámica en el select los posibles tipos de restaurantes
		3) Llamo a la función para --> render_to_map(data_markers, 'all'); <-- para mostrar restaurantes en el mapa
	*/

}

$('#kind_food_selector').on('change', function () {
	console.log(this.value);
	render_to_map(data_markers, this.value);
});

	/*
	FASE 3.2
		1) Limpio todos los marcadores
		2) Realizo un bucle para decidir que marcadores cumplen el filtro, y los agregamos al mapa
*/


function render_to_map(data_markers, filter) {


markers.clearLayers();

	$.each(data_markers, function (index_o) {



			
		if (filter == 'Todos' || data_markers[index_o].kind_food.split(",").includes(filter)) {

			var marker = L.marker([data_markers[index_o].lat, data_markers[index_o].lng]).bindPopup(`"<b><u>${data_markers[index_o].name}</u> </b>${data_markers[index_o].address}"<img src="${data_markers[index_o].photo}">`);
			
			markers.addLayer(marker);
			
			
		}
		
	});

	   //agrega el MarkerClusterGroup al mapa
	   map.addLayer(markers);

}




map.locate({setView: true, maxZoom: 16});

function onLocationFound(e) {
 var radius = e.accuracy / 2;

L.marker(e.latlng).addTo(map)
 .bindPopup("Tu estas aqui, con " + radius + " metros de aproximacion").openPopup();

L.circle(e.latlng, radius).addTo(map);
 }
 function onLocationError(e) {
 alert(e.message);
}
 map.on('locationfound', onLocationFound);
 map.on('locationerror', onLocationError);
