
#### 2.2.4) Adjusted P values
In this section we provide the adjusted P values for the preceding tests using Hommel's correction.
```{r hpv.adjusted}
variables.list <- c("Patient's age", "Patient's race", "Histologic subtype", "Anatomical site", "Anatomical level", "Histologic grade", "Tumor thickness", "Urethra invasion", "Lymphovascular invasion", "Perineural invasion", "pT stage", "pN stage", "Clinical stage", "Inguinal node dissection", "Nodal metastasis", "Tumor recurrence", "Tumor progression", "Distant metastasis", "Overall mortality", "Cancer-related mortality")
pvalues.hpv <- c(0.4632, 0.8269, 0.0009336, 0.07031, 0.3467, 0.03203, 1, 0.6364, 0.0008174, 0.4119, 0.02969, 0.8238, 0.1487, 1, 1, 0.1453, 0.6918, 0.2528, 1, 0.6231)
pvalues.hpv.adjusted <- p.adjust(pvalues.hpv, method = c("hommel"))
table.hpv.adjusted <- cbind(pvalues.hpv, pvalues.hpv.adjusted)
matrix(data = table.hpv.adjusted, nrow = length(variables.list), ncol = 2, dimnames = list(c(variables.list), c("Raw P values", "Adjusted P values")))
```
***

### 2.3) Association between p16INK4a overexpression and clinicopathological/outcome features
For the columns, "No" indicates no p16INK4a overexpression and "Yes" indicates p16INK4a overexpression. To control for family-wise error rates adjusted P values using Hommel's correction are provided in section 2.3.4)

#### 2.3.1) Clinical features
* Patient's age and p16INK4a
```{r AssociationP16age}
compare.mw(age, p16.pos)
```
* Patient's race and p16INK4a
```{r AssociationP16race}
compare.fisher(race, p16.pos)
```
#### 2.3.2) Pathologic features
* Histologic subtype and p16INK4a
```{r AssociationP16subtype}
compare.fisher(subtype, p16.pos)
```
* Anatomical site and p16INK4a
```{r AssociationP16site}
compare.fisher(site, p16.pos)
```
* Anatomical level and p16INK4a
```{r AssociationP16level}
compare.fisher(level, p16.pos)
```
* Histologic grade and p16INK4a
```{r AssociationP16grade}
compare.fisher(grade, p16.pos)
```
* Tumor thickness and p16INK4a
```{r AssociationP16thickness}
compare.fisher(thick, p16.pos)
```
* Tumor invasion of penile urethra and p16INK4a
```{r AssociationP16urethra}
compare.fisher(urethra, p16.pos)
```
* Lymphovascular invasion and p16INK4a
```{r AssociationP16lvi}
compare.fisher(lvi, p16.pos)
```
* Perineural invasion and p16INK4a
```{r AssociationP16pni}
compare.fisher(pni, p16.pos)
```
* Pathological T stage and p16INK4a
```{r AssociationP16pt}
compare.fisher(tnm.tumor, p16.pos)
```
* Pathological N stage and p16INK4a
```{r AssociationP16pn}
compare.fisher(tnm.nodes, p16.pos)
```
* Clinical stage and p16INK4a
```{r AssociationP16stage}
compare.fisher(stage, p16.pos)
```
* Inguinal lymph node dissection and p16INK4a
```{r AssociationP16dissection}
compare.fisher(dissection.type, p16.pos)
```
* Metastatic inguinal lymph nodes and p16INK4a
```{r AssociationP16lymphnodes}
compare.fisher(nodes, p16.pos)
```
#### 2.3.3) Outcome
* Tumor recurrence and p16INK4a
```{r AssociationP16recurrence}
compare.fisher(recurrence, p16.pos)
```
* Tumor progression and p16INK4a
```{r AssociationP16progression}
compare.fisher(progression, p16.pos)
```
* Distant metastasis and p16INK4a
```{r AssociationP16mets}
compare.fisher(mets, p16.pos)
```
* Overall mortality and p16INK4a
```{r AssociationP16overall}
compare.fisher(dead, p16.pos)
```
* Cancer-related mortality and p16INK4a
```{r AssociationP16cancer}
compare.fisher(died.disease, p16.pos)
```
#### 2.3.4) Adjusted P values
In this section we provide the adjusted P values for the preceding tests using Hommel's correction.
```{r p16.adjusted}
pvalues.p16 <- c(0.2606, 0.001199, 0.005738, 0.2485, 0.1202, 0.004966, 0.1401, 0.7341, 0.002351, 0.3927, 0.02212, 0.1998, 0.168, 0.6699, 0.0608, 1, 0.5502, 0.06637, 0.7785, 0.7137)
pvalues.p16.adjusted <- p.adjust(pvalues.hpv, method = c("hommel"))
table.p16.adjusted <- cbind(pvalues.p16, pvalues.p16.adjusted)
matrix(data = table.p16.adjusted, nrow = length(variables.list), ncol = 2, dimnames = list(c(variables.list), c("Raw P values", "Adjusted P values")))
```
***

