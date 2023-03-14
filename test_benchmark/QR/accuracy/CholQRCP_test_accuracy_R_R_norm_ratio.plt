set terminal png size 1500,1500
set ytics font ", 50"
set xtics font ", 50"
set key font ", 35"
set xtics offset 0, -2.5
set grid

set title offset 0, 2
set ylabel offset -10,0
set lmargin 25
set bmargin 10
set rmargin 5
set tmargin 10
set xlabel offset 0,-5

#Set line styles
set style line 1 \
linecolor rgb '#0080ff' \
linetype 1 linewidth 2\
pointtype 7 pointsize 2

do for [m in "131072"] {
    do for [n in "2000"] {
        do for [k in "2000"] {
            do for [d in "10000"] {
                do for [log10tol in "-14"] {
                    do for [mat_type in "0"] {
                        do for [cond in "10000000000"] {
                            do for [nnz in "4"]{
                                do for [OMP_threads in "36"]{

                                    #Set in/out files
                                    fname_in = sprintf("raw_data/R_R_norm_ratio_m_%s_n_%s_k_%s_d_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_OMP_threads_%s.dat", m, n, k, d, log10tol, mat_type, cond, nnz, OMP_threads)
                                    fname_out = sprintf("plots/R_R_norm_ratio_m_%s_n_%s_k_%s_d_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_OMP_threads_%s.png", m, n, k, d, log10tol, mat_type, cond, nnz, OMP_threads)

                                    set output fname_out
                                    #set title "{/*1.8 Approximation Error Ratio}" font ", 17"
                                    #set title "{/*2 || R_{qp3}[k+1:, :] || / || R_{cqrcp}[k+1:, :] ||}" font ", 25"
                                    set xlabel "k" font ", 50"
                                    set ylabel "{/*2 || R_{qp3}[k+1:, :] || / || R_{cqrcp}[k+1:, :] ||}" font ", 25"

                                    ntics = 4    
                                    set xtics n/ntics
                                    set xtics ("" 0, "500" 500, "" 1000, "1500" 1500, "" 2000)

                                    plot fname_in u 0:1:xtic(8) with linespoints linestyle 1 notitle
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
