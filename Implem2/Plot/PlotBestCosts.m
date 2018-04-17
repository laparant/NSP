function PlotBestCosts(BestCost)
plot(0:size(BestCost,2)-1,BestCost,'r-x');
xlabel('Iteration');
ylabel('Best Cost');
grid on;
end