set terminal png size 1000,1000
set logscale y

#Set line styles
set style line 1 \
linecolor rgb '#ff0000' \
linetype 1 linewidth 2.0\
pointtype 7 pointsize 1.0

#Set in/out files
fname_in = sprintf("raw_data/.dat")
fname_out = sprintf("plots/.png")
set output fname_out
set title "{/*1.8 Approximation Error Ratio}"
set xlabel "k"
set ylabel "{/*2 || R_qp3[k:, :] || / || R_cqrcp[k:, :] ||}"

plot fname_in u 0:1:xtic(8) with linespoints linestyle 1 notitle
  
