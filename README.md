## prioGene: Prioritize candidate genes for complex noncommunicable diseases

## :writing_hand: Authors
Erqiang Hu

College of Bioinformatics Science and Technology, Harbin Medical University

1

## :arrow\_double\_down: Installation

Get the development version from github:

```r
if(!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
devtools::install_github("huerqiang/prioGene")
```
Or  the released version from CRAN:

``` r
install.packages("prioGene")
```
-------

## Common operations on prioGene
```r
library(prioGene)
```

```r
# One-step interactions with known disease-causing genes are retained in networks
#'
#' net: a network
#' dise_gene: a matrix with one column of genes
#'
#' return: a matrix
net_disease <- deal_net(net,dise_gene)
```
```r
#Get a one-to-many matrix of gene and GO term
#'
#'net_disease: a disease related network, matrix
#'
#' return: a matrix
genes_mat <- get_gene_mat(net_disease)
```
```r
#Get a one-to-many matrix of GO term and gene
#' net_disease: a disease related network, matrix
#'
#' return: a matrix
terms_mat <- get_term_mat(net_disease)
```
```r
#Get the GO term for each pair of nodes in the network
#' genes_mat: a one-to-many matrix of GO term and gene
#' net_disease: a disease related network, matrix
#'
#' return: a matrix
net_disease_term <- get_net_disease_term(genes_mat,net_disease)
```

```r
#weighting gene
#' genes_mat: a one-to-many matrix of GO term and gene
#'
#' return: a matrix
node_weight <- get_node_weight(genes_mat)
```
```r
#weighting edge
#' net_disease_term: GO terms for each pair of nodes in the network
#'
#' return: a matrix
edge_weight <- get_edge_weight(net_disease_term,terms_mat)
```


```r
#R—_0 is the vector of initial disease risk scores for all genes
R_0<- get_R_0(dise_gene,node_weight,f=1)
```

```r
#get the result the output number is the number of iterations
#' bet:  a parameter to measure the importance of genes and interactions
#' R_0: the vector of initial disease risk scores for all genes
#' node_weight: a matrix, genes and their weights
#' threshold: a threshold for terminating iterations
#'
#' return: a matrix
result <- get_R(node_weight, net_disease_term, bet = 0.5, R_0 = R_0, threshold = 10^(-9))
```
