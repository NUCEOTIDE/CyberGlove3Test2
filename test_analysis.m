%% import workspace data (Optional)
% load('Sep 7 workspace');

%% measure and plot the difference between each data pull
t_diff = zeros(n, 1);
for i = 2 : (n - 1)
    t_diff(i, 1) = (GloveData_full(16, i + 1) - GloveData_full(16, i))* 24 * 60 * 60 * 1000;
end
figure('Name', 'Inividual Time Interval (between each data pull)');
plot(t_diff(1 : n, 1))
title('Inividual Time Interval (between each data pull)')
xlabel('Number of sample')
ylabel('Time(ms)')
savefig('Inividual Time Interval.fig');
avg_t_diff = mean(t_diff); % average time interval in ms.

%% measure and plot chunk average refresh rate for each 10 samples
avg_size = 10;
avg_fps_10 = zeros(n / avg_size, 1);
avg_fps = n /((GloveData_full(16, n) - GloveData_full(16, 2))* 24 * 60 * 60);
for i = 1 : n / avg_size
    avg_fps_10(i, 1) = avg_size / ((GloveData_full(16, i * avg_size) - GloveData_full(16, (i - 1) * avg_size + 1))* 24 * 60 * 60);
end
fluc_10 = avg_fps_10(:, 1) - avg_fps;
figure('Name', 'Average Refresh Rate (for 10 sample chunk)');
plot((1:1000), avg_fps_10,':', (1:1000), fluc_10)
title('Average Refresh Rate (for 10 sample chunk)')
xlabel('Number of sample')
ylabel('Refresh per second (/s)')
legend('original', 'offset')
savefig('Average Refresh Rate (for 10 sample chunk).fig');

std_avg_fps_10 = std(avg_fps_10(2 : 1000, 1)); % calculate standard deviation of the average refresh rate

%% measure and plot chunk average refresh rate for each 100 samples
avg_size = 100;
avg_fps_100 = zeros(n / avg_size, 1);
avg_fps = n /((GloveData_full(16, n) - GloveData_full(16, 2))* 24 * 60 * 60);
for i = 1 : n / avg_size
    avg_fps_100(i, 1) = avg_size / ((GloveData_full(16, i * avg_size) - GloveData_full(16, (i - 1) * avg_size + 1))* 24 * 60 * 60);
end
fluc_100 = avg_fps_100(:, 1) - avg_fps;
figure('Name', 'Average Refresh Rate (for 100 sample chunk)');
plot((1:100), avg_fps_100,':', (1:100), fluc_100)
title('Average Refresh Rate (for 100 sample chunk)')
xlabel('Number of sample')
ylabel('Refresh per second (/s)')
legend('original', 'offset')
savefig('Average Refresh Rate (for 100 sample chunk).fig');

std_avg_fps_100 = std(avg_fps_100(2 : 100, 1)); % calculate standard deviation of the average refresh rate

%% measure and plot a windowed refresh rate with numeric convolution


%% measure the 99% and 95% refresh rate
% sorted_avg_fps_10 = sort(avg_fps_100);
avg_fps_10_99 = quantile(avg_fps_10, [.01 .99]); % switch to quantile
avg_fps_10_95 = quantile(avg_fps_10, [.05 .95]);

%% measure and plot the distribution of repeated frames
repetition = zeros(1);
rep_count = 1;
i = 0;
j = 1;
while i < (length(GloveData_full) - 1)
    i = i + 1;
    while GloveData_full((1 : 15), i) == GloveData_full((1 : 15), i + j)
        rep_count = rep_count + 1;
        j = j + 1;
    end
    repetition = [repetition, rep_count]; % need to figure out how to determine the size of the array for speed.
    rep_count = 1;
    i = i + j;
    j = 1;
end
<<<<<<< Updated upstream
figure('Name', 'Distribution of repeated frames');
=======
figure('Name', 'Repetition distribution');
>>>>>>> Stashed changes
histogram(repetition);
title('Repetition distribution')
xlabel('Number of sample')
ylabel('Number of repetition')
savefig('Repetition distribution.fig');

<<<<<<< Updated upstream
%% measure and plot the distribution of angle increment sizes
increments = zeros(15, length(GloveData_full_r) - 1);

i = 0;
while i < length(increments)
    i = i + 1;
    increments(:, i) = GloveData_full_r((1:15), i + 1) - GloveData_full_r((1:15), i); 
end

figure('Name', 'Distribution of angle increment sizes');
histogram(increments(1, :));
title('Distribution of angle increment sizes')
xlabel('Number of sample')
ylabel('Increment size')

%% save all workspace variables
save('Sep 13 workspace');
=======
save('Current workspace');
>>>>>>> Stashed changes
