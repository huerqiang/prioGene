
#' a vector of disease related genes
#'
#' some genes
#'
#' @format A matrix with 79 rows and 1 column
#'
"dise_gene"

#' weights of edges of a net
#'
#' the first two columns are a net, and third column is their weight
#'
#' @format A matrix with 25 rows and 3 column
#'
"edge_weight"

#' a one-to-many matrix of GO term and gene
#'
#' the first column is the gene symbol, the second column is the go terms 
#'
#' the third column is the number of go terms 
#'
#' @format A matrix with 45 rows and 3 column
#'

"genes_mat"
#' a matrix, gene and GO terms
#'
#' the first column is the gene symbol, the second column is the go terms
#'
#' @format A matrix with 481418 rows and 2 column
#'
"GO_human"

#' a network of genes
#'
#' @format A matrix with 2000 rows and 2 column
#'
"net"
#' a network of disease related genes
#'
#' @format A matrix with 26 rows and 2 column
#'
"net_disease"

#' GO terms for each pair of nodes in the network
#'
#' the first two columns is the network
#'
#' the third column is the go terms,the fourth column is the number of go terms
#'
#' the fourth column is the number of go terms
#'
#' @format A matrix with 25 rows and 4 column
#'
"net_disease_term"

#' a matrix, genes and their weights
#'
#' @format A matrix with 45 rows and 2 column
#'
"node_weight"

#' the disease risk transition probability matrix
#'
#' @format A matrix with 45 rows and 45 column
#'
"Q"

#' the vector of initial disease risk scores for all genes
#'
#' @format A vector of 45 number
#'
"R_0"

#' a matrix, GO terms and GO genes
#'
#' a one-to-many matrix of GO term and gene
#'
#' @format A matrix with 1172 rows and 3 column
#'
"terms_mat"
