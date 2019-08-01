

var infoDiv = document.getElementById("infos");
var unserDiv = document.getElementById("comUser");
var adminDiv = document.getElementById("comAdmin");

function createXHRForAffichage() {
	    if (window.XMLHttpRequest) {
	        xhr = new XMLHttpRequest();
	    } else if (window.ActiveXObject) {
	        xhr = new ActiveXObject("Msxml2.XMLHTTP");
	    }
	    
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState == 4) {
	            if (xhr.status == 200) {
	            	affichDescriptif(xhr.responseText);
	            	affichInfos(xhr.responseText);
	            } else {
	                echec(xhr.status, xhr.responseText);
	            }
	        }
	    };
	    return xhr;
	}

function createXHRForOthers() {
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xhr = new ActiveXObject("Msxml2.XMLHTTP");
    }
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
            	afficher();
            	
            } else {
                echec(xhr.status, xhr.responseText);
            }
        }
    };
    return xhr;
}

function afficher() {
	var xhr = createXHRForAffichage();
	xhr.open("GET", "/ProjetJEE/rest/plats", true);
	xhr.setRequestHeader("Accept","application/json");
	xhr.send(null);
}

function afficherDescriptif() {
	descriptifDiv.innerHTML = "";
	var responseJSON = JSON.parse(response);
	for(i=0; i<responseJSON.length; i++) {
		notesDiv.appendChild(createDescriptif(responseJSON[i]));
	}
}

function echec(statut, response) {
	notesDiv.innerHTML=statut + " : " + response;
}

function affichDescriptif(element) {
	var div = document.createElement("div");
	var h4 = document.createElement("h4");
	h4.inneHTML = element.nom;
	div.appendChild(element.descriptif);
	div.appendChild(element.ingredients);
}

function affichInfos(element) {
	var div = document.createElement("div");
	var h4 = document.createElement("h4");
	h4.inneHTML = element.nom;
	div.appendChild(element.descriptif);
	div.appendChild(element.ingredients);
}

function createNoteList(element) {
	var div = document.createElement("div");
	var textarea = document.createElement("textarea");
	textarea.value = element.value;
	textarea.id = "ta" + element.id;
	div.appendChild(textarea);
	
	var modifier = document.createElement("input");
	modifier.type="button";
	modifier.value="Modifier";
	modifier.onclick=function() {modifierNote(element.id)};
	
	var supprimer = document.createElement("input");
	supprimer.type="button";
	supprimer.value="Supprimer";
	supprimer.onclick=function() {supprimerNote(element.id)};
	
	div.appendChild(modifier);
	div.appendChild(supprimer);
	
	return div;
}

function ajouter() {
	var xhr = createXHRForOthers();
	
	var textarea = document.getElementById("taCreation");
	var formulaire = "value=" + encodeURIComponent(textarea.value);
	
	xhr.open("POST", "/myTPPriseDeNote/rest/notes", true);
	xhr.setRequestHeader("Accept","application/json");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send(formulaire);
	textarea.value="";
	textarea.placeholder="Créez une nouvelle note...";
}

function modifierNote(id) {
	var xhr = createXHRForOthers();
	
	var textarea = document.getElementById("ta" + id);
	var formulaire = "value=" + encodeURIComponent(textarea.value);
	
	xhr.open("PUT", "/myTPPriseDeNote/rest/notes/" + id, true);
	xhr.setRequestHeader("Accept","application/json");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send(formulaire);
}

function supprimerNote(id) {
	var xhr = createXHRForOthers();
	xhr.open("DELETE", "/myTPPriseDeNote/rest/notes/" + id, true);
	xhr.send(null);
}