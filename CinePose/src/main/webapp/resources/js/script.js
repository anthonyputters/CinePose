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

	addMarkers(48.859, 2.335, "Cin&eacute;ma", "Cin&eacutema description", "4.0");
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

