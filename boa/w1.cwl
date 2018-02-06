cwlVersion: v1.0
class: Workflow

inputs:
  GFF_Files: File[]
  Fasta_Files: File[]
  Assembly_Stats_Files: File[]
  Taxonomy_database: File[]
  

outputs:
  Summary_stats:
    type: File
    outputSource: processing/stats
  
    
steps:
  cleaning:
    run: clean.cwl
    in:
      GFF_Files: GFF_Files
      Fasta_Files: Fasta_Files
      Assembly_Stats_Files: Assembly_Stats_Files
    out: [GFFs,Fasta,Assembly_Stats]
    
  processing:
    run: process.cwl
    in:
      Taxonomy_database: Taxonomy_database
      GFFs: cleaning/GFFs
      Fasta: cleaning/Fasta
      Assembly_Stats: cleaning/Assembly_Stats
    out: [stats]  
