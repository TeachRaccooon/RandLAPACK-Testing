set terminal png truecolor size 1000,1000 
set size ratio 1
set ytics font ", 25"
set xtics font ", 25"
set key font ", 20"
set xtics offset 0, -1
set key top left

set lmargin 20
set ylabel offset -2,0
set bmargin 9
set rmargin 6
set tmargin 6
set xlabel offset 0,-3

#Set line styles
set style line 1 \
linecolor rgb 'goldenrod' \
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
linecolor rgb "sea-green" \
linetype 1 linewidth 3.0 \
pointtype 12 pointsize 4.0

#Set line styles
set style line 6 \
linecolor rgb "sea-green" \
linetype 1 linewidth 3.0 \
pointtype 12 pointsize 4.0

#Set line styles
set style line 7 \
linecolor rgb "black" \
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

                                        fname_in = sprintf("raw_data/CholQRCP_inner_time_processed_%s_m_%s_d_multiplier_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s.dat", type, m, d_multiplier, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads)
                                        fname_out = sprintf("plots/CholQRCP_inner_time_processed_%s_m_%s_d_multiplier_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s.png", type, m, d_multiplier, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads)

                                        set output fname_out
                                        set title "{/*3 CholQRCP Subcomponents}" font ", 10"
                                        set xlabel "{/*3 Column size}"
                                        set ylabel "{/*3 Runtime %}"

                                        #ntics = 4    
                                        #set xtics n/ntics        

                                        if (m == 131072){
                                            #set xtics ("" 0, "1024" 1, "" 2, "4096" 3, "" 4)
                                            set xtics ("32" 0, "" 1, "128" 2, "" 3, "512" 4, "" 5, "2048" 6, "" 7, "8192" 8, "" 9)
                                        }
                                        
                                        #set style fill solid 0.5
                                        
                                        set style data histograms
                                        set style histogram rowstacked
                                        set boxwidth 0.5 relative
                                        set style fill solid 1.0 border -1
                                        set yrange [0:100]
                                        set rmargin 22
                                        set lmargin 17
                                        set key at 10, 50

                                        # Show main - boxes
                                        #plot fname_in u 0:1 with linespoints linestyle 3 title "SASO", '' u 0:2 with linespoints linestyle 2 title "QRCP", '' u 0:3 with linespoints linestyle 1 title "CholQR", '' u 0:4 with linespoints linestyle 4 title "piv(A)", '' u 0:5 with linespoints linestyle 5 title "TRSM(A)",'' u 0:6 with linespoints linestyle 8 title "Other"
                                        plot fname_in using 1 t "SASO" ls 2, '' using 2 t "QRCP" ls 3, '' using 3 t "CholQR" ls 1, '' using 4 t "piv(A)" ls 5, '' using 5 t "TRSM(A)" ls 7, '' using 6 t "Other" ls 8
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