## 3) SURVIVAL ANALYSIS
### 3.1) Estimating Survival Functions for HPV/p16 and Outcome
```{r SurvivalRecurrence, echo = TRUE}
# Defining survival object for tumor recurrence
surv.recurrence <- with(penis.data, Surv(date.recurrence.mo, as.numeric(recurrence)))
# Defining survival object for tumor progression
surv.progression <- with(penis.data, Surv(date.progression.mo, as.numeric(progression)))
# Defining survival object for overall mortality
surv.dead <- with(penis.data, Surv(fu.last.mo, as.numeric(dead)))
# Defining survival object for cancer-related mortality
surv.dod <- with(penis.data, Surv(fu.last.mo, as.numeric(died.disease)))
# HPV Status and tumor recurrence
hpv.recurrence <- survfit(surv.recurrence ~ EGFR, data = penis.data)
# HPV Status and tumor progression
hpv.progression <- survfit(surv.progression ~ EGFR, data = penis.data)
# HPV Status and overall mortality
hpv.dead <- survfit(surv.dead ~ EGFR, data = penis.data)
# HPV Status and cancer-related mortality
hpv.dod <- survfit(surv.dod ~ EGFR, data = penis.data)
# p16 expression and Tumor Recurrence
p16.recurrence <- survfit(surv.recurrence ~ p16.pos, data = penis.data)
# p16 expression and tumor progression
p16.progression <- survfit(surv.progression ~ p16.pos, data = penis.data)
# p16 expression and overall mortality
p16.dead <- survfit(surv.dead ~ p16.pos, data = penis.data)
# p16 expression and cancer-related mortality
p16.dod <- survfit(surv.dod ~ p16.pos, data = penis.data)
```

### 3.2) Plotting Survival Functions for HPV/p16 and Outcome
* HPV status and tumor recurrence
```{r Figure1A}
# Log-rank test
survdiff(surv.recurrence ~ EGFR)
# Survival curves
survival.plot(x = hpv.recurrence, title = "HPV Status and Tumor Recurrence", levels = c("HPV Negative", "HPV Positive"))
text("P (log-rank test) = 0.695", x = 9, y = 0.01, cex = 1.25)
```

* HPV status and tumor progression
```{r Figure1B}
# Log-rank test
survdiff(surv.progression ~ EGFR)
# Survival curves
survival.plot(x = hpv.progression, title = "HPV Status and Tumor Progression", levels = c("HPV Negative", "HPV Positive"))
text("P (log-rank test) = 0.06", x = 5, y = 0.01, cex = 1.25)
```

* HPV status and overall mortality
```{r Figure1C}
# Log-rank test
survdiff(surv.dead ~ EGFR)
# Survival curves
survival.plot(x = hpv.dead, title = "HPV Status and Overall Mortality", levels = c("HPV Negative", "HPV Positive"))
text("P (log-rank test) = 0.92", x = 30, y = 0.01, cex = 1.25)
```

* HPV status and cancer-related mortality
```{r Figure1D}
# Log-rank test
survdiff(surv.dod ~ EGFR)
# Survival curves
survival.plot(x = hpv.dod, title = "HPV Status and Cancer-Related Mortality", levels = c("HPV Negative", "HPV Positive"))
text("P (log-rank test) = 0.95", x = 30, y = 0.01, cex = 1.25)
```

* p16 expression and tumor recurrence
```{r Figure1E}
# Log-rank test
survdiff(surv.recurrence ~ p16.pos)
# Survival curves
survival.plot(x = p16.recurrence, title = "p16 Expression and Tumor Recurrence", levels = c("p16 Negative", "p16 Positive"))
text("P (log-rank test) = 0.695", x = 9, y = 0.01, cex = 1.25)
```

* p16 expression and tumor progression
```{r Figure1F}
# Log-rank test
survdiff(surv.progression ~ p16.pos)
# Survival curves
survival.plot(x = p16.progression, title = "p16 Expression and Tumor Progression", levels = c("p16 Negative", "p16 Positive"))
text("P (log-rank test) = 0.23", x = 5, y = 0.01, cex = 1.25)
```

* p16 expression and overall mortality
```{r Figure1G}
# Log-rank test
survdiff(surv.dead ~ p16.pos)
# Survival curves
survival.plot(x = p16.dead, title = "p16 Expression and Overall Mortality", levels = c("p16 Negative", "p16 Positive"))
text("P (log-rank test) = 0.87", x = 30, y = 0.01, cex = 1.25)
```

