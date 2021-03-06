% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subsetTopNAndJoinDataTOresult.R
\name{subsetTopNAndJoinDataTOresult}
\alias{subsetTopNAndJoinDataTOresult}
\title{subsetTopNAndJoinDataTOresult}
\usage{
subsetTopNAndJoinDataTOresult(list_data, data2join, key, top_n_rows = 3)
}
\arguments{
\item{list_data}{list containing data.frames}

\item{data2join}{data.frame}

\item{key}{}

\item{top_n_rows}{top N rows to subset from every data.frame in list \code{list_data} argument}
}
\value{
list
}
\description{
Subsets first \code{top_n_rows} rows of data.frame in provided \code{list_data}
and then join `data2join` to every element in that list by sepcified \code{key}
}
