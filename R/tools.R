#' function for binding data.frames even if names do not match
#' @param df1 first data.frame to rbind
#' @param df2 second data.frame to rbind
#' @keywords internal
rbind_fill <- function(df1=data.frame(), df2=data.frame()){

  # get union of names
  names_df <- c(names(df1), names(df2))

  # prepare empty data.frame
  empty_frame <- data.frame(lapply(names_df, as.data.frame))
  names(empty_frame) <- names_df
  if(length(names_df)>0){
    empty_frame <- subset(empty_frame, FALSE)
  }

  # filling up
  if( dim1(df1) > 0 ){
    df1[, names_df[!(names_df %in% names(df1))]] <- rep(NA, dim1(df1))
  }else{
    df1 <- empty_frame
  }

  if( dim1(df2) > 0 ){
    df2[, names_df[!(names_df %in% names(df2))]] <- rep(NA, dim1(df2))
  }else{
    df2 <- empty_frame
  }

  # doing-duty-to-do
  rbind(df1, df2)
}




#' get first dimension or length of object
#' @param x object, matrix, vector, data.frame, ...
#' @keywords internal
dim1 <- function(x){
  ifelse(is.null(dim(x)[1]), length(x), dim(x)[1])
}


#' get first dimension or length of object
#' @param x object, matrix, vector, data.frame, ...
#' @keywords internal
dim2 <- function(x){
  dim(x)[2]
}


#' seq along first dimension / length
#' @param x x
#' @keywords internal
seq_dim1 <- function(x){
  seq_len(dim1(x))
}

