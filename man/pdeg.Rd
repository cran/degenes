\name{pdeg}
\alias{pdeg}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Detection of differentially expressed genes.
}
\description{
Calculated gene-specific unadjusted p-values for the comparison of samples from two distinct groups.
}
\usage{
pdeg(treatment, control, alpha = 0.05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{treatment}{
Matrix of normalized expression levels in the first group. Rows represent genes, columns represent samples.
}
  \item{control}{
Matrix of normalized expression levels in the second group. Rows represent genes, columns represent samples.
}
  \item{alpha}{
Global significance level.
}
}

\value{
A vector with the gene-specific unadjusted p-values.
}
\references{
Jung K., Quast K., Gannoun A. and Urfer W. (2006) A renewed approach to the nonparametric analysis of replicated microarray experiments. Biometrical Journal, 48, 245-254.
}
\author{
Klaus Jung
}


\examples{
X1 = matrix(rnorm(2000, 0, 1), 200, 10)
X2 = matrix(rnorm(2000, 0, 1), 200, 10)
index = sample(1:200, 5, replace=FALSE)
X2[index,] = X2[index,] + 5
D = deg(X1, X2)
PD = pdeg(X1, X2)
PDa = p.adjust(PD, method="bonferroni")
sort(index)
D
which(PDa<0.05)
which(PD<0.05)
}