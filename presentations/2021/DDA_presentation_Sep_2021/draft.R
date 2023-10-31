<!-- .pull-left[ -->
                   
                   <!-- - Assume $X=[0,3,5,6]$ and $f_X=sin(X)$, giving $\mathcal{D}=(X,f_X)$. What is $p(f_*|X_*,\mathcal{D})$? -->
                   <!-- {{content}} -->
                   
                   <!-- ] -->
  
  <!-- -- -->
  
  <!-- .pull-right[ -->
                      
                      <!-- - Now we sample the point $X=1$, and add to $\mathcal{D}$ -->
                      <!-- {{content}} -->
                      
                      <!-- ] -->
  
  
  <!-- --- -->
  <!-- -- -->
  <!-- ## Contex of Topic -->
  
  <!-- -- -->
  <!-- ### Why we are talking about Bayesian Optimization (BO)?  -->
  <!-- -- -->
  
  <!-- ### Example Case: -->
  <!-- -- -->
  
  <!-- - R&D section of well known pharmaceutical company exploring for new medcine for old diseas -->
  
  <!-- -- -->
  
  <!-- - The medicine allviate or prenvent the disea will have usbstanital impact on the finacial profit and reputaion of the company -->
  
  <!-- -- -->
  
  <!-- - The R&D tea after extensive research campe of with three chemicl substance that thier mixture could lead to effective medicine -->
  
  <!-- -- -->
  
  <!-- .pull-left[ -->
                     
                     <!-- - The three chemcial substance are named **A**, **B** , **C** -->
                     
                     <!-- ] -->
  
  <!-- .pull-right[ -->
                      
                      <!-- ```{r, echo=FALSE, fig.align='center', out.width="50%"} -->
                      <!-- include_graphics("three_chemical_edit.jpg") -->
                      <!-- ``` -->
                      
                      <!-- ] -->
  
  <!-- --- -->
  
  <!-- ```{r, echo=FALSE} -->
  <!-- plot.dtree <- function(x, symbol = "$norm mu sd$", dec = 2, final = FALSE, orient = "LR", width = "400px", ...) { -->
      
      <!--   ## avoid error when dec is missing -->
      <!--   if (is_not(dec)) dec <- 2 -->
          
          <!--   isNum <- function(x) !is_not(x) && !grepl("[A-Za-z]+", x) -->
            
            <!--   if ("character" %in% class(x)) { -->
                <!--     return(paste0("graph LR\n A[Errors in the input file]") %>% DiagrammeR::DiagrammeR(.)) -->
                <!--   } -->
            <!--   if (x$type_none != "") { -->
                <!--     return(paste0("graph LR\n A[Node does not have a type. Please fix the tree input]") %>% DiagrammeR::DiagrammeR(.)) -->
                <!--   } -->
            
            <!--   ## based on https://gist.github.com/gluc/79ef7a0e747f217ca45e -->
            <!--   jl <- if (final) x$jl else x$jl_init -->
              
              <!--   ## create ids -->
              <!--   jl$Set(id = paste0("id", 1:jl$totalCount)) -->
              
              <!--   ## create start labels -->
              <!--   FromLabel <- function(node) { -->
                  <!--     if (node$parent$isRoot) { -->
                      <!--       ToLabel(node$parent) -->
                      <!--     } else { -->
                          <!--       as.character(node$parent$id) -->
                          <!--     } -->
                  <!--   } -->
                
                <!--   ## create arrow labels -->
                <!--   EdgeLabel <- function(node) { -->
                    <!--     if (node$isRoot) { -->
                        <!--       return(" ") -->
                        <!--     } else if (node$parent$type == "decision") { -->
                            <!--       lbl <- node$name -->
                              <!--     } else if (node$parent$type == "chance") { -->
                                  <!--       lbl <- paste0(node$name, ": ", format_nr(as.numeric(node$p), dec = dec + 2)) -->
                                    <!--     } else if (node$type == "terminal") { -->
                                        <!--       lbl <- paste0(node$name, ": ", format_nr(as.numeric(node$p), dec = dec + 2)) -->
                                          <!--     } -->
                    
                    <!--     if (length(node$parent$decision) > 0 && length(node$name) > 0 && node$name == node$parent$decision) { -->
                        <!--       paste0(" === |", lbl, "|") -->
                        <!--     } else { -->
                            <!--       paste0(" --- |", lbl, "|") -->
                            <!--     } -->
                    <!--   } -->
                  
                  <!--   FormatPayoff <- function(payoff) { -->
                      <!--     #if (!isNum(payoff)) payoff <- 0 -->
                      <!--     #paste0("Normal Dist mean,sd") -->
                      <!--     format_nr(payoff, paste0("\"", " ", "\""), dec = dec) -->
                      <!--   } -->
                    
                    <!--   ToLabel <- function(node) { -->
                        <!--     po <- if (final) FormatPayoff(node$payoff) else " " -->
                          <!--     if (node$type == "decision") { -->
                              <!--       lbl <- paste0("[", po, "]") -->
                                <!--     } else if (node$type == "chance") { -->
                                    <!--       lbl <- paste0("((", po, "))") -->
                                      <!--     } else if (node$type == "terminal") { -->
                                          <!--       lbl <- paste0("[", FormatPayoff(node$payoff), "]") -->
                                            <!--     } -->
                          <!--     paste0(" ", node$id, lbl) -->
                          <!--   } -->
                      
                      <!--   style_decision <- jl$Get("id", filterFun = function(x) x$type == "decision" && is.null(x$cost)) -->
                        <!--   if (is.null(style_decision)) style_decision <- "id_null" -->
                            <!--   style_decision_with_cost <- jl$Get("id", filterFun = function(x) x$type == "decision" && !is.null(x$cost)) -->
                              <!--   if (is.null(style_decision_with_cost)) style_decision_with_cost <- "id_null" -->
                                  <!--   style_chance <- jl$Get("id", filterFun = function(x) x$type == "chance" && is.null(x$cost)) -->
                                    <!--   if (is.null(style_chance)) style_chance <- "id_null" -->
                                        <!--   style_chance_with_cost <- jl$Get("id", filterFun = function(x) x$type == "chance" && !is.null(x$cost)) -->
                                          <!--   if (is.null(style_chance_with_cost)) style_chance_with_cost <- "id_null" -->
                                              
                                              <!--   ToolTip <- function(node) { -->
                                                  <!--     if (final == TRUE && !is.null(node$cost)) { -->
                                                      <!--       sym <- ifelse(node$cost < 0, " + ", " - ") -->
                                                        <!--       paste0(format_nr(node$payoff + node$cost, symbol, dec = dec), sym, format_nr(abs(node$cost), symbol, dec = dec)) %>% -->
                                                        <!--         paste0("click ", node$id, " callback \"", ., "\"") -->
                                                        <!--     } else if (!is.null(node$cost)) { -->
                                                            <!--       paste0("Cost: ", format_nr(node$cost, symbol, dec = dec)) %>% -->
                                                            <!--         paste0("click ", node$id, " callback \"", ., "\"") -->
                                                            <!--     } else { -->
                                                                <!--       NA -->
                                                                <!--     } -->
                                                  <!--   } -->
                                                
                                                <!--   style <- paste0( -->
                                                                          <!--     "classDef default fill:none, bg:none, stroke-width:0px; -->
<!--     classDef chance fill:#FF8C00,stroke:#333,stroke-width:1px; -->
<!--     classDef chance_with_cost fill:#FF8C00,stroke:#333,stroke-width:3px,stroke-dasharray:4,5; -->
<!--     classDef decision fill:#9ACD32,stroke:#333,stroke-width:1px; -->
<!--     classDef decision_with_cost fill:#9ACD32,stroke:#333,stroke-width:3px,stroke-dasharray:4,5; -->
<!--     class ", paste(style_decision, collapse = ","), " decision; -->
<!--     class ", paste(style_decision_with_cost, collapse = ","), " decision_with_cost; -->
<!--     class ", paste(style_chance, collapse = ","), " chance; -->
<!--     class ", paste(style_chance_with_cost, collapse = ","), " chance_with_cost;" -->
                                                                          <!--   ) -->
                                                  
                                                  <!--   trv <- data.tree::Traverse(jl, traversal = "level", filterFun = data.tree::isNotRoot) -->
                                                    <!--   df <- data.frame( -->
                                                                               <!--     from = data.tree::Get(trv, FromLabel), -->
                                                                               <!--     edge = data.tree::Get(trv, EdgeLabel), -->
                                                                               <!--     to = data.tree::Get(trv, ToLabel), -->
                                                                               <!--     id = data.tree::Get(trv, ToLabel), -->
                                                                               <!--     tooltip = data.tree::Get(trv, ToolTip), -->
                                                                               <!--     stringsAsFactors = FALSE -->
                                                                               <!--   ) -->
                                                      
                                                      <!--   trv <- data.tree::Traverse(jl, traversal = "level", filterFun = data.tree::isRoot) -->
                                                        <!--   ttip <- c(df[["tooltip"]], data.tree::Get(trv, ToolTip)) %>% -->
                                                          <!--     na.omit() %>% -->
                                                          <!--     unique() -->
                                                          
                                                          <!--   ## use LR or TD -->
                                                          <!--   paste( -->
                                                                          <!--     paste0("graph ", orient), paste(paste0(df$from, df$edge, df$to), collapse = "\n"), -->
                                                                          <!--     paste(ttip, collapse = "\n"), style, sep = "\n" -->
                                                                          <!--   ) %>% -->
                                                          <!--     ## address image size in pdf and html and allow zooming -->
                                                          <!--     # DiagrammeR::mermaid(., width = "100%", height = "100%") -->
                                                          <!--     DiagrammeR::mermaid(width = "2000px", height = "650px") -->
                                                          <!-- } -->
    <!-- ``` -->
    
    <!-- .pull-left[ -->
                       
                       <!-- ```{r, echo=FALSE, out.width="100%", fig.align='left'} -->
                       <!-- ############ -->
                       <!-- library(radiant.model) -->
                       <!-- library(yaml) -->
                       <!-- ############## -->
                       
                       <!-- yaml_file <- read_yaml("jennylind.yaml") -->
                       
                       <!-- tree_yaml_file <- radiant.model::dtree(yaml_file) -->
                       
                       <!-- plot.dtree(tree_yaml_file) -->
                       <!-- ``` -->
                       
                       <!-- ] -->
    
    <!-- .pull-right[ -->
                        
                        <!-- ## Discussion on Tree: -->
                        <!-- -  Z depends on prior knowledge, means: $\mathbf{E}[Z_i|x_i]$  -->
                        <!-- - -->
                        <!-- -  Then the best decision to make is: -->
                        <!-- - $$ -->
                        <!-- \begin{aligned} -->
                        <!-- & \underset{\mathbf{d}}{\text{maximize}} & & \mathbf{E}[Z_i|x_i] \\ -->
                        <!-- & \text{subject to} -->
                        <!-- & & \mathbf{d} \subseteq D \\ -->
                        <!-- \end{aligned} -->
                        <!-- $$ -->
                        <!-- ] -->
    
    <!-- --- -->
    <!-- - Text can be **bold**, _italic_, ~~strikethrough~~, or `inline code`. -->
    
    <!-- [Link to another slide](#colors). -->
      
      <!-- ### Lorem Ipsum -->
        
        <!-- Dolor imperdiet nostra sapien scelerisque praesent curae metus facilisis dignissim tortor.  -->
        <!-- Lacinia neque mollis nascetur neque urna velit bibendum.  -->
        <!-- Himenaeos suspendisse leo varius mus risus sagittis aliquet venenatis duis nec. -->
        
        <!-- - Dolor cubilia nostra nunc sodales -->
        
        <!-- - Consectetur aliquet mauris blandit -->
        
        <!-- - Ipsum dis nec porttitor urna sed -->
        
        <!-- --- -->
        <!-- name: colors -->
        
        <!-- ## Colors -->
        
        <!-- .left-column[ -->
                             <!-- Text color -->
                             
                             <!-- [Link Color](#3) -->
                               
                               <!-- **Bold Color** -->
                                 
                                 <!-- _Italic Color_ -->
                                 
                                 <!-- `Inline Code` -->
                                 <!-- ] -->
        
        <!-- .right-column[ -->
                              <!-- Lorem ipsum dolor sit amet, [consectetur adipiscing elit (link)](#3),  -->
                                <!-- sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  -->
                                  <!-- Erat nam at lectus urna. -->
                                  <!-- Pellentesque elit ullamcorper **dignissim cras tincidunt (bold)** lobortis feugiat.  -->
                                  <!-- _Eros donec ac odio tempor_ orci dapibus ultrices.  -->
                                  <!-- Id porta nibh venenatis cras sed felis eget velit aliquet. -->
                                  <!-- Aliquam id diam maecenas ultricies mi. -->
                                  <!-- Enim sit amet  -->
                                  <!-- `code_color("inline")` -->
                                  <!-- venenatis urna cursus eget nunc scelerisque viverra. -->
                                  <!-- ] -->
        
        <!-- --- -->
        
        <!-- # Big Topic or Inverse Slides `#` -->
        
        <!-- ## Slide Headings `##` -->
        
        <!-- ### Sub-slide Headings `###` -->
        
        <!-- #### Bold Call-Out `####` -->
        
        <!-- This is a normal paragraph text. Only use header levels 1-4. -->
        
        <!-- ##### Possible, but not recommended `#####` -->
        
        <!-- ###### Definitely don't use h6 `######` -->
        
        <!-- --- -->
        
        <!-- # Left-Column Headings -->
        
        <!-- .left-column[ -->
                             <!-- ## First -->
                             
                             <!-- ## Second -->
                             
                             <!-- ## Third -->
                             <!-- ] -->
        
        <!-- .right-column[ -->
                              <!-- Dolor quis aptent mus a dictum ultricies egestas. -->
                              
                              <!-- Amet egestas neque tempor fermentum proin massa! -->
                              
                              <!-- Dolor elementum fermentum pharetra lectus arcu pulvinar. -->
                              <!-- ] -->
        
        <!-- --- -->
        <!-- class: inverse center middle -->
        
        <!-- # Topic Changing Interstitial -->
        
        <!-- -- -->
        
        <!-- ``` -->
        <!-- class: inverse center middle -->
        <!-- ``` -->
        
        <!-- --- -->
        <!-- layout: true -->
        
        <!-- ## Blocks -->
        
        <!-- --- -->
        
        <!-- ### Blockquote -->
        
        <!-- > This is a blockquote following a header. -->
        <!-- > -->
        <!-- > When something is important enough, you do it even if the odds are not in your favor. -->
        
        <!-- --- -->
        
        <!-- ### Code Blocks -->
        
        <!-- #### R Code -->
        
        <!-- ```{r eval=FALSE} -->
        <!-- ggplot(gapminder) + -->
        <!--   aes(x = gdpPercap, y = lifeExp, size = pop, color = country) + -->
        <!--   geom_point() + -->
        <!--   facet_wrap(~year) -->
        <!-- ``` -->
        
        <!-- #### JavaScript -->
        
        <!-- ```js -->
        <!-- var fun = function lang(l) { -->
            <!--   dateformat.i18n = require('./lang/' + l) -->
              <!--   return true; -->
              <!-- } -->
        <!-- ``` -->
        
        <!-- --- -->
        
        <!-- ### More R Code -->
        
        <!-- ```{r eval=FALSE} -->
        <!-- dplyr::starwars %>% dplyr::slice_sample(n = 4) -->
        <!-- ``` -->
        
        <!-- --- -->
        
        <!-- ```{r message=TRUE, eval=requireNamespace("cli", quietly = TRUE)} -->
        <!-- cli::cli_alert_success("It worked!") -->
        <!-- ``` -->
        
        <!-- -- -->
        
        <!-- ```{r message=TRUE} -->
        <!-- message("Just a friendly message") -->
        <!-- ``` -->
        
        <!-- -- -->
        
        <!-- ```{r warning=TRUE} -->
        <!-- warning("This could be bad...") -->
        <!-- ``` -->
        
        <!-- -- -->
        
        <!-- ```{r error=TRUE} -->
        <!-- stop("I hope you're sitting down for this") -->
        <!-- ``` -->
        
        
        <!-- --- -->
        <!-- layout: true -->
        
        <!-- ## Tables -->
        
        <!-- --- -->
        <!-- exclude: `r if (requireNamespace("tibble", quietly=TRUE)) "false" else "true"` -->
        
        <!-- ```{r eval=requireNamespace("tibble", quietly=TRUE)} -->
        <!-- tibble::as_tibble(mtcars) -->
        <!-- ``` -->
        
        <!-- --- -->
        
        <!-- ```{r} -->
        <!-- knitr::kable(head(mtcars), format = 'html') -->
        <!-- ``` -->
        
        <!-- --- -->
        <!-- exclude: `r if (requireNamespace("DT", quietly=TRUE)) "false" else "true"` -->
        
        <!-- ```{r eval=requireNamespace("DT", quietly=TRUE)} -->
        <!-- DT::datatable(head(mtcars), fillContainer = FALSE, options = list(pageLength = 4)) -->
        <!-- ``` -->
        
        <!-- --- -->
        <!-- layout: true -->
        
        <!-- ## Lists -->
        
        <!-- --- -->
        
        <!-- .pull-left[ -->
                           <!-- #### Here is an unordered list: -->
                           
                           <!-- *   Item foo -->
                           <!-- *   Item bar -->
                           <!-- *   Item baz -->
                           <!-- *   Item zip -->
                           <!-- ] -->
        
        <!-- .pull-right[ -->
                            
                            <!-- #### And an ordered list: -->
                            
                            <!-- 1.  Item one -->
                            <!-- 1.  Item two -->
                            <!-- 1.  Item three -->
                            <!-- 1.  Item four -->
                            <!-- ] -->
        
        <!-- --- -->
        
        <!-- ### And a nested list: -->
        
        <!-- - level 1 item -->
        <!--   - level 2 item -->
        <!--   - level 2 item -->
        <!--     - level 3 item -->
        <!--     - level 3 item -->
        <!-- - level 1 item -->
        <!--   - level 2 item -->
        <!--   - level 2 item -->
        <!--   - level 2 item -->
        <!-- - level 1 item -->
        <!--   - level 2 item -->
        <!--   - level 2 item -->
        <!-- - level 1 item -->
        
        <!-- --- -->
        
        <!-- ### Nesting an ol in ul in an ol -->
        
        <!-- - level 1 item (ul) -->
        <!--   1. level 2 item (ol) -->
        <!--   1. level 2 item (ol) -->
        <!--     - level 3 item (ul) -->
        <!--     - level 3 item (ul) -->
        <!-- - level 1 item (ul) -->
        <!--   1. level 2 item (ol) -->
        <!--   1. level 2 item (ol) -->
        <!--     - level 3 item (ul) -->
        <!--     - level 3 item (ul) -->
        <!--   1. level 4 item (ol) -->
        <!--   1. level 4 item (ol) -->
        <!--     - level 3 item (ul) -->
        <!--     - level 3 item (ul) -->
        <!-- - level 1 item (ul) -->
        
        <!-- --- -->
        <!-- layout: true -->
        
        <!-- ## Plots -->
        
        <!-- --- -->
        
        <!-- ```{r plot-example, eval=requireNamespace("ggplot2", quietly=TRUE)} -->
        <!-- library(ggplot2) -->
        <!-- (g <- ggplot(mpg) + aes(hwy, cty, color = class) + geom_point()) -->
        <!-- ``` -->
        
        <!-- --- -->
        
        <!-- ```{r plot-example-themed, eval=requireNamespace("ggplot2", quietly=TRUE)} -->
        <!-- g + xaringanthemer::theme_xaringan(text_font_size = 16, title_font_size = 18) + -->
        <!--   ggtitle("A Plot About Cars") -->
        <!-- ``` -->
        
        <!-- --- -->
        <!-- layout: false -->
        
        <!-- ## Square image -->
        
        <!-- <center><img src="https://octodex.github.com/images/labtocat.png" height="400px" /></center> -->
        
        <!-- .footnote[GitHub Octocat] -->
        
        <!-- --- -->
        
        <!-- ### Wide image -->
        
        <!-- ![](https://guides.github.com/activities/hello-world/branching.png) -->
        
        <!-- .footnote[Wide images scale to 100% slide width] -->
        
        <!-- --- -->
        
        <!-- ## Two images -->
        
        <!-- .pull-left[ -->
                           <!-- ![](https://octodex.github.com/images/motherhubbertocat.png) -->
                           <!-- ] -->
        
        <!-- .pull-right[ -->
                            <!-- ![](https://octodex.github.com/images/dinotocat.png) -->
                            <!-- ] -->
        
        <!-- --- -->
        
        <!-- ### Definition lists can be used with HTML syntax. -->
        
        <!-- <dl> -->
        <!-- <dt>Name</dt> -->
        <!-- <dd>Godzilla</dd> -->
        <!-- <dt>Born</dt> -->
        <!-- <dd>1952</dd> -->
        <!-- <dt>Birthplace</dt> -->
        <!-- <dd>Japan</dd> -->
        <!-- <dt>Color</dt> -->
        <!-- <dd>Green</dd> -->
        <!-- </dl> -->
        
        <!-- --- -->
        <!-- class: center, middle -->
        
        <!-- # Thanks! -->
        
        <!-- Slides created via the R packages: -->
        
        <!-- [**xaringan**](https://github.com/yihui/xaringan)<br> -->
        <!-- [gadenbuie/xaringanthemer](https://github.com/gadenbuie/xaringanthemer) -->
        
        <!-- The chakra comes from [remark.js](https://remarkjs.com), [**knitr**](http://yihui.name/knitr), and [R Markdown](https://rmarkdown.rstudio.com). -->
        