<!-- fieldset legend="search area" -->
<g:javascript library="application" />
  <modalbox:modalIncludes />
 
  <table id="searchBox" class ='dialog'>
	<tr class ='title'>
		<td colspan ='3' ><g:message code="studio" />

		</td>
        <td colspan ='9' > 
            <div id="info" name="info" />
		</td>
<!--
        <td>
          <a href="/gsword/help/help.xhtml" target="_blank"><g:message code="help" /></a>
        </td>
-->
	</tr>
    <tr >
		<td class ="labelright" title="Input Key word for Bible or Dictionary Lookup">
<g:message code="searchword" />:
        </td>
		<td>
			<input type="text" id="keyword" onblur="searchBible();" onchange="searchBible();"/>
		</td>
		<td  class ="labelright"> <g:message code="bible" />: </td>
		<td title="Select a Bible before search">
			
			<g:select name="books" id="books" class ="books" noSelection='["${version}":"${version}"]'
			  from="${books}" value="name" optionKey="initials" optionValue="name" onchange="searchBible();"  ontouchend="searchBible();" onclick="searchBible();" />
		</td>

		<td  class ="labelright"> <g:message code="parallelbible" />: </td>
		<td title="select a Bible for parallel study">
			<g:select name="parallels" class = "books" onchange="flip_parallel();" ontouchend="flip_parallel();" onclick="flip_parallel();" noSelection="['':'']"
                from="${books}" value="name" optionKey="initials" optionValue="name"/>
		</td>
		<td class ='labelright'>
			<g:message code="choosebook" />: 
		</td>
		<td>
			<g:select name="bibles" id="bibles" class ='bibles' noSelection="['':'']"
              from="${bibles}"  
            optionValue="shortname"
                optionKey="key"
           
              onchange="${remoteFunction(
           controller:'gbook',
           action:'getChaps',
           params:'\'bible=\' + escape(this.value)',
           onComplete:'updateChapters(e)')}"/>
		</td>
<!--
		<td class ="labelright" >
            <g:message code="oneyearbible" />:
		</td>
		<td title="select a bible for daily reading">
			<g:select name="dailyword" class ="dailyword" noSelection="['':'']"
                from="${books}" value="name" optionKey="initials" optionValue="name" onchange="showword(this.value); " />

		</td>
-->
      	<td  class ='dialog' >
            <modalbox:createLink controller="gbook" action="adsearch" title='Advanced Search' width="400" linkname='Advanced Search' />


        </td>
    </tr>
    <tr>
		  
		<td  class ="labelright" title="Input the verses you want to display here">
			<g:message code="verse" />:
		</td>
		<td>
			<input type="text" id="reference" value="${ref}" onchange="locate();" onblur="locate();"/>
		</td>
		<td  class ="labelright"> <g:message code="dictionary" />: </td>
		<td title="Select a dictionary to search the key word">
			<g:select name="dictionaries" id="dictionaries"  class ='dictionaries' noSelection="['easton':'Eastons Bible Dictionary']"
              from="${dictionaries}" value="name" optionKey="initials" optionValue="name"  onchange="searchDictionary();" onclick="searchDictionary();" />
		</td>&nbsp;	  

		<td  class ="labelright">
			<g:message code="commentaries" />:
		</td>
		<td title="Select a commentary">
			<g:select onchange="flip_commentary();" ontouchend="flip_commentary();" onclick="flip_commentary();" name="commentaries" id="commentaries" class ='books'  noSelection="['':'']"
                from="${commentaries}"  value="name" optionKey="initials" optionValue="name" />
		</td>
        <td   class ="labelright">
            <g:message code="choosechapter" />: 
		</td>
		<td>
			<g:select name="chapters" class = 'chapters' noSelection="['':'']"
              from="${chapters}"
				onchange="updateReference(\$(\'bibles\').value+\' \'+ escape(this.value));"/>
		</td>
