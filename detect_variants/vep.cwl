#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: "Ensembl Variant Effect Predictor"
baseCommand: ["/home/vep/src/ensembl-vep/vep", "-I", "/home/vep/Plugins"]
requirements:
    - class: InlineJavascriptRequirement
    - class: DockerRequirement
      dockerPull: "mgibio/vep-cwl:v90"
arguments:
    ["--format", "vcf",
    "--vcf",
    "--plugin", "Downstream",
    "--plugin", "Wildtype",
    "--symbol",
    "--term", "SO",
    "--flag_pick",
    "-o", { valueFrom: $(runtime.outdir)/annotated.vcf }]
inputs:
    vcf:
        type: File
        inputBinding:
            prefix: "-i"
            position: 1
    cache_dir:
        type: Directory?
        inputBinding:
            valueFrom: |
                ${
                    if (inputs.cache_dir) {
                        return ["--offline", "--cache", "--max_af", "--af_gnomad", "--af_1kg", "--dir", inputs.cache_dir ]
                    }
                    else {
                        return "--database"
                    }
                }
            position: 4
    synonyms_file:
        type: File?
        inputBinding:
            prefix: "--synonyms"
            position: 2
    coding_only:
        type: boolean
        inputBinding:
            prefix: "--coding_only"
            position: 3
        default: false
    hgvs:
        type: boolean?
        inputBinding:
            valueFrom: |
                ${
                    if (inputs.hgvs) {
                        if (inputs.cache_dir) {
                            return ["--hgvs", "--fasta", inputs.reference]
                        }
                        else {
                            return ["--hgvs"]
                        }
                    }
                    else {
                        return []
                    }
                }
            position: 5
    reference:
        type: string?
outputs:
    annotated_vcf:
        type: File
        outputBinding:
            glob: "annotated.vcf"
    vep_summary:
        type: File
        outputBinding:
            glob: "annotated.vcf_summary.html"
