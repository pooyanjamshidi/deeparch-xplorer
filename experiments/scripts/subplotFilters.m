function [] = subplotFilters()
    close all;
    
    fid = fopen('../parsed_data/orig_parsed.txt');
    s = textscan(fid, '%f %f');
    subplot(2,2,1)
    plot(s{1}, s{2}, 'r');
    sum1 = sum(s{2});
    title('Original (32 Filters)');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 4*10^5 0 10*10^4])
    
    fid = fopen('../parsed_data/64_filters_parsed.txt');
    s = textscan(fid, '%f %f');
    subplot(2,2,2)
    plot(s{1}, s{2}, 'r');
    sum2 = sum(s{2});
    title('64 Filters');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 4*10^5 0 10*10^4])
    
    fid = fopen('../parsed_data/96_filters_parsed.txt');
    s = textscan(fid, '%f %f');
    subplot(2,2,3)
    plot(s{1}, s{2}, 'r');
    sum3 = sum(s{2});
    title('96 Filters');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 4*10^5 0 10*10^4])
    
    fid = fopen('../parsed_data/128_filters_parsed.txt');
    s = textscan(fid, '%f %f');
    subplot(2,2,4)
    plot(s{1}, s{2}, 'r');
    sum4 = sum(s{2});
    title('128 Filters');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 4*10^5 0 10*10^4])
    
    figure
    bar([32 64 96 128], [sum1 sum2 sum3 sum4]);
    title('Total Power Consumption');
    ylabel('Power Consumed (mW)');
    xlabel('Number of Filters');
end