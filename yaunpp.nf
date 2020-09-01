#!/usr/bin/env nextflow
params.faa="$launchDir/faa"
params.cds="$launchDir/cds"

process run_broccoli {
  publishDir "$launchDir/results/broccoli", mode: 'copy'
  
  conda 'ete3 fasttree diamond python=3.6'

  input:
  path faa from params.faa
  
  output:
  file '**/*.txt' into broccoli_out
 
  shell:
  """
     python $projectDir/scripts/broccoli/broccoli.py -dir !{faa}
  """  
}
