<h3>Advanced Search</h3>
    <table>
        <tr>
  <td>

              Include phrase
  </td>
            <td>
                <g:textField name="phrase" onblur="doSearch();"/>
            </td>
        </tr>
       <tr>
           <td>
               Includes words
           </td>
           <td>
               <g:textField name="inwords" onblur="doSearch();"/>
           </td>
       </tr>
      <tr>
           <td>
               Excludes words
           </td>
           <td>
               <g:textField name="exwords" onblur="doSearch();"/>
           </td>
       </tr>
      <tr>
           <td>
               like this
           </td>
           <td>
               <g:textField name="seems" onblur="doSearch();"/>
           </td>
       </tr>
      <tr>
           <td>
               Includes words start with
           </td>
           <td>
               <g:textField name="starts" onblur="doSearch();"/>
           </td>
       </tr>
    </table>
  <table>
      <tr>
          <td>
              Range
          </td>
          <td>
              <%
                   def books = org.crosswire.bibledesktop.book.Msg.PRESETS.toString().split("\\|")
              %>
            <g:select name="range"
                           from="${books}" onchange="doSearch();" onblur="doSearch();"/>
               
          </td>
</tr><tr>
  <td id="xcustomrange" name="xcustomrange" style="visibility:hidden;display:none;">
         <g:textField id="customrange" name="customrange" />
         </td>

      </tr>
     
  </table>

