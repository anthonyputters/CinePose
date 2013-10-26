<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section>
	<div class="add_form">
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

					<div id="cineAddress">
						<table>
							<tbody>
								<tr>
									<td>&nbsp;<b>Adresse</b></td>
									<td><i>128 Avenue de France, Paris, France</i></td>
								</tr>									
							</tbody>
						</table>
					</div>
					<div id="notes">
						<b>Notes : </b>
							<table>
							<tr>
								<td>Choix :</td>
								<td>${cinema.getChoiceMark()}</td>
								<td><span class="eval_bar"><span class="eval_bar_inner" style="width:${cinema.getChoiceMark()*20.0}%;"> </span></span></td>
							</tr>
							<tr>
								<td>Propreté :</td>
								<td>${cinema.getCleanMark()}</td>
								<td><span class="eval_bar"><span class="eval_bar_inner" style="width:${cinema.getCleanMark()*20.0}%;"> </span></span></td>
							</tr>
							<tr>
								<td>Confort :</td>
								<td>${cinema.getConfortMark()}</td>
								<td><span class="eval_bar"><span class="eval_bar_inner" style="width:${cinema.getConfortMark()*20.0}%;"> </span></span></td>
							</tr>
							<tr>
								<td>Bruit :</td>
								<td>${cinema.getNoiseMark()}</td>
								<td><span class="eval_bar"><span class="eval_bar_inner" style="width:${cinema.getNoiseMark()*20.0}%;"> </span></span></td>
							</tr>
							<tr>
								<td>Prix :</td>
								<td>${cinema.getPriceMark()}</td>
								<td><span class="eval_bar"><span class="eval_bar_inner" style="width:${cinema.getPriceMark()*20.0}%;"> </span></span></td>
							</tr>
						</table>
					</div>
					<div id="average">
							Total :<br><b>${cinema.getMark()}</b>/5
					</div>
					<p><b>Dernier Avis : </b> ${cinema.getLastComment()}</p>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty cinemas}">
			<div class="result">Aucun résultats trouvés pour ces critères</div>
		</c:if>
	</div>
</section>

