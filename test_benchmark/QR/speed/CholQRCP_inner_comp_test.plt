set terminal png size 1000,1000
set logscale y
set ytics font ", 25"
set xtics font ", 25"
set key font ", 20"
set xtics offset 0, -1
set key bottom right

set lmargin 20
set ylabel offset -5,0
set bmargin 9
set rmargin 6
set tmargin 6
set xlabel offset 0,-3

#Set line styles
set style line 1 \
linecolor rgb '#000000' \
linetype 1 linewidth 3.0\
pointtype 8 pointsize 4.0

#Set line styles
set style line 2 \
linecolor rgb '#0080ff' \
linetype 1 linewidth 3.0 \
pointtype 2 pointsize 4.0

#Set line styles
set style line 3 \
linecolor rgb '#ff0000' \
linetype 1 linewidth 3.0 \
pointtype 6 pointsize 4.0

#Set line styles
set style line 4 \
linecolor rgb "dark-violet" \
linetype 1 linewidth 3.0 \
pointtype 4 pointsize 4.0

do for [type in "Best"] {
    do for [m in "131072"] {
        do for [d_multiplier1 in "1.000000"] {
            do for [d_multiplier2 in "2.000000"] {
                do for [k_multiplier in "1.000000"] {
                    do for [log10tol in "-12"] {
                        do for [mat_type in "6"] {
                            do for [cond in "0"] {
                                do for [nnz in "1"] {
                                    do for [runs_per_sz in "5"] {
                                        do for [OMP_threads in "36"] {

                                            fname_in = sprintf("raw_data/CholQR_vs_GEQP3_%s_m_%s_d_multiplier1_%s_d_multiplier2_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s.dat", type, m, d_multiplier1, d_multiplier2, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads)
                                            fname_out = sprintf("plots/CholQR_vs_GEQP3_%s_m_%s_d_multiplier1_%s_d_multiplier2_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s.png", type, m, d_multiplier1, d_multiplier2, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads)

                                            set output fname_out
                                            set title "{/*3 Effect of Embedding Dimension}" font ", 10"
                                            set xlabel "{/*3 Column size}"
                                            set ylabel "{/*3 T(GEQP3) / (T(GEQP3) + T(CholQR))}"

                                            #ntics = 4    
                                            #set xtics n/ntics        


                                            if (m == 131072){
                                                set xtics ("32" 0, "" 1, "128" 2, "" 3, "512" 4, "" 5, "2048" 6, "" 7, "8192" 8, "" 9)
                                            }
                                            
                                            # BEGIN PLOTS WITH JUST QR
                                            # Show all
                                            plot fname_in u 0:1 with linespoints linestyle 1 title "d = n", '' u 0:2 with linespoints linestyle 2 title "d = n * 2"
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