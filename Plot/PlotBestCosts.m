function PlotBestCosts(BestCost)
figure;
plot(0:size(BestCost,2)-1,BestCost,'r-','Linewidth',2);
xlabel('Iteration');
ylabel('Best fitness value');
title('Best fitness value over iteration')
grid on;
end