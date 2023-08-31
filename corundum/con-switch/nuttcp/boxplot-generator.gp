# Set terminal and output file type (SVG)
set terminal svg size 600, 400
set output 'boxplot.svg'

# Set the plot title and axis labels
set title 'Box Plot Example'
set xlabel 'Categories'
set ylabel 'Data Values'

# Set the font size for labels and tick marks
set xlabel font 'Verdana,10'
set ylabel font 'Verdana,10'

# Set the style for box plots
set style fill solid 0.25 border lt -1

# Define the data file and the columns to use
datafile = 'boxplot-output-tcp-box-plot-157286400.txt'

box_width = 0.2

# Number of box plots (excluding the label column)
num_boxes = 1

# Define the x-axis positions for each box plot
x_pos(col) = (col - 1) * 2

# Plot the box plots
plot for [col=2:num_boxes+1] datafile using (x_pos(col)):3:($4-$3):($5-$4):($2-$3):($5-$2) with candlesticks title columnheader(col) whiskerbars, \
     '' using (x_pos($0)):4 with points pointtype 7 linecolor rgb 'black' title 'Median'
