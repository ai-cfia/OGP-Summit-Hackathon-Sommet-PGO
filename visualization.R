# stack bar of developed, developing and lcd countries

m49_developed_export_to_plot <- transpose(m49_developed_export_to_plot_t)
colnames(m49_developed_export_to_plot) <- m49_developed_export_to_plot[2, ]
m49_developed_export_to_plot <- m49_developed_export_to_plot[-2, ]
m49_developed_export_share_to_plot <- transpose(m49_developed_export_share_to_plot_t)
colnames(m49_developed_export_share_to_plot) <- m49_developed_export_share_to_plot[2, ]
m49_developed_export_share_to_plot <- m49_developed_export_share_to_plot[-2, ]

m49_developing_export_to_plot <- transpose(m49_developing_export_to_plot_t)
colnames(m49_developing_export_to_plot) <- m49_developing_export_to_plot[2, ]
m49_developing_export_to_plot <- m49_developing_export_to_plot[-2, ]
m49_developing_export_share_to_plot <- transpose(m49_developing_export_share_to_plot_t)
colnames(m49_developing_export_share_to_plot) <- m49_developing_export_share_to_plot[2, ]
m49_developing_export_share_to_plot <- m49_developing_export_share_to_plot[-2, ]

ldc_export_to_plot <- transpose(ldc_export_to_plot_t)
colnames(ldc_export_to_plot) <- ldc_export_to_plot[2, ]
ldc_export_to_plot <- ldc_export_to_plot[-2, ]
ldc_export_share_to_plot <- transpose(ldc_export_share_to_plot_t)
colnames(ldc_export_share_to_plot) <- ldc_export_share_to_plot[2, ]
ldc_export_share_to_plot <- ldc_export_share_to_plot[-2, ]

developed_developing_ldc_export <- rbind(m49_developed_export_to_plot, m49_developing_export_to_plot, ldc_export_to_plot)[, -1]
developed_developing_ldc_export_m <- data.matrix(developed_developing_ldc_export)
rownames(developed_developing_ldc_export_m) <- c("Developed Countries", "Developing Countries", "Least Developed Countries")

developed_developing_ldc_export_share <- rbind(m49_developed_export_share_to_plot, m49_developing_export_share_to_plot, ldc_export_share_to_plot)[, -1]
developed_developing_ldc_export_share_m <- data.matrix(developed_developing_ldc_export_share)
rownames(developed_developing_ldc_export_share_m) <- c("Developed Countries", "Developing Countries", "Least Developed Countries")

png(file = "./diagrams/developed_developing_ldc_export.png", width = 10, height = 6, units = "in", res = 500)
barplot_developed_developing_ldc_export <- barplot(
  developed_developing_ldc_export_m,
  col = c("#56B4E9", "#A0DB8E", "#D55E00"),
  border = "white", font.axis = 2, beside = TRUE,
  legend = rownames(developed_developing_ldc_export_m),
  args.legend = list(x = "topleft", bty = "n", inset = c(0.01, 0)),
  font.lab = 2
)
dev.off()

png(file = "./diagrams/developed_developing_ldc_export_share.png", width = 10, height = 6, units = "in", res = 500)
barplot_developed_developing_ldc_export_share <- barplot(
  developed_developing_ldc_export_share_m,
  col = c("#56B4E9", "#A0DB8E", "#D55E00"),
  border = "white", font.axis = 2, beside = TRUE,
  legend = rownames(developed_developing_ldc_export_share_m),
  args.legend = list(x = "topright", bty = "n", inset = c(0.01, 0)),
  font.lab = 2
)
dev.off()

# plotly graphs

developed_developing_ldc_export_to_plot_t <- data.frame(m49_developed_export_to_plot_t$V1, m49_developing_export_to_plot_t$V1, ldc_export_to_plot_t$V1, ldc_export_to_plot_t$Year)
colnames(developed_developing_ldc_export_to_plot_t) <- c("Developed", "Developing", "LDC", "Year")

plotly_developed_developing_ldc_export <- developed_developing_ldc_export_to_plot_t %>%
  plot_ly() %>%
  add_trace(x = ~Year, y = ~Developed, type = "bar", name = "Developed Countries",
            marker = list(color = "#56B4E9")) %>%
  add_trace(x = ~Year, y = ~Developing, type = "bar", name = "Developing Countries",
            marker = list(color = "#A0DB8E")) %>%
  add_trace(x = ~Year, y = ~LDC, type = "bar", name = "Least Developed Countries",
            marker = list(color = "#D55E00")) %>%
  layout(title = "Merhcandise Export over Time",
         yaxis = list(title = "Merhcandise Export (million USD)"),
         barmode = "group")
plotly_developed_developing_ldc_export

developed_developing_ldc_export_share_to_plot_t <- data.frame(m49_developed_export_share_to_plot_t$V1, m49_developing_export_share_to_plot_t$V1, ldc_export_share_to_plot_t$V1, ldc_export_share_to_plot_t$Year)
colnames(developed_developing_ldc_export_share_to_plot_t) <- c("Developed", "Developing", "LDC", "Year")

plotly_developed_developing_ldc_export_share <- developed_developing_ldc_export_share_to_plot_t %>%
  plot_ly() %>%
  add_trace(x = ~Year, y = ~Developed, type = "bar", name = "Developed Countries",
            marker = list(color = "#56B4E9")) %>%
  add_trace(x = ~Year, y = ~Developing, type = "bar", name = "Developing Countries",
            marker = list(color = "#A0DB8E")) %>%
  add_trace(x = ~Year, y = ~LDC, type = "bar", name = "Least Developed Countries",
            marker = list(color = "#D55E00")) %>%
  layout(title = "Merhcandise Export Share over Time",
         yaxis = list(title = "Merhcandise Export Share (%)"),
         barmode = "group")
plotly_developed_developing_ldc_export_share