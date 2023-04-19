set terminal png size 1500,1500
set logscale y
set ytics font ", 45"
set xtics font ", 45"
set key font ", 50"
set xtics offset 0, -2.5
set key bottom right
set grid
set key spacing 1.5 
set key box lt -1 lw 2

set lmargin 20
set ylabel offset -6,-2
set bmargin 9
set rmargin 6
set tmargin 6
set xlabel offset 0,-5

#Set line styles
set style line 1 \
linecolor rgb 'blue' \
linetype 1 linewidth 1.5\
pointtype 7 pointsize 2

#Set line styles
set style line 2 \
linecolor rgb '#0080ff' \
linetype 1 linewidth 2 \
pointtype 7 pointsize 2


#Set in/out files
fname_in = sprintf("raw_data/A_spiked_spectrum.dat")
fname_out = sprintf("plots/A_spiked_spectrum.png")
set output fname_out
#set title "{/*Spectrum of A^{pre}}" font ", 30"
set xlabel "{/*3 k}" font ", 20"
set ylabel "{/*3 s_{k}}" font ", 20"

ntics = 4
set xtics 1024/ntics
#set xtics ("" 0, "256" 256, "" 512, "768" 768, "" 1024)
set xtics ("" 0, "500" 500, "" 1000, "1500" 1500, "" 2000)

unset key

plot fname_in u 0:1:xtic(8) with linespoints linestyle 1 title "SPECTRUM"                   
