<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<%
	String lang = "fra";
	session.setAttribute("lang",lang);
%>
	<!--  FRENCH FRANCAIS -->
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/Room8Try1/pages/stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>
</head>
<body>
<div id="locale">
		<a class="localeItem" href="/Room8Try1/pages/eng/user/aboutUs.jsp"> <img
			src="/Room8Try1/images/english.png" height="20px" alt="English"
			title="English" />
		</a>| <a class="localeItem" href="/Room8Try1/pages/fra/user/aboutUs.jsp"> <img
			src="/Room8Try1/images/french.png" height="20px"
			alt="Fran&ccedil;ais" title="Fran&ccedil;ais" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/esp/user/aboutUs.jsp"> <img
			src="/Room8Try1/images/mexican.png" height="20px"
			alt="Espa&ntilde;ol" title="Espa&ntilde;ol" />
		</a>| <a class="LocaleItem" href="/Room8Try1/pages/afr/user/aboutUs.jsp"> <img
			src="/Room8Try1/images/afrikaans.png" height="20px" alt="Afrikaans"
			title="Afrikaans" />
		</a>
	</div>
	<div id="header">
		<img src="/Room8Try1/images/toplogoRev1PNG.png" id="toplog" />

		<table ID="menutable" align="center">
			<tr>
				<td><a class="menuItem" href="/Room8Try1/pages/fra/user/home.jsp">Ma Programme</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/fra/user/myAccount.jsp">Mon compte</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/fra/user/contactUs.jsp">Contactez nous</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/fra/user/aboutUs.jsp">� propos de nous</a></td>
				<td><a class="menuItem" href="/Room8Try1/pages/fra/login.jsp">Se d�connecter</a></td>
			</tr>
		</table>
	</div>

	<div class="content">

		<h1 align="center">Room M8</h1>
		<p>Ever try to find a room for your study group to work in at
			Algonquin College? A nice space with a large table for collaboration
			or a TV to practice a presentation on.</p>
		<p>It is not the easiest or the most efficient. We have first hand
			experience with this, losing a room because it wasn't marked down
			properly (during midterm season) or having to clean up after the
			people previously using it.</p>
		<p>
Room M8 est une application simplifiée du serveur qui sera basé
regarder après la réservation de bout en bout . A partir d'une connexion d'un utilisateur et
demander une chambre spécifique pour un temps déterminé , au suivi qui
les utilisateurs pourraient quitter les dégâts et peuvent offrir des pénalités à ceux
délinquants </p>
		<p>
La beauté de la chambre M8 réside dans son incapacité à faire cléricale
fautes ou autres erreurs humaines orientées qui existent dans le papier archaïque
systèmes basés .</p>
			
			<h1 align="center"> L'équipe</h1>
		<table cellpadding="20">
			<tr>
				<td><h3 align="center">Maria Reyes-Freaner</h3> 
Maria est un 5ème semestre
étudiant en informatique de Hermosillo , au Mexique. Maria a un
fond en robotique et d'autres activités basées sur la logique qu'elle
croit que son conduit dans ce programme et ont été des facteurs dans la conduite
son succès au Collège Algonquin. Maria est aussi un amoureux des animaux ,
partielle à l'éléphant .</td>
				<td align="center"><img src="/Room8Try1/images/aboutus/maria.jpg"
					alt="Smiley face" height="200px" /></td>
			</tr>
			<tr>
				<td align="center"><img src="/Room8Try1/images/aboutus/drew.jpg"
					alt="Smiley face" height="200px" /></td>
				<td><h3 align="center">Drew Hugill</h3> 
Drew est un ordinateur semestre 5e
étudiant en sciences . Drew a trouvé son chemin dans ce programme dès la sortie de
lycée et a trouvé son rythme dans cette technique et rapide
champ rythme . Drew a trouvé son premier emploi lié à ce domaine au
le début de cette année . Drew aime jouer sa guitare et
jeux vidéo dans son temps libre .</td>
			</tr>
			<tr>
				<td><h3 align="center">Sindie Grobbelaar</h3> 
Sindie est un 5ème semestre
étudiant en informatique de Pretoria , Afrique du Sud . Sindie a
multitude de compétences techniques et de conception qui lui permettent de produire
grand mot . Sindie aime jouer MMORPGs en ligne ou Xbox avec elle
amis dans son temps libre .</td>
				<td align="center"><img src="/Room8Try1/images/aboutus/sindie.jpg"
					alt="Smiley face" height="200px" /></td>
			</tr>
			<tr>
				<td align="center"><img src="/Room8Try1/images/aboutus/johnny.jpg"
					alt="Smiley face" height="200px" /></td>
				<td><h3 align="center">Jonathan Cockrem</h3> 
Jonathan est un 5ème semestre
étudiant en informatique . Jonathan a toujours profiter de l'électronique et
a été entouré par des ordinateurs depuis qu'il était jeune . Son enthousiasme
pour l'apprentissage et oeil pour le design l'a amené à travers cette
programmer et préparé à la main-d'œuvre . Jonathan aime jouer
Basket-ball tous les dimanches et le vélo à travers le Gatineaus .</td>

			</tr>
		</table>
	</div>

</body>
</html>