function [] = subplotFilterSize()
    close all;
    
    fid = fopen('../parsed_data/orig_parsed.txt');
    s = textscan(fid, '%f %f');
    subplot(2,2,1)
    plot(s{1}, s{2}, 'r');
    sum1 = sum(s{2});
    title('Original (2 Filter Size)');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 10*10^5 0 10*10^4])
    
    fid = fopen('../parsed_data/4_filter_size_parsed.txt');
    s = textscan(fid, '%f %f');
    subplot(2,2,2)
    plot(s{1}, s{2}, 'r');
    sum2 = sum(s{2});
    title('4 Filter Size');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 10*10^5 0 10*10^4])
    
    fid = fopen('../parsed_data/8_filter_size_parsed.txt');
    s = textscan(fid, '%f %f');
    subplot(2,2,3)
    plot(s{1}, s{2}, 'r');
    sum3 = sum(s{2});
    title('8 Filter Size');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 10*10^5 0 10*10^4])
    
    fid = fopen('../parsed_data/16_filter_size_parsed.txt');
    s = textscan(fid, '%f %f');
    subplot(2,2,4)
    plot(s{1}, s{2}, 'r');
    sum4 = sum(s{2});
    title('16 Filter Size');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 10*10^5 0 10*10^4])
    
    figure
    bar([2 4 8 16], [sum1 sum2 sum3 sum4]);
    title('Total Power Consumption');
    ylabel('Power Consumed (mW)');
    xlabel('Filter Size');
end