package gsword

import java.util.Random  
class InclosetController {
    def grailsApplication
    def readFile(filename){
    	def root= grailsApplication.config.inclosetroot
	new File(root+filename).text
	}
    def index() {
Random rand = new Random()  
def data=[ readFile('/theattributeofgod/s'+rand.nextInt(233+1)+'.txt'),
readFile('/theattributeofgod/s'+rand.nextInt(233+1)+'.txt'),
readFile('/workofgod/s'+rand.nextInt(342+1)+'.txt'),
readFile('/workofgod/s'+rand.nextInt(342+1)+'.txt'),
readFile('/myrelationtogod/s'+rand.nextInt(516+1)+'.txt'),
readFile('/myrelationtogod/s'+rand.nextInt(516+1)+'.txt'),
readFile('/thecharacteriwanttocultivate/s'+rand.nextInt(370+1)+'.txt'),
readFile('/thecharacteriwanttocultivate/s'+rand.nextInt(370+1)+'.txt'),
readFile('/myrelationshiptoothers/s'+rand.nextInt(203+1)+'.txt'),
readFile('/myrelationshiptoothers/s'+rand.nextInt(203+1)+'.txt')]
render (view:'index',model:[verses:data,metadesc:"Pray Scripture His Word God Spiritual Growth"])
 }
}
