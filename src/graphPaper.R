# Create graph paper UGent
library(tidyverse)

scores <- data.frame(matrix(nrow = 12, ncol = 0))
scores$method <- c("1", "2", "3", "4", "5", "6",
                   "7", "8", "9", "10", "11", "12")
scores$A <- factor(
  c(5,7,6,8,2,1,3,1,6,4,2,5),
  levels = c(0:8))
scores$B <- factor(
  c("-", "-", "F", "H", "C", "D", "C", "A", "E","C", "E", "C"),
  levels = c("-", "A", "B", "C", "D", "E", "F", "G", "H"))
scores$names <- c("LVK1", "LVK+/LVL", "VER", "ONT/ACO/CHO", "CED",
                  "ELV", "KLE", "A24", "ALU", "CHL", "KDI", "WSC")
scores$type <- c(rep("non-lethal", 2), rep("lethal", 10))

p <- ggplot(scores, aes(x = B, y = A, shape = type)) +
  geom_point(show.legend = FALSE) +
  scale_x_discrete(drop=FALSE) +
  scale_y_discrete(drop=FALSE) +
  geom_text(aes(label = names),
            nudge_y = -0.28,
            fontface = "bold",
            hjust="inward") +
  ylab(expression("" %->% "")) +
  xlab(expression("" %->% "")) +
  annotate(x = 0, y=c(1.5,7),
           label=c("Minder lijden","Meer lijden"),
           geom="text", angle=90, vjust=-2, size=4) +
  annotate(y = 0, x=c(1,8.5),
           label=c("Minder lijden","Meer lijden"),
           geom="text", vjust=3, size=4) +
  scale_shape_manual(values = c(16, 1)) +
  coord_cartesian(clip = "off")


ggsave(filename = "./output/graphPaper.jpeg", device='jpeg', dpi=700, width = 15,
       height = 15, units = c("cm"))


# Selecteer pagina's
# paginas <- c(1:42)
a <- sample(paginas, 1)
a
paginas <-  paginas[-a]



