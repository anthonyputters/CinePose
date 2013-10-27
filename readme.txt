======= Le Projet CinePose =======

CinePose est une application web destinée à classer 
les cinémas parisiens et rescencer des avis des uti-
lisateurs. Elle fonctionne de manière collaborative, 
chaque utilisateurs peut ajouter des cinémas à la 
base de donnée et laisser des avis.

Choix techniques : Cette application Web, développée 
en Java, emploie le Framwork Spring MVC et est confi-
guré en tant que projet maven. C'est maven qui permet 
de produire le .war (Web Archive) et qui le deploie 
sur TomCat. Les données du site sont stockées dans 
deux fichier csv. Les entrées utilisateurs y sont 
automatiquement ajoutés. Les pages web sont au format 
.jsp. Elles se trouvent dans le repertoire : 
src/main/webapp/WEB-INF/views/ 
Les fichiers contenant le css se trouvent dans le 
repertoire : src/main/webapp/resources/css/ 
Les fichiers contenant le javascript se trouvent dans 
le repertoire : str/main/webapp/resources/js/

Fonctionnalités :
- Affichage d'un classement des cinémas les mieux notés.
- Affichage de leur position sur une carte de Paris.
- Recherche des positions correspondant aux adresses avec
Google Map
- Ajout de Cinéma dans la base de données.
- Ajout d'avis dans la base de données.
- Visualisation des informations relatives à un cinéma.
- Visualisation des avis utilisateurs.


Ce projet à été développer dans le cadre d'un cours de 
Web Programming en 5ème année de l'école d'ingénieur 
ESIEA dispensé par Benoit Larroque.

Groupe de développement :
- Lydia LENG (leng@et.esiea.fr)
- Anthony PUTTERS (anthony.putters@gmail.com)