* p16 expression and cancer-related mortality
```{r Figure1H}
# Log-rank test
survdiff(surv.dod ~ p16.pos)
# Survival curves
survival.plot(x = p16.dod, title = "p16 Expression and Cancer-Related Mortality", levels = c("p16 Negative", "p16 Positive"))
text("P (log-rank test) = 0.39", x = 30, y = 0.01, cex = 1.25)
```

### 3.3) Survival Functions for combined HPV/p16 expression
First we create a new variable containing the 4 possible combinations of HPV/p16 expression (i.e., HPV+/p16+, HPV+/p16-, HPV-/p16+, HPV-/p16-) and we plot the proportions of each level:
```{r, echo = TRUE}
hpv.p16[EGFR == "Yes" & p16.pos == "Yes"] <- "HPV+/p16+"
hpv.p16[EGFR == "Yes" & p16.pos == "No"] <- "HPV+/p16-"
hpv.p16[EGFR == "No" & p16.pos == "Yes"] <- "HPV-/p16+"
hpv.p16[EGFR == "No" & p16.pos == "No"] <- "HPV-/p16-"
table.prop(hpv.p16)
```
As we can see, we have `1` missing value (corresponding to a p16 missing case) and no cases in the `HPV+/p16-` level. Thus, the survival analysis would consider only the 3 observed levels. We then plot the survival curves for these 3 levels, taking into account that these levels were not all present for all outcomes (see below).

* Tumor recurrence and combined HPV/p16 expression
```{r Figure2A}
# Defining survival function
hpvp16.recurrence <- survfit(surv.recurrence ~ hpv.p16, data = penis.data)
# Log-rank test
survdiff(surv.recurrence ~ hpv.p16)
# Survival curves
survival.plot(x = hpvp16.recurrence, title = "Combined HPV/p16 Expression and Tumor Recurrence", levels = c("HPV-/p16-", "HPV+/p16+"))
text("P (log-rank test) = 0.695", x = 9, y = 0.01, cex = 1.25)
```

* Tumor progresion and combined HPV/p16 expression
```{r Figure2B}
# Defining survival function
hpvp16.progression <- survfit(surv.progression ~ hpv.p16, data = penis.data)
# Log-rank test
survdiff(surv.progression ~ hpv.p16)
# Survival curves
survival.plot(x = hpvp16.progression, title = "Combined HPV/p16 Expression and Tumor Progression", levels = c("HPV-/p16-", "HPV-/p16+", "HPV+/p16+"))
text("P (log-rank test) = 0.171", x = 5, y = 0.01, cex = 1.25)
```

* Overall mortality and combined HPV/p16 expression
```{r Figure2C}
# Defining survival function
hpvp16.dead <- survfit(surv.dead ~ hpv.p16, data = penis.data)
# Log-rank test
survdiff(surv.dead ~ hpv.p16)
# Survival curves
survival.plot(x = hpvp16.dead, title = "Combined HPV/p16 Expression and Overall Mortality", levels = c("HPV-/p16-", "HPV-/p16+", "HPV+/p16+"))
text("P (log-rank test) = 0.98", x = 30, y = 0.01, cex = 1.25)
```

* Cancer-related mortality and combined HPV/p16 expression
```{r Figure2D}
# Defining survival function
hpvp16.dod <- survfit(surv.dod ~ hpv.p16, data = penis.data)
# Log-rank test
survdiff(surv.dod ~ hpv.p16)
# Survival curves
survival.plot(x = hpvp16.dod, title = "Combined HPV/p16 Expression and Cancer-Related Mortality", levels = c("HPV-/p16-", "HPV-/p16+", "HPV+/p16+"))
text("P (log-rank test) = 0.578", x = 30, y = 0.01, cex = 1.25)
```

## 4) OUTCOME ANALYSIS USING LOGISTIC REGRESSION
In this section we report the odds ratios for clinicopathologic features, HPV positivity and p16INK4a expression as prognosticators of tumor recurrence, tumor progression, overall mortality and cancer-specific mortality. To control for family-wise error rates adjusted P values using Hommel's correction are provided in section 4.5)

