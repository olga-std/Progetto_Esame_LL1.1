function resetDisplayNone(e) {

    try {

	    var rigaSpan=document.getElementsByClassName("riga");
	    for(var i=0; i<rigaSpan.length; i++){
            rigaSpan[i].setAttribute('style','display:none');
        }	    
	} catch(e){
		alert("resetDisplayNone"+e);
	}

}



function getElement(elem,tag) {

	var myid=elem.getAttribute(tag).trim();

   	elem=document.getElementById(myid);
   	return elem;
}



function mouseOver(e) {
    try {

        elem=getElement(this,'facs');
   	    
        if (elem) {
			elem.style.display="inline";
        }
	    
	} catch(e){
		alert("mouseOver"+e);
	}
}
  
  
function mouseOut(e) {
    try {
  
        elem=getElement(this,'facs');
   	    
        if (elem) {
			elem.style.display='none';
        }
	      
	    
	} catch(e){
		alert("mouseOut"+e);
	}

};

function gestoreLoad(){
	try{
		rigaFolio=document.getElementsByClassName("arealb");
		for(var i=0; i<rigaFolio.length; i++){
			rigaFolio[i].addEventListener("mouseover", mouseOver);
			rigaFolio[i].addEventListener("mouseout", mouseOut);
		}
		} catch(e){
		alert("gestoreLoad"+e);
	}
}

window.onload=gestoreLoad;