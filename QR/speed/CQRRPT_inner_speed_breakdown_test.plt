set terminal png truecolor size 1500,1500 
set size ratio 1
set ytics font ", 40"
set xtics font ", 40"
set key font ", 25"
set xtics offset 0, -2.5
set key top left
set key spacing 1.5 
set key box lt -1 lw 2

set ylabel offset -4,0
set lmargin 16.2
set bmargin 16.2
set rmargin 16.2
set tmargin 16.2
set xlabel offset 0,-5

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

                                        fname_in = sprintf("raw_data/cqrrpt_determine_rank/CQRRPT_inner_time_processed_%s_m_%s_d_multiplier_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s.dat", type, m, d_multiplier, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads)
                                        fname_out = sprintf("plots/cqrrpt_determine_rank/CQRRPT_inner_time_processed_%s_m_%s_d_multiplier_%s_k_multiplier_%s_log10(tol)_%s_mat_type_%s_cond_%s_nnz_%s_runs_per_sz_%s_OMP_threads_%s.png", type, m, d_multiplier, k_multiplier, log10tol, mat_type, cond, nnz, runs_per_sz, OMP_threads)

                                        set output fname_out
                                        set xlabel "{/*3 columns}" font ", 17"
                                        set ylabel "{/*3 Runtime %}" font ", 17"

                                        #ntics = 4    
                                        #set xtics n/ntics        

                                        if (m == 131072){
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