### 4.1) Odds ratios for tumor recurrence
#### 4.1.1) Clinical features
* Patient's age
```{r OddsRecurrenceAge}
logistic(recurrence ~ age, data = penis.data)
```
* Patient's race
```{r OddsRecurrenceRace}
logistic(recurrence ~ race, data = penis.data)
```
#### 4.1.2) Pathologic features
* Histologic subtype
```{r OddsRecurrenceSubtype}
logistic(recurrence ~ subtype, data = penis.data)
```
* Anatomical site
```{r OddsRecurrenceSite}
logistic(recurrence ~ site, data = penis.data)
```
* Anatomical level
```{r OddsRecurrenceLevel}
logistic(recurrence ~ level, data = penis.data)
```
* Histologic grade
```{r OddsRecurrenceGrade}
logistic(recurrence ~ grade, data = penis.data)
```
* Tumor thickness
```{r OddsRecurrenceThickness}
logistic(recurrence ~ thick, data = penis.data)
```
* Tumor invasion of penile urethra
```{r OddsRecurrenceUrethra}
logistic(recurrence ~ urethra, data = penis.data)
```
* Lymphovascular invasion
```{r OddsRecurrenceLVI}
logistic(recurrence ~ lvi, data = penis.data)
```
* Perineural invasion
```{r OddsRecurrencePNI}
logistic(recurrence ~ pni, data = penis.data)
```
* Pathologic pT stage
```{r OddsRecurrencePT}
logistic(recurrence ~ tnm.tumor, data = penis.data)
```
* Pathologic pN stage
```{r OddsRecurrencePN}
logistic(recurrence ~ tnm.nodes, data = penis.data)
```
* Clinical stage
```{r OddsRecurrenceStage}
logistic(recurrence ~ stage, data = penis.data)
```
* Lymph node metastasis
```{r OddsRecurrenceLymphnodes}
logistic(recurrence ~ nodes, data = penis.data)
```
#### 4.1.3) HPV status
```{r OddsRecurrenceHPV}
logistic(recurrence ~ EGFR, data = penis.data)
```
#### 3.1.4) p16IK4a
```{r OddsRecurrenceP16}
logistic(recurrence ~ p16.pos, data = penis.data)
```
***

### 4.2) Odds ratios for tumor progression
#### 4.2.1) Clinical features
* Patient's age
```{r OddsProgressionAge}
logistic(progression ~ age, data = penis.data)
```
* Patient's race
```{r OddsProgressionRace}
logistic(progression ~ race, data = penis.data)
```
#### 3.2.2) Pathologic features
* Histologic subtype
```{r OddsProgressionSubtype}
logistic(progression ~ subtype, data = penis.data)
```
* Anatomical site
```{r OddsProgressionSite}
logistic(progression ~ site, data = penis.data)
```
* Anatomical level
```{r OddsProgressionLevel}
logistic(progression ~ level, data = penis.data)
```
* Histologic grade
```{r OddsProgressionGrade}
logistic(progression ~ grade, data = penis.data)
```
* Tumor thickness
```{r OddsProgressionThickness}
logistic(progression ~ thick, data = penis.data)
```
* Tumor invasion of penile urethra
```{r OddsProgressionUrethra}
logistic(progression ~ urethra, data = penis.data)
```
* Lymphovascular invasion
```{r OddsProgressionLVI}
logistic(progression ~ lvi, data = penis.data)
```
* Perineural invasion
```{r OddsProgressionPNI}
logistic(progression ~ pni, data = penis.data)
```
* Pathologic pT stage
```{r OddsProgressionPT}
logistic(progression ~ tnm.tumor, data = penis.data)
```
* Pathologic pN stage
```{r OddsProgressionPN}
logistic(progression ~ tnm.nodes, data = penis.data)
```
* Clinical stage
```{r OddsProgressionStage}
logistic(progression ~ stage, data = penis.data)
```
* Lymph node metastasis
```{r OddsProgressionLymphnodes}
logistic(progression ~ nodes, data = penis.data)
```
#### 4.2.3) HPV status
```{r OddsProgressionHPV}
logistic(progression ~ EGFR, data = penis.data)
```
#### 4.2.4) p16IK4a
```{r OddsProgressionP16}
logistic(progression ~ p16.pos, data = penis.data)
```
***

### 4.3) Odds ratios for overall mortality
#### 4.3.1) Clinical features
* Patient's age
```{r OddsOverallAge}
logistic(dead ~ age, data = penis.data)
```
* Patient's race
```{r OddsOverallRace}
logistic(dead ~ race, data = penis.data)
```
#### 4.3.2) Pathologic features
* Histologic subtype
```{r OddsOverallSubtype}
logistic(dead ~ subtype, data = penis.data)
```
* Anatomical site
```{r OddsOverallSite}
logistic(dead ~ site, data = penis.data)
```
* Anatomical level
```{r OddsOverallLevel}
logistic(dead ~ level, data = penis.data)
```
* Histologic grade
```{r OddsOverallGrade}
logistic(dead ~ grade, data = penis.data)
```
* Tumor thickness
```{r OddsOverallThickness}
logistic(dead ~ thick, data = penis.data)
```
* Tumor invasion of penile urethra
```{r OddsOverallUrethra}
logistic(dead ~ urethra, data = penis.data)
```
* Lymphovascular invasion
```{r OddsOverallLVI}
logistic(dead ~ lvi, data = penis.data)
```
* Perineural invasion
```{r OddsOverallPNI}
logistic(dead ~ pni, data = penis.data)
```
* Pathologic pT stage
```{r OddsOverallPT}
logistic(dead ~ tnm.tumor, data = penis.data)
```
* Pathologic pN stage
```{r OddsOverallPN}
logistic(dead ~ tnm.nodes, data = penis.data)
```
* Clinical stage
```{r OddsOverallStage}
logistic(dead ~ stage, data = penis.data)
```
* Lymph node metastasis
```{r OddsOverallLymphnodes}
logistic(dead ~ nodes, data = penis.data)
```
#### 4.3.3) HPV status
```{r OddsOverallHPV}
logistic(dead ~ EGFR, data = penis.data)
```
#### 4.3.4) p16IK4a
```{r OddsOverallP16}
logistic(dead ~ p16.pos, data = penis.data)
```
***
 
