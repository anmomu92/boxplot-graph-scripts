# Set the output file type and name (e.g., PNG)
set terminal pngcairo size 800, 600 enhanced font 'Verdana,12'
set output 'output.png'

# Set the plot title and axis labels
set title 'Data Transfer Rate'
set xlabel 'MSG_SIZE'
set ylabel 'Transfer Rate (KB/s)'

# Set the format for the Y-axis to display as kilobytes
set format y "%.0fKB"

# Plot the data from "data.txt"
plot 'udp-throughput-157286400.txt' using 1:($2/1000) with linespoints title 'Transfer Rate'
