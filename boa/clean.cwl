
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [CMD_PREFIXreadfile]

label: 'Data Cleaning'

inputs:
    GFF_Files1:
        type: File[]
    Fasta_Files1: 
        type: File[]
    Assembly_Stats_Files1: 
        type: File[]

  
outputs:
    GFF_Files1:
        type: File[]
    Fasta_Files1: 
        type: File[]
    Assembly_Stats_Files1: 
        type: File[]
