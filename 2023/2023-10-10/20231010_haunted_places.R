library(here)
library(tidyverse)
library(sf)
library(ggthemes)

tuesdata <-
  tidytuesdayR::tt_load('2023-10-10')


haunted_places <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-10-10/haunted_places.csv')

haunted_sf <-
  haunted_places |>
  filter(longitude < -60) |>
  drop_na() |>
  sf::st_as_sf(coords = c("longitude", "latitude"), crs = "WGS84")


haunted_sf |>
  ggplot() +
  geom_sf(
    color = "#7D1D53",
    fill = "#7D1D53",
    alpha = 0.25
  ) +
  theme_map()

usa_shp <-
  giscoR::gisco_get_countries(
  resolution = 1,
  country = "United States"
)

