suppressPackageStartupMessages(library(tidyverse))
fin=read_csv("dummy_data.csv", show_col_types = F)

f=fin %>% 
  mutate(
    SEA_duration = case_when(
      duration_SEA == 0 ~ 0, 
      duration_SEA != 0 ~ duration_SEA+sample(c(-1,1))
    ),
    offset = runif(50, min=-.1, max=.1),
    ACCURACY_ASIAN = 
      accuracy_Asian + (offset*accuracy_Asian),
    diff = ACCURACY_ASIAN - accuracy_Asian
    )

df = f %>% select(Age, Sex, Ethnicity, SEA_duration, ACCURACY_ASIAN) %>% 
  rename(duration_SEA = SEA_duration, accuracy_Asian = ACCURACY_ASIAN)
