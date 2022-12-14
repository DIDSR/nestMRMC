% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TheoreticalAUCVarRcpp.R
\name{true_AUC_var_abitrary_Rcpp}
\alias{true_AUC_var_abitrary_Rcpp}
\title{Calculate the between-cases AUC estimator's theoretical variance and covariance}
\usage{
true_AUC_var_abitrary_Rcpp(
  numROI,
  AUC = 0.7,
  cov = 0.5,
  rho = 0.5,
  sigma_pos = 1,
  sigma_neg = 1
)
}
\arguments{
\item{numROI}{The number of positive and negative ROIs in all the patients.}

\item{AUC}{The AUC values used in simulated data.}

\item{cov}{The covariance used in simulating reading scores.}

\item{rho}{The scale factor used in simulating reading scores.}

\item{sigma_pos}{The variacne for positive ROI's reading score, defalut is 1.}

\item{sigma_neg}{The variacne for negative ROI's reading score, defalut is 1.}
}
\value{
The theoretical AUC estimator's (co)variance based on the simulation settings.
}
\description{
This function calculates between-cases AUC estimator's theoretical variance and covariance based on all the truths, namely, the ROI's truth labels, AUC values, covariance between ROI scores
within same reader, scale factor that influences the covariance between ROI scores between readers and the variances for
positive and negative ROI scores. Detailed formulas are available in following paper: Single Reader Between-Cases AUC Estimator with Nested Data. Statistical Methods in Medical Research. https://doi.org/10.1177/09622802221111539.
There is also a none Rcpp version of this function in this package. The function name is 'true_AUC_var_abitrary', which is slower but no need to install Rcpp. They produce the exact same results.
}
