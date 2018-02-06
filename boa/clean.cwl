
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [tar]

label: 'Data Cleaning'

inputs:
    GFF_Files1:
        type: File[]
    Fasta_Files1: 
        type: File[]
    Assembly_Stats_Files1: 
        type: File[]

  
outputs:
    GFF_Files2:
        type: File[]
    Fasta_Files2: 
        type: File[]
    Assembly_Stats_Files2: 
        type: File[]
