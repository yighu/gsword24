<%--
  Created by IntelliJ IDEA.
  User: Yiguang
  Date: Dec 20, 2008
  Time: 9:30:55 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>CCIM GSword Online Bible studio</title>
  <meta name="description" content="CCIM Chinese Christian GSword Online Bible Studio"/>
  <meta name="keywords" content="CCIM,GSword,Jsword,Bible,Chinese,groovy,grails"/>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<feed:meta kind="rss" version="2.0" controller="gbook" action="feed"/>

  <link rel="stylesheet" type="text/css" href="${createLinkTo(dir:pluginContextPath,file:'css/iBD.css')}" />

  <g:javascript library="prototype"/>

<g:javascript library="application" />
<r:layoutResources/>
<g:javascript>
var selectedbooks=new Array();
function addBooks(selected){
        var len=selectedbooks.length;
        if (len<4){
        var index=selectedbooks.indexOf(selected);
        if (index==-1){
                selectedbooks.push(selected);
        }
        }
}
function removeBooks(selected){
        var index=selectedbooks.indexOf(selected);
        if (index!=-1){
                selectedbooks.splice(index,1);
        }
}
function flipBooks(selected){
        var index=selectedbooks.indexOf(selected);
        var len=selectedbooks.length;
        if (index==-1&&len<4){
                selectedbooks.push(selected);
        }else{
                selectedbooks.splice(index,1);
	}
}
function flip_parallel(){
        flipBooks(getParallel());
        locate();
        }
function pick_parallel(){
        addBooks(getParallel());
        locate();
        }
function unpick_parallel(){
        removeBooks(getParallel());
     locate();
        }
function getBooks(){
    if(selectedbooks.length==0){
        return getBook();
    }else{
  return getBook()+","+selectedbooks.toString();
    }
}
function getDictionary()
{
  return $("dictionaries").value;
}
function getCommentary()
{
  return $("commentaries").value;
}
function getParallel()
{
  return $("parallels").value;
}

function searchBible(){
    var bible=$('books')  ;
    var key=$('keyword').value;
    if (key){
    ${remoteFunction(
          controller: 'gbook',
          action: 'searchBible',

          params: '\'bible=\' + escape(bible.value)+\'&key=\'+key',
          onComplete: 'updateForm(e)')};
    }else{
        locate()               ;
    }
}

function locate(){
  var bible=getBooks();
    var reference=$('reference').value;
    ${remoteFunction(
            controller: 'gbook',
            action: 'display',
            params: '\'bible=\' + escape(bible)+\'&key=\'+escape(reference)+\'&start=\'+verseStart+\'&limit=\'+verseLimit',

            onComplete: 'updateForm(e)')};

}
  function setInfo(msg){
  $('info').innerHTML=msg;
  }
  function updateAuxForm(e){
         var result=eval( e.responseJSON  )
      if(result.data){
      $('auxform').innerHTML=result.data;
   showLayer('closeaux') ;
      }
}
  function updateForm(e){
         var result=eval( e.responseJSON  )
      if(result.data){

      var fom=$('liveform');
      fom.innerHTML=result.data;
      }
      if(result.verses){

      var  fom1=$('reference');
           fom1.value= result.verses;
      }
      if( result.total){

        fom1=$('total');
           fom1.value= result.total;
      }
  }
 function openwin(e){
         var result=eval( e.responseJSON ) ;
	var ptf="http://www.ccimweb.org/gsword/"+result.data;
          setInfo("<a href=\""+ptf+"\">Download PowerPoint Here</a>") ;
          popup(ptf, "PowerPoint") ;

  }

function popup(mylink, windowname)
{
if (!window.focus)return true;
var href;
if (typeof(mylink) == 'string')
   href=mylink;
else
   href=mylink.href;
window.open(href, windowname, ',type=fullWindow,fullscreen,scrollbars=yes');
return false;
}

 function updateReference(e){
      var fom=$('reference');
      fom.innerHTML=e.responseText;
  }
