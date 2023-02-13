set terminal png size 1500,1500
set ytics font ", 40"
set xtics font ", 40"
set key font ", 40"
set xtics offset 0, -2.5
set key bottom right

set lmargin 20
set ylabel offset -7,0
set bmargin 9
set rmargin 6
set tmargin 6
set xlabel offset 0,-5
set title offset 0, 1

#Set line styles
set style line 2 \
linecolor rgb '#0080ff' \
linetype 1 linewidth 5.0 \
pointtype 8 pointsize 8.0

do for [type in "Best"] {
    do for [m in "131072"] {
        do for [n in "2048"] {
            do for [d_multiplier_start in "1.000000"] {
                do for [d_multiplier_end in "4.000000"] {
                    do for [k_multiplier in "1.000000"] {
                        do for [log10tol in "-11"] {
                            do for [mat_type in "6"] {
                                do for [cond in "0"] {
                                    do for [nnz in "1"] {
                                        do for [runs_per_sz in "5"] {
                                            do for [OMP_threads in "36"] {

                                                fname_in = sprintf("raw_data/CholQRCP_embedding_time_%s_m_%s_n_%s_d_multiplier_start_%s_d_multiplier_end_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s.dat", type, m, n, d_multiplier_start, d_multiplier_end, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads)
                                                fname_out = sprintf("plots/CholQRCP_embedding_time_QR_%s_m_%s_n_%s_d_multiplier_start_%s_d_multiplier_end_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s.png", type, m, n, d_multiplier_start, d_multiplier_end, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads)

                                                set output fname_out
                                                set title "{/*3 Effect of the Embedding Dimension" font ", 15" #on CholQRCP runtime
                                                set xlabel "{/*3 d/n}" font ", 15"
                                                set ylabel "{/*3 Runtime (s)}" font ", 20"

                                                #ntics = 4    
                                                #set xtics n/ntics        
                                                set xtics ("" 0, "1.5" 1, "" 2, "2.5" 3, "" 4, "3.5" 5, "" 6)
                                                
                                                # BEGIN PLOTS WITH JUST QR
                                                # Show all
                                                plot fname_in u 0:10 with linespoints linestyle 2 title "CholQRCP"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}