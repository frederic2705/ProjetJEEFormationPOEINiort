
var descriptifDiv = document.getElementById("descriptif");
var carouselDiv = document.getElementById("carousel");

function createXHRForAffichage() {
	    if (window.XMLHttpRequest) {
	        xhr = new XMLHttpRequest();
	    } else if (window.ActiveXObject) {
	        xhr = new ActiveXObject("Msxml2.XMLHTTP");
	    }
	    
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState == 4) {
	            if (xhr.status == 200) {
	            	console.log(xhr.responseText);
	            	afficherDescriptif(xhr.responseText);
	            	afficherCarousel(xhr.responseText);
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

function afficherCarousel (response) {
	carouselDiv.innerHTML = "";
	var responseJSON = JSON.parse(response);
	for(i=0; i<responseJSON.length; i++) {
		carouselDiv.appendChild(createCarousel(responseJSON[i]));
	}
	alert("test2");
}

function afficher() {
	var xhr = createXHRForAffichage();
	xhr.open("GET", "/ProjetJEE/rest/plats", true);
	xhr.setRequestHeader("Accept","application/json");
	xhr.send(null);
}

function afficherDescriptif(response) {
	descriptifDiv.innerHTML = "";
	var responseJSON = JSON.parse(response);
	for(i=0; i<responseJSON.length; i++) {
		descriptifDiv.appendChild(createDescriptif(responseJSON[i]));
	}
}

function createCarousel(element) {
	var div = document.createElement("div");
	div.id = "image_"+element.id;
	var img = document.createElement("img");
	alert(element.image);
	var image = element.image.replace("\\\\", "\\");
	alert(image);
	img.src = image;
	img.style = "max-width:100%;";
	img.onclick=function() {afficher(element.id)};
	
	carouselDiv.appendChild(div);
	document.getElementById("image_"+element.id).appendChild(img);
}

function echec(statut, response) {
	descriptifDiv.innerHTML=statut + " : " + response;
}

function createDescriptif(element) {
	var div1 = document.createElement("div");
	div1.id = "descritpitf";
	var div2 = document.createElement("div");
	div2.id = "ingredients";	
	var h4 = document.createElement("h4");
	h4.innerHTML = element.nom;

	div1.innerHTML = element.descriptif;
	div2.innerHTML = element.ingredients;
	
	descriptifDiv.appendChild(h4);
	descriptifDiv.appendChild(div1);
	descriptifDiv.appendChild(div2);
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