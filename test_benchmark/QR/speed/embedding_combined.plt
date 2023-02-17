set terminal png size 1500,1500
set ytics font ", 50"
set xtics font ", 50"
set key font ", 50"
set xtics offset 0, -2.5
set key top left

set lmargin 20
set ylabel offset -7,0
set bmargin 9
set rmargin 6
set tmargin 6
set xlabel offset 0,-5
set title offset 0, 1

#Set line styles
set style line 1 \
linecolor rgb '#000000' \
linetype 1 linewidth 5.0\
pointtype 8 pointsize 6.0

#Set line styles
set style line 2 \
linecolor rgb '#0080ff' \
linetype 1 linewidth 5.0 \
pointtype 4 pointsize 6.0

#Set line styles
set style line 3 \
linecolor rgb '#ff0000' \
linetype 1 linewidth 5.0 \
pointtype 6 pointsize 6.0

fname_in = sprintf("raw_data/embedding_combined.dat")
fname_out = sprintf("plots/embedding_combined.png")

set output fname_out
#set title "{/*3 Effect of the Embedding Dimension" font ", 17" #on CholQRCP runtime
set xlabel "{/*3 d/n}" font ", 18"
set ylabel "{/*3 Runtime (s)}" font ", 20"

#ntics = 4    
#set xtics n/ntics        
set xtics ("" 0, "1.5" 1, "" 2, "2.5" 3, "" 4, "3.5" 5, "" 6)

plot fname_in u 0:1 with linespoints linestyle 1 title "col=1024", '' u 0:2 with linespoints linestyle 2 title "col=2048", '' u 0:3 with linespoints linestyle 3 title "col=4096"
