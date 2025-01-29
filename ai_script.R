# R for the rest of us course on AI in Rstudio

# Load Package

library(tidyverse)


# Import data

survey_english <-
  read_tsv("https://raw.githubusercontent.com/rstudio/r-community-survey/master/2020/data/2020-english-survey-final.tsv"
)

# Data analysis

# Count the responses on the Qr_experience variable, grouped by Qr_how_often_used
# Keep the result in a tidy format
# Use the native pipe, and not the tidyverspipe

survey_english %>%
  group_by(Qr_experience, Qr_how_often_used) %>% 
  ggplot(aes(x = Qr_experience, fill = Qr_how_often_used)) +
  geom_bar() +
  theme_minimal() +
  labs(title = "Experience with R and how often it is used",
       x = "Experience with R",
       y = "Count")

survey_english %>%
  count(Qr_experience, Qr_how_often_used)

survey_english %>%
  count(Qr_experience)

usethis::edit_r_environ()


# Ellmer package

library(ellmer)


chat <- chat_openai(
  system_prompt = "You are an intermediate R user who prefers the tidyverse."
)

chat$chat("Who invented R?")
chat$chat("What is the best way to learn R?")

chat$chat("What is the easiest way to make a histogram in R?")

# Pal

library(pal)

options(
  .pal.fn = "chat_openai",
  .pal_args = list(model = "gpt-4o")
)

#devtools::install_github("frankiethull/ggpal2")

library(ggpal2)

# Make a histogram


