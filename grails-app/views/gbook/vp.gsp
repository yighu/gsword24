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
  <title>与神会面,祷告神的话</title>
  <meta name="description" content="与神会面,祷告神的话GSword Bible"/>
  <meta name="keywords" content="与神会面,祷告神的话,GSword,Jsword,Bible,Chinese,groovy,grails"/>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="layout" content="main" />
  <g:javascript library="prototype"/>

<g:javascript library="application" />
</head>
<body>
<center>
<div id="prayer_root"> 
<g:each status="i" var="cat" in="${catlist}">
<g:link action="vp" id="${i}" >-${cat}-</g:link>
</g:each>
<div>尽情大声的祷告吧!</div>
</center>
<g:each var="subc" in="${prayers}">
  <div><br/><center><h1>${subc.name?.trim()}</h1></center><br/></div>
 <g:each var="prays" in="${subc.prays}">
 <div><br/><center><h2>${prays.name?.trim()}</h2></center><br/></div>
 <div>${prays.txt?.encodeAsRaw()}</div>
 </g:each>
</g:each>
</div>

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
