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
		<div id="notes">
			<table>
				<tr>
					<td>Choix :</td>
					<td>${cinema.getChoiceMark()}</td>
					<td><span class="eval_bar_cinema"><span class="eval_bar_inner" style="width:${cinema.getChoiceMark()*20.0}%;"> </span></span></td>
				</tr>
				<tr>
					<td>Propreté :</td>
					<td>${cinema.getCleanMark()}</td>
					<td><span class="eval_bar_cinema"><span class="eval_bar_inner" style="width:${cinema.getCleanMark()*20.0}%;"> </span></span></td>
				</tr>
				<tr>
					<td>Confort :</td>
					<td>${cinema.getConfortMark()}</td>
					<td><span class="eval_bar_cinema"><span class="eval_bar_inner" style="width:${cinema.getConfortMark()*20.0}%;"> </span></span></td>
				</tr>
				<tr>
					<td>Bruit :</td>
					<td>${cinema.getNoiseMark()}</td>
					<td><span class="eval_bar_cinema"><span class="eval_bar_inner" style="width:${cinema.getNoiseMark()*20.0}%;"> </span></span></td>
				</tr>
				<tr>
					<td>Prix :</td>
					<td>${cinema.getPriceMark()}</td>
					<td><span class="eval_bar_cinema"><span class="eval_bar_inner" style="width:${cinema.getPriceMark()*20.0}%;"> </span></span></td>
				</tr>
			</table>
		</div>
		<div id="average">
			Total :<br><b>${cinema.getMark()}</b>/5
		</div>

	</aside>

	<div id="avis">
		<h1>Avis</h1>
		<c:if test="${not empty cinema.getAvis()}">
			<% int i = 1; %>
			<c:forEach var="avis" items="${cinema.getAvis()}">
				<div class="result">
					<div id="notes">
						<b>Notes : </b><br>
			
						<table>
							<tr>
								<td>Choix :</td>
								<td>${avis.getChoice()}</td>
								<td><span class="eval_bar"><span class="eval_bar_inner" style="width:${cinema.getChoiceMark()*20.0}%;"> </span></span></td>
							</tr>
							<tr>
								<td>Propreté :</td>
								<td>${avis.getClean()}</td>
								<td><span class="eval_bar"><span class="eval_bar_inner" style="width:${cinema.getCleanMark()*20.0}%;"> </span></span></td>
							</tr>
							<tr>
								<td>Confort :</td>
								<td>${avis.getConfort()}</td>
								<td><span class="eval_bar"><span class="eval_bar_inner" style="width:${cinema.getConfortMark()*20.0}%;"> </span></span></td>
							</tr>
							<tr>
								<td>Bruit :</td>
								<td>${avis.getNoise()}</td>
								<td><span class="eval_bar"><span class="eval_bar_inner" style="width:${cinema.getNoiseMark()*20.0}%;"> </span></span></td>
							</tr>
							<tr>
								<td>Prix :</td>
								<td>${avis.getPrice()}</td>
								<td><span class="eval_bar"><span class="eval_bar_inner" style="width:${cinema.getPriceMark()*20.0}%;"> </span></span></td>
							</tr>
						</table>
					</div>
					<div id="average">
						Total :<br><b>${avis.getMark()}</b>/5
					</div>
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