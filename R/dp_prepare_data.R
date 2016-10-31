#' function for preparing data for tabulation
#'
#' @param dp an object of type diffrproject
#' @param link which link to produce table for
#' @param align_var either a character vector of variable names or TRUE for all
#' @param text_var either a character vector of variable names or TRUE for all
#' @param aggregate_function a function able to resolve conflicts if for a
#'    specific variable for a token of text severla values exist, if NULL it
#'    defaults to modus() but could also be e.g. paste or something alike
#' @param ... further arguments passed through to aggregate_function
#'
#' @export
#'
dp_prepare_data_table <-
  function(
    dp,
    link               = NULL,
    align_var          = TRUE,
    text_var           = TRUE,
    aggregate_function = NULL,
    ...
  ){
    # check input
    if( is.null(link) ){
      if( length(dp$link) == 1  ){
        link <- 1
      }else{
        stop("No link/alignment choosen, please specify link/alignment to render.")
      }
    }

    # get link name and text names
    if( is.numeric(link) ){
      link  <- names(dp$link)[link]
    }

    text_name_1 <- dp$link[[link]]$from
    text_name_2 <- dp$link[[link]]$to

    # prepare alignment
    alignment <-
      dp$alignment[[link]] %>%
      diffrprojects::sort_alignment(ti1 = "token_i_1", ti2 = "token_i_2")

    # prepare alignment_data
    alignment_data <-
      dp$alignment[[link]][, "alignment_i", drop=FALSE] %>%
      dplyr::left_join(
        tidyr::spread(
          diffrprojects:::as.data.frame.alignment_data_list(
            dp$alignment_data[link]
          ),
          name,
          val
        ),
        by = c("alignment_i"="alignment_i")
      ) %>%
      dplyr::select(-hl,-link, -alignment_i)

    if( any(align_var != TRUE) ){
      alignment_data <- alignment_data[, names(alignment_data) %in% align_var, drop = FALSE]
    }

    # preapare text_data
    tokens <-
      alignment %>%
      dplyr::select(from_1, to_1) %>%
      stats::setNames(c("from","to"))
    text1_data <-
      dp$text[[text_name_1]]$
      tokenize_data_sequences(
        token = tokens,
        aggregate_function = aggregate_function,
        ...
      ) %>%
      dplyr::select(-from, -to, -token_i)

    tokens <-
      alignment %>%
      dplyr::select(from_2, to_2) %>%
      stats::setNames(c("from","to"))
    text2_data <-
      dp$text[[text_name_2]]$
      tokenize_data_sequences(
        token = tokens,
        aggregate_function = aggregate_function,
        ...
      ) %>%
      dplyr::select(-from, -to, -token_i)

    if( any(text_var != TRUE) ){
      text1_data <- text1_data[, names(text1_data) %in% text_var, drop=FALSE]
      text2_data <- text2_data[, names(text2_data) %in% text_var, drop=FALSE]
    }

    # return
    return(
      list(
        alignment                 = alignment,
        alignment_vars            = names(alignment),
        text1                     = dp$text[[text_name_1]]$text_get(),
        text2                     = dp$text[[text_name_2]]$text_get(),
        alignment_data            = alignment_data,
        alignment_data_vars       = names(alignment_data),
        alignment_text1_data      = text1_data,
        alignment_text2_data      = text2_data,
        alignment_text_data_vars  = names(text1_data)
      )
    )
  }

