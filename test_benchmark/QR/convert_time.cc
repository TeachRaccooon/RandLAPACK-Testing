#include <stdio.h>
#include <string.h>
#include <math.h>
#include <numeric>
#include <iostream>
#include <fstream>
#include <chrono>
#include <thread>
#include <fstream>
#include <iterator>
#include <vector>
#include <algorithm>
#include <iostream>
#include <string>
#include <sstream>

template <typename T>
static void 
process_dat() {
    // Open data file
    //std::string filename = "speed/raw_data/CholQRCP_embedding_time_Best_m_131072_n_1024_d_multiplier_start_1.000000_d_multiplier_end_4.000000_k_multiplier_1.000000_log10(tol)_-11_mat_type_6_cond_0_nnz_1_runs_per_sz_5_OMP_threads_36.dat";
    std::string filename = "speed/raw_data/embedding_combined.dat";

    std::fstream file(filename);
    
    int offset = 0;
    int line_length = 10;
    int numlines = 7;
    std::vector<std::string> all_data(numlines * line_length);

    for( std::string l; getline(file, l);)
    {
        std::stringstream ss(l);
        std::istream_iterator<std::string> begin(ss);
        std::istream_iterator<std::string> end;
        std::vector<std::string> times_per_col_sz(begin, end);

        
        std::for_each(times_per_col_sz.begin(), times_per_col_sz.end(),
            [](std::string& entry) {
                entry = std::to_string((std::stod(entry) / 1e6));
            }
        );

        std::copy(times_per_col_sz.begin(), times_per_col_sz.end(), all_data.begin() + offset);
        offset += line_length;
    }
    
    // Clear file
    std::ofstream ofs;
    ofs.open(filename, std::ofstream::out | std::ofstream::trunc);   
    // re-open file
    std::fstream file1(filename, std::fstream::app);
 
    for(int i = 0; i < line_length * numlines; ++i)
    {
        if(!(i % line_length))
            file1 << "\n";
        file1 << all_data[i] << "  ";
    }
}

int main(){ 
    process_dat<double>();
    return 0;
}