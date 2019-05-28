# developed countries

m49_developed_export <- dataUN_export[dataUN_export$ECONOMY == "M49 developed regions", ]
m49_developed_export_t <- transpose(m49_developed_export)
m49_developed_export_t$Years <- colnames(m49_developed_export)
m49_developed_export_t <- m49_developed_export_t[-1, ]
m49_developed_export_t$V1 <- as.numeric(m49_developed_export_t$V1)
m49_developed_export_to_plot_t <- m49_developed_export_t[-(1: 50), ]

m49_developed_export_share <- dataUN_export_share[dataUN_export_share$ECONOMY == "M49 developed regions", ]
m49_developed_export_share_t <- transpose(m49_developed_export_share)
m49_developed_export_share_t$Years <- colnames(m49_developed_export_share)
m49_developed_export_share_t <- m49_developed_export_share_t[-1, ]
m49_developed_export_share_t$V1 <- as.numeric(m49_developed_export_share_t$V1)
m49_developed_export_share_to_plot_t <- m49_developed_export_share_t[-(1: 50), ]

ggplot(data = m49_developed_export_to_plot_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )

ggplot(data = m49_developed_export_share_to_plot_t, mapping = aes(x = Years, y = V1)) +
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
m49_developing_export_t <- m49_developing_export_t[-1, ]
m49_developing_export_t$V1 <- as.numeric(m49_developing_export_t$V1)
m49_developing_export_to_plot_t <- m49_developing_export_t[-(1: 50), ]

m49_developing_export_share <- dataUN_export_share[dataUN_export_share$ECONOMY == "M49 developing regions", ]
m49_developing_export_share_t <- transpose(m49_developing_export_share)
m49_developing_export_share_t$Years <- colnames(m49_developing_export_share)
m49_developing_export_share_t <- m49_developing_export_share_t[-1, ]
m49_developing_export_share_t$V1 <- as.numeric(m49_developing_export_share_t$V1)
m49_developing_export_share_to_plot_t <- m49_developing_export_share_t[-(1: 50), ]

ggplot(data = m49_developing_export_to_plot_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )

ggplot(data = m49_developing_export_share_to_plot_t, mapping = aes(x = Years, y = V1)) +
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
ldc_export_t <- ldc_export_t[-1, ]
ldc_export_t$V1 <- as.numeric(ldc_export_t$V1)
ldc_export_to_plot_t <- ldc_export_t[-(1: 50), ]

ldc_export_share <- dataUN_export_share[dataUN_export_share$ECONOMY == "LDCs (Least developed countries)", ]
ldc_export_share_t <- transpose(ldc_export_share)
ldc_export_share_t$Years <- colnames(ldc_export_share)
ldc_export_share_t <- ldc_export_share_t[-1, ]
ldc_export_share_t$V1 <- as.numeric(ldc_export_share_t$V1)
ldc_export_share_to_plot_t <- ldc_export_share_t[-(1: 50), ]

ggplot(data = ldc_export_to_plot_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )

ggplot(data = ldc_export_share_to_plot_t, mapping = aes(x = Years, y = V1)) +
  geom_bar(width = 0.5, stat = "identity") +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.position = "none"
  )