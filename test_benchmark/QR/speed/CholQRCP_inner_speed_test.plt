set terminal png size 1000,1000
set logscale y
set ytics font ", 30"
set xtics font ", 30"
set key font ", 20"
set xtics offset 0, -1
set key bottom right

set lmargin 20
set ylabel offset -7,0
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

#Set line styles
set style line 5 \
linecolor rgb "#ffc107" \
linetype 1 linewidth 3.0 \
pointtype 12 pointsize 4.0

#Set line styles
set style line 6 \
linecolor rgb "goldenrod" \
linetype 1 linewidth 3.0 \
pointtype 12 pointsize 4.0

#Set line styles
set style line 7 \
linecolor rgb "sea-green" \
linetype 1 linewidth 3.0 \
pointtype 9 pointsize 4.0

#Set line styles
set style line 8 \
linecolor rgb "cyan"  \
linetype 1 linewidth 3.0 \
pointtype 16 pointsize 3.0

#Set line styles
set style line 9 \
linecolor rgb "cyan"  \
linetype 1 linewidth 3.0 \
pointtype 18 pointsize 3.0

do for [type in "Best Mean"] {
    do for [m in "131072"] {
        do for [d_multiplier in "1.000000"] {
            do for [k_multiplier in "1.000000"] {
                do for [log10tol in "-12"] {
                    do for [mat_type in "6"] {
                        do for [cond in "0"] {
                            do for [nnz in "1"] {
                                do for [runs_per_sz in "5"] {
                                    do for [OMP_threads in "36"] {

                                        fname_in = sprintf("raw_data/CholQRCP_inner_time_%s_m_%s_d_multiplier_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s.dat", type, m, d_multiplier, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads)
                                        fname_out = sprintf("plots/CholQRCP_inner_time_QR_%s_m_%s_d_multiplier_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s.png", type, m, d_multiplier, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads)

                                        set output fname_out
                                        set title "{/*3 CholQRCP Subcomponents}" font ", 10"
                                        set xlabel "{/*3 Column size}"
                                        set ylabel "{/*3 Runtime (μs)}"

                                        #ntics = 4    
                                        #set xtics n/ntics        


                                        if (m == 131072){
                                            #set xtics ("" 0, "1024" 1, "" 2, "4096" 3, "" 4)
                                            set xtics ("" 0, "64" 1, "" 2, "256" 3, "" 4, "1024" 5, "" 6, "4096" 7, "" 8, "16384" 9)
                                        }
                                        
                                        # BEGIN PLOTS WITH JUST QR
                                        # Show all
                                        #plot fname_in u 0:1 with linespoints linestyle 1 title "SASO", '' u 0:2 with linespoints linestyle 2 title "QRCP", '' u 0:3 with linespoints linestyle 3 title "Rank Rev", '' u 0:4 with linespoints linestyle 4 title "CholQR", '' u 0:5 with linespoints linestyle 5 title "piv(A)", '' u 0:6 with linespoints linestyle 6 title "TRSM(A)", '' u 0:7 with linespoints linestyle 7 title "copy", '' u 0:8 with linespoints linestyle 8 title "resize", '' u 0:9 with linespoints linestyle 9 title "other"
                                        # Show main
                                        plot fname_in u 0:1 with linespoints linestyle 3 title "SASO", '' u 0:2 with linespoints linestyle 2 title "QRCP", '' u 0:4 with linespoints linestyle 1 title "CholQR", '' u 0:5 with linespoints linestyle 4 title "piv(A)", '' u 0:6 with linespoints linestyle 5 title "TRSM(A)"
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