var verseStart=0           ;
var verseLimit=10           ;
function prev()
{
        verseStart=verseStart-verseLimit;
        if (verseStart<0){
                verseStart=0;
        }
    return page( verseStart)  ;

}
function nextstep()
{

    var total=$('total').value;
        if (verseStart<0){
            verseStart=0   ;
        }
        verseStart=verseStart+verseLimit;
        if (verseStart>total){
                verseStart=0;
        }

  return   page( verseStart)  ;

}
function page(startv){
var book=getBooks();
  var ref  = $('reference').value;
  if (book && ref)
  {
    getOsis(book, ref, startv,verseLimit);
      return true;
  }
    return false;
}
function getOsis(bible,ref,start,limit){
    ${remoteFunction(
            controller: 'gbook',
            action: 'getOsis',

            params: '\'bible=\' + escape(bible)+\'&reference=\'+escape(ref)+\'&start=\'+start+\'&limit=\'+limit',
            onComplete: 'updateForm(e)')};
}
function getBook()
{
  var bk=$('books').value;
        if(!bk){
        bk='ChiUns';
        setBook(bk);
        }
        return bk;
}
function setBook(data){
    $('books').value=data;
    return false;
}
 function setPassage(data){
 $('reference').value=data;
     locate();
     return false;
 }
 function handlePassage(data){
 $('reference').value=data;
     locate();
     return false;
 }
function updateChapters(data)
{
  var bk=$('chapters');
       var dd=eval(data.responseJSON)    ;
  $('chapters').options[0] = new Option("All Chapters",0);
 var chps=""
    var book=$('bibles').value   ;
for (i = 0; i < dd.nchaps; i++) {
  var newOption = document.createElement("OPTION");
  newOption.text=1+i;
  newOption.value=1+i;
  $('chapters').options[i] = new Option(newOption.text,newOption.value);
  chps=chps+ "<button onclick='readChap(&quot;"+book +" "+(1+i) +"&quot;);'>"+(1+i)+"</button>";

}
 $('chapters').length = dd.nchaps+1;
 $('chaps').innerHTML=chps;
}

function updateChaptersbybook(bible,data)
{
  var bk=$('chapters');
       var dd=eval(data.responseJSON) ;
  $('chapters').options[0] = new Option("All Chapters",0);
 var chps=""
    var book=bible;
for (i = 0; i < dd.nchaps; i++) {
  var newOption = document.createElement("OPTION");
  newOption.text=1+i;
  newOption.value=1+i;
  $('chapters').options[i] = new Option(newOption.text,newOption.value);
  chps=chps+ "<button onclick='return readChap(&quot;"+book +" "+(1+i) +"&quot;);'>"+(1+i)+"</button>" ;
}
 $('chapters').length = dd.nchaps+1;
 $('chaps').innerHTML=chps;
}

function setChaps(bible){

${remoteFunction(
           controller:'gbook',
           action:'getChaps',
           params:'\'bible=\' + escape(bible)',
           onComplete:'updateChaptersbybook(bible,e)')};
     updateReference(bible+" 1");
           return false;
}

function readChap(ref){
    $('reference').value=ref;
   // getOsis($('books').value,ref,0,500) ;
    locate();
    return false;
}
function updateReference(data){
 $('reference').value=data    ;
    locate()                   ;
}
function searchDictionary(){
    var dic=$('dictionaries')        ;
    var key=$('keyword')              ;
if(key!=null) ${remoteFunction(
            controller: 'gbook',
            action: 'searchDictionary',

            params: '\'dic=\' + escape(dic.value)+\'&key=\'+key.value',
            onComplete: 'updateDict(e)')};

}
function searchDictionaryp(){
    var dic=$('dictionariesp')        ;
    var key=$('keyp')              ;
    ${remoteFunction(
            controller: 'gbook',
            action: 'searchDictionary',

            params: '\'dic=\' + escape(dic.value)+\'&key=\'+key.value',
            onComplete: 'updateDictp(e)')};

}
function tweet(){
    
   ${remoteFunction(
            controller: 'gbook',
            action: 'ontwitter',
            onComplete: 'twitter(e)')};
  //  Tweek.begin();
}
function updateDict(data){
           var dic=eval(data.responseJSON);
	showBox(dic.data);
	
}
function updateDictp(data){
           var dic=eval(data.responseJSON);

	showBox(dic.data);
}
function twitter(data){
    var msg=eval(data.responseJSON) ;
	showBox(msg.data);
}
   function getPassage(){
   return $('reference').value               ;
   }