### 4.4) Odds ratios for cancer-related mortality
#### 4.4.1) Clinical features
* Patient's age
```{r OddsCancerAge}
logistic(died.disease ~ age, data = penis.data)
```
* Patient's race
```{r OddsCancerRace}
logistic(died.disease ~ race, data = penis.data)
```
#### 3.4.2) Pathologic features
* Histologic subtype
```{r OddsCancerSubtype}
logistic(died.disease ~ subtype, data = penis.data)
```
* Anatomical site
```{r OddsCancerSite}
logistic(died.disease ~ site, data = penis.data)
```
* Anatomical level
```{r OddsCancerLevel}
logistic(died.disease ~ level, data = penis.data)
```
* Histologic grade
```{r OddsCancerGrade}
logistic(died.disease ~ grade, data = penis.data)
```
* Tumor thickness
```{r OddsCancerThickness}
logistic(died.disease ~ thick, data = penis.data)
```
* Tumor invasion of penile urethra
```{r OddsCancerUrethra}
logistic(died.disease ~ urethra, data = penis.data)
```
* Lymphovascular invasion
```{r OddsCancerLVI}
logistic(died.disease ~ lvi, data = penis.data)
```
* Perineural invasion
```{r OddsCancerPNI}
logistic(died.disease ~ pni, data = penis.data)
```
* Pathologic pT stage
```{r OddsCancerPT}
logistic(died.disease ~ tnm.tumor, data = penis.data)
```
* Pathologic pN stage
```{r OddsCancerPN}
logistic(died.disease ~ tnm.nodes, data = penis.data)
```
* Clinical stage
```{r OddsCancerStage}
logistic(died.disease ~ stage, data = penis.data)
```
* Lymph node metastasis
```{r OddsCancerLymphnodes}
logistic(died.disease ~ nodes, data = penis.data)
```
#### 4.4.3) HPV status
```{r OddsCancerHPV}
logistic(died.disease ~ EGFR, data = penis.data)
```
#### 4.4.4) p16IK4a
```{r OddsCancerP16}
logistic(died.disease ~ p16.pos, data = penis.data)
```
***

### 4.5) Adjusted P values
The adjusted P values provided here correspond to the variables selected for the manuscript. Adjustment was done using Hommel's correction.

```{r odds.adjusted}
list.variables.odds <- c("Patient's age", "Histologic grade", "Lymphovascular invasion", "Perineural invasion", "Tumor thickness 5-10 mm", "Tumor thickness > 10 mm", "Tumor invasion of penile urethra", "Lymph node metastasis", "HPV status", "p16INK4a expression")
# Raw P values
p.odds.recurrence <- c(0.8127, 0.07333, 0.4886270, 0.7598601, 0.751962, 0.751962, 9.947e-01, 0.84602, 1.127e-01, 0.7300339)
p.odds.progression <- c(0.1489, 0.013970, 0.01753, 0.008719, 0.0896725, 0.0003891, 0.01430, 0.03056, 0.45838, 0.4754)
p.odds.overall <- c(0.4274, 0.7523, 0.5630, 0.5525, 0.1631, 0.5356, 0.1021, 0.5688, 0.8560, 0.7045)
p.odds.cancer <- c(0.03408, 0.063258, 1.438e-02, 0.0317806, 0.346138, 0.024572, 1.891e-02, 0.2232, 0.5768513, 0.525265)
# Adjusted P values
p.odds.adj.recurrence <- p.adjust(p.odds.recurrence, method = c("hommel"))
p.odds.adj.progression <- p.adjust(p.odds.progression, method = c("hommel"))
p.odds.adj.overall <- p.adjust(p.odds.overall, method = c("hommel"))
p.odds.adj.cancer <- p.adjust(p.odds.cancer, method = c("hommel"))
# Binding the raw and adjusted P values
table.odds.recurrence <- cbind(p.odds.recurrence, p.odds.adj.recurrence)
table.odds.progression <- cbind(p.odds.progression, p.odds.adj.progression)
table.odds.overall <- cbind(p.odds.overall, p.odds.adj.overall)
table.odds.cancer <- cbind(p.odds.cancer, p.odds.adj.cancer)
```

