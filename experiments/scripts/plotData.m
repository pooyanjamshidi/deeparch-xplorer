function [] = plotData(fileName, titleName)
    close all;
    fid = fopen(fileName);
    s = textscan(fid, '%f %f');
    timeStamps = s{1};
    powerReadings = s{2};
    
    plot(timeStamps, powerReadings, 'r');
    title(titleName);
    xlabel('Time Elapsed (ms)');
    ylabel('Power Reading (mW)');
end