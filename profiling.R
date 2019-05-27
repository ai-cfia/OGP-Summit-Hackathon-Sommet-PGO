# developed countries

m49_developed <- dataUN[dataUN$ECONOMY == "M49 developed regions", ]
m49_developed_t <- transpose(m49_developed)
m49_developed_t$Years <- colnames(m49_developed)
m49_developed_t <- m49_developed_t[-(1: 51), ]
m49_developed_t$V1 <- as.numeric(m49_developed_t$V1)
m49_developed_t$Years <- substring(m49_developed_t$Years, 2)

ggplot(data = m49_developed_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )

# developing countries

m49_developing <- dataUN[dataUN$ECONOMY == "M49 developing regions", ]
m49_developing_t <- transpose(m49_developing)
m49_developing_t$Years <- colnames(m49_developing)
m49_developing_t <- m49_developing_t[-(1: 51), ]
m49_developing_t$V1 <- as.numeric(m49_developing_t$V1)
m49_developing_t$Years <- substring(m49_developing_t$Years, 2)

ggplot(data = m49_developing_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )

# ldc countries

ldc <- dataUN[dataUN$ECONOMY == "LDCs (Least developed countries)", ]
ldc_t <- transpose(ldc)
ldc_t$Years <- colnames(ldc)
ldc_t <- ldc_t[-(1: 51), ]
ldc_t$V1 <- as.numeric(ldc_t$V1)
ldc_t$Years <- substring(ldc_t$Years, 2)

ggplot(data = ldc_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )

# stack bar of developed, developing and lcd countries

m49_developed <- transpose(m49_developed_t)
colnames(m49_developed) <- m49_developed[2, ]
m49_developed <- m49_developed[-2, ]

m49_developing <- transpose(m49_developing_t)
colnames(m49_developing) <- m49_developing[2, ]
m49_developing <- m49_developing[-2, ]

ldc <- transpose(ldc_t)
colnames(ldc) <- ldc[2, ]
ldc <- ldc[-2, ]

m49_developed_developing_ldc <- rbind(m49_developed, m49_developing, ldc)[, -1]
m49_developed_developing_ldc_m <- data.matrix(m49_developed_developing_ldc)
rownames(m49_developed_developing_ldc_m) <- c("developed", "developing", "ldc")

png(file = "./diagrams/developed_developing_ldc.png", width = 10, height = 6, units = "in", res = 500)
barplot_developed_developing_ldc <- barplot(
  m49_developed_developing_ldc_m,
  col=c("#58afd0", "#a0db8e", "#990000"),
  border="white", font.axis=2, beside=T,
  legend=rownames(m49_developed_developing_ldc_m),
  args.legend = list(x = "topleft", bty = "n", inset=c(0.01, 0)),
  font.lab=2
)
dev.off()