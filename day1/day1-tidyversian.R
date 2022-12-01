# AoC 2022 - Day 1 --------------------------------------------------------

# https://adventofcode.com/2022/day/1

library(dplyr)
library(tibble)
requireNamespace("here")



# Part 1 ------------------------------------------------------------------

# Foods carried by elves
foods <- readLines(here::here("day1", "day1-input.txt")) |>
  enframe(name = "line_no", value = "cals") |>
  mutate(
    cals = ifelse(cals == "", as.numeric(NA), as.numeric(cals)),
    id_elve = cumsum(is.na(cals)) + 1
  ) |>
  filter(!is.na(cals))

# Cals carried by the Elve caryying the most
foods |>
  group_by(id_elve) |>
  summarise(cals = sum(cals)) |>
  with(max(cals))



# Part 2 ------------------------------------------------------------------

# Number of calories carried by top three Elves

foods |>
  group_by(id_elve) |>
  summarise(cals = sum(cals)) |>
  arrange(desc(cals)) |>
  head(3) |>
  with(sum(cals))
