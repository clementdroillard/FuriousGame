 <?php
 	 //connexion a notre base de donnee
 	include("../connexion.php");
 	//on vérifie si il y a eu une saisie 
 	if(isset($_POST["idAventurier"]) && isset($_POST["idJoueur"]))
 	{
 		//contient la valeur qui vient d'etre saisie
 		$idAventurier = $_POST["idAventurier"];
 		$idJoueur = $_POST["idJoueur"];
 		
 		$aventurier = $dbh->query('select nom,vie,magie from aventurier where idAventurier = '.$idAventurier);
 		foreach ($aventurier as $row)
		{
		    $nom = $row['nom'];
		    $vie = $row['vie'];
		    $magie = $row['magie'];
		}
 		$sql = 'INSERT INTO aventurier(nom,vie,magie,idJoueur) VALUES(\''.$nom.'\','.$vie.','.$magie.','.$idJoueur.')';
 		// on revoie le bon code http
 		if($dbh->exec($sql))
 		{
 			http_response_code(200);
 		}
 		else
 		{
 			http_response_code(503);
 		}
 	}
 	else
 	{
 		http_response_code(500);
 	}

 ?>