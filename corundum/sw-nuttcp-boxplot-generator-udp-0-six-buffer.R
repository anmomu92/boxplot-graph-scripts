# Sample data for multiple boxes
data1 <- read.table("con-switch/nuttcp/udp-box-plot-104-0.txt", header = FALSE)
data2 <- read.table("con-switch/nuttcp/udp-box-plot-208-0.txt", header = FALSE)
data3 <- read.table("con-switch/nuttcp/udp-box-plot-512-0.txt", header = FALSE)
data4 <- read.table("con-switch/nuttcp/udp-box-plot-1024-0.txt", header = FALSE)
data5 <- read.table("con-switch/nuttcp/udp-box-plot-10240-0.txt", header = FALSE)
data6 <- read.table("con-switch/nuttcp/udp-box-plot-51200-0.txt", header = FALSE)

# Define custom y-axis values
#y_values <- c("208 KB", "150 MB")

# Combine data into a matrix
data_matrix <- cbind(data1, data2, data3, data4, data5, data6)

column_names <- c("104 KB", "208 KB", "512 KB", "1 MB", "10 MB", "50 MB")

# Set the column names for the data_matrix
colnames(data_matrix) <- column_names

# Create a boxplot with multiple boxes
bp <- boxplot(data_matrix, horizontal=FALSE, main="Conf. 2 - nuttcp UDP throughput (no injection limit)", ylab="Throughput (Mbps)", xlab="Buffer size", col=c("lightblue", "lightgreen", "lightcoral", "lightyellow", "lightpink", "lightgray"), outline=TRUE)

par(cex.axis = 0.8, cex.lab = 0.8)

# Calculate quartiles and median for each box
q1 <- bp$stats[2, ]
q3 <- bp$stats[4, ]
median_val <- bp$stats[3, ]

# Create custom legend labels
legend_labels <- sapply(1:ncol(data_matrix), function(i) {
  paste("Box", i, ": Q1 =", round(q1[i], 2), ", Q2 =", round(median_val[i], 2), ", Q3 =", round(q3[i], 2))
})

# Create a legend
legend("bottomright", legend=legend_labels, fill=c("lightblue", "lightgreen", "lightcoral", "lightyellow", "lightpink", "lightgray"), cex = 0.7)

# Open an SVG graphics device and save the plot as an SVG image
svg("boxplots/two-nuttcp-boxplot-udp-throughput-0-six-buffer.svg")
boxplot(data_matrix, horizontal=FALSE, main="Conf. 2 - iperf3 UDP throughput (no injection limit)", ylab="Throughput (Mbps)", xlab="Buffer size", col=c("lightblue", "lightgreen", "lightcoral", "lightyellow", "lightpink", "lightgray"), outline=TRUE)
par(cex.axis = 0.8, cex.lab = 0.8)
legend("bottomright", legend=legend_labels, fill=c("lightblue", "lightgreen", "lightcoral", "lightyellow", "lightpink", "lightgray"), cex = 0.7)
dev.off()