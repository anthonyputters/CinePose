<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section>
	<div class="add_form">
		<!--*même div que pour les autres*-->
		<h1>Contactez-nous</h1>
		<p>Contactez nous pour d'éventuelles questions</p>
		<form method="POST" action="mailto:anthony.putters@gmail.com">
			<table style="width:400px">
				<tr>
					<td><input type="radio" class="radio" name="sexe" value="Mlle" />Mlle</td>
					<td><input type="radio" class="radio" name="sexe" value="Mme" />Mme</td>
					<td><input type="radio" class="radio" name="sexe" value="M" />M</td>
				</tr>
			</table>
			<table>
				<tbody>
					<tr>
						<td><label for="name">Nom<span class="small">20
									caractères maximum</span></label></td>
						<td><input type="name" id="name" size="32" maxlength="20"
							autofocus required /></td>
						<br>
						<div id="name_error" class="error_div"></div>
					</tr>
					<tr>
						<td><label for="firstname">Prenom<span class="small">20
									caractères maximum</span></label></td>
						<td><input type="firstname" id="name" size="32"
							maxlength="20" required /></td>
						<br>
						<div id="name_error" class="error_div"></div>
					</tr>
					<tr>
						<td><label for="mail">email</label></td>
						<td><input type="email" id="mail" size="32" required /></td>
					</tr>
					<tr>
						<td><label for="msg">Message</label></td>
						<td><textarea id="msg"></textarea></td>
					</tr>
				</tbody>
			</table>
			<button type="submit">Envoyer</button>
		</form>
	</div>

</section>

