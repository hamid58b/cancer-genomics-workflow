cwlVersion: v1.0

class: CommandLineTool
baseCommand: echo

label: 'Schema and Compiler Generator'

inputs:
    Schema:
        type: File
    
outputs:
    Schema:
        type: File
