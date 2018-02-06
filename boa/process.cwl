cwlVersion: v1.0

class: CommandLineTool
baseCommand: echo

label: 'Data Processing'

inputs:
    GFF_Files:
        type: File[]
    Fasta_Files: 
        type: File[]
    Assembly_Stats_Files: 
        type: File[]
    Taxonomy_database: 
        type: File
    
  
outputs:
    Summary_stats:
        type: File
