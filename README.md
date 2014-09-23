## EGFR in Penile SCC

### Description
This repository, currently **under preparation**, contains information on patients with penile squamous cell carcinoma (SCC) in whom EGFR expression was assessed. The repository contains the following files, pages, and folders:

* [Results:](https://github.com/alcideschaux/PenisEGFR/blob/master/EGFRpenis.md) This page contains the results of the analysis.
* [Codebook:](https://github.com/alcideschaux/PenisEGFR/blob/master/CODEBOOK.md) This page contains the description of the variables with labels and levels.
* [Dataset:](https://github.com/alcideschaux/PenisEGFR/blob/master/PenisDataset.csv) This file corresponds to the dataset that it is used for analysis.
* [Figures:](https://github.com/alcideschaux/PenisEGFR/tree/master/figure) This folder contains the figures (survival curves) in PNG format.
* [R code:](https://github.com/alcideschaux/PenisEGFR/blob/master/EGFRpenis.Rmd) This file contains the R code that was used for analysis.

### Aim
The aim of this project is to evaluate EGFR immunohistochemical expression, accessing the relationship between EGFR and clinicopathologic and outcome features, and building prognostic models of penile cancer recurrence, progression, dissemination, and outcome, including overall mortality and cancer-related mortality.

### Material & Method
#### Patient cohort
Fifty-nine in situ and invasive penile squamous cell carcinomas from fifty-three different patients diagnosed between 1985 and 2013 were retrieved from our surgical pathology archives. Histologic subtyping was carried out in whole tissue sections using the morphologic criteria presented in the Atlas of Tumor Pathology of the Armed Forces Institute of Pathology. Other pathologic features of the tumor were also re-assessed to include tumor grade, tumor thickness, presence of angiolymphatic and perineural invasion, extent of invasion, urethral involvement, presence of metastasis, and pathologic and clinical stage.

Representative formalin-fixed, paraffin-embedded archival blocks were used for the construction of two high-density tissue microarrays (TMAs). Tumors and paired nonneoplastic tissue were spotted 3 to 5 times each using 1.6-mm cores.

Electronic medical records were reviewed for pertinent clinical information including age, gender, anatomical site of involvement, date of surgery, type of treatment, recurrence, progression, death status, cause of death and last follow up date. Recurrence was defined as development of a new tumor in the same location as the prior tumor (local recurrence). Progression was defined as the presence of local or distant metastasis after the primary treatment.

#### Immunohistochemistry for EGFR expression
Immunohistochemistry for EGFR expression was carried out on unstained 4-μm-thick TMA tissue sections. Immunohistochemical expression was evaluated using a monoclonal mouse anti-EGFR antibody (DAKO, Carpinteria, CA) on a Dako autostainer. Briefly, after baking and deparaffinization sections were hydrated and incubated for 30 minutes with the primary antibody. The reaction was developed with EGFR polymer detection kit and visualized with DAB (DAKO, Carpinteria, CA). Negative and positive controls provided by the manufacturer were used as indicated.

Using previously published and validated criteria (Hum Pathol 2013;44:2690-5) membranous EGFR expression was evaluated taking into account staining completeness (from 0 to 10 points) and staining intensity (from 0 to 10 points). Both scores were added for a combined score (0–20 points). The final score represented the pooled median of all TMA spots correspondind to the same case. Cases were classified as follows: negative EGFR expression, 0–3 points; low EGFR expression, 4–8 points; high EGFR expression, 9–20 points.

#### Statistical analysis
Associations between variables were evaluated using the Kruskal-Wallis test and the Fisher's exact test. Predictor variables were grouped in clinical features (age and race), pathologic features (histologic subtype, anatomical site, anatomical level, histologic grade, tumor thickness, tumor invasion of penile urethra, lymphovascular invasion, perineural invasion, pT stage, pN stage, clinical stage, and inguinal lymph node metastasis), HPV status, and EGFR expression. For time-to-event analysis endpoints included tumor recurrence, tumor progression, distant metastasis, overall mortality, and cancer-related mortality.

Survival curves were built using the Kaplan-Meier method and compared using the log-rank (Mantel-Cox) test. Odds ratios and hazard ratios were estimated using unconditional logistic regression and Cox's proportional hazard regression, respectively, for each of the aforementioned endpoints. A 2-tailed P < 0.05 was required for statistical significance. Raw P values were adjusted using Hommel's correction to control for family-wise error rates.

Data were analyzed by [Alcides Chaux](https://github.com/alcideschaux) using R Version 3.1.1 “Sock it to Me” (R Foundation for Statistical Computing, Vienna, Austria).

### Researchers
* Nilda Gonzalez-Roibon<sup>1</sup>
* Alcides Chaux<sup>1,2</sup>
* Mark W. Ball<sup>3</sup>
* Sheila F. Faraj<sup>1</sup>
* Stephania M. Bezerra<sup>1</sup>
* Enrico Munari<sup>1</sup>
* Rajni Sharma<sup>1</sup>
* Trinity J. Bivalacqua<sup>3</sup>
* Arthur L. Burnett<sup>3</sup>
* George J. Netto<sup>1,2,3</sup>

<sup>1</sup>Department of Pathology, The Johns Hopkins Medical Institutions, Baltimore, MD 21231  
<sup>2</sup>Norte University, Office of Scientific Research, Asunción, Paraguay  
<sup>3</sup>Department of Urology, The Johns Hopkins Medical Institutions, Baltimore, MD 21231  
<sup>4</sup>Department of Oncology, The Johns Hopkins Medical Institutions, Baltimore, MD 21231