* Adjusted P values for TUMOR RECURRENCE
```{r AdjustedOddsRecurrence}
matrix(data = table.odds.recurrence, nrow = length(list.variables.odds), ncol = 2, dimnames = list(c(list.variables.odds), c("Raw P values", "Adjusted P values")))
```

* Adjusted P values for TUMOR PROGRESSION
```{r AdjustedOddsProgression}
matrix(data = table.odds.progression, nrow = length(list.variables.odds), ncol = 2, dimnames = list(c(list.variables.odds), c("Raw P values", "Adjusted P values")))
```

* Adjusted P values for OVERALL MORTALITY
```{r AdjustedOddsOverall}
matrix(data = table.odds.overall, nrow = length(list.variables.odds), ncol = 2, dimnames = list(c(list.variables.odds), c("Raw P values", "Adjusted P values")))
```

* Adjusted P values for CANCER-RELATED MORTALITY
```{r AdjustedOddsCancer}
matrix(data = table.odds.cancer, nrow = length(list.variables.odds), ncol = 2, dimnames = list(c(list.variables.odds), c("Raw P values", "Adjusted P values")))
```
***

## 5) OUTCOME ANALYSIS USING COX REGRESSION
In this section we report the hazard ratios for clinicopathologic features, HPV positivity and p16INK4a expression as prognosticators of tumor recurrence, tumor progression, overall mortality and cancer-specific mortality. To control for family-wise error rates adjusted P values using Hommel's correction are provided in section 5.5)

### 5.1) Hazard ratios for tumor recurrence
```{r HazardRecurrence}
survival.recurrence <- with(Surv(as.numeric(date.recurrence.mo), as.numeric(recurrence)), data = penis.data)
```
#### 5.1.1) Clinical features
* Patient's age
```{r HazardRecurrenceAge}
hazard(survival.recurrence ~ age, data = penis.data)
```
#### 5.1.2) Pathologic features
* Histologic subtype
```{r HazardRecurrenceSubtype}
hazard(survival.recurrence ~ subtype, data = penis.data)
```
* Anatomical site
```{r HazardRecurrenceSite}
hazard(survival.recurrence ~ site, data = penis.data)
```
* Anatomical level
```{r HazardRecurrenceLevel}
hazard(survival.recurrence ~ level, data = penis.data)
```
* Histologic grade
```{r HazardRecurrenceGrade}
hazard(survival.recurrence ~ as.factor(grade), data = penis.data)
```
* Tumor thickness
```{r HazardRecurrenceThickness}
hazard(survival.recurrence ~ thick, data = penis.data)
```
* Tumor invasion of penile urethra
```{r HazardRecurrenceUrethra}
hazard(survival.recurrence ~ urethra, data = penis.data)
```
* Lymphovascular invasion
```{r HazardRecurrenceLVI}
hazard(survival.recurrence ~ lvi, data = penis.data)
```
* Perineural invasion
```{r HazardRecurrencePNI}
hazard(survival.recurrence ~ pni, data = penis.data)
```
* pT stage
```{r HazardRecurrencePT}
hazard(survival.recurrence ~ tnm.tumor, data = penis.data)
```
* pN stage
```{r HazardRecurrencePN}
hazard(survival.recurrence ~ tnm.nodes, data = penis.data)
```
* Clinical stage
```{r HazardRecurrenceStage}
hazard(survival.recurrence ~ stage, data = penis.data)
```
* Lymph node metastasis
```{r HazardRecurrenceLymphnodes}
hazard(survival.recurrence ~ nodes, data = penis.data)
```
#### 5.1.3) HPV status
```{r HazardRecurrenceHPV}
hazard(survival.recurrence ~ EGFR, data = penis.data)
```
#### 5.1.4) p16INk4a overexpression
```{r HazardRecurrenceP16}
hazard(survival.recurrence ~ p16.pos, data = penis.data)
```
***

