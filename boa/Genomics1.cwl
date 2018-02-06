cwlVersion: v1.0
class: Workflow

inputs:
  GFF_Files: File[]
  Fasta_Files: File[]
  Assembly_Stats_Files: File[]
  Taxonomy_database: File
  Gene_Ontology: File
  

outputs:
  Summary_stats:
    type: File
    outputSource: process/Summary_Stats
  
    
steps:
  cleaning:
    run: clean.cwl
    in:
      GFF_Files: GFF_Files
      Fasta_Files: Fasta_Files
      Assembly_Stats_Files: Assembly_Stats_Files
    out: [GFFs,Fasta,Assembly_Stats]
    
  schema_gen:
    run: schema.cwl
    in:
      Gene_Ontology: Gene_Ontology
    out: [Schema]  
  
  data_gen:
    run: data_gen.cwl
    in:
      Taxonomy_database: Taxonomy_database
      GFFs: cleaning/GFFs
      Fasta: cleaning/Fasta
      Assembly_Stats: cleaning/Assembly_Stats
      Schema : schema_gen/Schema
    out: [Hadoop_Sequence_File]  
  
  process:
    run: process.cwl
    in:
      sequence_file: data_gen/Hadoop_Sequence_File
      Schema: schema_gen/Schema
     
    out: [Summary_Stats]  
  
