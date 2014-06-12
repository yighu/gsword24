package gsword
import grails.converters.*
class NoteController {

    def index() { }
    def takenote() {
	def result=new HashMap()
	def biblenote
	if(session.biblenote)biblenote=session.biblenote
	def noteform=g.render(template: "takenote", model:[note:biblenote])
	result.put("data",noteform)
	render result as JSON	
	 }
    def keepnote(){
	session.biblenote=params
	def result=new HashMap()
	result.put("data","note is cached")
	render result as JSON	
	}
    def emailnote(){
	def ORIGIN="\nGSword Online Bible Studio http://www.ccimweb.org/gsword\n"
	def msg="The note is emailed successfully."
	def address=request.remoteHost
try{
	println "email note to email:"+session.biblenote?.email +"\n from "+address
if(session.biblenote?.note&&session.biblenote?.email) sendMail {
        to session.biblenote?.email
        from "mailman@ccim.org"
        subject session.biblenote?.title
        body session.biblenote?.note +"\n"+ORIGIN +" \n"+address
   } } catch (Exception e) {
	msg="Sorry email note not successful."
	e.printStackTrace()
    }
	def result=new HashMap()
	result.put("data",msg)
	render result as JSON	
}
}
