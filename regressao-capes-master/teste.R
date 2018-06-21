library(tidyverse)
library(httr)
library(jsonlite)

# Save username as variable
username <- 'Gleyser'

# Save base enpoint as variable
url_git <- 'https://api.github.com/'

reposit <- GET(url = paste0(url_git,'/repositories'), since = "100")

repo_content <- content(reposit)

repo_df <- lapply(repo_content, function(x) {
    df <- data_frame(repo        = x$name,
                     address     = x$html_url,
                     commits     = x$git_commits_url,
                     contribuidores = x$contributors_url,
                     lang = x$languages_url
                     )
}) %>% bind_rows()

commits_df2 <- reposit <- GET(url = paste0('https://api.github.com/repos/mojombo/grit/languages'))
