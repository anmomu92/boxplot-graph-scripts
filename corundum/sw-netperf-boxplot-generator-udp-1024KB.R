# Sample data for multiple boxes
data1 <- read.table("con-switch/netperf/udp-box-plot-1024-512.txt", header = FALSE)
data2 <- read.table("con-switch/netperf/udp-box-plot-1024-1024.txt", header = FALSE)
data3 <- read.table("con-switch/netperf/udp-box-plot-1024-2048.txt", header = FALSE)
data4 <- read.table("con-switch/netperf/udp-box-plot-1024-4096.txt", header = FALSE)
data5 <- read.table("con-switch/netperf/udp-box-plot-1024-8192.txt", header = FALSE)
data6 <- read.table("con-switch/netperf/udp-box-plot-1024-16384.txt", header = FALSE)

# Combine data into a matrix
data_matrix <- cbind(data1, data2, data3, data4, data5, data6)

column_names <- c("512", "1024", "2048", "4096", "8192", "16384")

# Set the column names for the data_matrix
colnames(data_matrix) <- column_names


# Create a boxplot with multiple boxes
bp <- boxplot(data_matrix, horizontal=FALSE, main="Conf. 2 - netperf UDP throughput (1 MB)", ylab="Throughput (Mbps)", xlab="Message size", col=c("lightblue", "lightgreen", "lightcoral", "lightyellow", "lightpink", "lightgray"), outline=FALSE)

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
svg("boxplots/two-netperf-boxplot-udp-throughput-1mb-six-buffer.svg")
boxplot(data_matrix, horizontal=FALSE, main="Conf. 2 - netperf UDP throughput (1 MB)", ylab="Throughput (Mbps)", xlab="Message size (B)", col=c("lightblue", "lightgreen", "lightcoral", "lightyellow", "lightpink", "lightgray"), outline=TRUE)
legend("bottomright", legend=legend_labels, fill=c("lightblue", "lightgreen", "lightcoral", "lightyellow", "lightpink", "lightgray"), cex = 0.7)
dev.off()