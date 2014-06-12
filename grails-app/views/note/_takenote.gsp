  <h3><g:message code="notetitle"/></h3>
<br/>
   
   <table>
        <tr>
  <td>Title 

 </td>
            <td>
                <g:textField name="notetitle" value="${note?.title}" onchange="keepnote();"/>
            </td>
        </tr>
       <tr>
           <td>   Email
          </td>
           <td>
               <g:textField name="noteemail" value="${note?.email}" onchange="keepnote();"/>
           </td>
       </tr>
      <tr>
           <td>Notes</td>
           <td>
               <g:textArea name="notetxt" rows="25" cols="50" value="${note?.ref?:''}\n\n${note?.note?:''}" onblur="keepnote();" onchange="keepnote();"/>
           </td>
       </tr>

    </table>
  <table>

     <tr >
         <td>
 <button type="button" onclick="addreftonote();">Append Bible</button>         
         
 <button type="button" onclick="sendnotemail();">Email Note to the Above address</button>         
          <div id="emailnotestatus"/> 
         </td>
     </tr>
<tr><td>Note: CCIM do not keep your note and do not share it with any one!</td></tr>
  </table>
