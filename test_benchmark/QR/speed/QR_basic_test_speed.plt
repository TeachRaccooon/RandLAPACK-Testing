set terminal png size 1000,1000
set logscale y
set ytics font ", 30"
set xtics font ", 30"
set key font ",30"
set xtics offset 0, -1
set key bottom right

set lmargin 20
set ylabel offset -7,0
set bmargin 9
set rmargin 6
set tmargin 6
set xlabel offset 0,-3

#Set line styles
set style line 1 \
linecolor rgb '#000000' \
linetype 1 linewidth 3.0\
pointtype 9 pointsize 3.0

#Set line styles
set style line 2 \
linecolor rgb '#0080ff' \
linetype 1 linewidth 3.0 \
pointtype 5 pointsize 3.0

#Set line styles
set style line 3 \
linecolor rgb '#ff0000' \
linetype 1 linewidth 3.0 \
pointtype 7 pointsize 3.0

fname_in = sprintf("raw_data/.dat")
fname_out = sprintf("plots/.png")
set output fname_out
set title "{/*3 QR Speed Comparisons}"
set xlabel "{/*3 Column size}"
set ylabel "{/*3 Runtime (μs)}"

#set xtics ("" 0, "128" 1, "" 2, "512" 3, "" 4)
#set xtics ("" 0, "512" 1, "" 2, "2048" 3, "" 4)
#set xtics ("" 0, "1024" 1, "" 2, "4096" 3, "" 4)

plot fname_in u 0:1:xtic(8) with linespoints linestyle 1 title "CholQR", '' u 0:2:xtic(8) with linespoints linestyle 2 title "GEQP3", '' u 0:3:xtic(8) with linespoints linestyle 3 title "GEQRF"