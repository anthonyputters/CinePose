<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section>
	<div id="add_form">
		<form id="searchCinemaForm" name="searchCinemaForm" method="post" action="javascript:sendSearchFormData()">
			<h1>Rechercher un Cinéma</h1>
			<p>Cette page vous permet de rechercher un cinéma par nom et/ou
				par adresse.</p>

			<table>
				<tr>
					<td><label> Nom du Cinéma<span class="small">que
								vous recherchez</span></label></td>
					<td><input type="text" name="name" id="name" value="${name}"/></td>
				</tr>
				<tr>
					<td><label> Adresse du Cinéma<span class="small">que
								vous recherchez</span></label></td>
					<td><input type="text" name="address" id="address" value="${address}"/></td>
				</tr>
			</table>
			<button type="submit">Rechercher</button>
		</form>
	</div>

	<div id="search_result">
		<h1>Résultats de la recherche</h1>
		<c:if test="${not empty cinemas}">
			<% int i = 1; %>
			<c:forEach var="cinema" items="${cinemas}">
				<div class="result">
					<h3><a href="javascript:openLink('cinema?cinema_name=${cinema.getName()}')">${cinema.getName()}</a></h3>
					<b>Notes : </b>
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
					<b>Dernier Avis : </b> ${cinema.getLastComment()}
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty cinemas}">
			<div class="result">Aucun résultats trouvés pour ces critères</div>
		</c:if>
	</div>
</section>

