function updateMenu(id) {
	document.getElementById("li"+id).className = 'active';
	for(var i = 1 ; i < 4 ; i++)
		document.getElementById("li"+ (id+i) % 4).className = '';
}

function openLink(givenUrl) {
	$.ajax({
		url : givenUrl,
		method: "GET",          
		success : function(response) {
			$('#corps').html(response);
		}
	});
}

function validateAddCinemaForm() {
	return true;
}

/* Fonctions relatives à la carte google map sur la page d'acceuil */
var map;

function initialize() {
	var centralLatlng = new google.maps.LatLng(48.859, 2.335);

	var mapOptions = {
			center: centralLatlng,
			zoom: 12,
			mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById("paris_map"),
			mapOptions);
}

function addMarkers(lat, lon, name, description, mark) {
	var contentString = '<b><a href="javascript:openLink(\'cinema\')">'+name+'</a></b>'+'<p>'+description+'<br>'+'Note : '+mark+'</p>';

	var infowindow = new google.maps.InfoWindow({
		content: contentString
	});

	var marker = new google.maps.Marker({
		position: new google.maps.LatLng(lat, lon),
		map: map,
		title:name
	});

	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map,marker);});
}

function initializeAddMap() {
	var centralLatlng = new google.maps.LatLng(48.859, 2.335);

	var mapOptions = {
			center: centralLatlng,
			zoom: 12,
			mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	var mapAdd = new google.maps.Map(document.getElementById("paris_map_add"),
			mapOptions);

	var input = /** @type {HTMLInputElement} */(document.getElementById('address'));
	var autocomplete = new google.maps.places.Autocomplete(input);

	autocomplete.bindTo('bounds', mapAdd);

	var infowindow = new google.maps.InfoWindow();
	var marker = new google.maps.Marker({
		map: mapAdd
	});

	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		infowindow.close();
		marker.setVisible(false);
		input.className = '';
		var place = autocomplete.getPlace();
		if (!place.geometry) {
			// Inform the user that the place was not found and return.
			input.className = 'notfound';
			return;
		}

		// If the place has a geometry, then present it on a map.
		if (place.geometry.viewport) {
			mapAdd.fitBounds(place.geometry.viewport);
		} else {
			// On affiche le point sur la carte
			mapAdd.setCenter(place.geometry.location);
			mapAdd.setZoom(17);
			
			// On place les valeurs de latitude et longitude dans 
			// deux champs invisible du formulaire pour que le 
			// controller Java les récupère
			document.getElementById("latitude").value = place.geometry.location.lat();
			document.getElementById("longitude").value = place.geometry.location.lng();
		}
		marker.setIcon(/** @type {google.maps.Icon} */({
			url: place.icon,
			size: new google.maps.Size(71, 71),
			origin: new google.maps.Point(0, 0),
			anchor: new google.maps.Point(17, 34),
			scaledSize: new google.maps.Size(35, 35)
		}));
		marker.setPosition(place.geometry.location);
		marker.setVisible(true);

		var address = '';
		if (place.address_components) {
			address = [
			           (place.address_components[0] && place.address_components[0].short_name || ''),
			           (place.address_components[1] && place.address_components[1].short_name || ''),
			           (place.address_components[2] && place.address_components[2].short_name || '')
			           ].join(' ');
		}
	});
}

