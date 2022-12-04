set terminal png size 1000,1000
set logscale y

#Set line styles
set style line 1 \
linecolor rgb '#ff0000' \
linetype 1 linewidth 2.0\
pointtype 7 pointsize 1.0


do for [m in "131072"] {
    do for [n in "2000"] {
        do for [k in "2000"] {
            do for [d in "2000"] {
                do for [log10tol in "-12"] {
                    do for [mat_type in "0"] {
                        do for [cond in ""] {
                            do for [nnz in "1"]{
                                do for [OMP_threads in "36"]{

                                    #Set in/out files
                                    fname_in = sprintf("raw_data/R_R_norm_ratio_m_%s_n_%s_k_%s_d_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_OMP_threads_%s.dat", m, n, k, d, log10tol, mat_type, cond, nnz, OMP_threads)
                                    fname_out = sprintf(""plots/R_R_norm_ratio_m_%s_n_%s_k_%s_d_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_OMP_threads_%s.png", m, n, k, d, log10tol, mat_type, cond, nnz, OMP_threads)
                                    set output fname_out
                                    set title "{/*1.8 Approximation Error Ratio}"
                                    set xlabel "k"
                                    set ylabel "{/*2 || R_qp3[k:, :] || / || R_cqrcp[k:, :] ||}"

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
