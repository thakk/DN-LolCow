$HOSTNAME = ""
params.outdir = 'results'  





process LolCow {

publishDir params.outdir, overwrite: true, mode: 'copy',
	saveAs: {filename ->
	if (filename =~ /cowsay.txt$/) "Results/$filename"
}


output:
 file "cowsay.txt"  into g_0_txtFile

"""
fortune | cowsay | lolcat > cowsay.txt

"""
}


workflow.onComplete {
println "##Pipeline execution summary##"
println "---------------------------"
println "##Completed at: $workflow.complete"
println "##Duration: ${workflow.duration}"
println "##Success: ${workflow.success ? 'OK' : 'failed' }"
println "##Exit status: ${workflow.exitStatus}"
}
