<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section>
	<div id="map">
		<h1>Carte</h1>
		<h2>
			<a href="javascript:openLink('add')">Ajouter un cinéma</a>
		</h2>
		<hr>
		<div id="paris_map"></div>
		<hr>
	</div>

	<aside>
		<h1>Classement</h1>
		<!--  Initialisation de la carte  -->
		<script>initialize();</script>

		<div id="target" class="mousescroll">		
		<c:if test="${not empty cinemas}">
				<% int i = 1; %>
				<c:forEach var="cinema" items="${rating}">
					<p>
						<b><% out.print(i); %>. ${cinema.getName()}</b><br>
						Adresse : <i>${cinema.getAddress()}</i><br>
						Note : ${cinema.getMark()}<br>			
						Avis : ${cinema.getLastComment()}<br>
					</p>
					<script>
						var cinemaName = "${cinema.getName()}";
						var comment = "${cinema.getAddress()}";
						var mark = "${cinema.getMark()}";
						addMarkers(${cinema.getLatitude()}, ${cinema.getLongitude()}, cinemaName, comment, mark);
					</script>
	
					<% i++; %>
				</c:forEach>
			</c:if>
		</div>
		<div id="log"></div>
	</aside>
</section>

