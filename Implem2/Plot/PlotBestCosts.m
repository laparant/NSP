function PlotBestCosts(BestCost)
plot(0:size(BestCost,2)-1,BestCost,'r-x');
xlabel('Iteration');
ylabel('Best fitness value');
title('Best fitness value over iteration')
grid on;
end