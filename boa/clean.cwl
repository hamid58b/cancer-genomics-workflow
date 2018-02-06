cwlVersion: v1.0
class: CommandLineTool

label: 'Data Cleaning'

inputs:
    GFF_Files:
        type: File[]
    Fasta_Files: 
        type: File[]
    Assembly_Stats_Files: 
        type: File[]

  
outputs:
    GFF_Files:
        type: File[]
    Fasta_Files: 
        type: File[]
    Assembly_Stats_Files: 
        type: File[]
