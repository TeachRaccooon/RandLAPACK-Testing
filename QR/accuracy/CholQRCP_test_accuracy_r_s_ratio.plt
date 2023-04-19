set terminal png size 1500,1500
set logscale y
set ytics font ", 50"
set xtics font ", 50"
set key font ", 40"
set xtics offset 0, -2.5
set key top right
set grid
set key spacing 1.5 
set key box lt -1 lw 2
#set format y "%.0s*10^{%T}"

set lmargin 20
set ylabel offset -8,0
set bmargin 9
set rmargin 6
set tmargin 6
set xlabel offset 0,-6

#Set line styles
set style line 1 \
linecolor rgb '#ff0000' \
linetype 1 linewidth 1.5\
pointtype 7 pointsize 2

#Set line styles
set style line 2 \
linecolor rgb '#0080ff' \
linetype 1 linewidth 2 \
pointtype 7 pointsize 2

do for [m in "131072"] {
    do for [n in "2000"] {
        do for [k in "2000"] {
            do for [d in "2000"] { # Include also 6000
                do for [log10tol in "-15"] {
                    do for [mat_type in "0, 7, 8"] {
                        do for [cond in "10000000000"] {
                            do for [nnz in "1"]{ # Include also 4
                                do for [OMP_threads in "36"]{
                                    #Set in/out files
                                    fname_in = sprintf("raw_data/r_s_ratio_m_%s_n_%s_k_%s_d_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_OMP_threads_%s.dat", m, n, k, d, log10tol, mat_type, cond, nnz, OMP_threads)
                                    fname_out = sprintf("plots/r_s_ratio_m_%s_n_%s_k_%s_d_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_OMP_threads_%s.png", m, n, k, d, log10tol, mat_type, cond, nnz, OMP_threads)
                                    set output fname_out
                                    set xlabel "{/*3 k}" font ", 20"
                                    set ylabel "{/*3 r_{k} / s_{k}}" font ", 20"

                                    ntics = 4
                                    set xtics n/ntics
                                    set xtics ("" 0, "500" 500, "" 1000, "1500" 1500, "" 2000)

                                    plot fname_in u 0:1:xtic(8) with linespoints linestyle 1 title "CQRRPT", '' u 0:2:xtic(8) with linespoints linestyle 2 title "GEQP3"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}