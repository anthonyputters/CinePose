<section>
	<div id="add_form">
		<form id="form" name="form" method="post" action="">
			<h1>Ajouter un cinéma</h1>
			<p>Ce formulaire vous permet d'ajouter un cinéma dans la base de
				donnée. Ce site se limite aux cinémas au sein même de Paris.</p>

			<table>
				<tr>
					<td><label> Nom du Cinéma<span class="small">20
								caractères maximum</span></label></td>
					<td><input type="text" name="prenom" id="prenom" /></td>
				</tr>
				<tr>
					<td><label> Adresse du Cinéma<span class="small">
								Dans Paris </span>
					</label></td>
					<td><input type="text" name="nom" id="nom" /></td>
				</tr>
				<tr>
					<td><label> Nombre de Salles <span class="small">
								Approximativement </span>
					</label></td>
					<td><select name="salle_nb">
							<option value="less_than_5">Mois de 5</option>
							<option value="between_5_and_10">Entre 5 et 10</option>
							<option value="between_10_and_20">Entre 10 et 20</option>
							<option value="more_than_20">Plus de 20</option>
					</select></td>
				</tr>
				<tr>
					<td><label> Position <span class="small">
								Positionner le cinéma<br> sur la carte </span>
					</label></td>
					<td><div id="paris_map_add"></div></td>
				</tr>
			</table>
			<button type="submit">Ajouter</button>
		</form>
	</div>
	<br>
	<br>

	<div id="add_form">
		<form id="form" name="form" method="post" action="">
			<h1>Ajouter un avis</h1>
			<p>Ce formulaire vous permet d'ajouter un avis sur un des cinémas
				dans la base de donnée. Ce site se limite aux cinémas au sein même
				de Paris.</p>

			<table>
				<tr>
					<td><label> Cinéma<span class="small">Choisir
								parmi les cinémas</span></label></td>
					<td><select name="salle_nb">
							<option value="cinema1">Cinema 1</option>
							<option value="cinema2">Cinema 2</option>
							<option value="cinema3">Cinema 3</option>
							<option value="cinema4">Cinema 4</option>
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
						<input type="radio" class="radio" name="confort" value="5"></td>
				</tr>
				<tr>
					<td><label> Choix<span class="small"> Evaluez
								le choix des films </span>
					</label></td>
					<td><input type="radio" class="radio" name="choice" value="1">
						<input type="radio" class="radio" name="choice" value="2">
						<input type="radio" class="radio" name="choice" value="3">
						<input type="radio" class="radio" name="choice" value="4">
						<input type="radio" class="radio" name="choice" value="5"></td>
				</tr>
				<tr>
					<td><label> Bruit<span class="small"> Evaluez
								le volume sonor </span>
					</label></td>
					<td><input type="radio" class="radio" name="noise" value="1">
						<input type="radio" class="radio" name="noise" value="2">
						<input type="radio" class="radio" name="noise" value="3">
						<input type="radio" class="radio" name="noise" value="4">
						<input type="radio" class="radio" name="noise" value="5"></td>
				</tr>
				<tr>
					<td><label> Propreté<span class="small"> Evaluez
								la propreté des salles </span>
					</label></td>
					<td><input type="radio" class="radio" name="clean" value="1">
						<input type="radio" class="radio" name="clean" value="2">
						<input type="radio" class="radio" name="clean" value="3">
						<input type="radio" class="radio" name="clean" value="4">
						<input type="radio" class="radio" name="clean" value="5"></td>
				</tr>
				<tr>
					<td><label> Prix<span class="small"> Evaluez
								l'abordabilité des prix </span>
					</label></td>
					<td><input type="radio" class="radio" name="noise" value="1">
						<input type="radio" class="radio" name="noise" value="2">
						<input type="radio" class="radio" name="noise" value="3">
						<input type="radio" class="radio" name="noise" value="4">
						<input type="radio" class="radio" name="noise" value="5"></td>
				</tr>
				<tr>
					<td><label> Commentaire <span class="small">
								Vous pouvez rédiger un commentaire </span>
					</label></td>
					<td><textarea rows="5" cols="22"></textarea></td>
				</tr>
			</table>
			<button type="submit">Ajouter</button>
		</form>
	</div>
</section>
<script>initializeAddMap();</script>
