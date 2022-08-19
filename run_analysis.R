filterData <- function(merged_tbl) {
  merged_tbl %>% select(subject_id, activity_label, matches("mean|std")) %>% group_by(subject_id, activity_label) %>% summarize_all(.funs = c(mean = "mean"))
} 

getMergedData <- function() {
  first <- readData("test")
  second <- readData("train")
  tbl_df(merge(first, second, all.x = TRUE, all.y = TRUE))
}

readData <- function(x, variable_names) {
  signal_file <- paste(x, "/X_", x, ".txt", sep = "")
  signal_data <- read.table(signal_file)
  colnames(signal_data) <- getVariableNames()
  signal_df <- data.frame(getSubjectIds(x), getActivityNames(x), signal_data)
  colnames(signal_df)[2] <- "activity_label"
  signal_df
}

getActivityNames <- function(x) {
  activity_names <- read.table("activity_labels.txt")
  activity_file <- paste(x, "/y_", x, ".txt", sep = "")
  activity <- read.table(activity_file)
  colnames(activity) <- c("activity_id")
  colnames(activity_names) <- c("activity_id", "activity_name")
  merge(activity, activity_names)$activity_name
}

getSubjectIds <- function(x) {
  subject_file <- paste(x, "/subject_", x, ".txt", sep = "")
  subject_ids <- read.table(subject_file)
  colnames(subject_ids) <- c("subject_id")
  subject_ids
}

getVariableNames <- function() {
  variable_names <- read.table("features.txt")
  variable_names$V2 <- gsub(",", "-", variable_names$V2)
  variable_names$V2 <- gsub("\\(", "", variable_names$V2)
  variable_names$V2 <- gsub("\\)", "", variable_names$V2)
  variable_names$V2
}
