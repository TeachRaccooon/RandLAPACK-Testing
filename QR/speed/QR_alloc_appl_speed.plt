set terminal png size 1500,1500
#set logscale y
set ytics font ", 50"
set xtics font ", 50"
set key font ", 40"
set xtics offset 0, -2.5
set key top left
set grid
set key spacing 1.5
set key box lt -1 lw 2

set lmargin 20
set ylabel offset -8,0
set bmargin 9
set rmargin 6
set tmargin 6
set xlabel offset 0,-5

#Set line styles
set style line 1 \
linecolor rgb '#000000' \
linetype 1 linewidth 4.0\
pointtype 8 pointsize 8.0

#Set line styles
set style line 2 \
linecolor rgb '#0080ff' \
linetype 1 linewidth 4.0 \
pointtype 2 pointsize 8.0

#Set line styles
set style line 3 \
linecolor rgb '#ff0000' \
linetype 1 linewidth 4.0 \
pointtype 6 pointsize 8.0

#set yrange[0:200]

do for [type in "Best"] {
    do for [m in "131072"] {
        do for [d_multiplier in "1.000000"] {
            do for [k_multiplier in "1.000000"] {
                do for [log10tol in "-11"] {
                    do for [mat_type in "6"] {
                        do for [cond in "0"] {
                            do for [nnz in "1"] {
                                do for [runs_per_sz in "5"] {
                                    do for [OMP_threads in "36"] {
                                            do for [apply_to_large in "0"] {

                                            #include/exclude 'apply_to_large'
                                            fname_in = sprintf("raw_data/QR_time_%s_m_%s_d_multiplier_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s_apply_to_large_%s.dat", type, m, d_multiplier, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads, apply_to_large)
                                            fname_out = sprintf("plots/QR_time_%s_m_%s_d_multiplier_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s_apply_to_large_%s.png", type, m, d_multiplier, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads, apply_to_large)
                                            set output fname_out
                                            
                                            set xlabel "{/*3 columns}"  font ", 20"
                                            set ylabel "{/*3 Runtime (s)}"  font ", 20"      

                                            if (m == 131072){
                                                set xtics ("" 0, "1024" 1, "" 2, "4096" 3, "" 4)
                                            }

                                            #unset key
                                            plot fname_in u 0:6 with linespoints linestyle 1 title "CQRRPT", '' u 0:9 with linespoints linestyle 2 title "TSQRP", '' u 0:8 with linespoints linestyle 3 title "GEQR"
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
