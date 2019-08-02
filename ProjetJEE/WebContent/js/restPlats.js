
var descriptifDiv = document.getElementById("descriptif");
var carouselDiv = document.getElementById("carousel");
var infoDiv = document.getElementById("infos");
var comUserDiv = document.getElementById("comUser");
var modifAdminDiv = document.getElementById("modifAdmin");
var currentId;

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

function createXHRForAffichageModif() {
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xhr = new ActiveXObject("Msxml2.XMLHTTP");
    }
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
            	afficherModif(xhr.responseText);
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
            	loadInfo(currentId);
            	
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
		loadInfo(element.id);
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

function loadInfo(id) {
	currentId = id;
	var xhr = createXHRForAffichageInfo();
	xhr.open("GET", "/ProjetJEE/rest/commentaires/" + id, true);
	xhr.setRequestHeader("Accept","application/json");
	xhr.send(null);
}

function afficherInfo(response) {
	infoDiv.innerHTML = "";
	var responseJSON = JSON.parse(response);
	console.log(responseJSON);
	var h4 = document.createElement("h4");
	h4.innerHTML = "Commentaires :";
	infoDiv.appendChild(h4);
	for(i=0; i<responseJSON.length; i++) {
		createInfo(responseJSON[i]);
	}
}

function createInfo(element) {
	
	var div1 = document.createElement("div");
	div1.id = "commentaire_"+element.id;
	div1.style = "display: flex; justify-content: space-between;"
	var p = document.createElement("p");
	
	p.innerHTML = "- User : " + element.user.nom + ". Commentaire : " + element.contenu + ". Note : " + element.note + "&nbsp;";
	
	var button = document.createElement("input");
	button.id = "button_"+element.id;
	button.type = "button";
	button.value = "Editer";
	button.style = "margin-right:20px;";
	button.onclick=function() {
		afficherModif(element);
	}
	
	infoDiv.appendChild(div1);
	infoDiv.appendChild(p);
	p.appendChild(button);
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
	label1.innerHTML = "Votre note : ";
	var input1 = document.createElement("input");
	input1.type = "number";
	input1.id = "noteUser";
	input1.name = "noteUser";
	
	var label2 = document.createElement("label");
	label2.for = "comUser";
	label2.innerHTML = "Votre commentaire : ";
	var textArea = document.createElement("textarea");
	textArea.id = "text_"+element.id;
	textArea.name = "comUser";
	textArea.rows = "5";
	textArea.cols = "33";
//	textarea.innerHTML="";
//	textarea.placeholder="Créez une nouvelle note...";
//	textArea.innerHTML = "Commentaire : " + element.contenu;

	var input3 = document.createElement("input");
	input3.type = "submit";
	input3.value = "Valider";
	input3.onclick = function() {
		ajouterCom(element);
	}
	
	comUserDiv.appendChild(h4);
	comUserDiv.appendChild(form);
	form.appendChild(label1);
	form.appendChild(document.createElement("br"));
	form.appendChild(input1);
	form.appendChild(document.createElement("br"));
	form.appendChild(label2);
	form.appendChild(document.createElement("br"));
	form.appendChild(textArea);
	form.appendChild(document.createElement("br"));
	form.appendChild(input3);
	comUserDiv.appendChild(document.createElement("br"));
}

function afficherModif(response) {
	modifAdminDiv.innerHTML = "";
	createModif(response);
}

function createModif(element) {
	
	var div1 = document.createElement("div");
	div1.id = "saisie_"+element.id;	
	var textArea = document.createElement("textarea");
	textArea.id = "text_"+element.id;
	textArea.rows = "5";
	textArea.cols = "33";
	textArea.innerHTML = "Commentaire : " + element.contenu;
	
	var button1 = document.createElement("input");
	button1.type = "button";
	button1.value = "Modifier";
	button1.onclick=function() {
		modifierCom(element.id);
	}
	
	var button2 = document.createElement("input");
	button2.type = "button";
	button2.value = "Supprimer";
	button2.onclick=function() {
		supprimerCom(element.id);
	}
	
	modifAdminDiv.appendChild(div1);
	modifAdminDiv.appendChild(textArea);
	modifAdminDiv.appendChild(document.createElement("br"));
	modifAdminDiv.appendChild(button1);
	modifAdminDiv.appendChild(button2);
}

function ajouterCom() {
	var xhr = createXHRForOthers();
	
	var textarea = document.getElementById("taCreation");
	var formulaire = "value=" + encodeURIComponent(textarea.value);
	
	xhr.open("POST", "/ProjetJEE/rest/commentaires", true);
	xhr.setRequestHeader("Accept","application/json");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send(formulaire);
	textarea.value="";
	textarea.placeholder="Créez une nouvelle note...";
}

function modifierCom(id) {
	var xhr = createXHRForOthers();
	var textarea = document.getElementById("text_" + id);
	var formulaire = "value=" + encodeURIComponent(textarea.value);
	
	xhr.open("PUT", "/ProjetJEE/rest/commentaires/" + id, true);
	xhr.setRequestHeader("Accept","application/json");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send(formulaire);
}

function supprimerCom(id) {
	var xhr = createXHRForOthers();
	xhr.open("DELETE", "/ProjetJEE/rest/commentaires/" + id, true);
	modifAdminDiv.remove();
	xhr.send(null);
}