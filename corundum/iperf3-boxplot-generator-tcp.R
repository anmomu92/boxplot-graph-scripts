# Sample data for multiple boxes
data1 <- read.table("sin-switch/iperf3/tcp-box-plot-212992.txt", header = FALSE)
data2 <- read.table("sin-switch/iperf3/tcp-box-plot-157286400.txt", header = FALSE)

# Define custom y-axis values
#y_values <- c("208 KB", "150 MB")

# Combine data into a matrix
data_matrix <- cbind(data1, data2)

column_names <- c("208 KB", "150 MB")

# Set the column names for the data_matrix
colnames(data_matrix) <- column_names


# Create a boxplot with multiple boxes
bp <- boxplot(data_matrix, horizontal=TRUE, main="Conf. 1 - iperf3 TCP throughput", xlab="Throughput (Mbps)", ylab="Buffer size", col=c("lightblue", "lightgreen"), outline=TRUE)

# Calculate quartiles and median for each box
q1 <- bp$stats[2, ]
q3 <- bp$stats[4, ]
median_val <- bp$stats[3, ]

# Create custom legend labels
legend_labels <- sapply(1:ncol(data_matrix), function(i) {
  paste("Box", i, ": Q1 =", round(q1[i], 2), ", Q2 =", round(median_val[i], 2), ", Q3 =", round(q3[i], 2))
})

# Create a legend
legend("topleft", legend=legend_labels, fill=c("lightblue", "lightgreen"), cex = 0.7)

# Open an SVG graphics device and save the plot as an SVG image
svg("boxplots/one-iperf3-boxplot-tcp-throughput.svg")
boxplot(data_matrix, horizontal=TRUE, main="Conf. 1 - iperf3 TCP throughput", xlab="Throughput (Mbps)", ylab="Buffer size", col=c("lightblue", "lightgreen"), outline=TRUE)
legend("topleft", legend=legend_labels, fill=c("lightblue", "lightgreen"), cex = 0.7)
dev.off()
