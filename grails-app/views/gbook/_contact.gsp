  <h3>Please let us know your feedback & suggestions!</h3>
<br/>
   <table>
        <tr>
  <td> Name

 </td>
            <td>
                <g:textField name="username" />
            </td>
        </tr>
       <tr>
           <td>   Email
          </td>
           <td>
               <g:textField name="useremail"/>
           </td>
       </tr>
      <tr>
           <td> Comment       </td>
           <td>
               <g:textArea name="usercomment" rows="25" cols="50"/>
           </td>
       </tr>

    </table>
  <table>

     <tr >
         <td>
 <button type="button" id="sendemail" onclick="sendmail();">Submit</button>         </td>
         <td>
          <div id="emailstatus"/> 
         </td>
     </tr>
  </table>
