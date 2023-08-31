# Set the output file type and name
set terminal svg

##################
# UDP THROUGHPUT #
##################

# Plot the udp-throughput 
set output 'udp-throughput.svg'

# Set the plot title and axis labels for the first graph
set title 'Netperf - UDP connection throughput'
set xlabel "Message size (B)"
set ylabel "Throughput (Mbps)"

# Set properties for the bars in the first graph
set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 0.5
set key top left
set offsets 0.5, 0.5, graph 0.1, graph 0.1 

# Set properties for the bars in the first graph
set style line 2 \
    linecolor rgb '#60ad00' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 0.5
set key top left
set offsets 0.5, 0.5, graph 0.1, graph 0.1 


# Plot the first graph
plot "udp-throughput-212992.txt" using 0:2:xtic(1) with linespoints linestyle 1 title "Buffer size: 208 KB", "" using 0:2:2 with labels font ',8' offset char 1.75,-0.5 notitle "", \
     "udp-throughput-157286400.txt" using 0:2:xtic(1) with linespoints linestyle 2 title "Buffer size: 150 MB", "" using 0:2:2 with labels font ',8' offset char -1.75,0.5 notitle ""
     

#############
# UDP ERROR #
#############

# Plot the udp-error 
set output 'udp-error.svg'

# Set the plot title and axis labels for the second graph
set title 'Netperf - UDP connection error'
set xlabel "Message size (B)"
set ylabel "Error (%)"

# Set properties for the bars in the first graph
set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 4 \
    pointtype 7 pointsize 0.7
set key top left
set offsets 0.5, 0.5, graph 0.1, graph 0.1 

# Set properties for the bars in the first graph
set style line 2 \
    linecolor rgb '#60ad00' \
    linetype 1 linewidth 2 \
    pointtype 5 pointsize 0.5
set key top left
set offsets 0.5, 0.5, graph 0.1, graph 0.1 


# Plot the first graph
plot "udp-error-212992.txt" using 0:2:xtic(1) with linespoints linestyle 1 title "Buffer size: 208 KB", "" using 0:2:2 with labels font ',8' offset char 0,-0.5 notitle "", \
     "udp-error-157286400.txt" using 0:2:xtic(1) with linespoints linestyle 2 title "Buffer size: 150 MB", "" using 0:2:2 with labels font ',8' offset char 0,0.5 notitle ""
     