#' function for preparing data for tabulation
#'
#' @param dp an object of type diffrproject
#' @param link which link to produce table for
#' @param align_var either a character vector of variable names or TRUE for all
#' @param text_var either a character vector of variable names or TRUE for all
#' @param aggregate_function a function able to resolve conflicts if for a
#'    specific variable for a token of text severla values exist, if NULL it
#'    defaults to modus() but could also be e.g. paste or something alike
#' @param ... further arguments passed through to aggregate_function
#'
#' @export
#'
dp_prepare_data_vis <-
  function(
    dp,
    link               = NULL,
    align_var          = TRUE,
    text_var           = TRUE,
    aggregate_function = NULL,
    minimize           = FALSE,
    ...
  ){
    # check input
    if( is.null(link) ){
      if( length(dp$link) == 1  ){
        link <- 1
      }else{
        stop("No link/alignment choosen, please specify link/alignment to render.")
      }
    }

    # get link name and text names
    if( is.numeric(link) ){
      link  <- names(dp$link)[link]
    }

    text_name_1 <- dp$link[[link]]$from
    text_name_2 <- dp$link[[link]]$to

    # prepare alignment
    alignment <-
      dp$alignment[[link]] %>%
      diffrprojects::sort_alignment(ti1 = "token_i_1", ti2 = "token_i_2")

    # prepare alignment_data
    alignment_data <-
      dp$alignment[[link]][, "alignment_i", drop=FALSE] %>%
      dplyr::left_join(
        tidyr::spread(
          diffrprojects:::as.data.frame.alignment_data_list(
            dp$alignment_data[link]
          ),
          name,
          val
        ),
        by = c("alignment_i"="alignment_i")
      ) %>%
      dplyr::select(-hl,-link, -alignment_i)

    if( any(align_var != TRUE) ){
      alignment_data <- alignment_data[, names(alignment_data) %in% align_var, drop = FALSE]
    }

    # preapare text1_data
    text1 <-
      alignment %>%
      dplyr::select(token_i_1, from_1, to_1) %>%
      stats::setNames(c("token_i", "from","to")) %>%
      dplyr::filter(!duplicated(token_i), !is.na(token_i)) %>%
      dplyr::arrange(token_i)

    # get text data by tokenizing character level data
    # / aggregating it to character-span level
    text1_data <-
      dp$text[[text_name_1]]$
      tokenize_data_sequences(
        token = text1[,c("from","to")],
        aggregate_function = aggregate_function,
        ...
      ) %>%
      dplyr::select(-from, -to, -token_i)

    # add text to text
    f <- dp$text[[text_name_1]]$text_get
    text1$text <- mapply(f, from=text1$from, to=text1$to)
    text1$tnr  <- 1


    # preapare text2_data
    text2 <-
      alignment %>%
      dplyr::select(token_i_2, from_2, to_2) %>%
      stats::setNames(c("token_i", "from","to")) %>%
      dplyr::filter(!duplicated(token_i), !is.na(token_i)) %>%
      dplyr::arrange(token_i)

    # get text data by tokenizing character level data
    # / aggregating it to character-span level
    text2_data <-
      dp$text[[text_name_2]]$
      tokenize_data_sequences(
        token = text2[,c("from","to")],
        aggregate_function = aggregate_function,
        ...
      ) %>%
      dplyr::select(-from, -to, -token_i)

    # add text to text
    f <- dp$text[[text_name_2]]$text_get
    text2$text <- mapply(f, from=text2$from, to=text2$to)
    text2$tnr  <- 2


    if( any(text_var != TRUE) ){
      text1_data <- text1_data[, names(text1_data) %in% text_var, drop=FALSE]
      text2_data <- text2_data[, names(text2_data) %in% text_var, drop=FALSE]
    }

    # drop unwanted variables from alignment
     alignment <-
       alignment %>%
       dplyr::select_("token_i_1", "token_i_2", "distance", "type")

    # should data be minimized?
    jsonify <-
        function(x){
          htmlwidgets::JS(
            jsonlite::toJSON(
              x, "values", pretty = TRUE, na="null"
            )
          )
        }



    # return
    return(
      list(
        alignment                 = jsonify(alignment),
        alignment_vars            = jsonify(names(alignment)),
        text                      = jsonify(rbind(text1, text2)),
        text_vars                 = jsonify(names(text1)),
        alignment_data            = jsonify(alignment_data),
        alignment_data_vars       = jsonify(names(alignment_data)),
        alignment_text1_data      = jsonify(text1_data),
        alignment_text2_data      = jsonify(text2_data),
        alignment_text_data_vars  = jsonify(names(text1_data))
      )
    )
  }

