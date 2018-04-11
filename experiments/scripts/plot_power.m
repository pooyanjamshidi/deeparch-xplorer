function [] = plot_power()
    close all;
    
    path_tk = '../tk1_power_parsed/';
  
    xmax = 13*10^5;
    ymax = 10^4;
    
    % red = high power
    % blu = lower power
    
    fid = fopen(strcat(path_tk,'high_3_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,1)
    plot(s{1}, s{2}, 'r');
    sum1_vm = sum(s{2});
    title('Original (3 Layers)');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    hold on
    fid = fopen(strcat(path_tk,'low_3_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,1)
    plot(s{1}, s{2}, 'b');
    sum1_tk = sum(s{2});
    hold off
    
    fid = fopen(strcat(path_tk,'high_6_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,2)
    plot(s{1}, s{2}, 'r');
    sum2_vm = sum(s{2});
    title('6 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    hold on
    fid = fopen(strcat(path_tk,'low_6_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,2)
    plot(s{1}, s{2}, 'b');
    sum2_tk = sum(s{2});
    hold off
    
    fid = fopen(strcat(path_tk,'high_9_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,3)
    plot(s{1}, s{2}, 'r');
    sum3_vm = sum(s{2});
    title('9 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    hold on
    fid = fopen(strcat(path_tk,'low_9_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,3)
    plot(s{1}, s{2}, 'b');
    sum3_tk = sum(s{2});
    hold off
    
    fid = fopen(strcat(path_tk,'high_12_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,4)
    plot(s{1}, s{2}, 'r');
    sum4_vm = sum(s{2});
    title('12 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    hold on
    fid = fopen(strcat(path_tk,'low_12_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,4)
    plot(s{1}, s{2}, 'b');
    sum4_tk = sum(s{2});
    hold off
    
    figure
    bar([3 6 9 12], [sum1_vm sum2_vm sum3_vm sum4_vm], 'r');
    title('Total Power Consumption (High Performance)');
    ylabel('Power Consumed (mW)');
    xlabel('Number of Network Layers');
    ylim([0 14*10^6]);
    figure
    bar([3 6 9 12], [sum1_tk sum2_tk sum3_tk sum4_tk]);
    title('Total Power Consumption (Low Performance)');
    ylabel('Power Consumed (mW)');
    xlabel('Number of Network Layers');
    ylim([0 14*10^6]);
end