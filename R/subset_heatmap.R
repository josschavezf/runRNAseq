#' Crear un subgrupo de la matriz y genera un heatmap
#'
#' @param x matriz
#' @param mediciones character. Líneas de la matriz a graficar.
#' @param grupos character. Columnas de la matriz a graficar.
#' @importFrom ComplexHeatmap Heatmap
#'
#' @return ComplexHeatmap
#' @export
#'
#' @examples
#' mi_ruta <- system.file("extdata", "mi_matriz.csv", package = "runRNAseq")
#' mi_matriz <- as.matrix(read.csv(mi_ruta, row.names = 1))
#'
#' subset_heatmap(mi_matriz,
#' mediciones = c("medicion_a", "medicion_b", "medicion_c"),
#' grupos = c("grupo_d","grupo_e","grupo_g"))
subset_heatmap <- function(x, mediciones = NULL,
                           grupos = NULL) {

    ## check input
    if(!is.matrix(x)) {stop("x debe ser una matriz")}

    if(!is.character(mediciones)) {
        stop("mediciones debe ser un vector de tipo character")}

    ## subset matrix
    x_subset <- x[mediciones, grupos]

    message("Subset de la matrix, listo")

    ## plot heatmap
    ComplexHeatmap::Heatmap(
        x_subset,
        cluster_columns = FALSE,
        heatmap_legend_param = list(title = "valores"))

    message("Generación del heatmap, listo")
}
