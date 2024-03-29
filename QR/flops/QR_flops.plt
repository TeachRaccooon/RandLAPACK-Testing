set terminal png size 1500,1500
#set logscale y
set ytics font ", 50"
set xtics font ", 50"
set key font ", 35"
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

#Set line styles
set style line 4 \
linecolor rgb "#ffc107" \
linetype 1 linewidth 4.0 \
pointtype 4 pointsize 8.0

#Set line styles
set style line 5 \
linecolor rgb "dark-violet" \
linetype 1 linewidth 4.0 \
pointtype 12 pointsize 8.0

#Set line styles
set style line 6 \
linecolor rgb "cyan"  \
linetype 1 linewidth 4.0 \
pointtype 16 pointsize 8.0

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

                                        fname_in = sprintf("raw_data/CQRRPT_FLOP_RATE_%s_m_%s_d_multiplier_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s.dat", type, m, d_multiplier, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads)
                                        fname_out = sprintf("plots/CQRRPT_FLOP_RATE_QR_%s_m_%s_d_multiplier_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s.png", type, m, d_multiplier, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads)
                                        set output fname_out

                                        set xlabel "{/*3 columns}" font ", 20"
                                        set ylabel "{/*3 GLOP/s}" font ", 20"

                                        #ntics = 4    
                                        #set xtics n/ntics        

                                        if (m == 131072){
                                            set xtics ("" 0, "1024" 1, "" 2, "4096" 3, "" 4)
                                        }
                                        
                                        # Show all
                                        #plot fname_in u 0:1 with linespoints linestyle 1 title "CQRRPT", '' u 0:4 with linespoints linestyle 2 title "TSQRP", '' u 0:6 with linespoints linestyle 6 title "sCholQR2", '' u 0:5 with linespoints linestyle 3 title "GEQRF", '' u 0:3 with linespoints linestyle 4 title "GEQR", '' u 0:2 with linespoints linestyle 5 title "GEQP3"
                                        # Avoid GEQRF
                                        plot fname_in u 0:1 with linespoints linestyle 1 title "CQRRPT", '' u 0:4 with linespoints linestyle 2 title "TSQRP", '' u 0:6 with linespoints linestyle 4 title "sCholQR3", '' u 0:3 with linespoints linestyle 3 title "GEQR", '' u 0:2 with linespoints linestyle 5 title "GEQP3"
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