
# Load necessary libraries
library(ggplot2)
library(gridExtra)

# Create the hexagon data
hexagon <- data.frame(
  x = c(0, 0, 60, 120, 120, 60, 0),
  y = c(40, 110, 150, 110, 40, 0, 40)
)

upper_triangle <- data.frame(
  x = c(0, 60, 120, 0),
  y = c(110, 150, 110, 110)
)

lower_triangle <- data.frame(
  x = c(0, 60, 120, 0),
  y = c(40, 0, 40, 40)
)

rectangle <- data.frame(
  x = c(0, 120, 120, 0, 0),
  y = c(40, 40, 110, 110, 40)
)

# Luxembourgish flag
lux_colors <- c("#00A1DE", "#FFFFFF", "#ED2939")

p <- ggplot() +
  geom_polygon(data = lower_triangle, aes(x = x, y = y), fill = lux_colors[1]) +
  geom_polygon(data = upper_triangle, aes(x = x, y = y), fill = lux_colors[3]) +
  geom_polygon(data = rectangle, aes(x = x, y = y), fill = lux_colors[2]) +
  geom_polygon(data = hexagon, aes(x = x, y = y), fill = NA, color = "black", linewidth = 4) +
  annotate("text", x = 60, y = 75, label = "datapubliclu", size = 16) +
  coord_fixed() +
  theme_void() +
  theme(plot.background = element_rect(fill = "transparent", color = NA))

# Save the plot as a PNG file with a transparent background
ggsave("man/figures/README-/logo.png", plot = p, width = 5, height = 5, bg = "transparent")
