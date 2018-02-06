cwlVersion: v1.0

class: CommandLineTool
baseCommand: echo

label: 'Query Processing'

inputs:
    Schema:
        type: File
    sequence_file:
        type: File
outputs:
    Summary_Stats:
        type: File
