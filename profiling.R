# developed countries

m49_developed_export <- dataUN_export[dataUN_export$ECONOMY == "M49 developed regions", ]
m49_developed_export_t <- transpose(m49_developed_export)
m49_developed_export_t$Years <- colnames(m49_developed_export)
m49_developed_export_t <- m49_developed_export_t[-(1: 51), ]
m49_developed_export_t$V1 <- as.numeric(m49_developed_export_t$V1)

m49_developed_export_share <- dataUN_export_share[dataUN_export_share$ECONOMY == "M49 developed regions", ]
m49_developed_export_share_t <- transpose(m49_developed_export_share)
m49_developed_export_share_t$Years <- colnames(m49_developed_export_share)
m49_developed_export_share_t <- m49_developed_export_share_t[-(1: 51), ]
m49_developed_export_share_t$V1 <- as.numeric(m49_developed_export_share_t$V1)

ggplot(data = m49_developed_export_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )

ggplot(data = m49_developed_export_share_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )

# developing countries

m49_developing_export <- dataUN_export[dataUN_export$ECONOMY == "M49 developing regions", ]
m49_developing_export_t <- transpose(m49_developing_export)
m49_developing_export_t$Years <- colnames(m49_developing_export)
m49_developing_export_t <- m49_developing_export_t[-(1: 51), ]
m49_developing_export_t$V1 <- as.numeric(m49_developing_export_t$V1)

m49_developing_export_share <- dataUN_export_share[dataUN_export_share$ECONOMY == "M49 developing regions", ]
m49_developing_export_share_t <- transpose(m49_developing_export_share)
m49_developing_export_share_t$Years <- colnames(m49_developing_export_share)
m49_developing_export_share_t <- m49_developing_export_share_t[-(1: 51), ]
m49_developing_export_share_t$V1 <- as.numeric(m49_developing_export_share_t$V1)

ggplot(data = m49_developing_export_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )

ggplot(data = m49_developing_export_share_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )

# ldc_export countries

ldc_export <- dataUN_export[dataUN_export$ECONOMY == "LDCs (Least developed countries)", ]
ldc_export_t <- transpose(ldc_export)
ldc_export_t$Years <- colnames(ldc_export)
ldc_export_t <- ldc_export_t[-(1: 51), ]
ldc_export_t$V1 <- as.numeric(ldc_export_t$V1)

ldc_export_share <- dataUN_export_share[dataUN_export_share$ECONOMY == "LDCs (Least developed countries)", ]
ldc_export_share_t <- transpose(ldc_export_share)
ldc_export_share_t$Years <- colnames(ldc_export_share)
ldc_export_share_t <- ldc_export_share_t[-(1: 51), ]
ldc_export_share_t$V1 <- as.numeric(ldc_export_share_t$V1)

ggplot(data = ldc_export_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )

ggplot(data = ldc_export_share_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )

# stack bar of developed, developing and lcd countries

m49_developed_export <- transpose(m49_developed_export_t)
colnames(m49_developed_export) <- m49_developed_export[2, ]
m49_developed_export <- m49_developed_export[-2, ]
m49_developed_export_share <- transpose(m49_developed_export_share_t)
colnames(m49_developed_export_share) <- m49_developed_export_share[2, ]
m49_developed_export_share <- m49_developed_export_share[-2, ]

m49_developing_export <- transpose(m49_developing_export_t)
colnames(m49_developing_export) <- m49_developing_export[2, ]
m49_developing_export <- m49_developing_export[-2, ]
m49_developing_export_share <- transpose(m49_developing_export_share_t)
colnames(m49_developing_export_share) <- m49_developing_export_share[2, ]
m49_developing_export_share <- m49_developing_export_share[-2, ]

ldc_export <- transpose(ldc_export_t)
colnames(ldc_export) <- ldc_export[2, ]
ldc_export <- ldc_export[-2, ]
ldc_export_share <- transpose(ldc_export_share_t)
colnames(ldc_export_share) <- ldc_export_share[2, ]
ldc_export_share <- ldc_export_share[-2, ]

