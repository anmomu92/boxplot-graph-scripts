# Sample data for multiple boxes
data1 <- read.table("udp-box-plot-157286400-512.txt", header = FALSE)
data2 <- read.table("udp-box-plot-157286400-1024.txt", header = FALSE)
data3 <- read.table("udp-box-plot-157286400-2048.txt", header = FALSE)
data4 <- read.table("udp-box-plot-157286400-4096.txt", header = FALSE)
data5 <- read.table("udp-box-plot-157286400-8192.txt", header = FALSE)
data6 <- read.table("udp-box-plot-157286400-16384.txt", header = FALSE)

# Define custom y-axis values
#y_values <- c("208 KB", "150 MB")

# Combine data into a matrix
data_matrix <- cbind(data1, data2, data3, data4, data5, data6)

column_names <- c("1: 512", "2: 1024", "3: 2048", "4: 4096", "5: 8192", "6: 16384")

# Set the column names for the data_matrix
colnames(data_matrix) <- column_names


# Create a boxplot with multiple boxes
bp <- boxplot(data_matrix, horizontal=FALSE, main="netperf UDP throughput (150 MB)", ylab="Throughput (Mbps)", xlab="Message size (B)", col=c("lightblue", "lightgreen", "lightcoral", "lightyellow", "lightpink", "lightgray"), outline=TRUE)

# Calculate quartiles and median for each box
q1 <- bp$stats[2, ]
q3 <- bp$stats[4, ]
median_val <- bp$stats[3, ]

# Create custom legend labels
legend_labels <- sapply(1:ncol(data_matrix), function(i) {
  paste(i, ": Q1 =", round(q1[i], 2), ", Q2 =", round(median_val[i], 2), ", Q3 =", round(q3[i], 2))
})

# Create a legend
legend("bottomright", legend=legend_labels, fill=c("lightblue", "lightgreen", "lightcoral", "lightyellow", "lightpink", "lightgray"), cex = 0.65)

# Save the ggplot object as an image with a custom height
ggsave("udp-boxplot-150MB-test2.png", width = 10, height = 20)  # Adjust the height as needed