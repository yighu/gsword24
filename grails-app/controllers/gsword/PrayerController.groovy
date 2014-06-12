package gsword
class PrayerController {
def grailsApplication
def prayerindex(){
def file=new File(grailsApplication.config.prayerroot.toString() +"/prayerindex.txt")
if(!file.isFile())file.write("0");
def index=file?.text
if(!index){
	index="1"
}
int i=index.toInteger()
if(i>92)i=0
//i++
//file.write(""+i);
i
}
def intro={
def file=grailsApplication.config.prayerroot+"/intro.htm"
def txt=new File(file).text?.replaceAll("�","")
render (view:'index',model:[txt:txt,metadesc:"Pray Scripture His Word Spiritual growth"])
}

def today={

def i=prayerindex()
def file=grailsApplication.config.prayerroot+"/day${i}.htm"
render new File(file).text
}
    def index = {

def i=params.i
try{
if (!i?.isInteger()) i=prayerindex()
if(i.toInteger()>93||i.toInteger()<0)i=prayerindex()
}catch (Exception e){}
def file=grailsApplication.config.prayerroot+"/day${i}.htm"
def txt=new File(file).text?.replaceAll("�","")
render (view:'index',model:[txt:txt,metadesc:"Pray Scripture His Word Spiritual Growth"])
 }
}
