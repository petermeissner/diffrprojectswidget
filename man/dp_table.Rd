% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dp_table.R
\name{dp_table}
\alias{dp_table}
\title{function for tabulation}
\usage{
dp_table(dp, link = NULL, align_var = FALSE, text_var = FALSE,
  aggregate_function = NULL, ..., width = "100\%", height = "400px")
}
\arguments{
\item{dp}{an object of type diffrproject}

\item{link}{which link to produce table for}

\item{align_var}{either a character vector of variable names or TRUE for all}

\item{text_var}{either a character vector of variable names or TRUE for all}

\item{aggregate_function}{a function able to resolve conflicts if for a
specific variable for a token of text severla values exist, if NULL it
defaults to modus() but could also be e.g. paste or something alike}

\item{...}{further arguments passed through to aggregate_function}

\item{width}{width of widget}

\item{height}{heigth of widget}
}
\description{
function for tabulation
}

