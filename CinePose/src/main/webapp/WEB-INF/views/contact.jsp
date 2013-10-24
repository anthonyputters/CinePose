<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section>
	<h1>&nbsp;&nbsp;&nbsp; Contactez-nous</h1>
	<div class="contact">
		<form method="POST" action="">
			<label for="sexe"><input type="radio" name="sexe" />Mlle<input
				type="radio" name="sexe" />Mme <input type="radio" name="sexe" />M<br />
				<label for="name">Nom*<input type="lastname" id="name" /></label><br />
				<label for="firstname">Prenom*<input type="firstname"
					id="firstname" /></label><br /> <label for="mail">email*<input
					type="email" id="mail" /></label><br /> <label for="msg">Message<textarea
						id="msg"></textarea></label><br /> <input type="submit" id="submit"
				value="Send">
		</form>
	</div>
	* Champs obligatoires
</section>

