<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<!--meta HTTP-EQUIV="REFRESH" content="0; url=/gsword/gbook/v"-->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <!--meta name="layout" content="guimain" /-->
    <title><g:message code="welcome" /></title>
  <g:javascript library="prototype"/>
<g:javascript library="application" />
<g:javascript>

  function updateAuxForm(e){
         var result=eval( e.responseJSON  )
      if(result.data){
      $('auxform').innerHTML=result.data;
   showLayer('closeaux') ;
      }
}
function offAuxform(){
     $('auxform').innerHTML="";
   hideLayer('closeaux') ;
}
   function showLayer(divName) {
        document.getElementById(divName).style.display = "";
        document.getElementById(divName).style.visibility = 'visible';
    }

    function hideLayer(divName) {
        document.getElementById(divName).style.display = "none";
        document.getElementById(divName).style.visibility = 'hidden';
    }
var commentform;
function showcomment(){
      var fom=$('liveform');
    if (commentform) $('liveform').innerHTML=commentform;
    else ${remoteFunction(
             controller: 'gbook',
             action: 'fetchCommentForm',
             onComplete: 'updateAuxForm(e)')};
      }
</g:javascript>


</head>

<body>

    <h1><g:message code="welcome" /></h1>
    <br/>
<table>
<tr>
<td width="10%">
<ul>
  <li>
    <a href="/gsword/bible/read"><g:message code="readbible" /></a>
  <li>
    <a href="/gsword/bible/search"> <g:message code="searchthebible" /></a>
  </li>
  <li>
    <a href="v"><g:message code="researchbible" /> </a>
  </li>
  <li>
    <a href="c"> <g:message code="classics" /> </a>
  </li>
   <li>
    <a href="/gsword/bible/cmnt"> <g:message code="commentary" /> </a>
  </li>
  <li>
    <a href="searchdics"> <g:message code="dictionarylookup" /> </a>
  </li>
  <li><a href="http://www.twitter.com/gsword"><g:message code="meditate"/></li>
  <li><a href="http://www.twitter.com/membible"><g:message code="memorize" /></a></li>

  <li> <g:link controller="gbook" action="oneyearbible" title="One Year Through Bible"><g:message code="oneyearbiblechinese" /></g:link> </li>
<li><a href="/gsword/help/help.xhtml"><span><g:message code="help"/></span></a> </li> 
</ul>
</td>
<td>
<div class="section-header">
<h3><g:message code="quicksearch" /></h3>
</div>
<div class="section" id='quick_search'>
<g:message code="enterkey" />
 <g:render template="/bible/includes/searchbible"/>
<p class="txt-sm">
For more search options, try: 
<a href="/gsword/bible/read" title="Look for a passage in one or more Bible versions">Passage&nbsp;Lookup</a>&nbsp;| 
<a href="/gsword/bible/search" title="Search for keywords or phrases in one or more Bible versions">Keyword&nbsp;Search</a>&nbsp;| 
<a href="/gsword/gbook/searchdics" title="Search in Dictionary(Topical)">Dictionary(or Topical)&nbsp;Search</a>&nbsp;| 
<a href="/gsword/gbook/v" title="Studio">Online&nbsp;Bible&nbsp;Studio</a>
</p>
</div>

    <br/>

        <g:link controller="gbook" action="oneyearbible" title="One Year Through Bible"><g:message code="readdaily" /></g:link>
<br/>
<br/>
<g:message code="subscribe"/>:    <a href="http://bible.ccim.org/email/bibleemaillist_zh.htm">Chinese</a>

    <a href="http://bible.ccim.org/email/bibleemaillist.htm">English</a>

<br/>
<br/>
        <g:link controller="prayer" action="index" title="Face to Face with God, Pray His Word"><g:message code="facetoface" /></g:link>
        <g:link controller="closet" action="index.html" title="Closet"><g:message code="closet" /></g:link>
<br/>
Follows us on twitters:
  <a href="http://www.twitter.com/gsword">Meditate the Word<img border="0" src="/gsword/images/icon-twitter.png" width="55" height="25" alt="twitter" title="twitter"/></a>
  <a href="http://www.twitter.com/membible">Memorize Bible, One Verse a day<img border="0" src="/gsword/images/icon-twitter.png" width="55" height="25" alt="twitter" title="twitter"/></a>
<br/>
Read the twitts here: 
        <g:link controller="gbook" action="feeds" title="Daily twitts">Twitter</g:link>
<br/>
Download Mobile applications:
  <a href="https://market.android.com/search?q=yiguang+hu&c=apps">Andriod Applications</a>
<br/>
<br/>

<g:message code="introduction" />
<!--
<ul style="margin-bottom:0;">
<li><a href="http://www.ccimweb.org/gsword/help/help.xhtml" title="Learn how to use www.ccimweb.org/gsword with a tutorial">Learn how to use www.ccimweb.org/gsword with a tutorial</a></li>
</ul>
-->
<div id="sig" class="txt-sm">
<p>
<!--
  <a href="http://www.facebook.com/group.php?gid=1714831533">GSword Facebook<img src="/gsword/images/ipcn-fb.png" width="55" height="25" alt="facebook" title="facebook" border="0"/></a><br/>
  <a href="http://www.ccimweb.org/gsword/gbook/feed"><g:message code="feed"/><img border="0" src="/gsword/images/icon-rss.png" width="55" height="25" alt="rss" title="rss"/></a><br/>
           <modalbox:createLink controller="gbook" action="contactus" title='Contact us/Feedback' width="400" linkname='Contact us/Feedback' /><br/>
<a href="http://bible.ccim.org/" target="_blank"> <g:message code="oldtool" /></a><br/>
-->
<a href="http://www.ccim.org" title="CCIM.ORG">CCIM.ORG</a><br />
<a href="http://www.ccim.org/n103" target="_blank" title="Support information"><g:message code="donation"/></a>
</p>
<button onclick="showcomment();"><g:message code="comment" /></button>
</div>
<div id="liveform" name="liveform"/>
 <div id="auxform" name="auxform"></div>
                <button id="closeaux" name="closeaux" style="display:none" onclick="offAuxform();">Click Me to close</button>
</td>
</tr>
</table>

<div id="display_tweet" name="display_tweet"/>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-8971382-3");
pageTracker._trackPageview();
} catch(err) {}</script>
</body>
</html>
