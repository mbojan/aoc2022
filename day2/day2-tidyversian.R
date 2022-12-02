# AoC 2022 - Day 2 --------------------------------------------------------

# https://adventofcode.com/2022/day/2

library(dplyr)
requireNamespace("here")


# Part 1 ------------------------------------------------------------------

strategy_guide <- readr::read_delim(here::here("day2", "day2-input.txt"),
                  col_types = "c",
                  col_names = c("v1", "v2"))

d <- strategy_guide |>
  mutate(
    s_theirs = match(v1, LETTERS[1:3]),
    s_ours = match(v2, LETTERS[24:26]),
    outcome = (3 + s_theirs - s_ours) %% 3,
    s_outcome = c(3, 0, 6)[outcome + 1],
    pts = s_ours + s_outcome
  )

with(d, sum(pts))