### 5.2) Hazard ratios for tumor progression
```{r HazardProgression}
survival.progression <- with(Surv(as.numeric(date.progression.mo), as.numeric(progression)), data = penis.data)
```
#### 5.2.1) Clinical features
* Patient's age
```{r HazardProgressionAge}
hazard(survival.progression ~ age, data = penis.data)
```
* Patient's race
```{r HazardProgressionRace}
hazard(survival.progression ~ race, data = penis.data)
```
#### 5.2.2) Pathologic features
* Histologic subtype
```{r HazardProgressionSubtype}
hazard(survival.progression ~ subtype, data = penis.data)
```
* Anatomical site
```{r HazardProgressionSite}
hazard(survival.progression ~ site, data = penis.data)
```
* Anatomical level
```{r HazardProgressionLevel}
hazard(survival.progression ~ level, data = penis.data)
```
* Histologic grade
```{r HazardProgressionGrade}
hazard(survival.progression ~ as.factor(grade), data = penis.data)
```
* Tumor thickness
```{r HazardProgressionThickness}
hazard(survival.progression ~ thick, data = penis.data)
```
* Tumor invasion of penile urethra
```{r HazardProgressionUrethra}
hazard(survival.progression ~ urethra, data = penis.data)
```
* Lymphovascular invasion
```{r HazardProgressionLVI}
hazard(survival.progression ~ lvi, data = penis.data)
```
* Perineural invasion
```{r HazardProgressionPNI}
hazard(survival.progression ~ pni, data = penis.data)
```
* pT stage
```{r HazardProgressionPT}
hazard(survival.progression ~ tnm.tumor, data = penis.data)
```
* pN stage
```{r HazardProgressionPN}
hazard(survival.progression ~ tnm.nodes, data = penis.data)
```
* Clinical stage
```{r HazardProgressionStage}
hazard(survival.progression ~ stage, data = penis.data)
```
* Lymph node metastasis
```{r HazardProgressionLymphnodes}
hazard(survival.progression ~ nodes, data = penis.data)
```
#### 5.2.3) HPV status
```{r HazardProgressionHPV}
hazard(survival.progression ~ EGFR, data = penis.data)
```
#### 5.2.4) p16IK4a overexpression
```{r HazardProgressionP16}
hazard(survival.progression ~ p16.pos, data = penis.data)
```
***

### 5.3) Hazard ratios for overall mortality
```{r HazardOverall}
survival.dead <- with(Surv(as.numeric(fu.last.mo), as.numeric(dead)), data = penis.data)
```
#### 5.3.1) Clinical features
* Patient's age
```{r HazardOverallnAge}
hazard(survival.dead ~ age, data = penis.data)
```
* Patient's race
```{r HazardOverallRace}
hazard(survival.dead ~ race, data = penis.data)
```
#### 5.3.2) Pathologic features
* Histologic subtype
```{r HazardOverallSubtype}
hazard(survival.dead ~ subtype, data = penis.data)
```
* Anatomical site
```{r HazardOverallSite}
hazard(survival.dead ~ site, data = penis.data)
```
* Anatomical level
```{r HazardOverallLevel}
hazard(survival.dead ~ level, data = penis.data)
```
* Histologic grade
```{r HazardOverallGrade}
hazard(survival.dead ~ as.factor(grade), data = penis.data)
```
* Tumor thickness
```{r HazardOverallThickness}
hazard(survival.dead ~ thick, data = penis.data)
```
* Tumor invasion of penile urethra
```{r HazardOverallUrethra}
hazard(survival.dead ~ urethra, data = penis.data)
```
* Lymphovascular invasion
```{r HazardOverallLVI}
hazard(survival.dead ~ lvi, data = penis.data)
```
* Perineural invasion
```{r HazardOverallPNI}
hazard(survival.dead ~ pni, data = penis.data)
```
* pT stage
```{r HazardOverallPT}
hazard(survival.dead ~ tnm.tumor, data = penis.data)
```
* pN stage
```{r HazardOverallPN}
hazard(survival.dead ~ tnm.nodes, data = penis.data)
```
* Clinical stage
```{r HazardOverallStage}
hazard(survival.dead ~ stage, data = penis.data)
```
* Lymph node metastasis
```{r HazardOverallLymphnodes}
hazard(survival.dead ~ nodes, data = penis.data)
```
#### 5.3.3) HPV status
```{r HazardOverallHPV}
hazard(survival.dead ~ EGFR, data = penis.data)
```
#### 5.3.4) p16IK4a overexpression
```{r HazardOverallP16}
hazard(survival.dead ~ p16.pos, data = penis.data)
```
***