<!--
	    <td>
        <g:message code="dailyfood" />:
      </td>
      <td  class ='dialog' title="select the Bible version">
                <g:select name="devotion" id="devotion" class ='commentaries'  noSelection="['':'']"
                from="${devotions}" value="name" optionKey="initials" optionValue="name"
				onchange="${remoteFunction(
		           controller:'gbook',
		           action:'devotion',
		           params:'\'devotion=\' + escape(this.value)',
		           onComplete:'updateForm(e)')}"/>

              </td>
      <td>
        <a href="http://bible.ccim.org/" target="_blank"> <g:message code="oldtool" /></a>
      </td>
-->

    </tr>
</table>
<table>
	<tr>
		<td   colspan =4 height =10px></td>
	</tr>
    <tr>
		<td  class ="labelright">
			<g:message code="total" />:&nbsp;<input type="text" id="total" name="total" value="${total}" size=5 readonly/>
		</td>
		<td>
			&nbsp;
			<button type="button" id="prev" onclick="prev();" title="Click for previous 10 verses">< <g:message code="default.paginate.prev" /></button>&nbsp;
			<button type="button" id="next" onclick="nextstep();" title="Click for next 10 verses"><g:message code="default.paginate.next" /> ></button>
		</td>
        <td>
            <button type="button" id="showstrongs" onclick="showstrongs();" title="Click to on/off Strong number. Best used with KJV Bible"><g:message code="strongs" /></button>&nbsp;

        </td>
         <!--td>
            <button type="button" id="showmorph" onclick="showmorph();"><g:message code="morphology" /></button>&nbsp;

         </td-->
        <td>
            <button type="button" id="shownotes" onclick="shownotes();" title="Click to on/off notes. Best used with KJV Bible"><g:message code="notes" /></button>&nbsp;
        </td>
        <td>
            <button type="button" id="showheadings" onclick="showheadings();" title="Click to on/off headings. Best used with KJV Bible"><g:message code="headings" /></button>&nbsp;
        </td>
        <td>
            <button type="button" id="showxref" onclick="showxref();" title="Click to on/off xref. Best used with KJV Bible"><g:message code="xref" /></button>&nbsp;
        </td>
          <td>
              <button type="button" id="showverseline" onclick="showverseline();" title="Click to swith 1 or multiple verses a line"><g:message code="verseperline" /></button>&nbsp;

          </td>

         <td title="Click to generate PowerPoint file">
           <button type="button" id="ppt" onclick="genppt();">PowerPoint</button>&nbsp;
           %{--<button type="button" id="excl" onclick="genexcl();">Excel</button>&nbsp;--}%
          <!--td><button onclick="showcomment();"><g:message code="comment" /></button></td-->
          </td>
          <!--td><button onclick="showhelp();"><g:message code="help" /></button></td-->
          <td><button onclick="showadvsearch();"><g:message code="AdvancedSearch" /></button></td>

    </tr>


</table>

<table>
  <tr> 
  <td width="10" valign="top" title="Select a book to read">
    
      <g:message code="books" />
     <g:if test="${bibles}">
            <g:each in="${bibles}" status ="i" var="b">
            <!--a href="bible://${b.shortname}"  id="b${b}" onClick='return setChaps(&quot;${b.key}&quot;);'>
             ${b.shortname}
           </a-->
            <button id="b${b}" onClick='return setChaps(&quot;${b.key}&quot;);'>
             ${b.shortname}
           </button>
            </g:each>

             </g:if>
  </td>
  <td valign="top" title="Select a chapter to read">
      <table>
   <tr><td id="xchaps" name="xch" valign="top">
      <g:message code="chapters" /><div id="chaps" name="chaps" />
      </td>
</tr>   
<tr>
          <td valign="top" >
    		<div id="display_dict" onkeypress="offBox();" onclick="offBox();" name="display_dict"/>
            <br/>
  </td>
  </tr>
<tr>
          <td valign="top" >
		
    		<div id="auxform" name="auxform"></div>
    		<button id="closeaux" name="closeaux" style="display:none" onclick="offAuxform();">Click Me to close</button>
            <br/>
  </td>
  </tr>
  <tr>
    <td id="display" valign="top">


      <div id="liveform">
	${results.encodeAsRaw()}
      </div>
    </td>
       

  </tr>
</table>
    </td>
</table>
