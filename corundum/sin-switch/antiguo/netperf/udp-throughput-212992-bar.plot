# Set the output file type and name (e.g., PNG)
set terminal pngcairo size 800, 600 enhanced font 'Verdana,12'
set output 'output_bar_graph.png'

# Set the plot title and axis labels
set title 'Data Transfer Rate'
set xlabel 'MSG_SIZE'
set ylabel 'Transfer Rate (KB/s)'

# Set the format for the Y-axis to display as kilobytes
set format y "%.0fKB"

# Set properties for the bars
set style fill solid
set boxwidth 0.5
set xtics rotate by -45

# Plot the data from "data.txt" as a bar graph
plot 'udp-throughput-212992.txt' using 1:($2/1000) with boxes fillcolor rgb 'skyblue' title 'Transfer Rate'
