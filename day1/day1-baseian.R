# AoC 2022 - Day 1 --------------------------------------------------------

# https://adventofcode.com/2022/day/1

requireNamespace("here")

# Part 1 ------------------------------------------------------------------

# Foods carried by elves
l <- readLines(here::here("day1", "day1-input.txt"))
d <- data.frame(
  cals = ifelse(l == "", as.numeric(NA), as.numeric(l))
)
d$id <- cumsum(is.na(d$cals)) + 1
d <- subset(d, !is.na(cals))

# Calories carried by the top Elve
max(elves <- with(d, tapply(cals, id, sum)))



# Part 2 ------------------------------------------------------------------

# Number of calories carried by top three Elves

sum(tail(sort(elves), 3))
