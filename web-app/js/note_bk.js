function takenote(){
    ${remoteFunction(
          controller: 'note',
          action: 'takenote',
          onComplete: 'displayNote(e)')};
    }
  function displayNote(e){
	alert("got data");
       var result=eval( e.responseJSON  );
      if(result.data){
      	$('noteform').innerHTML=result.data;
      }
  }
