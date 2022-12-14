% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reconciliation_liu.R
\name{reconcile2}
\alias{reconcile2}
\alias{reconcile2.mdl_df}
\title{Forecast reconciliation}
\usage{
reconcile2(.data, ...)

\method{reconcile2}{mdl_df}(.data, ...)
}
\arguments{
\item{.data}{A mable.}

\item{...}{Reconciliation methods applied to model columns within \code{.data}.}
}
\description{
This function allows you to specify the method used to reconcile forecasts
in accordance with its key structure.
}
\examples{
\dontshow{if (requireNamespace("fable", quietly = TRUE)) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
library(fable)
lung_deaths_agg <- as_tsibble(cbind(mdeaths, fdeaths)) \%>\%
  aggregate_key(key, value = sum(value))

lung_deaths_agg \%>\%
  model(lm = TSLM(value ~ trend() + season())) \%>\%
  reconcile2(lm = min_trace(lm)) \%>\% 
  forecast()
\dontshow{\}) # examplesIf}
}
