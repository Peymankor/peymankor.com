library(radiant.model)
library(yaml)
##############
plot.dtree <- function(x, symbol = "$norm mu sd$", dec = 2, final = FALSE, orient = "LR", width = "400px", ...) {
  
  ## avoid error when dec is missing
  if (is_not(dec)) dec <- 2
  
  isNum <- function(x) !is_not(x) && !grepl("[A-Za-z]+", x)
  
  if ("character" %in% class(x)) {
    return(paste0("graph LR\n A[Errors in the input file]") %>% DiagrammeR::DiagrammeR(.))
  }
  if (x$type_none != "") {
    return(paste0("graph LR\n A[Node does not have a type. Please fix the tree input]") %>% DiagrammeR::DiagrammeR(.))
  }
  
  ## based on https://gist.github.com/gluc/79ef7a0e747f217ca45e
  jl <- if (final) x$jl else x$jl_init
  
  ## create ids
  jl$Set(id = paste0("id", 1:jl$totalCount))
  
  ## create start labels
  FromLabel <- function(node) {
    if (node$parent$isRoot) {
      ToLabel(node$parent)
    } else {
      as.character(node$parent$id)
    }
  }
  
  ## create arrow labels
  EdgeLabel <- function(node) {
    if (node$isRoot) {
      return(" ")
    } else if (node$parent$type == "decision") {
      lbl <- node$name
    } else if (node$parent$type == "chance") {
      lbl <- paste0(node$name, ": ", format_nr(as.numeric(node$p), dec = dec + 2))
    } else if (node$type == "terminal") {
      lbl <- paste0(node$name, ": ", format_nr(as.numeric(node$p), dec = dec + 2))
    }
    
    if (length(node$parent$decision) > 0 && length(node$name) > 0 && node$name == node$parent$decision) {
      paste0(" === |", lbl, "|")
    } else {
      paste0(" --- |", lbl, "|")
    }
  }
  
  FormatPayoff <- function(payoff) {
    #if (!isNum(payoff)) payoff <- 0
    #paste0("Normal Dist mean,sd")
    format_nr(payoff, paste0("\"", "dolar", "\""), dec = dec)
  }
  
  ToLabel <- function(node) {
    po <- if (final) FormatPayoff(node$payoff) else " "
    if (node$type == "decision") {
      lbl <- paste0("[", po, "]")
    } else if (node$type == "chance") {
      lbl <- paste0("((", po, "))")
    } else if (node$type == "terminal") {
      lbl <- paste0("[", FormatPayoff(node$payoff), "]")
    }
    paste0(" ", node$id, lbl)
  }
  
  style_decision <- jl$Get("id", filterFun = function(x) x$type == "decision" && is.null(x$cost))
  if (is.null(style_decision)) style_decision <- "id_null"
  style_decision_with_cost <- jl$Get("id", filterFun = function(x) x$type == "decision" && !is.null(x$cost))
  if (is.null(style_decision_with_cost)) style_decision_with_cost <- "id_null"
  style_chance <- jl$Get("id", filterFun = function(x) x$type == "chance" && is.null(x$cost))
  if (is.null(style_chance)) style_chance <- "id_null"
  style_chance_with_cost <- jl$Get("id", filterFun = function(x) x$type == "chance" && !is.null(x$cost))
  if (is.null(style_chance_with_cost)) style_chance_with_cost <- "id_null"
  
  ToolTip <- function(node) {
    if (final == TRUE && !is.null(node$cost)) {
      sym <- ifelse(node$cost < 0, " + ", " - ")
      paste0(format_nr(node$payoff + node$cost, symbol, dec = dec), sym, format_nr(abs(node$cost), symbol, dec = dec)) %>%
        paste0("click ", node$id, " callback \"", ., "\"")
    } else if (!is.null(node$cost)) {
      paste0("Cost: ", format_nr(node$cost, symbol, dec = dec)) %>%
        paste0("click ", node$id, " callback \"", ., "\"")
    } else {
      NA
    }
  }
  
  style <- paste0(
    "classDef default fill:none, bg:none, stroke-width:0px;
    classDef chance fill:#FF8C00,stroke:#333,stroke-width:1px;
    classDef chance_with_cost fill:#FF8C00,stroke:#333,stroke-width:3px,stroke-dasharray:4,5;
    classDef decision fill:#9ACD32,stroke:#333,stroke-width:1px;
    classDef decision_with_cost fill:#9ACD32,stroke:#333,stroke-width:3px,stroke-dasharray:4,5;
    class ", paste(style_decision, collapse = ","), " decision;
    class ", paste(style_decision_with_cost, collapse = ","), " decision_with_cost;
    class ", paste(style_chance, collapse = ","), " chance;
    class ", paste(style_chance_with_cost, collapse = ","), " chance_with_cost;"
  )
  
  trv <- data.tree::Traverse(jl, traversal = "level", filterFun = data.tree::isNotRoot)
  df <- data.frame(
    from = data.tree::Get(trv, FromLabel),
    edge = data.tree::Get(trv, EdgeLabel),
    to = data.tree::Get(trv, ToLabel),
    id = data.tree::Get(trv, ToLabel),
    tooltip = data.tree::Get(trv, ToolTip),
    stringsAsFactors = FALSE
  )
  
  trv <- data.tree::Traverse(jl, traversal = "level", filterFun = data.tree::isRoot)
  ttip <- c(df[["tooltip"]], data.tree::Get(trv, ToolTip)) %>%
    na.omit() %>%
    unique()
  
  ## use LR or TD
  paste(
    paste0("graph ", orient), paste(paste0(df$from, df$edge, df$to), collapse = "\n"),
    paste(ttip, collapse = "\n"), style, sep = "\n"
  ) %>%
    ## address image size in pdf and html and allow zooming
    # DiagrammeR::mermaid(., width = "100%", height = "100%")
    DiagrammeR::mermaid(width = "400px", height = "400px")
}


##########
yaml_file <- read_yaml("jennylind.yaml")

tree_yaml_file <- radiant.model::dtree(yaml_file)

plot.dtree(tree_yaml_file)
