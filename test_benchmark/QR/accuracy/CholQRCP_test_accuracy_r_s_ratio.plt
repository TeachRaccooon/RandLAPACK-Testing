set terminal png size 1000,1000
set logscale y
set ytics font ", 30"
set xtics font ", 30"
set key font ", 30"
set xtics offset 0, -1
set key bottom right

set lmargin 20
set ylabel offset -3,0
set bmargin 9
set rmargin 6
set tmargin 6
set xlabel offset 0,-3

#Set line styles
set style line 1 \
linecolor rgb '#ff0000' \
linetype 1 linewidth 1.5\
pointtype 7 pointsize 1.5

#Set line styles
set style line 2 \
linecolor rgb '#0080ff' \
linetype 1 linewidth 1.5 \
pointtype 7 pointsize 1.5

do for [m in "131072"] {
    do for [n in "2000"] {
        do for [k in "2000"] {
            do for [d in "2000"] {
                do for [log10tol in "-14"] {
                    do for [mat_type in "0"] {
                        do for [cond in "10000000000"] {
                            do for [nnz in "1"]{
                                do for [OMP_threads in "36"]{
                                    #Set in/out files
                                    fname_in = sprintf("raw_data/r_s_ratio_m_%s_n_%s_k_%s_d_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_OMP_threads_%s.dat", m, n, k, d, log10tol, mat_type, cond, nnz, OMP_threads)
                                    fname_out = sprintf("plots/r_s_ratio_m_%s_n_%s_k_%s_d_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_OMP_threads_%s.png", m, n, k, d, log10tol, mat_type, cond, nnz, OMP_threads)
                                    set output fname_out
                                    #set title "{/*1.8 Ratio of diagonal of R to the singular values}" font ", 17"
                                    set xlabel "k" font ", 33"
                                    set ylabel "{/*2 r_{k} / s_{k}}" font ", 17"

                                    ntics = 4    
                                    set xtics n/ntics

                                    plot fname_in u 0:1:xtic(8) with linespoints linestyle 1 title "CholQRCP", '' u 0:2:xtic(8) with linespoints linestyle 2 title "GEQP3"                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}