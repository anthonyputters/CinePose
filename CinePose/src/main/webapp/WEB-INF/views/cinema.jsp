<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section>
	<h1>&nbsp;&nbsp;&nbsp; ${cinema.getName()}</h1>
	<div id="map">
		<h1>Position du cinéma</h1>
		<hr>
		<div id="paris_map"></div>
		<hr>
	</div>

	<aside>
		<h1>Info du Cinema</h1>
		<b>Adresse :</b> ${cinema.getAddress()}<br> 
		<b>Nombre de Salles :</b> ${cinema.getSalleNb()}<br>
		<b>Détail des
			notes : </b><br>
		<table>
			<tr>
				<td>Choix :</td>
				<td>${cinema.getChoiceMark()}</td>
			</tr>
			<tr>
				<td>Propreté :</td>
				<td>${cinema.getCleanMark()}</td>
			</tr>
			<tr>
				<td>Confort :</td>
				<td>${cinema.getConfortMark()}</td>
			</tr>
			<tr>
				<td>Bruit :</td>
				<td>${cinema.getNoiseMark()}</td>
			</tr>
			<tr>
				<td>Prix :</td>
				<td>${cinema.getPriceMark()}</td>
			</tr>
			<tr>
				<td><b>Total :</b></td>
				<td><b>${cinema.getMark()}</b></td>
			</tr>
		</table>
	</aside>

	<div id="avis">
		<h1>Avis</h1>
		<c:if test="${not empty cinema.getAvis()}">
			<% int i = 1; %>
			<c:forEach var="avis" items="${cinema.getAvis()}">
				<div class="result">
					<b>Notes : </b><br>
					<table>
						<tr>
							<td>Choix :</td>
							<td>${avis.getChoice()}</td>
						</tr>
						<tr>
							<td>Propreté :</td>
							<td>${avis.getClean()}</td>
						</tr>
						<tr>
							<td>Confort :</td>
							<td>${avis.getConfort()}</td>
						</tr>
						<tr>
							<td>Bruit :</td>
							<td>${avis.getNoise()}</td>
						</tr>
						<tr>
							<td>Prix :</td>
							<td>${avis.getPrice()}</td>
						</tr>
						<tr>
							<td><b>Total :</b></td>
							<td><b>${avis.getMark()}</b></td>
						</tr>
					</table>
					<br> <b>Remarque : </b> ${avis.getComment()}
				</div>
			</c:forEach>
		</c:if>
	</div>
</section>

<script>
	var cinemaName = "${cinema.getName()}";
	var comment = "${cinema.getAddress()}";
	var mark = "${cinema.getMark()}";
	initialize();
	addMarkers(${cinema.getLatitude()}, ${cinema.getLongitude()}, cinemaName, comment, mark);
</script>