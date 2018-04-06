function [] = subplotLayers()
    close all;
    
    path_tk = '../tk1_parsed/';
    path_vm = '../vm_parsed/';

    fid = fopen(strcat(path_vm,'num_filters_acc.txt'));
    s = textscan(fid, '%f');
    accs = s{1};


    xmax = 7*10^5;
    ymax = 10*10^4;
    
    fid = fopen(strcat(path_tk,'orig_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,1)
    plot(s{1}, s{2}, 'r');
    sum1_vm = sum(s{2});
    title('Original (3 Layers)');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    hold on
    fid = fopen(strcat(path_vm,'orig_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,1)
    plot(s{1}, s{2}, 'b');
    sum1_tk = sum(s{2});
    hold off
    
    fid = fopen(strcat(path_tk,'6_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,2)
    plot(s{1}, s{2}, 'r');
    sum2_vm = sum(s{2});
    title('6 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    hold on
    fid = fopen(strcat(path_vm,'6_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,2)
    plot(s{1}, s{2}, 'b');
    sum2_tk = sum(s{2});
    hold off
    
    fid = fopen(strcat(path_tk,'9_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,3)
    plot(s{1}, s{2}, 'r');
    sum3_vm = sum(s{2});
    title('9 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    hold on
    fid = fopen(strcat(path_vm,'9_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,3)
    plot(s{1}, s{2}, 'b');
    sum3_tk = sum(s{2});
    hold off
    
    fid = fopen(strcat(path_tk,'12_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,4)
    plot(s{1}, s{2}, 'r');
    sum4_vm = sum(s{2});
    title('12 Layers');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    hold on
    fid = fopen(strcat(path_vm,'12_layers_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,4)
    plot(s{1}, s{2}, 'b');
    sum4_tk = sum(s{2});
    hold off
    
    figure
    bar([3 6 9 12], [sum1_vm sum2_vm sum3_vm sum4_vm], 'r');
    title('Total Power Consumption (VM)');
    ylabel('Power Consumed (mW)');
    xlabel('Number of Network Layers');
    figure
    bar([3 6 9 12], [sum1_tk sum2_tk sum3_tk sum4_tk]);
    title('Total Power Consumption (TK1)');
    ylabel('Power Consumed (mW)');
    xlabel('Number of Network Layers');
    

    figure
    plot([3 6 9 12], accs, 'o');
    title('Accuracy vs Number of Layers')
    ylabel('Accuracy %')
    xlabel('Number of Layers')

end