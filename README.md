# <center>prioGene</center>

| title    | author     |
| -------- | ---------- |
| prioGene | Erqiang Hu |



## Introduction

Prioritizing candidate genes for complex noncommunicable diseases is critical to understanding their mechanisms and developing better diagnostics and treatments.

With the emergence of  a great amount of biological data and molecular changes in the process of non-communicable diseases, more and more studies have been carried out on the identification and sequencing of disease-related genes by using the calculation method of protein-protein interaction (PPI) network.
In gene sequencing methods, the topological features of PPI networks are often used, such as ToppNet (https://toppGene.cchmc.org) and Razaghi Moghadam's gene sequencing method.

In this study, a candidate gene prioritization method was proposed for non-communicable diseases considering disease risks transferred between genes in weighted disease PPI networks with weights for nodes and edges based on functional information.

## Construction of weighted disease PPI networks
In biological networks, nodes represented genes and edges represented interactions between products of these genes. Weights for nodes (genes) and  edges (interactions) were calculated utilizing functional information represented by GO terms, respectively.
For each gene g, the gene weight w g was defined as the proportion of GO terms annotated by g in all GO terms annotated by human genes. The interaction weight Wgh was defined as the functional similarity of two interacting genes g and h.

## Prioritization of candidate genes
The prioritization of candidate genes was performed based on disease risk scores of each gene obtained from an iteration process considering disease risks transferred between genes.

--------

## Installation
To install this package, start R (version "3.6") and enter:

```{r, eval=FALSE, message=FALSE, warning=FALSE}
if(!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
devtools::install_github("huerqiang/prioGene")
```

-------

## Common operations on prioGene
```{r}
library(prioGene)
```

```{r}
#One-step interactions with known disease-causing genes are retained in networks
#'
#' net: a network
#' dise_gene: a matrix with one column of genes
#'
#' return: a matrix
net_disease <- deal_net(net,dise_gene)
```
```{r}
#Get a one-to-many matrix of gene and GO term
#'
#'net_disease: a disease related network, matrix
#'GO_human: a matrix, gene and GO terms
#'
#' return: a matrix
genes_mat <- get_gene_mat(net_disease,GO_human)
```
```{r}
#Get a one-to-many matrix of GO term and gene
#' net_disease: a disease related network, matrix
#' GO_human: a matrix, gene and GO terms
#'
#' return: a matrix
terms_mat <- get_term_mat(net_disease,GO_human)
```
```{r}
#Get the GO term for each pair of nodes in the network
#' genes_mat: a one-to-many matrix of GO term and gene
#' net_disease: a disease related network, matrix
#'
#' return: a matrix
net_disease_term <- get_net_disease_term(genes_mat,net_disease)
```

```{r}
#weighting gene
#' genes_mat: a one-to-many matrix of GO term and gene
#'
#' return: a matrix
node_weight <- get_node_weight(genes_mat)
```
```{r}
#weighting edge
#' net_disease_term: GO terms for each pair of nodes in the network
#'
#' return: a matrix
edge_weight <- get_edge_weight(net_disease_term,terms_mat)
```


```{r}
#R—_0 is the vector of initial disease risk scores for all genes
R_0<- get_R_0(dise_gene,node_weight,f=1)
```

```{r}
#get the result the output number is the number of iterations
#' bet:  a parameter to measure the importance of genes and interactions
#' R_0: the vector of initial disease risk scores for all genes
#' node_weight: a matrix, genes and their weights
#' threshold: a threshold for terminating iterations
#'
#' return: a matrix
result <- get_R(node_weight, net_disease_term, bet = 0.5, R_0 = R_0, threshold = 10^(-9))
```

------

## Session information

```{r}
sessionInfo()
```



