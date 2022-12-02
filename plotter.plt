set terminal png size 1000,1000
set logscale y

#Set line styles
set style line 1 \
linecolor rgb '#000000' \
linetype 1 linewidth 2.0\
pointtype 7 pointsize 1.0

#Set line styles
set style line 2 \
linecolor rgb '#0080ff' \
linetype 1 linewidth 2.0 \
pointtype 7 pointsize 1.0

#Set in/out files
fname_in = sprintf("r_ratios.dat")
fname_out = sprintf("plot.png")
set output fname_out
set title "{/*1.8 Ratio of diagonal of R to the singular values}"
set xlabel "x"
#unset xtics
set ylabel "{/*2 r/s}"

plot fname_in u 0:1:xtic(8) with linespoints linestyle 1 title "CholQRCP", '' u 0:2:xtic(8) with linespoints linestyle 2 title "GEQP3"
  
