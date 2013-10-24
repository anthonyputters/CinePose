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
	var validateName = validateNameFromAddCinemaForm();
	var validateAddress = validateAddressFromAddCinemaForm();
	
	return validateName && validateAddress;
}

function validateNameFromAddCinemaForm() {
	var champ = document.getElementById("name");
	if(champ.value.length < 2) {
		champ.className = "error";
		showErrorMessage("name", "Vous devez saisir au moins 2 caractères");
      	return false;
	}
	if(champ.value.length > 20) {
		champ.className = "error";
		showErrorMessage("name", "Vous devez saisir moins de 20 caractères");
      	return false;
	}
	hideErrorMessage("name");
	return true;
}

function validateAddressFromAddCinemaForm() {
	var champ = document.getElementById("address");
	var latitude = document.getElementById("latitude");
	var longitude = document.getElementById("longitude");

	// Nous devons vérifier si Google Map à réussi à localiser l'adresse donnée par l'utilisateur
	// Pour cela, nous vérifions simplement si les champs cachés longitude et latitude ont été remplis
	if((latitude.value == "0.0") && (longitude.value == "0.0")) {
		champ.className = "error";
		showErrorMessage("address", "L'adresse que vous avez entrée n'existe pas");
      	return false;
	}
	
	hideErrorMessage("address");
	return true;
}

function validateAddAvisForm() {
	var champ = document.getElementById("addAvisForm");
	var validateChoice = validateMarkFromAddAvisForm("choice", champ.choice);
	var validateClean = validateMarkFromAddAvisForm("clean", champ.clean);
	var validateConfort = validateMarkFromAddAvisForm("confort", champ.confort);
	var validateNoise = validateMarkFromAddAvisForm("noise", champ.noise);
	var validatePrice = validateMarkFromAddAvisForm("price", champ.price);

	return validateChoice && validateClean && validateConfort && validateNoise && validatePrice;
}

function validateMarkFromAddAvisForm(name, radioGroup) {
	for(var i = 0 ; i < 5 ; i++) {
		if(radioGroup[i].checked) {
			hideErrorMessage(name);
			return true;
		}
	}
	
	showErrorMessage(name, "Vous devez entrer une note");
	return false;
}

function showErrorMessage(id, msg) {
	document.getElementById(id+"_error").style.visibility = "visible";
	document.getElementById(id+"_error").innerHTML = msg;
}

function hideErrorMessage(id) {
	document.getElementById(id+"_error").style.visibility="hidden";
}

function sendSearchFormData() {
	var searchCinemaForm = document.getElementById("searchCinemaForm");
	var name = searchCinemaForm.name.value;
	var address = searchCinemaForm.address.value;
		
	openLink("searchCinema?name="+name+"&address="+address);
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
	var contentString = '<b><a href="javascript:openLink(\'cinema?cinema_name='+name+'\')">'+name+'</a></b>'+'<p>'+description+'<br>'+'Note : '+mark+'</p>';

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

