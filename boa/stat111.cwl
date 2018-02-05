cwlVersion: v1.0
class: Workflow

inputs:
  GFFs: File

outputs:
  output_file:
    type: File
    outputSource: md5sum/output_file

steps:
  md5sum:
    run: dockstore-tool-md5sum.cwl
    in:
      GFFs: GFFs
    out: [output_file]