function flip_commentary()
{
  var dict=  $('commentaries').value;
  var ref  = getPassage();
  if (dict&& ref)
  {
        flipBooks(dict);
locate();
      
  }
}
function pick_commentary()
{
  var dict=  $('commentaries').value;
  var ref  = getPassage();
  if (dict&& ref)
  {
        addBooks(dict);
locate();
      
  //  return false;
  }
 // return false;
}
function unpick_commentary()
{
  var dict= $('commentaries').value;
  var ref  = getPassage();
  if (dict&& ref)
  {
        removeBooks(dict);
locate();
  //  return false;
  }
  //return false;
}
  function showword(bible){
    ${remoteFunction(
             controller: 'gbook',
             action: 'daily',
            params: '\'bible=\' + escape(bible)',
             onComplete: 'updateForm(e)')};
  setBook(bible);
  }
 function doSearch(){
     var key="";
     var range=$('range').value;
     if (range=='Custom'){
        var custrange=$('customrange').value;
        if (custrange){
          key="["+custrange+"]";
        }
     }else{
       var b=1+range.indexOf('\(');
       var e=range.indexOf('\)');
        if (b>1){
        key="["+range.substring(b,e)+"]";
        }
       var phrase=$('phrase').value;
     if(phrase){
     key+=" \""+phrase+"\"";
     }
     }
       var inwords=$('inwords').value;
     if(inwords){
      key+=" +"+inwords;
     }
       var exwords=$('exwords').value;
       if(exwords){
      key+=" -"+exwords;
     }
       var seems=$('seems').value;
     if(seems){
       key+=" "+seems+"~ ";
     }
       var starts=$('starts').value;
       if(starts){
       key+=" "+starts+"* ";
     }
        
       $('keyword').value=key;
	searchBible();
   }

function sendmail(){
    var name=$('username')                    ;
    var email=$('useremail')                   ;
    var comment=$('usercomment')                ;
      ${remoteFunction(
             controller: 'gbook',
             action: 'sendmail',
             params: '\'name=\' + escape(name.value)+\'&email=\'+escape(email.value)+\'&comment=\'+escape(comment.value)',
             onComplete: 'displaymailsendresponse(e)')};
       return false;
   }
function displaymailsendresponse(e){
       var result=e.responseText;

      var fom=$('emailstatus');
      fom.innerHTML=result;
}
function genppt(){
    setInfo("Please wait generating PowerPoint.....")  ;
    var bible=getBook();
    var reference=$('reference').value;
    ${remoteFunction(
             controller: 'gbook',
             action: 'ppt',
 params: '\'version=\' + escape(bible)+\'&key=\'+escape(reference)',

             onComplete: 'openwin(e)')};
}

function showxref(){
    var bible=getBooks();
    var reference=$('reference').value;

    ${remoteFunction(
             controller: 'gbook',
             action: 'flipXRef',
 params: '\'version=\' + escape(bible)+\'&key=\'+escape(reference)+\'&start=\'+verseStart+\'&limit=\'+verseLimit',

             onComplete: 'updateForm(e)')};
}

function showheadings(){
    var bible=getBooks();
    var reference=$('reference').value;

    ${remoteFunction(
             controller: 'gbook',
             action: 'flipHeadings',
 params: '\'version=\' + escape(bible)+\'&key=\'+escape(reference)+\'&start=\'+verseStart+\'&limit=\'+verseLimit',

             onComplete: 'updateForm(e)')};
}

