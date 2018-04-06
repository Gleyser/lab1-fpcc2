

library(tidyverse)
library(here)
library(knitr)
library(ggplot2)
library(gmodels)

projetos = read_csv(here("data/projetos.csv"))
cols(
    gh_project_name = col_character(),
    team = col_integer(),
    lang = col_character(),
    sloc = col_integer(),
    tests_per_kloc = col_double(),
    build_success = col_double()
)

ggplot(data = projetos, 
       mapping = aes(x = "valor", 
                     y = team)) + 
    geom_point(alpha = 0.5, position = position_jitter(width = .1))

projetos %>% 
    ggplot(mapping = aes(x = team)) + 
    geom_histogram(bins = 10) + 
    geom_rug(alpha = 0.7)

```{r}
projetos %>% 
    ggplot(mapping = aes(x = team)) + 
    geom_density()  
    geom_freqpoly(bins = 10)
```