developed_developing_ldc_export <- rbind(m49_developed_export, m49_developing_export, ldc_export)[, -1]
developed_developing_ldc_export_m <- data.matrix(developed_developing_ldc_export)
rownames(developed_developing_ldc_export_m) <- c("Developed Countries", "Developing Countries", "Least Developed Countries")

developed_developing_ldc_export_share <- rbind(m49_developed_export_share, m49_developing_export_share, ldc_export_share)[, -1]
developed_developing_ldc_export_share_m <- data.matrix(developed_developing_ldc_export_share)
rownames(developed_developing_ldc_export_share_m) <- c("Developed Countries", "Developing Countries", "Least Developed Countries")

png(file = "./diagrams/developed_developing_ldc_export.png", width = 10, height = 6, units = "in", res = 500)
barplot_developed_developing_ldc_export <- barplot(
  developed_developing_ldc_export_m,
  col=c("#56B4E9", "#A0DB8E", "#D55E00"),
  border="white", font.axis=2, beside=T,
  legend=rownames(developed_developing_ldc_export_m),
  args.legend = list(x = "topleft", bty = "n", inset=c(0.01, 0)),
  font.lab=2
)
dev.off()

png(file = "./diagrams/developed_developing_ldc_export_share.png", width = 10, height = 6, units = "in", res = 500)
barplot_developed_developing_ldc_export_share <- barplot(
  developed_developing_ldc_export_share_m,
  col=c("#56B4E9", "#A0DB8E", "#D55E00"),
  border="white", font.axis=2, beside=T,
  legend=rownames(developed_developing_ldc_export_share_m),
  args.legend = list(x = "topright", bty = "n", inset=c(0.01, 0)),
  font.lab=2
)
dev.off()

# plotly graphs

developed_developing_ldc_export_t <- data.frame(m49_developed_export_t$V1, m49_developing_export_t$V1, ldc_export_t$V1, ldc_export_t$Years)
colnames(developed_developing_ldc_export_t) <- c("Developed", "Developing", "LDC", "Years")

plotly_developed_developing_ldc_export <- developed_developing_ldc_export_t %>%
  plot_ly() %>%
  add_trace(x = ~Years, y = ~Developed, type = "bar", name = "Developed Countries",
            marker = list(color = "#56B4E9")) %>%
  add_trace(x = ~Years, y = ~Developing, type = "bar", name = "Developing Countries",
            marker = list(color = "#A0DB8E")) %>%
  add_trace(x = ~Years, y = ~LDC, type = "bar", name = "Least Developed Countries",
            marker = list(color = "#D55E00")) %>%
  layout(title = "Merhcandise Export over Time",
         yaxis = list(title = "Merhcandise Export (million USD)"),
         barmode = "group")
plotly_developed_developing_ldc_export

developed_developing_ldc_export_share_t <- data.frame(m49_developed_export_share_t$V1, m49_developing_export_share_t$V1, ldc_export_share_t$V1, ldc_export_share_t$Years)
colnames(developed_developing_ldc_export_share_t) <- c("Developed", "Developing", "LDC", "Years")

plotly_developed_developing_ldc_export_share <- developed_developing_ldc_export_share_t %>%
  plot_ly() %>%
  add_trace(x = ~Years, y = ~Developed, type = "bar", name = "Developed Countries",
            marker = list(color = "#56B4E9")) %>%
  add_trace(x = ~Years, y = ~Developing, type = "bar", name = "Developing Countries",
            marker = list(color = "#A0DB8E")) %>%
  add_trace(x = ~Years, y = ~LDC, type = "bar", name = "Least Developed Countries",
            marker = list(color = "#D55E00")) %>%
  layout(title = "Merhcandise Export Share over Time",
         yaxis = list(title = "Merhcandise Export Share (%)"),
         barmode = "group")
plotly_developed_developing_ldc_export_share

plotly_ldc_export_share <- developed_developing_ldc_export_share_t %>%
  plot_ly() %>% 
  add_trace(x = ~Years, y = ~LDC, type = "bar", name = "Least Developed Countries",
            marker = list(color = "#D55E00")) %>%
  layout(title = "Merhcandise Export Share of Least Least Developed Countries over Time",
         yaxis = list(title = "Merhcandise Export Share (%)"),
         barmode = "bar-basic")
plotly_ldc_export_share