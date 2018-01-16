 <?php

 	require 'vendor/autoload.php';
 	Mustache_Autoloader::register();
 	 //connexion a notre base de donnee
 	include("connexion.php");

 	$listeAventurier = $dbh->query('select idAventurier,nom,vie,magie from aventurier where idJoueur is null');	
 	$listeJoueur = $dbh->query('select idJoueur,nom from joueur');	
	$m = new Mustache_Engine(array(
    	'loader' => new Mustache_Loader_FilesystemLoader(dirname(__FILE__) . '/views'),
	));
	//affichage de notre vue 
 	echo $m->render('liste' ,array('listeAventurier'=>$listeAventurier,'listeJoueur'=>$listeJoueur));

 ?>
