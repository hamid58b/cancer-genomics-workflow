cwlVersion: v1.0

class: CommandLineTool
baseCommand: echo

label: 'Schema and Compiler Generator'

inputs:
    Gene_Ontology:
        type: File
    sequence_file:
        type: File
outputs:
    Summary_Stats:
        type: File
