function [] = plot_frequency()
    close all;
    
    path_tk = '../tk1_freq_parsed/';
  
    xmax = 25*10^5;
    ymax = 2*10^3;
    
    % red = high frequency
    % blu = low frequency
    
    fid = fopen(strcat(path_tk,'max_freq_3_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,1)
    plot(s{1}, s{2}, 'r');
    sum1_vm = sum(s{2});
    title('Original (3 Layers)');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    fid = fopen(strcat(path_tk,'max_freq_6_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,2)
    plot(s{1}, s{2}, 'r');
    sum2_vm = sum(s{2});
    title('6 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    fid = fopen(strcat(path_tk,'max_freq_9_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,3)
    plot(s{1}, s{2}, 'r');
    sum3_vm = sum(s{2});
    title('9 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    fid = fopen(strcat(path_tk,'max_freq_12_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,4)
    plot(s{1}, s{2}, 'r');
    sum4_vm = sum(s{2});
    title('12 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
        
    figure
    fid = fopen(strcat(path_tk,'min_freq_3_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,1)
    plot(s{1}, s{2}, 'b');
    sum1_tk = sum(s{2});
    title('Original (3 Layers)');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    fid = fopen(strcat(path_tk,'min_freq_6_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,2)
    plot(s{1}, s{2}, 'b');
    sum2_tk = sum(s{2});
    title('6 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    fid = fopen(strcat(path_tk,'min_freq_9_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,3)
    plot(s{1}, s{2}, 'b');
    sum3_tk = sum(s{2});
    title('9 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    fid = fopen(strcat(path_tk,'min_freq_12_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,4)
    plot(s{1}, s{2}, 'b');
    sum4_tk = sum(s{2});
    title('12 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    figure
    bar([3 6 9 12], [sum1_vm sum2_vm sum3_vm sum4_vm], 'r');
    title('Total Power Consumption (High Frequency: 2065.5 MHz)');
    ylabel('Power Consumed (mW)');
    xlabel('Number of Network Layers');
    ylim([0 7*10^6]);
    figure
    bar([3 6 9 12], [sum1_tk sum2_tk sum3_tk sum4_tk]);
    title('Total Power Consumption (Low Frequency: 564 MHz)');
    ylabel('Power Consumed (mW)');
    xlabel('Number of Network Layers');
    ylim([0 7*10^6]);
end