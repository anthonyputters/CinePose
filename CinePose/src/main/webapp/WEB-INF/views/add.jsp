<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section>
	<div id="add_form">
		<form id="addCinemaForm" name="addCinemaForm" method="post" action="addCinema"
			onsubmit="return validateAddCinemaForm()">
			<h1>Ajouter un cinéma</h1>
			<p>Ce formulaire vous permet d'ajouter un cinéma dans la base de
				donnée. Ce site se limite aux cinémas au sein même de Paris.</p>

			<table>
				<tr>
					<td><label> Nom du Cinéma<span class="small">20
								caractères maximum</span></label></td>
					<td><input type="text" name="name" id="name" /><br> 
					<div id="name_error" class="error_div"></div></td>
				</tr>
				<tr>
					<td><label> Nombre de Salles <span class="small">
								Approximativement </span>
					</label></td>
					<td><select name="salleNb">
							<option value="Moins de 5">Moins de 5</option>
							<option value="Entre 5 et 10">Entre 5 et 10</option>
							<option value="Entre 10 et 20">Entre 10 et 20</option>
							<option value="Plus de 20">Plus de 20</option>
					</select></td>
				</tr>
				<tr>
					<td><label> Adresse du Cinéma<span class="small">
								Dans Paris </span>
					</label></td>
					<td><input type="text" name="address" id="address" /><br> 
					<div id="address_error" class="error_div"></div>
					<!-- Input invisible pour passer la longitude et la latitude du cinéma
					au controller Java. Les valeur sont définies à l'exécution du code Javascript -->
						<input type="hidden" name="latitude" id="latitude" value="0.0" />
						<input type="hidden" name="longitude" id="longitude" value="0.0" /></td>
				</tr>
				<tr>
					<td><label> Position <span class="small">
								Position du cinéma<br> sur la carte
						</span>
					</label></td>
					<td><div id="paris_map_add"></div></td>
				</tr>
			</table>
			<button type="submit">Ajouter</button>
		</form>
	</div>
	<br> <br>

	<div id="add_form">
		<form id="addAvisForm" name="addAvisForm" method="post" action="addAvis"
			onsubmit="return validateAddAvisForm()">
			<h1>Ajouter un avis</h1>
			<p>Ce formulaire vous permet d'ajouter un avis sur un des cinémas
				dans la base de donnée. Ce site se limite aux cinémas au sein même
				de Paris.</p>

			<table>
				<tr>
					<td><label> Cinéma<span class="small">Choisir
								parmi les cinémas</span></label></td>
					<td><select name="cinema_name">
							<c:if test="${not empty cinemas}">
								<c:forEach var="cinema" items="${cinemas}">
									<option value="${cinema.getName()}">${cinema.getName()} - ${cinema.getAddress()}</option>
								</c:forEach>
							</c:if>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<td><span style="color: white;">&nbsp;&nbsp; 1
							&nbsp;&nbsp;&nbsp;&nbsp; 2 &nbsp;&nbsp;&nbsp;&nbsp; 3
							&nbsp;&nbsp;&nbsp;&nbsp; 4 &nbsp;&nbsp;&nbsp;&nbsp; 5</span>
					<td>
				</tr>
				<tr>
					<td><label> Confort<span class="small"> Evaluez
								le confort du cinéma </span>
					</label></td>
					<td><input type="radio" class="radio" name="confort" value="1">
						<input type="radio" class="radio" name="confort" value="2">
						<input type="radio" class="radio" name="confort" value="3">
						<input type="radio" class="radio" name="confort" value="4">
						<input type="radio" class="radio" name="confort" value="5"><br> 
						<div id="confort_error" class="error_div"></div></td>
				</tr>
				<tr>
					<td><label> Choix<span class="small"> Evaluez
								le choix des films </span>
					</label></td>
					<td><input type="radio" class="radio" name="choice" value="1">
						<input type="radio" class="radio" name="choice" value="2">
						<input type="radio" class="radio" name="choice" value="3">
						<input type="radio" class="radio" name="choice" value="4">
						<input type="radio" class="radio" name="choice" value="5"><br> 
						<div id="choice_error" class="error_div"></div></td>
				</tr>
				<tr>
					<td><label> Bruit<span class="small"> Evaluez
								le volume sonor </span>
					</label></td>
					<td><input type="radio" class="radio" name="noise" value="1">
						<input type="radio" class="radio" name="noise" value="2">
						<input type="radio" class="radio" name="noise" value="3">
						<input type="radio" class="radio" name="noise" value="4">
						<input type="radio" class="radio" name="noise" value="5"><br> 
						<div id="noise_error" class="error_div"></div></td>
				</tr>
				<tr>
					<td><label> Propreté<span class="small">
								Evaluez la propreté des salles </span>
					</label></td>
					<td><input type="radio" class="radio" name="clean" value="1">
						<input type="radio" class="radio" name="clean" value="2">
						<input type="radio" class="radio" name="clean" value="3">
						<input type="radio" class="radio" name="clean" value="4">
						<input type="radio" class="radio" name="clean" value="5"><br> 
						<div id="clean_error" class="error_div"></div></td>
				</tr>
				<tr>
					<td><label> Prix<span class="small"> Evaluez
								l'abordabilité des prix </span>
					</label></td>
					<td><input type="radio" class="radio" name="price" value="1">
						<input type="radio" class="radio" name="price" value="2">
						<input type="radio" class="radio" name="price" value="3">
						<input type="radio" class="radio" name="price" value="4">
						<input type="radio" class="radio" name="price" value="5"><br> 
						<div id="price_error" class="error_div"></div></td>
				</tr>
				<tr>
					<td><label> Commentaire <span class="small">
								Vous pouvez rédiger un commentaire </span>
					</label></td>
					<td><textarea name="comment" rows="5" cols="22"></textarea></td>
				</tr>
			</table>
			<button type="submit">Ajouter</button>
		</form>
	</div>
</section>

<!--  Nous chargeons la carte à la fin pour ne pas ralentir l'affichage de la page  -->
<script>initializeAddMap();</script>