### 5.4) Hazard ratios for cancer-related mortality
```{r HazardCancer}
survival.dod <- with(Surv(as.numeric(fu.last.mo), as.numeric(died.disease)), data = penis.data)
```
#### 5.4.1) Clinical features
* Patient's age
```{r HazardCancerAge}
hazard(survival.dod ~ age, data = penis.data)
```
* Patient's race
```{r HazardCancerRace}
hazard(survival.dod ~ race, data = penis.data)
```
#### 5.4.2) Pathologic features
* Histologic subtype
```{r HazardCancerSubtype}
hazard(survival.dod ~ subtype, data = penis.data)
```
* Anatomical site
```{r HazardCancerSite}
hazard(survival.dod ~ site, data = penis.data)
```
* Anatomical level
```{r HazardCancerLevel}
hazard(survival.dod ~ level, data = penis.data)
```
* Histologic grade
```{r HazardCancerGrade}
hazard(survival.dod ~ as.factor(grade), data = penis.data)
```
* Tumor thickness
```{r HazardCancerThickness}
hazard(survival.dod ~ thick, data = penis.data)
```
* Tumor invasion of penile urethra
```{r HazardCancerUrethra}
hazard(survival.dod ~ urethra, data = penis.data)
```
* Lymphovascular invasion
```{r HazardCancerLVI}
hazard(survival.dod ~ lvi, data = penis.data)
```
* Perineural invasion
```{r HazardCancerPNI}
hazard(survival.dod ~ pni, data = penis.data)
```
* pT stage
```{r HazardCancerPT}
hazard(survival.dod ~ tnm.tumor, data = penis.data)
```
* pN stage
```{r HazardCancerPN}
hazard(survival.dod ~ tnm.nodes, data = penis.data)
```
* Clinical stage
```{r HazardCancerStage}
hazard(survival.dod ~ stage, data = penis.data)
```
* Lymph node metastasis
```{r HazardCancerLymphnodes}
hazard(survival.dod ~ nodes, data = penis.data)
```
#### 5.4.3) HPV status
```{r HazardCancerHPV}
hazard(survival.dod ~ EGFR, data = penis.data)
```
#### 5.4.4) p16IK4a overexpression
```{r HazardCancerP16}
hazard(survival.dod ~ p16.pos, data = penis.data)
```
***

### 5.5) Adusted P values
The adjusted P values provided here correspond to the variables selected for the manuscript. Adjustment was done using Hommel's correction.

```{r hazard.adjusted}
list.variables.hazard <- c("Patient's age", "Patient's race", "Tumor thickness 5-10 mm", "Tumor thickness > 10 mm", "Tumor invasion of penile urethra", "Lymphovascular invasion", "Perineural invasion", "Lymph node metastasis", "HPV status", "p16INK4a expression")
# Raw P values
p.hazard.recurrence <- c(0.5091, NA, 0.5321, 0.8957, NA, 0.6975, 0.9183, 0.9996, 0.6975, 0.6975)
p.hazard.progression <- c(0.9504, 0.2828, 0.9987, 0.6521, 0.1393, 0.7147, 0.7919, 0.9942, 0.07895, 0.2342)
p.hazard.overall <- c(0.8616, 0.6328, 0.157643, 0.005606, 0.002801, 0.08435, 0.001002, 0.6939, 0.9277, 0.8658)
p.hazard.cancer <- c(0.06362, 0.9984, 0.11401, 0.00419, 0.007009, 0.0208, 0.003836, 0.1917, 0.9514, 0.396)
# Adjusted P values
p.hazard.adj.recurrence <- p.adjust(p.hazard.recurrence, method = c("hommel"))
p.hazard.adj.progression <- p.adjust(p.hazard.progression, method = c("hommel"))
p.hazard.adj.overall <- p.adjust(p.hazard.overall, method = c("hommel"))
p.hazard.adj.cancer <- p.adjust(p.hazard.cancer, method = c("hommel"))
# Binding the raw and adjusted P values
table.hazard.recurrence <- cbind(p.hazard.recurrence, p.hazard.recurrence)
table.hazard.progression <- cbind(p.hazard.progression, p.hazard.adj.progression)
table.hazard.overall <- cbind(p.hazard.overall, p.hazard.adj.overall)
table.hazard.cancer <- cbind(p.hazard.cancer, p.hazard.adj.cancer)
```

* Adjusted P values for TUMOR RECURRENCE
```{r AdjustedHazardRecurrence}
matrix(data = table.hazard.recurrence, nrow = length(list.variables.hazard), ncol = 2, dimnames = list(c(list.variables.hazard), c("Raw P values", "Adjusted P values")))
```

* Adjusted P values for TUMOR PROGRESSION
```{r AdjustedHazardProgression}
matrix(data = table.hazard.progression, nrow = length(list.variables.hazard), ncol = 2, dimnames = list(c(list.variables.hazard), c("Raw P values", "Adjusted P values")))
```

* Adjusted P values for OVERALL MORTALITY
```{r AdjustedHazardOverall}
matrix(data = table.hazard.overall, nrow = length(list.variables.hazard), ncol = 2, dimnames = list(c(list.variables.hazard), c("Raw P values", "Adjusted P values")))
```

* Adjusted P values for CANCER-RELATED MORTALITY
```{r AdjustedHazardCancer}
matrix(data = table.hazard.cancer, nrow = length(list.variables.hazard), ncol = 2, dimnames = list(c(list.variables.hazard), c("Raw P values", "Adjusted P values")))
```
***
