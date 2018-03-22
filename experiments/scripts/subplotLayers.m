function [] = subplotLayers()
    close all;
    
    fid = fopen('../parsed_data/orig_parsed.txt');
    s = textscan(fid, '%f %f');
    subplot(2,2,1)
    plot(s{1}, s{2}, 'r');
    sum1 = sum(s{2});
    title('Original (3 Layers)');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 2.5*10^5 0 10*10^4])
    
    fid = fopen('../parsed_data/6_layers_parsed.txt');
    s = textscan(fid, '%f %f');
    subplot(2,2,2)
    plot(s{1}, s{2}, 'r');
    sum2 = sum(s{2});
    title('6 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 2.5*10^5 0 10*10^4])
    
    fid = fopen('../parsed_data/9_layers_parsed.txt');
    s = textscan(fid, '%f %f');
    subplot(2,2,3)
    plot(s{1}, s{2}, 'r');
    sum3 = sum(s{2});
    title('9 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 2.5*10^5 0 10*10^4])
    
    fid = fopen('../parsed_data/12_layers_parsed.txt');
    s = textscan(fid, '%f %f');
    subplot(2,2,4)
    plot(s{1}, s{2}, 'r');
    sum4 = sum(s{2});
    title('12 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 2.5*10^5 0 10*10^4])
    
    figure
    bar([3 6 9 12], [sum1 sum2 sum3 sum4]);
    title('Total Power Consumption');
    ylabel('Power Consumed (mW)');
    xlabel('Number of Network Layers');
end