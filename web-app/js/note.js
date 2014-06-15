function takenote(){
new Ajax.Request('/gsword/note/takenote', {
  onSuccess: function(response) {
	//console.log(response);
	 var result=eval( response.responseJSON  )
      if(result.data){
      		$('noteform').innerHTML=result.data;
  	}
}});
//return false;
}


function keepnote(){
var reference=$('reference');
var ref="";
if(reference)ref=reference.value;
if(!ref)ref="";
var options = { 
    method:"post", 
    postBody:"note="+$('notetxt').value+"&email="+$('noteemail').value+"&ref="+ref+"&title="+$('notetitle').value, 
    onComplete:function(response){
	//console.log(response);
	 var result=eval( response.responseJSON  )
      		if(result.data){
//      		$('emailnotestatus').innerHTML=result.data;
  	}
	
}}; 
new Ajax.Request('/gsword/note/keepnote',options);  
}
function addreftonote(){
var reference=$('reference');
var ref="";
if(reference)ref=reference.value;
$('notetxt').value=$('notetxt').value+"\n"+ref;
}

function sendnotemail(){
new Ajax.Request('/gsword/note/emailnote', {
  onSuccess: function(response) {
	 var result=eval( response.responseJSON  )
	//console.log(response);
      if(result.data){
      		$('emailnotestatus').innerHTML=result.data;
  	}
   }
}
);
}

