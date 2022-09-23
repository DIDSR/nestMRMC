# NestMRMC

This repo is the R package for the methodology in the paper, "Single Reader Between-Cases AUC Estimator with Nested Data", accepted by Statistical Methods in Medical Research  Journal. The paper is available at this [link](https://doi.org/10.1177/09622802221111539). 

Please check out a statement of the licenses related to our software [here](https://github.com/DevinHFD/NestMRMC_DEV/blob/master/LICENSE.md).



# Citation
To cite our work:

  Du, Hongfei, Si Wen, Yufei Guo, Fang Jin, and Brandon D Gallas. “Single Reader Between-Cases AUC Estimator with Nested Data.” Statistical Methods in Medical Research, (July 2022). https://doi.org/10.1177/09622802221111539.

## BibTex citation 
  ```
  @article{du2022single,
  title={Single reader between-cases AUC estimator with nested data},
  author={Du, Hongfei and Wen, Si and Guo, Yufei and Jin, Fang and Gallas, Brandon D},
  journal={Statistical Methods in Medical Research},
  pages={09622802221111539},
  year={2022},
  publisher={SAGE Publications Sage UK: London, England}
}
  ```


# Introduction

 The area under the receiver operating characteristic curve (AUC) is widely used in evaluating diagnostic performance for many clinical tasks. It is still challenging to evaluate the reading performance of distinguishing between positive and negative regions of interest (ROIs) in the nested-data problem, where multiple ROIs are nested within the cases. To address this issue, we identify two kinds of AUC estimators, within-cases AUC and between-cases AUC. We focus on the between-cases AUC estimator, since our main research interest is in patient-level diagnostic performance rather than location-level performance (the ability to separate ROIs with and without disease within each patient). Another reason is that as the case number increases, the number of between-cases paired ROIs is much larger than the number of within-cases ROIs. We provide estimators for the variance of the between-cases AUC and for the covariance when there are two readers. We derive and prove the above estimators' theoretical values based on a simulation model and characterize their behavior using Monte Carlo simulation results. 
 
In this R package, we code all above calculations. 



# Installation
If you are starting with source, please roxygenize the package before building.
```
roxygen2::roxygenize('.', roclets = c('rd', 'collate', 'namespace', 'vignette'))
```

Build the package from your local operating system command line. This 
command works on Windows or you can use the Build tools in Rstudio:
```
"C:\Program Files\R\R-4.2.1\bin\x64\Rcmd.exe" INSTALL --preclean --no-multiarch --with-keep.source .\
```

# Usage Example
After the package is installed, you can follow the example below.

## Simulate data

The command below uses a default configuration.
Of course, you can specify your own configuration.
The parameters are organized in a list `sim.confg`. 

```
# I [num] The number of patients.
# k [num] The number of ROIs in each patient.
# R [num] The number of readers.
# correlation_t [num] The correlation for simulating truth label.
# potential_correlation_s [num] The correlation for simulating reading scores.
# AUC_all [num] The theoretical AUC values.
# sameclustersize [boolean] The binary variable to decide whether we have same number of ROIs in each patient.
# rho [num] The scale parameter that infulence the covariance matrix in multivariate normal distribution.
# fix_design [boolean] Binary variable to decide whether fix the truth label in simulation.
# stream [num] The integer control the random number generator.

library(NestMRMC)
sim.config = simu_config()
data = data_MRMC(sim.config)$data_final

```

## Between-cases AUC estimate calculation

Calculate single reader between-cases AUC estimates, corresponding variance
and covariance estimates among paired readers. The number of positive and negative 
regions of interest (ROI) in each case is also available in outputs.

```
Outputs = AUC_per_reader_nest(data)
```

## AUC esitmates

```
Outputs$AUC
```

The row names `mod1` and `mod2` refer to modality 1 and 2. There is only one
modality in the dataset, so the results for `mod2` are empty.

## Variance esitmates and covariance esitmates among paired readers

```
Outputs$Var
```

## Number of ROIs in each case

```
Outputs$numROI
```

## Theoretical (co)variance calculation for between-cases AUC estimator

There are two versions of functions to calculate the theoretical (co)variance
One is the Rcpp based and the other one is for loop based.
They outputs exactly same results, while the Rcpp based version is much faster
than the for loop based version. 

**Rcpp version**
```
true_AUC_var_abitrary_Rcpp(Outputs$numROI, AUC = 0.7, cov = 0.5,
                                 rho = 0.5, sigma_pos = 1, sigma_neg = 1)
```

**For loop version**
```
true_AUC_var_abitrary(Outputs$numROI, AUC = 0.7, cov = 0.5,
                                 rho = 0.5, sigma_pos = 1, sigma_neg = 1)
```
