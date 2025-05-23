**EMSeq Data Analysis for Liquid Biopsy in Pediatric Tumors**

This repository contains code and results for analysis of EMSeq (Enzymatic Methyl-seq) data from liquid biopsy samples in pediatric tumors.

## Table of Contents

- [Project Overview](#project-overview)
- [Directory Structure](#directory-structure)
- [Code Modules](#code-modules)
- [Data Files](#data-files)
- [Results](#results)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The goal of this project is to perform comprehensive DNA methylation analysis using EMSeq data derived from liquid biopsy samples of pediatric tumors. Analyses include read alignment, quality control, differential methylation region (DMR) detection, and copy number variation (CNV) calling.

**Main directories:**

- `/omics/odcf/analysis/OE0290_projects/pediatric_tumor/whole_genome_biosulfite_sequencing/`
- `/omics/odcf/analysis/OE0290_projects_temp/pediatric_tumor/EMseq/`


## Directory Structure

- **codes/**
  - **nextflow/**: nf-core/methylseq pipeline  
  - **dmr/**: DMR analysis scripts  
  - **qc_summary/**: QC summary scripts  
  - **sample_prep/**: Input preparation for pipelines  
  - **cnv_calling/**
    - **cfdna/**: cfDNA CNV calling tool  

- **data/**
  - **methylation_calls/**: Normalized tables for DMR analysis  

- **datasets/**
  - **samples_sheet.tsv**: Sample metadata manifest  

- **results/**
  - **nextflow/**
    - **bismark/**
      - **deduplicated/**: BAMs for CNV calling  
      - **methylation_calls/**: Cytosine calls for DMR analysis  
  - **dmr/**
    - **figures/**: DMR plots & heatmaps  
  - **biscuit_pipeline/**: Biscuit benchmarking scripts  

- **README.md**: This file




---

## Code Modules

### 1. `codes/nextflow`
- Implements the [nf-core/methylseq](https://github.com/nf-core/methylseq) pipeline using Nextflow.
- Produces alignment (Bismark), deduplication, and methylation call outputs.

### 2. `codes/dmr`
- Scripts for identifying and annotating differentially methylated regions across samples.

### 3. `codes/qc_summary`
- Aggregates QC metrics (e.g., coverage, duplication rate) across EMSeq samples into summary reports.

### 4. `codes/sample_prep`
- Generates input manifests and FASTQ file lists required by the Nextflow pipeline.

### 5. `codes/cnv_calling`
- Focuses on CNV detection from cfDNA data.
- **Use the `cfdna/` tool**—other scripts or tools in this directory are deprecated for liquid biopsy analyses.

---

## Data Files
- **Normalized methylation calls** are stored in `data/methylation_calls/`. These tables are used as input for downstream DMR analysis in the `codes/dmr/` module.
- **Sample sheets** in `datasets/` define sample metadata (IDs, paths, groups) for pipeline runs.

---

## Results

### Nextflow Pipeline Outputs (`results/nextflow`)
- **`bismark/deduplicated/`**: Deduplicated BAM files for CNV calling.
- **`bismark/methylation_calls/`**: Cytosine call files for DMR analysis.

### DMR Analysis (`results/dmr`)
- **Figures**: Plots and heatmaps summarizing differentially methylated regions.

### Biscuit Pipeline (`results/biscuit_pipeline`)
- Prototype scripts for running the [Biscuit](https://huishenlab.github.io/biscuit/) toolchain. Modify and re-run these to benchmark against Nextflow results.

---

