function PlotTime(Time)
figure;
plot(Time);
tile(['Total time : ' num2str(sum(Time)) ' seconds']);
xlabel('Iteration');
ylabel('Time (seconds)');
end