function showstrongs(){
    var bible=getBooks();
    var reference=$('reference').value;
    ${remoteFunction(
             controller: 'gbook',
             action: 'flipStrongs',
 params: '\'version=\' + escape(bible)+\'&key=\'+escape(reference)+\'&start=\'+verseStart+\'&limit=\'+verseLimit',

             onComplete: 'updateForm(e)')};
}

function shownotes(){
    var bible=getBooks();
    var reference=$('reference').value;

    ${remoteFunction(
             controller: 'gbook',
             action: 'flipNotes',
 params: '\'version=\' + escape(bible)+\'&key=\'+escape(reference)+\'&start=\'+verseStart+\'&limit=\'+verseLimit',

             onComplete: 'updateForm(e)')};
}
function donothing(){
}
function showmorph(){
 var bible=getBooks();
    var reference=$('reference').value;

    ${remoteFunction(
             controller: 'gbook',
             action: 'flipMorph',
 params: '\'version=\' + escape(bible)+\'&key=\'+escape(reference)+\'&start=\'+verseStart+\'&limit=\'+verseLimit',
             onComplete: 'updateForm(e)')};
}
function showverseline(){
var bible=getBooks();
    var reference=$('reference').value;
            
    ${remoteFunction(
             controller: 'gbook',
             action: 'flipVline',
 params: '\'version=\' + escape(bible)+\'&key=\'+escape(reference)+\'&start=\'+verseStart+\'&limit=\'+verseLimit',
             onComplete: 'updateForm(e)')};
}
function doProtocol(protocol,lemma){
       ${remoteFunction(
             controller: 'gbook',
             action: 'handleProtocol',
            params: '\'protoc=\' + escape(protocol)+\'&key=\'+lemma',
             onComplete: 'showProtocolData(e)')};
    return false;
}
function showProtocolData(e){
     var result=eval( e.responseJSON  )   ;
      showBox(result.result); 
    return false;
}
function showBox(e){
if(e!=null) $('display_dict').innerHTML="<b>Click to close the dictionary</b><br/>"+e;
return false;
}
function offBox(){
     $('display_dict').innerHTML="";
}
function offAuxform(){
     $('auxform').innerHTML="";
   hideLayer('closeaux') ;
}
function changeLocale(){
    
    location.reload("/gsword/gbook/v?lang=\'"+$('lang').value+"\'");
    return false;

}
 function custom(){
  var cust=$('range').value;
     
     if (cust=='Custom'){
     showLayer('xcustomrange');
     }else{
         hideLayer('xcustomrange');
     }
     return false;
 }
   function showLayer(divName) {
        document.getElementById(divName).style.display = "";
        document.getElementById(divName).style.visibility = 'visible';
    }

    function hideLayer(divName) {
        document.getElementById(divName).style.display = "none";
        document.getElementById(divName).style.visibility = 'hidden';
    }
var helptxt;
var commentform;
function showhelp(){
    if (helptxt) $('liveform').innerHTML=helptxt;
    else ${remoteFunction(
             controller: 'gbook',
             action: 'fetchHelp',
             onComplete: 'updateAuxForm(e)')};
      }
function showcomment(){
      var fom=$('liveform');
    if (commentform) $('liveform').innerHTML=commentform;
    else ${remoteFunction(
             controller: 'gbook',
             action: 'fetchCommentForm',
             onComplete: 'updateAuxForm(e)')};
      }
	
function showadvsearch(){
      var fom=$('liveform');
    if (commentform) $('liveform').innerHTML=commentform;
    else ${remoteFunction(
             controller: 'gbook',
             action: 'advsearch',
             onComplete: 'updateAuxForm(e)')};
      }
	
  </g:javascript>
  <meta name="layout" content="main"/>

</head>
<%
 //def tm="showword(\"ChiNCVs\");"
 def tm="showword(\"ChiUns\");"
%>
<body onload='${tm}' >
 <g:render template="includes/searchdlg" />
</body>
</html>
