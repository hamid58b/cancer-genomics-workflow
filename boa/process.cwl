cwlVersion: v1.0

class: CommandLineTool
baseCommand: echo

label: 'Data Processing'

inputs:
    GFFs:
        type: File[]
    Fasta: 
        type: File[]
    Assembly_Stats: 
        type: File[]
    Taxonomy_database: 
        type: File
    
  
outputs:
    Summary_stats:
        type: File
