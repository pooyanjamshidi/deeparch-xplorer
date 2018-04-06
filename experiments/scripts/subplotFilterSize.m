function [] = subplotFilterSize()
    close all;
    
    path_tk = '../tk1_parsed/';
    path_vm = '../vm_parsed/';
    %{
    fid = fopen(strcat(path,'num_filters_acc.txt'));
    s = textscan(fid, '%f');
    accs = s{1};
    %}

    xmax = 40*10^5;
    ymax = 10*10^4;
    
    fid = fopen(strcat(path_tk,'orig_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,1)
    plot(s{1}, s{2}, 'r');
    sum1 = sum(s{2});
    title('Original (2 Filter Size)');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    hold on
    fid = fopen(strcat(path_vm,'orig_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,1)
    plot(s{1}, s{2}, 'b');
    hold off
    
    fid = fopen(strcat(path_tk,'4_filter_size_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,2)
    plot(s{1}, s{2}, 'r');
    sum2 = sum(s{2});
    title('4 Filter Size');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    hold on
    fid = fopen(strcat(path_vm,'4_filter_size_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,2)
    plot(s{1}, s{2}, 'b');
    hold off
    
    fid = fopen(strcat(path_tk,'8_filter_size_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,3)
    plot(s{1}, s{2}, 'r');
    sum3 = sum(s{2});
    title('8 Filter Size');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    hold on
    fid = fopen(strcat(path_vm,'8_filter_size_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,3)
    plot(s{1}, s{2}, 'b');
    hold off
    
    fid = fopen(strcat(path_tk,'16_filter_size_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,4)
    plot(s{1}, s{2}, 'r');
    sum4 = sum(s{2});
    title('16 Filter Size');
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
    axis([0 xmax 0 ymax])
    
    hold on
    fid = fopen(strcat(path_vm,'16_filter_size_parsed.txt'));
    s = textscan(fid, '%f %f');
    subplot(2,2,4)
    plot(s{1}, s{2}, 'b');
    hold off
    
    figure
    bar([3 6 9 12], [sum1 sum2 sum3 sum4]);
    title('Total Power Consumption');
    ylabel('Power Consumed (mW)');
    xlabel('Number of Filters');
    
    %{
    figure
    plot([3 6 9 12], accs, 'o');
    title('Accuracy vs Number of Layers')
    ylabel('Accuracy %')
    xlabel('Number of Layers')
    %}
end