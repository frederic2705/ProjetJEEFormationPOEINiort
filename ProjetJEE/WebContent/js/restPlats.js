
var descriptifDiv = document.getElementById("descriptif");
var carouselDiv = document.getElementById("carousel");
var infoDiv = document.getElementById("infos");
var comUserDiv = document.getElementById("comUser");

function createXHRForAffichageCarousel() {
	    if (window.XMLHttpRequest) {
	        xhr = new XMLHttpRequest();
	    } else if (window.ActiveXObject) {
	        xhr = new ActiveXObject("Msxml2.XMLHTTP");
	    }
	    
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState == 4) {
	            if (xhr.status == 200) {
	            	afficherCarousel(xhr.responseText);
	            } else {
	                echec(xhr.status, xhr.responseText);
	            }
	        }
	    };
	    return xhr;
	}

function createXHRForAffichageInfo() {
	    if (window.XMLHttpRequest) {
	        xhr = new XMLHttpRequest();
	    } else if (window.ActiveXObject) {
	        xhr = new ActiveXObject("Msxml2.XMLHTTP");
	    }
	    
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState == 4) {
	            if (xhr.status == 200) {
	            	afficherInfo(xhr.responseText);
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

function echec(statut, response) {
	descriptifDiv.innerHTML=statut + " : " + response;
}

function loadCarousel() {
	var xhr = createXHRForAffichageCarousel();
	xhr.open("GET", "/ProjetJEE/rest/plats", true);
	xhr.setRequestHeader("Accept","application/json");
	xhr.send(null);
}

function afficherCarousel (response) {
	carouselDiv.innerHTML = "";
	var responseJSON = JSON.parse(response);
	for(i=0; i<responseJSON.length; i++) {
		createCarousel(responseJSON[i]);
	}
}

function createCarousel(element) {
	var div = document.createElement("div");
	div.id = "image_"+element.id;
	div.className="item thumbnail";
	var img = document.createElement("img");
	img.src = element.image;
	img.style = "max-width:100%;";
	
	img.onclick=function() {
		afficherDescriptif(element);
		loadInfo(element);
		afficherComUser(element)
	};
	
	if(element.id==3) {
		div.className="item thumbnail active";
	}
	carouselDiv.appendChild(div);
	document.getElementById("image_"+element.id).appendChild(img);
}

function afficherDescriptif(response) {
	descriptifDiv.innerHTML = "";
	createDescriptif(response);
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
	descriptifDiv.appendChild(document.createElement("br"));
	descriptifDiv.appendChild(div2);
}

function loadInfo () {
	var xhr = createXHRForAffichageInfo();
	xhr.open("GET", "/ProjetJEE/rest/commentaires", true);
	xhr.setRequestHeader("Accept","application/json");
	xhr.send(null);
}

function afficherInfo(response) {
	infoDiv.innerHTML = "";
	createInfo(response);
}

function createInfo(element) {
	var div1 = document.createElement("div");
	div1.id = "descritpitf";
	var div2 = document.createElement("div");
	div2.id = "ingredients";	
	var h4 = document.createElement("h4");
	h4.innerHTML = element.nom;

	div1.innerHTML = element.descriptif;
	div2.innerHTML = element.ingredients;
	
	infoDiv.appendChild(h4);
	infoDiv.appendChild(div1);
	infoDiv.appendChild(document.createElement("br"));
	infoDiv.appendChild(div2);
}

function afficherComUser(response) {
	comUserDiv.innerHTML = "";
	createComUser(response);
}

function createComUser(element) {	
	comUserDiv.appendChild(document.createElement("br"));
	var h4 = document.createElement("h4");
	h4.innerHTML = "Votre évaluation :";
	var form = document.createElement("form");
	form.method = "post";
	form.action = "<%= request.getContextPath() %>/ServletNosPlats";
	var label1 = document.createElement("label");
	label1.for = "noteUser";
	label1.innerHTML = "Votre note :";
	var input1 = document.createElement("input");
	input1.type = "number";
	input1.id = "noteUser";
	input1.name = "noteUser";
	
	var label2 = document.createElement("label");
	label2.for = "comUser";
	label2.innerHTML = "Votre commentaire :";
	var input2 = document.createElement("input");
	input2.type = "text";
	input2.id = "comUser";
	input2.name = "comUser";

	var input3 = document.createElement("input");
	input3.type = "submit";
	input3.value = "Valider";
	
	comUserDiv.appendChild(h4);
	comUserDiv.appendChild(form);
	form.appendChild(label1);
	form.appendChild(input1);
	form.appendChild(document.createElement("br"));
	form.appendChild(label2);
	form.appendChild(input2);
	form.appendChild(document.createElement("br"));
	form.appendChild(input3);
	comUserDiv.appendChild(document.createElement("br"));
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