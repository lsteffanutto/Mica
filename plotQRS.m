function [  t_axis ] = plotQRS( ecg, Fs, Q_indices, R_indices, S_indices, left, right, nb )
%PLOTQRS Summary of this function goes here
%   Detailed explanation goes here

    window_ecg = ecg(left(nb(1))-35:right(nb(end))+35);
    t_axis = linspace((left(nb(1))-35)/Fs, (right(nb(end))+35)/Fs, length(window_ecg));
    figure;
    hold on;
    plot(t_axis, window_ecg);
    for j=nb
        plot(R_indices(j)/Fs, ecg(R_indices(j)), 'x', 'color', 'red'); text(R_indices(j)/Fs, ecg(R_indices(j)), 'R', 'color', 'red', 'Fontsize', 14);
        plot(Q_indices(j)/Fs, ecg(Q_indices(j)), 'x', 'color', 'red'); text(Q_indices(j)/Fs, ecg(Q_indices(j)), 'Q', 'color', 'red', 'Fontsize', 14);
        plot(S_indices(j)/Fs, ecg(S_indices(j)), 'x', 'color', 'red'); text(S_indices(j)/Fs, ecg(S_indices(j)), 'S', 'color', 'red', 'Fontsize', 14);
    end
    hold off;
    xlabel('Time (s)');
    ylabel('Magnitude');
    title('ECG segment characteristic with QRS complexes');
end

