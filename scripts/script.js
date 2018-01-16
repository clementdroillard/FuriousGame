//clic sur le bouton ajouter
function ajouter()
{
	var idAventurier = document.querySelector('input[name="aventurierRadio"]:checked').value;
	var idJoueur = document.querySelector('input[name="joueurRadio"]:checked').value;
	var xhr = new XMLHttpRequest();

	xhr.open("POST", "scripts/insert.php", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("idAventurier="+idAventurier+"&idJoueur="+idJoueur);

	//la requete vient d'etre effectué
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			alert("insertion OK");
		}
	};
}








//clic sur le bouton supprimer
/*function supprimer(id)
{
	//on envoie la requete pour supprimer
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "scripts/delete.php", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("del="+id);

	//lorsque la requete a réussi
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//suppression de la ligne dans le html
			var liste = document.getElementById("li"+id);
			liste.parentNode.removeChild(liste);
		}
	};
}

//clic sur le bouton valider
function valider(id)
{
	var liste = document.getElementById("element"+id);
	var libelle = document.getElementById("lib"+id);
	var valider;
	//on vérifie si c'est deja valider ou non
	if(document.getElementById("strike"+id) != null)
	{
		valider = 1;
	}
	else
	{
		valider = 0;
	}
	//requete pour changer le statut de validation
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "scripts/valider.php", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("valider="+valider+"&id="+id);

	//lorsque la requete est effectué
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//on modifie le html
			if(valider){
				var strike = document.getElementById("strike"+id);
				strike.parentNode.removeChild(strike);
				liste.appendChild(libelle);
			}
			else{
				var strike = document.createElement("strike");
				strike.style.fontSize = "xx-large";
				strike.id = "strike"+id
				liste.insertBefore(strike,libelle);
				libelle.parentNode.removeChild(libelle);
				strike.appendChild(libelle);
			}
		}
	};
}
*/
