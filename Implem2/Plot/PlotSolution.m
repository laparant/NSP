function PlotSolution(S,G)
% Planning
[r, c] = size(S);
imagesc((1:c), (1:r),S);
colormap([1 1 1; 0.8 0.5 0.4]);
set(gca,'xtick', 1:(c+1));
set(gca,'yTick', 1:(r+1));
axis tight;
set(gca,'xlimmode','manual','ylimmode','manual','layer','bottom'); % Hide ticks
hold all;
for n = 0.5:size(S,1)+0.5
    plot(xlim,[n n],'k');
end
for p = 0.5:size(S,2)+0.5
    plot([p p], ylim,'k');
end
% Y labels
nurses = {};
for n = 1:1:r
    nurses = [nurses;strcat(['Nurse ',num2str(n)])];
end
yticklabels(nurses);
xticklabels(repmat({'AM','PM','N'},1,size(S,2)));
set(gca,'xaxisLocation','top')
title(['Nurses Schedule at iteration ' num2str(G)]);
end